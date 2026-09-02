<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Syaratketentuan extends Aplego_Controller
{
	public function index()
	{
		$this->title = 'Dashboard';
		$this->param['term_condition'] = $this->option_model->get_value('term_condition');
		$this->load->view('syaratketentuan', $this->param);
	}
}
