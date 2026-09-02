<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Izin_permission_model extends Aplego_Model {
	public $table_name 			= "app_permission";
	public $primary_key 		= "permission_id";
	protected $table_view_name 	= 'app_permission_view';
	protected $created_at 		= true;

	public $rules = array(
        'date_start'		=> array('Tgl Mulai', array('have', 'required')),
        'date_end'		    => array('Tgl Selesai', array('have', 'required')),
        'student_id'		=> array('Mahasiswa', array('have', 'required')),
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

    public function prepar_student()
    {
        if ($this->student_id !== false) {
            $this->db->where('student_id', $this->student_id);
        }
        if ($this->semester_id !== false) {
            $this->db->where('semester_id', $this->semester_id);
        }
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

    public function get_accompaniment_volunteer($data){
        $this->db->select("app_accompaniment.*, 
                app_schedule_student.start_at,
                app_schedule_student.end_at,
                app_schedule_student.volunteer_id as prior_volunteer_id,
                app_students.majors_id,
                app_majors.faculty_id,
                app_majors.majors_focus")
            ->from("app_accompaniment")
            ->join("app_schedule_student", "app_schedule_student.schedule_student_id = app_accompaniment.schedule_student_id")
            ->join("app_students", "app_students.student_id=app_schedule_student.student_id")
            ->join("app_majors", "app_majors.majors_id=app_students.majors_id")
            ->join("app_faculties", "app_faculties.faculty_id=app_majors.faculty_id")
            ->where("app_accompaniment.date between '" . $data['date_start'] . "' AND '" . $data['date_end'] . "'")
            ->where('app_accompaniment.volunteer_id', $data['volunteer_id']);
        return $this->db->get()->result_array();
    }

    public function get_accompaniment_student($data){
        $this->db->select("app_accompaniment.*, 
                app_schedule_student.start_at,
                app_schedule_student.end_at,
                app_schedule_student.volunteer_id as prior_volunteer_id,
                app_students.majors_id,
                app_majors.faculty_id,
                app_majors.majors_focus")
            ->from("app_accompaniment")
            ->join("app_schedule_student", "app_schedule_student.schedule_student_id = app_accompaniment.schedule_student_id")
            ->join("app_students", "app_students.student_id=app_schedule_student.student_id")
            ->join("app_majors", "app_majors.majors_id=app_students.majors_id")
            ->join("app_faculties", "app_faculties.faculty_id=app_majors.faculty_id")
            ->where("app_accompaniment.date between '" . $data['date_start'] . "' AND '" . $data['date_end'] . "'")
            ->where('app_schedule_student.student_id', $data['student_id']);
        return $this->db->get()->result_array();
    }
}
