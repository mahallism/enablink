<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Setting extends Setting_Controller {
	protected $protected_page = array(
		'index' 	=> 'admin',
		'app' 	=> 'admin',
	);
	
	public function index()
	{
		$rules_form = array(
			'copyright' => array(
				'label' 		=> 'Copyright',
				'required' 		=> true,
			),
			'wa_number' => array(
				'label' 		=> 'No Whatsapp',
				'required' 		=> true,
			),
			'term_condition' => array(
				'label' 		=> 'Syarat Ketentuan',
				'required' 		=> true,
				'type'			=> 'textarea',
			),
			'copyright_link' => array(
				'label' 		=> 'Copyright Link',
			),
		);

		$rules = array(
			'copyright'			=> array('Copyright', array('have', 'required')),
			'term_condition'	=> array('Term Condition', array('have', 'required')),
			'wa_number'			=> array('No Whatsapp', array('have', 'required')),
			'copyright_link'	=> array('Copyright Link', array('have')),
		);
		parent::setting('global', $rules, $rules_form);
	}
	
	public function app()
	{
		$rules_form = array(
			'current_semester' => array(
				'label' 		=> 'Current Semester',
				'required' 		=> true,
				'type' 			=> 'select',
				'select_type' 	=> 'key_value',
				'select_data' 	=> 'data_semester',
			),
			'max_volunteer' => array(
				'label' 		=> 'Pendampingan',
				'required' 		=> true,
				'type' 			=> 'number',
				'input_size' 	=> 6,
				'info' 			=> "Maksimum pendamping mendampingi dalam satu minggu.",
			),
		);

		$this->load->model($this->group.'semester/semester_model');
		$data_semester = $this->semester_model->gets();
		$data_semester = array_column($data_semester, 'semester_name', 'semester_id');
		$this->fcontrol->set_meta_data('data_semester', $data_semester);

		$rules = array(
			'current_semester'	=> array('Current Semester', array('have', 'required')),
			'max_volunteer'	=> array('Pendampingan', array('have', 'required')),
		);
		parent::setting('app', $rules, $rules_form);
	}
}
