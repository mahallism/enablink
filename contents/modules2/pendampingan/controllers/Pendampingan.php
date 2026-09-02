<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pendampingan extends App_Controller {
	protected $module_main  = 'pendampingan';
	protected $module_name  = 'pendampingan';

	protected $load_model = false;
	protected $gets_view = true;
	
	protected $list_field_difabel  	= array(
		'field' 	=> array(
			'day' 			=> 'Hari dan tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Pendamping',
			'volunteer_status' => 'Status',
			'review_mc' 	=> 'Review',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"])',
			'pendamping' 	=> '$item["volunteer_name"] . " <small class=\"text-muted\">({$item["volunteer_nick_name"]})</small>"',
			'volunteer_status' => '$item["volunteer_status"] === null ? "Dijadawalkan" : ucwords($item["volunteer_status"])',
			'review' 		=> '$item["review"] === null ? 0 : ucwords($item["review"])',
			'review_mc' 	=> '$this->meta_data["data_star"][$item["review"]]',
		),
	);

	protected $list_field_volunteer = array(
		'field' 	=> array(
			'day' 			=> 'Hari dan tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Mahasiswa Difabel',
			'student_status' => 'Status',
			'review_mc' 	=> 'Review',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"])',
			'pendamping' 	=> '$item["name"] . " <small class=\"text-muted\">({$item["nick_name"]})</small>"',
			'student_status' => '$item["student_status"] === null ? "Dijadawalkan" : ucwords($item["student_status"])',
			'review' 		=> '$item["review"] === null ? 0 : ucwords($item["review"])',
			'review_mc' 	=> '$this->meta_data["data_star"][$item["review"]]',
		),
	);

	protected $action_url  	= array();

	public function __construct()
	{
		$this->protected_page['input'] = 'denied';
		$this->protected_page['edit'] = 'denied';
		$this->protected_page['duplicate'] = 'denied';
		$this->protected_page['delete'] = 'denied';
		$this->protected_page['confirm'] = 'member';

		parent::__construct('member');

		$data_hari = $this->config->item('data_hari');
		$this->fcontrol->set_meta_data('data_hari', $data_hari);
		$this->aquery->set_meta_data('data_hari', $data_hari);

		$data_star = array();
		for ($i=0; $i <= 5; $i++) {
			$data_star[$i] = '';
			for ($j=0; $j < 5; $j++) { 
				$data_star[$i] .= '<i class="fa fa-fw fa-star' . ($i <= $j ? ' text-light' : '') . '"></i>';
			}
			$data_star[$i] = '<div class="text-nowrap"><span class="hide">' . $i . '</span>'.$data_star[$i].'</div>';
		}

		$this->aquery->set_meta_data('data_star', $data_star);

		$this->load->model($this->admin_group . 'pendampingan/pendampingan_model');
		$this->model =& $this->pendampingan_model;

		$this->model->set_student_id($this->user_data['student_id']);
		$this->model->set_semester_id($this->current_semester);
	}
	public function index($id = false)
	{
		if ($this->capability === 'difabel') {
			$this->list_field = $this->list_field_difabel;
			$this->model->where('volunteer_status', "Selesai");
			$this->model->prepar_difabel();
		}else{
			$this->list_field = $this->list_field_volunteer;
			$this->model->where('student_status', "Selesai");
			$this->model->prepar_volunteer();
		}

		parent::index($id);
	}
}
