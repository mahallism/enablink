<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Izin_model extends Aplego_Model {
	public $table_name 			= "app_permit";
	public $primary_key 		= "permit_id";
	protected $table_view_name 	= 'app_permit_view';
	protected $created_at 		= true;
	
	public $rules = array(
		'accompaniment_id'	=> array('Jadwal Pendampingan', array('have', 'required')),
		'clarification'		=> array('Keterangan', array('have', 'required')),
	);

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
			$this->db->where('student_id', $this->student_id);
		}
		if ($this->semester_id !== false) {
			$this->db->where('semester_id', $this->semester_id);
		}
	}
}