<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Master extends Api_Controller {

	protected $protected_page = array(
		'faculty' => array(
			'method' => array('GET'),
		),
		'disabilitas' => array(
			'method' => array('GET'),
		),
		'wa' => array(
			'method' => array('GET'),
		),
		'preferensi' => array(
			'method' => array('GET'),
		),
	);

	public function faculty()
	{
		$this->load->model($this->admin_group.'fakultas/fakultas_model');
		$data = $this->fakultas_model->gets_view();
		$this->build($data);
	}

	public function disabilitas()
	{
		$data = $this->option_model->gets_data('difabel');
		$data = array_column($data, 'option_value');
		$this->build($data);
	}

	public function preferensi()
	{
		$data = $this->option_model->gets_data('preferensi');
		$data = array_column($data, 'option_value');
		$this->build($data);
	}

	public function wa()
	{
		$data['wa_number'] = $this->option_model->get_value('wa_number');
		$this->build($data);
	}
}