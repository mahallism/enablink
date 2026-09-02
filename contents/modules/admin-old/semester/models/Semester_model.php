<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Semester_model extends Aplego_Model {
	public $table_name 	= "app_semester";
	public $primary_key = "semester_id";

	public $rules = array(
		'semester_name'	=> array('Nama Semester', array('have', 'required')),
		'start_at'		=> array('Tanggal Mulai Kuliah', array('have', 'required')),
		'end_at'		=> array('Tanggal Selesai Kuliah', array('have', 'required')),
        'uts_start_at'		=> array('Tanggal Mulai UTS', array('have', 'required')),
        'uts_end_at'		=> array('Tanggal Selesai UTS', array('have', 'required')),
        'uas_start_at'		=> array('Tanggal Mulai UAS', array('have', 'required')),
        'uas_end_at'		=> array('Tanggal Selesai UAS', array('have', 'required')),
	);
}

