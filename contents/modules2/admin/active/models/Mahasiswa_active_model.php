<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa_active_model extends Aplego_Model {
	public $table_name 		= "app_student_active";
	public $primary_key 	= "register_id";
	protected $table_view_name 	= 'app_student_active_view';
	protected $created_at 	= true;
}