<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jadwal_volunteer_model extends Aplego_Model {
	public $table_name 			= "app_schedule_volunteer";
	public $primary_key 		= "schedule_volunteer_id";
	protected $table_view_name 	= 'app_schedule_volunteer_view';

	public $rules = array(
		'student_id' 	=> array('Mahasiswa', array('have', 'required')),
		'day'			=> array('Hari', array()),
        'date'			=> array('Tanggal', array()),
		'schedule_type'	=> array('Jenis Jadwal', array('have', 'required')),
		'start_at'		=> array('Jam Mulai Kuliah', array('have', 'required')),
		'end_at'		=> array('Jam Selesai Kuliah', array('have', 'required')),
		'clarification'	=> array('Keterangan', array('have', 'required')),
		'room'			=> array('Ruangan', array('have', 'required')),
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
        $sql = "INSERT INTO app_schedule_volunteer_rev 
            SELECT NULL, app_schedule_volunteer.student_id, app_schedule_volunteer.semester_id, '0',
                   app_schedule_volunteer.start_at, app_schedule_volunteer.end_at, app_schedule_volunteer.day,
                   app_schedule_volunteer.clarification, app_schedule_volunteer.schedule_type, app_schedule_volunteer.room, 
                   app_schedule_volunteer.deleted,waktu_revisi
            FROM app_schedule_volunteer 
            WHERE app_schedule_volunteer.semester_id = '".$data['semester_id']."' AND 
                app_schedule_volunteer.student_id = '".$data['student_id']."'";
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
        $sql = "INSERT INTO app_schedule_volunteer 
            SELECT NULL, app_schedule_volunteer_rev.student_id, app_schedule_volunteer_rev.semester_id,
                   app_schedule_volunteer_rev.start_at, app_schedule_volunteer_rev.end_at, app_schedule_volunteer_rev.day, null,
                   app_schedule_volunteer_rev.clarification, app_schedule_volunteer_rev.schedule_type, app_schedule_volunteer_rev.room, 
                   app_schedule_volunteer_rev.deleted,waktu_revisi,rev
            FROM app_schedule_volunteer_rev 
            WHERE app_schedule_volunteer_rev.semester_id = '".$data['semester_id']."' AND 
                app_schedule_volunteer_rev.student_id = '".$data['student_id']."' AND
                app_schedule_volunteer_rev.rev = '".$data['rev']."'";
        return $this->db->query($sql);
    }
}