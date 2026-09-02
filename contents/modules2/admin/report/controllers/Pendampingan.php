<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pendampingan extends App_Controller {
	protected $module_main = 'report/pendampingan';
	protected $module_name = 'pendampingan mahasiswa';

	protected $load_model = false;
	protected $gets_view = true;

	protected $list_field  	= array(
		'field' 	=> array(
			'day' 			=> 'Hari dan Tanggal',
			'jam' 			=> 'Jam',
			'duration' 		=> 'Durasi',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'sks' 			=> 'SKS',
			'nick_name' 	=> 'Mahasiswa',
			'student_status' 	=> 'Status',
			'volunteer_nick_name' 	=> 'Pendamping',
			'volunteer_status' 	=> 'Status',
			'review_mc' 	=> 'Review',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'duration'		=> 'round(((strtotime($item["end_at"]) - strtotime($item["start_at"])) / 60 / 60), 2) . " Jam"',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'date' 			=> '$item["date"]',
			'date_day' 		=> 'date_html($item["date"])',
			'day' 			=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"] . ", " . $item["date_day"]',
			'student_status' 	=> '$item["student_status"] === null ? "Dijadawalkan" : ucwords($item["student_status"])',
			'volunteer_status' 	=> '$item["volunteer_status"] === null ? "Dijadawalkan" : ucwords($item["volunteer_status"])',
			'review' 		=> '$item["review"] === null ? 0 : ucwords($item["review"])',
			'review_mc' 	=> '$this->meta_data["data_star"][$item["review"]]',
		),
	);

	protected $protected_page = array(
		'index' 	=> 'admin',
		'input' 	=> 'denied',
		'edit' 		=> 'denied',
		'duplicate' => 'denied',
		'delete' 	=> 'denied',
		'detail' 	=> 'admin',
		'field' 	=> 'denied',
	);
	protected $action_url  	= array(
// 		'detail',
		// 'delete',
	);

	function __construct()
	{
		parent::__construct();

		$data_hari = $this->config->item('data_hari');
		$this->fcontrol->set_meta_data('data_hari', $data_hari);
		$this->aquery->set_meta_data('data_hari', $data_hari);

		$this->load->model($this->group.'pendampingan/pendampingan_model');
		$this->model =& $this->pendampingan_model;

		$this->list_field['custom']['nick_name'] = '"<a href=\"' . $this->group . 'report/pendampingan/detail/{$item["student_id"]}\">{$item["nick_name"]}</a>"';
		$this->list_field['custom']['volunteer_nick_name'] = '"<a href=\"' . $this->group . 'report/volunteer/detail/{$item["volunteer_id"]}\">{$item["volunteer_nick_name"]}</a>"';

		$data_star = array();
		for ($i=0; $i <= 5; $i++) {
			$data_star[$i] = '';
			for ($j=0; $j < 5; $j++) { 
				$data_star[$i] .= '<i class="fa fa-fw fa-star' . ($i <= $j ? ' text-light' : '') . '"></i>';
			}
			$data_star[$i] = '<div class="text-nowrap text-warning"><span class="hide">' . $i . '</span>'.$data_star[$i].'</div>';
		}

		$this->aquery->set_meta_data('data_star', $data_star);
	}

	public function index($id=false)
	{
		$this->filter();
		parent::index($id);
	}
	
	

	protected function filter()
	{
		$rules_form = array(
			'semester_id' => array(
				'label' 		=> 'Semester',
				'type' 			=> 'select',
				'select_type' 	=> 'key_value',
				'select_data' 	=> 'data_semester',
			),
			'date' => array(
				'label' 		=> 'Tgl. Pendampingan',
				'type' 			=> 'date',
			),
		);

		$this->load->model($this->group.'semester/semester_model');
		$data_semester = $this->semester_model->gets();
		$data_semester = array_column($data_semester, 'semester_name', 'semester_id');
		$this->fcontrol->set_meta_data('data_semester', $data_semester);

		$get_data = array(
			'semester_id' => $this->current_semester,
		);
		if ($get = $this->input->get()) {
			$get_data = array_merge($get_data, $get);
		}

        $this->fcontrol->set_data($get_data)->init($rules_form)->generate();
        if (isset($get_data['semester_id']) === true) {
        	$this->model->where('semester_id', $get_data['semester_id']);
        }
        if (isset($get_data['date']) === true && $get_data['date']) {
        	$this->model->where('date', $get_data['date']);
        }
	}

	public function detail($id = false)
	{
		$this->title = 'Detail Report Pendampingan';
		$this->load->model($this->group.'active/mahasiswa_active_model');
		$arg_where = array(
			'student_id' 	=> $id,
			'semester_id' 	=> $this->current_semester,
		);
		$data = $this->mahasiswa_active_model->where($arg_where)->get();
		if ($data === false) {
			$this->set_message('Data difabel tidak ditemukan');
			$this->redirect($this->module_main);
		}

		$this->load->model($this->group.'mahasiswa/mahasiswa_model');
		$data_mahasiswal = $this->mahasiswa_model->get_view($data['student_id']);
		$this->param['data_mahasiswal'] = $data_mahasiswal;

		$arg_where = array(
			'student_id' 	=> $id,
			'semester_id' 	=> $this->current_semester,
		);

		$data = $this->model->where($arg_where)->gets_view('app_chart_accompainiment_pendampingan_view');
		$this->param['data'] = $data;

		$this->data_kehadiran($arg_where);
		
		$this->build('report-pendampingan-detail');
	}

	protected function data_kehadiran($arg_where)
	{
		$data_star = array();
		for ($i=0; $i <= 5; $i++) {
			$data_star[$i] = '';
			for ($j=0; $j < 5; $j++) { 
				$data_star[$i] .= '<i class="fa fa-fw fa-star' . ($i <= $j ? ' text-light' : '') . '"></i>';
			}
			$data_star[$i] = '<div class="text-nowrap"><span class="hide">' . $i . '</span>'.$data_star[$i].'</div>';
		}

		$this->aquery->set_meta_data('data_star', $data_star);

		$list_field = array(
			'day' 			=> 'Hari dan Tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'nick_name' 	=> 'Mahasiswa',
			'review_mc' 	=> 'Review',
			'sks' 			=> 'SKS',
			'total_jam' 	=> 'Durasi',
		);
		$custom = array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'date' 			=> '$item["date"]',
			'date_day' 		=> 'date_html($item["date"])',
			'day' 			=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"] . ", " . $item["date_day"]',
			'student_status' 	=> '$item["student_status"] === null ? "Dijadawalkan" : ucwords($item["student_status"])',
			'volunteer_status' 	=> '$item["volunteer_status"] === null ? "Dijadawalkan" : ucwords($item["volunteer_status"])',
			'review' 		=> '$item["review"] === null ? 0 : ucwords($item["review"])',
			'review_mc' 	=> '$this->meta_data["data_star"][$item["review"]]',
			'total_jam'		=> 'round(((strtotime($item["end_at"]) - strtotime($item["start_at"])) / 60 / 60), 2) . " Jam"',
			'total_time' 	=> 'strtotime($item["end_at"]) - strtotime($item["start_at"])',
		);

		$this->load->model($this->group.'pendampingan/pendampingan_model');
		$this->param['list_field'] = $list_field;
		$arg_where['volunteer_status'] = 'Selesai';
		$data = $this->pendampingan_model->where($arg_where)->gets_view();
		$this->param['data_hadir'] = $this->aquery->prepar($data)->add_column($custom)->gets();
		$arr_sks = array_column($data, 'sks');
		$arr_jam = array_column($this->param['data_hadir'], 'total_time');
		$arr_review = array_column($this->param['data_hadir'], 'review');
		$this->param['data_hadir_report'] = array(
			'jumlah_hadir' => count($data),
			'jumlah_sks' => array_sum($arr_sks),
			'jumlah_jam' => round((array_sum($arr_jam) / 60 / 60), 2),
			'max_review' => empty($arr_review) === true ? 0 : min($arr_review),
			'min_review' => empty($arr_review) === true ? 0 : max($arr_review),
			'avg_review' => empty($arr_review) === true ? 0 : round(array_sum($arr_review)/count($arr_review), 2),
		);
	}

}
