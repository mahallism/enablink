<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jadwal_difabel_model extends Aplego_Model {
	public $table_name 			= "app_schedule_student";
	public $primary_key 		= "schedule_student_id";
	public $table_view_name 	= 'app_schedule_student_view';

	public $table_active_view_name = 'app_schedule_student_active_view';

	public $rules = array(
		'student_id' 	=> array('Mahasiswa', array('have', 'required')),
        'day'			=> array('Hari', array()),
        'date'			=> array('Tanggal', array()),
		'schedule_type'	=> array('Jenis Jadwal', array('have', 'required')),
		'start_at'		=> array('Jam Mulai Kuliah', array('have', 'required')),
		'end_at'		=> array('Jam Selesai Kuliah', array('have', 'required')),
		'room'			=> array('Ruangan', array('have', 'required')),
		'courses'		=> array('Mata Kuliah', array('have', 'required')),
		'sks'			=> array('Jumlah SKS', array('have', 'required')),
	);

	public $student_id = false;
	public $semester_id = false;

	public function set_student_id(&$student_id)
	{
		$this->student_id = $student_id;
		unset($this->rules['student_id']);
	}

	public function set_semester_id(&$semester_id)
	{
		$this->semester_id = $semester_id;
	}

	public function prepar_student()
	{
		if ($this->student_id !== false) {
			$this->db->where('student_id', $this->student_id);
		}
		if ($this->semester_id !== false) {
			$this->db->where('semester_id', $this->semester_id);
		}
	}

	public function create($data)
	{
		if ($this->student_id !== false) {
			$data['student_id'] = $this->student_id;
		}
		if ($this->semester_id !== false) {
			$data['semester_id'] = $this->semester_id;
		}
		return parent::create($data);
	}

	public function check_jadwal($data)
	{
		if ($this->semester_id !== false) {
			$this->db->where('semester_id', $this->semester_id);
		}else if(isset($data['semester_id']) === true){
			$this->db->where('semester_id', $data['semester_id']);
		}

		if ($this->student_id !== false) {
			$this->db->where('student_id', $this->student_id);
		}else{
			$this->db->where('student_id', $data['student_id']);
		}

        if(!empty($data['day'])){
            $this->db->where('day', $data['day']);
        }
        if(!empty($data['date'])){
            $this->db->where('date', $data['date']);
        }

		$this->db->where('deleted', 'false');

		$where_start = "start_at < '" . $data['start_at'] . "' and end_at > '" . $data['start_at'] . "'";
		$where_end = "start_at < '" . $data['end_at'] . "' and end_at > '" . $data['end_at'] . "'";
		$where_in = "start_at >= '" . $data['start_at'] . "' and end_at <= '" . $data['end_at'] . "'";

		$where = "(($where_start) or ($where_end) or $where_in)";
		$this->db->where($where);
		return parent::get_count() === 0;
	}

    public function backup_jadwal_active_student($data){
        $sql = "INSERT INTO app_schedule_student_rev 
        SELECT NULL, app_schedule_student.student_id, app_schedule_student.semester_id, '0',
               app_schedule_student.start_at, app_schedule_student.end_at, app_schedule_student.day,
               app_schedule_student.room, app_schedule_student.courses, app_schedule_student.sks, 
               app_schedule_student.schedule_type, app_schedule_student.deleted
        FROM app_schedule_student 
        WHERE app_schedule_student.semester_id = '".$data['semester_id']."' AND 
            app_schedule_student.student_id = '".$data['student_id']."'";
        return $this->db->query($sql);
    }

    public function softdelete_jadwal_active_student($data){
        if ($this->semester_id !== false) {
            $this->db->where('semester_id', $this->semester_id);
        }else if(isset($data['semester_id']) === true){
            $this->db->where('semester_id', $data['semester_id']);
        }

        if ($this->student_id !== false) {
            $this->db->where('student_id', $this->student_id);
        }else{
            $this->db->where('student_id', $data['student_id']);
        }

        $this->db->where('date IS NULL');
        $this->db->set('deleted', 'true');
        $this->db->update($this->table_name);
    }

    public function set_jadwal_rev_active_student($data){
        $sql = "INSERT INTO app_schedule_student 
            SELECT NULL, app_schedule_student_rev.student_id, app_schedule_student_rev.semester_id, NULL,
                   app_schedule_student_rev.start_at, app_schedule_student_rev.end_at, app_schedule_student_rev.day, NULL,
                   app_schedule_student_rev.room, app_schedule_student_rev.courses, app_schedule_student_rev.sks, 
                   app_schedule_student_rev.schedule_type, app_schedule_student_rev.deleted
            FROM app_schedule_student_rev 
            WHERE app_schedule_student_rev.semester_id = '".$data['semester_id']."' AND 
                app_schedule_student_rev.student_id = '".$data['student_id']."' AND
                app_schedule_student_rev.rev = '".$data['rev']."'";
        return $this->db->query($sql);
    }

    public function clearAccompanimentSemester($semester_id, $start_date = null, $end_date = null){
        $builder = $this->db->set("volunteer_id", NULL)
            ->where( "semester_id", $semester_id);
        if(!empty($start_date) && !empty($end_date)){
            $builder->where("date between '$start_date' and '$end_date'");
        }
        return $builder->update($this->table_name);
    }

    public function get_free_volunteer($data){
        if ($this->semester_id !== false) {
            $semester_id = $this->semester_id;
        }
        else if(isset($data['semester_id']) === true){
            $semester_id = $data['semester_id'];
        }
        else{
            $semester_id = "";
        }

        $this->db->select("app_students.student_id,
            aplego_user.name,
            app_students.nick_name,
            app_majors.majors_name,
            app_majors.majors_id,
            app_majors.faculty_id,
            app_majors.majors_focus,
            (SELECT GROUP_CONCAT(IF( 
                !( app_schedule_volunteer.start_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( app_schedule_volunteer.end_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( '".$data['start_at']."' BETWEEN app_schedule_volunteer.start_at AND app_schedule_volunteer.end_at ), 'TRUE', 'FALSE' 
            )) FROM app_schedule_volunteer where app_schedule_volunteer.student_id = app_students.student_id 
                AND app_schedule_volunteer.day = '".$data['day']."'
                AND app_schedule_volunteer.deleted = 'false'
                AND app_schedule_volunteer.semester_id = '$semester_id'
            ) AS is_free_schedule,
                
            (SELECT GROUP_CONCAT(IF( 
                !( j.start_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( j.end_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( '".$data['start_at']."' BETWEEN j.start_at AND j.end_at ), 'TRUE', 'FALSE' 
            )) FROM app_schedule_student as j
                WHERE j.volunteer_id = app_students.student_id AND 
                    j.semester_id = app_student_active.semester_id AND
                    j.day = '".$data['day']."'
            ) AS is_free_accompaniment,
            
            (SELECT COUNT(a.volunteer_id) 
                FROM app_schedule_student as a
                WHERE a.volunteer_id = app_students.student_id AND 
                    a.day = '".$data['day']."' AND 
                    a.semester_id = app_student_active.semester_id
            ) as count_accompaniment")
            ->from("app_students")
            ->join("aplego_user", "aplego_user.user_id = app_students.user_id AND aplego_user.capability = 'volunteer'")
            ->join("app_student_active", "app_student_active.student_id = app_students.student_id 
                AND app_student_active.semester_id = '$semester_id'
                AND app_student_active.approver_id IS NOT NULL")
            ->join("app_majors", "app_majors.majors_id = app_students.majors_id");
        //condition
        if (!empty($data['majors_id'])) {
            $this->db->where('app_majors.majors_id', $data['majors_id']);
        }
        if (!empty($data['faculty_id'])) {
            $this->db->where('app_majors.faculty_id', $data['faculty_id']);
        }
        if (!empty($data['majors_focus'])) {
            $this->db->where('app_majors.majors_focus', $data['majors_focus']);
        }
        if(!empty($data['limit_count_accompaniment'])){
            $this->db->having("count_accompaniment < '".$data['limit_count_accompaniment']."'");
        }
        $this->db->having("(is_free_schedule IS NULL OR !(is_free_schedule like '%FALSE%'))");
        $this->db->having("(is_free_accompaniment IS NULL OR !(is_free_accompaniment like '%FALSE%'))");

        //prior and order
        if (!empty($data['prior_volunteer_id'])) {
            $this->db->order_by("FIELD(app_students.student_id, '".$data['prior_volunteer_id']."') DESC");
        }
        if (!empty($data['prior_majors_id'])) {
            $this->db->order_by("FIELD(app_majors.majors_id, '".$data['prior_majors_id']."') DESC");
        }
        if (!empty($data['prior_faculty_id'])) {
            $this->db->order_by("FIELD(app_majors.faculty_id, '".$data['prior_faculty_id']."') DESC");
        }
        if (!empty($data['prior_majors_focus'])) {
            $this->db->order_by("FIELD(app_majors.majors_focus, '".$data['prior_majors_focus']."') DESC");
        }
        $this->db->order_by("count_accompaniment ASC, name ASC");

        // result
        if(isset($data['pick_one'])) {
            $this->db->limit(1);
            return $this->db->get()->row_array();
        }
        return $this->db->get()->result_array();
    }
}
