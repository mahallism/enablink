<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jurusan extends App_Controller {

	protected $module_main = 'fakultas';
	protected $module_name = 'jurusan';
	
	protected $gets_view = true;

	protected $load_model = false;
	
	protected $input_field  = array(
		'faculty_id' => array(
			'label' 		=> 'Fakultas',
			'required' 		=> true,
			'type' 			=> 'select',
			'select_type' 	=> 'key_value',
			'select_data' 	=> 'data_fakultas',
		),
		'majors_name' => array(
			'label' 	=> 'Nama Jurusan',
			'required' 	=> true,
		),
	);

	function __construct()
	{
		parent::__construct();

		$this->load->model('jurusan_model');
		$this->model =& $this->jurusan_model;
		$this->load->model('fakultas_model');
		$data_fakultas = $this->fakultas_model->gets();
		$data_fakultas = array_column($data_fakultas, 'faculty_name', 'faculty_id');
		$this->fcontrol->set_meta_data('data_fakultas', $data_fakultas);

		$this->param['module_main'] = 'jurusan';
	}

	public function input($id = false)
	{
		if ($id !== false) {
			$data = array('faculty_id' => $id);
			$this->fcontrol->set_data($data);
		}
		parent::input($id);
	}

	public function edit($id = false)
	{
		parent::edit($id);
	}

	public function delete($id = false)
	{
		$this->module_main = 'fakultas';
		parent::delete($id);
	}
}
