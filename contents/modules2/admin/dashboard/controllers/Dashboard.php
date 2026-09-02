<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends Subsystem_Controller {
	protected $protected_page = array(
		'index' 	=> 'admin',
	);
	
	public function index()
	{
		$this->title = 'Dashboard';
		$this->active_menu = 'dashboard';

		$this->load->model($this->group.'active/mahasiswa_active_model');
		$this->load->model($this->group.'pendampingan/pendampingan_model');
		$this->load->model($this->group.'izin/izin_model');

		$this->param['data_count'] = array(
			'jadwal'				=> $this->pendampingan_model->where('semester_id', $this->current_semester)->get_count(),
			'surat_izin'			=> $this->izin_model->where('semester_id', $this->current_semester)->get_count(),
			'pendampingan'			=> $this->pendampingan_model->where('semester_id', $this->current_semester)->get_count(),
			'mahasiswa_difabel'		=> $this->mahasiswa_active_model->where('semester_id', $this->current_semester)->where('capability', 'difabel')->get_count('app_student_active_view'),
			'mahasiswa_volunteer'	=> $this->mahasiswa_active_model->where('semester_id', $this->current_semester)->where('capability', 'volunteer')->get_count('app_student_active_view'),
			'mahasiswa_register'	=> $this->mahasiswa_active_model->where('semester_id', $this->current_semester)->get_count('app_student_active_view'),
			'mahasiswa' 			=> $this->user_model->where_in('capability', $this->user_group['member'])->get_count(),
		);
		$this->param['data'] = $this->pendampingan_model->where('semester_id', $this->current_semester)->gets_view('app_chart_accompainiment_view');
		$this->build('dashboard');
	}
}
