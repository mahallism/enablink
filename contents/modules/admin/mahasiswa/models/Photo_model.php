<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Photo_model extends Aplego_Model {
	public $table_name = "app_students";
	public $primary_key = "student_id";
	protected $table_view_name = 'app_students_view';

	public $rules = array(
// 		'nick_name'			=> array('Nama Panggilan', array('have', 'required')),
	);
}