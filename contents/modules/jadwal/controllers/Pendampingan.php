<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pendampingan extends App_Controller {
	protected $module_main  = 'jadwal/pendampingan';
	protected $module_name  = 'jadwal pendampingan';

	protected $load_model = false;
	protected $gets_view = true;

	protected $list_field_difabel  	= array(
		'field' 	=> array(
			'day' 			=> 'Hari dan tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Pendamping',
            'student_status'    => 'Status Madif',
            'code_attending'=> 'Kode Pendamping',
            'volunteer_status'  => 'Status Volunteer',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? $this->meta_data["data_hari"][date("w", strtotime($item["date"]))] : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'fakultas_jurusan' 	=> '"<div><small>{$item["volunteer_faculty_name"]} - {$item["volunteer_majors_name"]}</small></div>"',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"])',
			'pendamping' 	=> '$item["volunteer_name"] . " <small class=\"text-muted\">({$item["volunteer_nick_name"]})</small>".$item["fakultas_jurusan"].$item["volunteer_no_hp"]',
			'volunteer_status' => '$item["volunteer_status"] === null ? "Sedang Dijadawalkan" : ucwords($item["volunteer_status"])',
            'student_status'=> '$item["student_status"] == "izin" ? "<code>Izin</code>" : ucwords($item["student_status"])',
		),
	);

	protected $list_field_volunteer = array(
		'field' 	=> array(
			'day' 			=> 'Hari dan tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Mahasiswa Difabel',
            'student_status'    => 'Status Madif',
            'volunteer_status'  => 'Status Volunteer',
			
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? $this->meta_data["data_hari"][date("w", strtotime($item["date"]))] : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'fakultas_jurusan' 	=> '"<div><small>{$item["faculty_name"]} - {$item["majors_name"]}</small></div>"',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"])',
			'pendamping' 	=> '$item["name"] . " <small class=\"text-muted\">({$item["nick_name"]})</small>".$item["fakultas_jurusan"].$item["no_hp"]',
			'student_status' => '$item["student_status"] === null ? "Sedang Dijadawalkan" : ' .
                '($item["student_status"] == "izin" ? "<code>Izin</code>" : ucwords($item["student_status"]))',
				'daynum'		=>'date("w", strtotime($item["date"]))',
				'fakultas'=> '$item["faculty_name"]',
		),
	);

	protected $action_url  	= array(
		// 'input', 'edit', 'duplicate', 'delete',
	);

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

		$this->load->model($this->admin_group . 'pendampingan/pendampingan_model');
		$this->model =& $this->pendampingan_model;

		$this->model->set_student_id($this->user_data['student_id']);
		$this->model->set_semester_id($this->current_semester);
	}

	public function index($id = false)
	{
        $this->param['capability'] = $this->capability;
        if ($this->capability === 'difabel') {
			$this->list_field = $this->list_field_difabel;
			$this->model->prepar_difabel();
			$temp = $this->model->gets_view();
			$temp = array_column($temp, $this->model->primary_key);
			if (empty($temp) === false) {
				$this->model->where_in($this->model->primary_key, $temp)->update(array(
					'semester_id' => $this->current_semester,
					'student_status' => null,
				), array(
					'student_status' => 'Dilihat',
				));
			}
			$this->model->prepar_difabel();
		}else{
			$this->list_field = $this->list_field_volunteer;
			$this->model->update(array(
				'volunteer_id' => $this->user_data['student_id'],
				'semester_id' => $this->current_semester,
				'volunteer_status' => null,
			), array(
				'volunteer_status' => 'Dilihat',
			));
			$this->model->prepar_volunteer();
		}
		
		$this->param['data'] = $this->model->gets_view();
		$this->param['list_field'] = $this->list_field['field'];
		$this->param['data'] = $this->aquery->prepar($this->param['data'])
			->add_column($this->list_field['custom'])
			->gets();

		$this->title = 'Data ' . ucwords($this->module_name);
		$this->param['mode_add'] = $this->single_page;
		$this->param['size'] = $this->list_size;

		$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
		$user_id = $this->user_data['user_id'] ?? null;

		foreach ($this->param['data'] as &$item) {
			$jadwal_id = $item['accompaniment_id'] ?? null;
			if ($user_id && $jadwal_id) {
				$item['status_pengajuan'] = $this->Volunteer_model->change_button($user_id, $jadwal_id);
			} else {
				$item['status_pengajuan'] = false;
			}
		}
		
		
		//$this->load->view('jadwal-pendampingan-list');
		//$this->load->view('member/jadwal-pendampingan-list');
		$this->build('jadwal-pendampingan-list');
		
	}

	// public function confirm($id = false)
	// {
	// 	if ($this->capability === 'difabel') {
	// 		$this->model->prepar_difabel();
	// 	}else{
	// 		$this->model->prepar_volunteer();
	// 	}
	// 	$data = $this->model->get_view($id);
	// 	if ($data === false) {
	// 		$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
	// 		$this->redirect($this->module_main);
	// 	}

	// 	if ($this->capability === 'difabel') {
	// 		$status = $data['student_status'];
	// 	}else{
	// 		$status = $data['volunteer_status'];
	// 	}

	// 	if (in_array($status, array('Dijadawalkan', 'Dilihat')) === false) {
	// 		$this->set_message('Perubahan data status tidak dapat dilakukan.');
	// 		$this->redirect($this->module_main);
	// 	}else{
	// 		if ($this->capability === 'difabel') {
	// 			$this->model->update($id, array(
	// 				'student_status' => 'Dikonfirmasi',
	// 			));
	// 		}else{
	// 			$this->model->update($id, array(
	// 				'volunteer_status' => 'Dikonfirmasi',
	// 			));
	// 		}
	// 		$this->set_message('Data ' . $this->module_name . ' telah berhasil dikonfirmasi.', 'success');
	// 		$this->redirect($this->module_main);
	// 	}
	// }
	
}
