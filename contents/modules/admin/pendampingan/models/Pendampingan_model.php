<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pendampingan_model extends Aplego_Model {
	public $table_name 		= "app_accompaniment";
	public $primary_key 	= "accompaniment_id";
	protected $table_view_name 	= 'app_accompaniment_view';
	protected $timestamp 	= true;

	public $table_base_view_name = 'app_accompaniment_view';
	public $table_report_view_name = 'app_report_volunteer_view';

	public $student_id = false;
	public $semester_id = false;

	public function set_student_id(&$student_id)
	{
		$this->student_id = $student_id;
	}

	public function set_semester_id(&$semester_id)
	{
		$this->semester_id = $semester_id;
	}

	public function prepar_difabel()
	{
		if ($this->student_id !== false) {
			$this->db->where('student_id', $this->student_id);
		}
		if ($this->semester_id !== false) {
			$this->db->where('semester_id', $this->semester_id);
		}
	}

	public function prepar_volunteer()
	{
		if ($this->student_id !== false) {
			$this->db->where('volunteer_id', $this->student_id);
		}
		if ($this->semester_id !== false) {
			$this->db->where('semester_id', $this->semester_id);
		}
	}

	public function prepar_new_volunteer()
	{
		if ($this->student_id !== false) {
			$this->db->where('new_volunteer_id', $this->student_id);
		}
		if ($this->semester_id !== false) {
			$this->db->where('semester_id', $this->semester_id);
		}
	}

    public function is_free_accompaniment($data){
        $query = $this->db->query("SELECT GROUP_CONCAT(IF( 
                !( j.start_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( j.end_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( '".$data['start_at']."' BETWEEN j.start_at AND j.end_at ), 'TRUE', 'FALSE' 
            )) as status FROM app_accompaniment as i 
                JOIN app_schedule_student as j ON j.schedule_student_id = i.schedule_student_id AND j.deleted = 'false'
                WHERE i.volunteer_id = '".$data['student_id']."' AND 
                    i.date = '".$data['date']."' AND 
                    i.semester_id = '".$data['semester_id']."'
            ");
        $result = $query->row_array();
        if(empty($result) || empty($result['status']) || !(strpos($result['status'], 'FALSE') !== false)) return true;
        return false;
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
            app_majors.majors_id,
            app_majors.majors_name,
            app_majors.faculty_id,
            app_majors.majors_focus,
            (SELECT GROUP_CONCAT(IF( 
                !( app_schedule_volunteer.start_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( app_schedule_volunteer.end_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( '".$data['start_at']."' BETWEEN app_schedule_volunteer.start_at AND app_schedule_volunteer.end_at ), 'TRUE', 'FALSE' 
            )) FROM app_schedule_volunteer where app_schedule_volunteer.student_id = app_students.student_id 
                AND IF(app_schedule_volunteer.day IS NULL, app_schedule_volunteer.date='".$data['date']."', app_schedule_volunteer.day = '".$data['day']."')
                AND app_schedule_volunteer.deleted = 'false'
                AND app_schedule_volunteer.semester_id = '$semester_id'
            ) AS is_free_schedule,
            
            (SELECT COUNT(*) FROM app_permission
                WHERE ('".$data['date']."' between app_permission.date_start and app_permission.date_end)
                AND app_permission.semester_id = '$semester_id'
                AND app_permission.student_id = app_students.student_id) as is_exist_permission,
                
            (SELECT GROUP_CONCAT(IF( 
                !( j.start_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( j.end_at BETWEEN '".$data['start_at']."' AND '".$data['end_at']."' ) AND 
                !( '".$data['start_at']."' BETWEEN j.start_at AND j.end_at ), 'TRUE', 'FALSE' 
            )) FROM app_accompaniment as i JOIN app_schedule_student as j ON j.schedule_student_id = i.schedule_student_id AND j.deleted = 'false'
                WHERE i.volunteer_id = app_students.student_id AND 
                    i.semester_id = app_student_active.semester_id AND 
                    i.date = '".$data['date']."' AND 
                    i.semester_id = '$semester_id'
            ) AS is_free_accompaniment,
            
            (SELECT COUNT(a.accompaniment_id) FROM app_accompaniment as a
                WHERE a.volunteer_id = app_students.student_id AND 
                    a.semester_id = app_student_active.semester_id AND 
                    a.date = '".$data['date']."' AND
                    a.semester_id = '$semester_id'
            ) as count_accompaniment")
            ->from("app_students")
            ->join("aplego_user", "aplego_user.user_id = app_students.user_id AND aplego_user.capability = 'volunteer'")
            ->join("app_student_active", "app_student_active.student_id = app_students.student_id 
                AND app_student_active.semester_id = '$semester_id'
                AND app_student_active.approver_id IS NOT NULL")
            ->join("app_majors", "app_majors.majors_id = app_students.majors_id");

        $strict_matching = $this->config->item('strict_volunteer_matching');
        if ($strict_matching) {
            if (!empty($data['majors_id'])) {
                $this->db->where('app_majors.majors_id', $data['majors_id']);
            }
            if (!empty($data['faculty_id'])) {
                $this->db->where('app_majors.faculty_id', $data['faculty_id']);
            }
            if (!empty($data['majors_focus'])) {
                $this->db->where('app_majors.majors_focus', $data['majors_focus']);
            }
        } else {
            if (empty($data['prior_majors_id']) && !empty($data['majors_id'])) {
                $data['prior_majors_id'] = $data['majors_id'];
            }
            if (empty($data['prior_faculty_id']) && !empty($data['faculty_id'])) {
                $data['prior_faculty_id'] = $data['faculty_id'];
            }
            if (empty($data['prior_majors_focus']) && !empty($data['majors_focus'])) {
                $data['prior_majors_focus'] = $data['majors_focus'];
            }
        }

        if(!empty($data['limit_count_accompaniment'])){
            $this->db->having("count_accompaniment < '".$data['limit_count_accompaniment']."'");
        }
        if(isset($data['filter_all']) && $data['filter_all']){

        }else {
            $this->db->having("(is_free_schedule IS NULL OR !(is_free_schedule like '%FALSE%'))");
            $this->db->having("(is_free_accompaniment IS NULL OR !(is_free_accompaniment like '%FALSE%'))");
        }
        $this->db->having("(is_exist_permission = 0)");

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

    public function clearAccompanimentSemester($semester_id, $start_at = null){
        $query = "delete app_accompaniment from app_accompaniment 
            JOIN app_schedule_student ON app_schedule_student.schedule_student_id = app_accompaniment.schedule_student_id
            WHERE app_accompaniment.semester_id = '$semester_id' AND 
                app_schedule_student.schedule_type='kuliah' AND 
                app_schedule_student.date IS NULL";
        if(!empty($start_at)){
            !$query .= " AND app_accompaniment.date > '$start_at'";
        }
        return $this->db->query($query);
    }

    public function getReportVolunteer($param = array()){
        $query = $this->db->select('app_accompaniment.volunteer_id AS volunteer_id,
                app_accompaniment.semester_id AS semester_id,
                app_students.nick_name AS nick_name,
                app_students.user_id AS user_id,
                app_students.student_id AS student_id,
                aplego_user.username AS username,
                aplego_user.name AS name,
                sum(IF(( isnull( app_accompaniment.volunteer_status ) OR ( app_accompaniment.volunteer_status = "Dilihat" ) OR ( app_accompaniment.volunteer_status = "Dikonfirmasi" )), 1, 0 )) AS count_belum_datang,
                sum(IF(( app_accompaniment.volunteer_status = "Hadir" ), 1, 0 )) AS count_selesai,
                sum(IF(( app_accompaniment.volunteer_status = "Izin" ), 1, 0 )) AS count_izin,
                sum(IF(( app_accompaniment.volunteer_status = "Tidak Hadir" ), 1, 0 )) AS count_tidak_datang,
                max( app_accompaniment.review ) AS max_review,
                min( app_accompaniment.review ) AS min_review,
                avg( app_accompaniment.review ) AS avg_review')
            ->from('app_accompaniment')
            ->join('app_students','app_students.student_id = app_accompaniment.volunteer_id')
            ->join('aplego_user','aplego_user.user_id = app_students.user_id')
            ->group_by('app_accompaniment.semester_id, app_accompaniment.volunteer_id');
        if(!empty($param['semester_id'])){
            $query->where('app_accompaniment.semester_id', $param['semester_id']);
        }
        if(!empty($param['tgl_awal'])){
            $query->where('app_accompaniment.date >= "'.$param['tgl_awal'].'"');
        }
        if(!empty($param['tgl_akhir'])){
            $query->where('app_accompaniment.date <= "'.$param['tgl_akhir'].'"');
        }
        return $query->get()->result_array();
    }
}
