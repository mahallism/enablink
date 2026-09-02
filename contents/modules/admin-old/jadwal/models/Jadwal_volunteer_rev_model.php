<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jadwal_volunteer_rev_model extends Aplego_Model {
	public $table_name 			= "app_schedule_volunteer_rev";
	public $primary_key 		= "schedule_volunteer_rev_id";
	protected $table_view_name 	= 'app_schedule_volunteer_rev_view';

	public $rules = array(
		'student_id' 	=> array('Mahasiswa', array('have', 'required')),
		'day'			=> array('Hari', array('have', 'required')),
		'schedule_type'	=> array('Jenis Jadwal', array('have', 'required')),
		'start_at'		=> array('Jam Mulai Kuliah', array('have', 'required')),
		'end_at'		=> array('Jam Selesai Kuliah', array('have', 'required')),
		'clarification'	=> array('Keterangan', array('have', 'required')),
		'room'			=> array('Ruangan', array('have', 'required')),
	);

	public $student_id = false;
	public $semester_id = false;
    public $rev = false;

	public function set_student_id(&$student_id)
	{
		$this->student_id = $student_id;
		unset($this->rules['student_id']);
	}

	public function set_semester_id(&$semester_id)
	{
		$this->semester_id = $semester_id;
	}

    public function set_rev($rev)
    {
        $this->rev = $rev;
    }

	public function prepar_student()
	{
		if ($this->student_id !== false) {
			$this->db->where('student_id', $this->student_id);
		}
		if ($this->semester_id !== false) {
			$this->db->where('semester_id', $this->semester_id);
		}
        if ($this->rev !== false) {
            $this->db->where('rev', $this->rev);
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
        if ($this->rev !== false) {
            $data['rev'] = $this->rev;
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

        if ($this->rev !== false) {
            $this->db->where('rev', $this->rev);
        }else{
            $this->db->where('rev', $data['rev']);
        }

        $this->db->where('day', $data['day']);

        $where_start = "start_at < '" . $data['start_at'] . "' and end_at > '" . $data['start_at'] . "'";
        $where_end = "start_at < '" . $data['end_at'] . "' and end_at > '" . $data['end_at'] . "'";
        $where_in = "start_at >= '" . $data['start_at'] . "' and end_at <= '" . $data['end_at'] . "'";

        $where = "(($where_start) or ($where_end) or $where_in)";
        $this->db->where($where);
        return parent::get_count() === 0;
    }

}