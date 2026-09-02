<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pendampingan_ganti_model extends Aplego_Model {
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

}