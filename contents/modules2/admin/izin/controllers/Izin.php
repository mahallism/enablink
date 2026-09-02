<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Izin extends App_Controller {
	protected $module_main = 'izin';
	protected $module_name = 'surat izin';

	protected $gets_view = true;

	protected $list_field  	= array(
		'field' 	=> array(
			'pengirim' 		=> 'Pengirim',
			'student' 		=> 'Mahasiswa',
			'pendampingan' 	=> 'Waktu Pendampingan',
			'volunteer_tujuan' 	=> 'Volunteer Tujuan',
			'clarification' => 'Keterangan',
			'status'		=> 'Status Izin',
			'created_at' 	=> 'Dibuat',
		),
		'custom' 	=> array(
			'student' 		=> 'ucwords($item["student"])',
			'created_at' 	=> 'datetime_html($item["created_at"])',
		),
	);

	protected $protected_page = array(
		'index' 	=> 'admin',
		'input' 	=> 'denied',
		'edit' 		=> 'denied',
		'duplicate' => 'denied',
		'delete' 	=> 'admin_master',
		'detail' 	=> 'denied',
		'field' 	=> 'denied',
	);
	protected $action_url  	= array(
		'delete',
	);

	function __construct()
	{
		parent::__construct();
		$this->list_field['custom']['pengirim'] = '"<a href=\"' . $this->group . 'mahasiswa/edit/{$item["user_id"]}\">{$item["name"]}</a> <small class=\"text-muted\">({$item["nick_name"]})</small>"';
		$this->list_field['custom']['volunteer_tujuan'] = '"<a href=\"' . $this->group . 'report/volunteer/detail/{$item["new_volunteer_id"]}\">{$item["volunteer_nick_name"]}</a>"';
		$str_custom_waktu_pendampingan = '"<a href=\"' . $this->group . 'pendampingan/edit/{$item["accompaniment_id"]}\">" . date_html($item["date"]) . "</a> <small class=\"text-muted\">(" . time_html($item["start_at"]) . "-" . time_html($item["end_at"]) . ")</small>"';
		$this->list_field['custom']['pendampingan'] = $str_custom_waktu_pendampingan;
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

}
