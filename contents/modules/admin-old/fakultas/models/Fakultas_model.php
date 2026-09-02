<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Fakultas_model extends Aplego_Model {
	public $table_name 			= "app_faculties";
	public $primary_key 		= "faculty_id";
	protected $table_view_name 	= 'app_faculty_view';
	
	public $rules = array(
		'faculty_name'	=> array('Nama Fakultas', array('have', 'required')),
	);
}