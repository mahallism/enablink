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
			'label' 	=> 'Nama Prodi',
			'required' 	=> true,
		),
        'majors_focus' => array(
            'label' 	=> 'Fokus Prodi',
            'required' 	=> true,
            'type' 			=> 'select',
            'select_type' 	=> 'key_value',
            'select_data' 	=> array(
                'SAINTEK' => 'SAINTEK',
                'SOSHUM' => 'SOSHUM',
            ),
        ),
        'level' => array(
            'label' 	=> 'Jenjang Prodi',
            'required' 	=> true,
            'type' 			=> 'select',
            'select_type' 	=> 'key_value',
            'select_data' 	=> array(
                'D3' => 'D3',
                'D4' => 'D4',
                'S1' => 'S1',
                'S2' => 'S2',
                'S3' => 'S3',
            ),
        )
	);

	function __construct()
	{
		parent::__construct();

		$this->load->model('jurusan_model');
		$this->model =& $this->jurusan_model;
		$this->load->model('fakultas_model');
		$data_fakultas = $this->fakultas_model->where("is_active",'1')->gets();
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
