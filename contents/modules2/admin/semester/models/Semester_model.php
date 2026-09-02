<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Semester_model extends Aplego_Model {
	public $table_name 	= "app_semester";
	public $primary_key = "semester_id";

	public $rules = array(
		'semester_name'	=> array('Nama Semester', array('have', 'required')),
		'start_at'		=> array('Tanggal Mulai', array('have', 'required')),
		'end_at'		=> array('Tanggal Selesai', array('have', 'required')),
	);
}

