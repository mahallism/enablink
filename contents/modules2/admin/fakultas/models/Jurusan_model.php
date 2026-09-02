<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jurusan_model extends Aplego_Model {
	public $table_name 	= "app_majors";
	public $primary_key = "majors_id";

	public $rules = array(
		'faculty_id'	=> array('Fakultas', array('have', 'required')),
		'majors_name'	=> array('Nama Jurusan', array('have', 'required')),
	);
}