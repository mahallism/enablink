<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Semester extends App_Controller
{

	protected $module_main = 'semester';
	protected $list_size  	= 'md';

	protected $list_field  	= array(
		'field' 	=> array(
			'semester_name' => 'Nama Semester',
			'start_at' 		=> 'Tanggal Mulai',
			'end_at' 		=> 'Tanggal Selesai',
		),
		'custom' 	=> array(
			'start_at' 		=> 'date_html($item["start_at"])',
			'end_at' 		=> 'date_html($item["end_at"])',
		),
	);
	protected $input_field  = array(
		'semester_name' => array(
			'label' 	=> 'Nama Semester',
			'required' 	=> true,
		),
		'start_at' => array(
			'label' 		=> 'Tanggal Mulai',
			'type' 			=> 'date',
			'required' 		=> true,
			'input_size'	=> 6,
		),
		'end_at' => array(
			'label' 		=> 'Tanggal Selesai',
			'type' 			=> 'date',
			'required' 		=> true,
			'input_size'	=> 6,
		),
	);

	public function input($id = false)
	{
		parent::input($id);
	}

	protected function do_input($post)
	{
		$semester_data = $this->db->get('app_semester');

		foreach ($semester_data->result_array() as $data) {
			if (((strtotime($data['start_at']) < strtotime($post['start_at']) &&
				strtotime($data['end_at']) > strtotime($post['start_at'])) ||
				(strtotime($data['start_at']) < strtotime($post['end_at']) &&
					strtotime($data['end_at']) > strtotime($post['end_at'])) ||
				(strtotime($data['start_at']) >= strtotime($post['start_at']) &&
					strtotime($data['end_at']) <= strtotime($post['end_at'])))) {
				$this->set_message('Terdapat tanggal yang bertabrakan dengan semester lain.', 'danger');
				$this->redirect($this->module_main . '/input');
			}
		}

		$this->semester_model->create($post);

		$this->set_message('Berhasil menambah data semester.', 'success');
		$this->redirect($this->module_main);
	}
}
