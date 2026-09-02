<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa_model extends Aplego_Model {
	public $table_name = "app_students";
	public $primary_key = "student_id";
	protected $table_view_name = 'app_students_view';

	public $rules = array(
		'nick_name'			=> array('Nama Panggilan', array('have', 'required')),
		'majors_id'			=> array('Jurusan', array('have', 'required')),
		'class_of_college'	=> array('Angkatan', array('have', 'required')),
		'no_hp'				=> array('Nomor Hp', array('have', 'required')),
		// 'photo'				=> array('Foto', array('have', 'required')),
		// 'ktm'				=> array('Foto KTM', array('have', 'required')),
		'birth_date'		=> array('Tanggal Lahir', array('have', 'required')),
	);
}