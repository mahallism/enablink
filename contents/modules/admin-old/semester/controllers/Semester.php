<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Semester extends App_Controller
{

	protected $module_main = 'semester';
	protected $list_size  	= 'xl';

	function __construct()
	{
		parent::__construct();

		foreach (array('duplicate', 'edit', 'delete') as $item) {
			$this->action_url[$item]['id'] = 'semester_id';
			$this->action_url[$item]['url'] = $this->group.$this->module_main.'/'.$item;
		}
	}

	protected $list_field  	= array(
		'field' 	=> array(
			'semester_name' => 'Nama Semester',
			'start_at' 		=> 'Tanggal Mulai Kuliah',
			'end_at' 		=> 'Tanggal Selesai Kuliah',
            'uts_start_at' 		=> 'Tanggal Mulai UTS',
            'uts_end_at' 		=> 'Tanggal Selesai UTS',
            'uas_start_at' 		=> 'Tanggal Mulai UAS',
            'uas_end_at' 		=> 'Tanggal Selesai UAS',
		),
		'custom' 	=> array(
			'start_at' 		=> 'date_html($item["start_at"])',
			'end_at' 		=> 'date_html($item["end_at"])',
            'uts_start_at' 	=> 'date_html($item["uts_start_at"])',
            'uts_end_at' 	=> 'date_html($item["uts_end_at"])',
            'uas_start_at' 	=> 'date_html($item["uas_start_at"])',
            'uas_end_at' 	=> 'date_html($item["uas_end_at"])',
		),
	);
	protected $input_field  = array(
		'semester_name' => array(
			'label' 	=> 'Nama Semester',
			'required' 	=> true,
		),
		'start_at' => array(
			'label' 		=> 'Tanggal Mulai Kuliah',
			'type' 			=> 'date',
			'required' 		=> true,
			'input_size'	=> 6,
		),
		'end_at' => array(
			'label' 		=> 'Tanggal Selesai Kuliah',
			'type' 			=> 'date',
			'required' 		=> true,
			'input_size'	=> 6,
		),
        'uts_start_at' => array(
            'label' 		=> 'Tanggal Mulai UTS',
            'type' 			=> 'date',
            'required' 		=> true,
            'input_size'	=> 6,
        ),
        'uts_end_at' => array(
            'label' 		=> 'Tanggal Selesai UTS',
            'type' 			=> 'date',
            'required' 		=> true,
            'input_size'	=> 6,
        ),
        'uas_start_at' => array(
            'label' 		=> 'Tanggal Mulai UAS',
            'type' 			=> 'date',
            'required' 		=> true,
            'input_size'	=> 6,
        ),
        'uas_end_at' => array(
            'label' 		=> 'Tanggal Selesai UAS',
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
