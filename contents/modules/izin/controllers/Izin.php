<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Izin extends App_Controller {
	protected $protected_page = array(
		'index' 	=> 'member',
	);

	protected $module_main  = 'izin';
	protected $module_name  = 'surat izin';
    protected $list_view  	= 'izin-list';

	protected $load_model = false;
	protected $gets_view = true;
	
	protected $list_field_difabel  	= array(
		'field' 	=> array(
			'day' 			=> 'Jadwal Pendampingan',
			'clarification' => 'Keterangan',
            '_status' => 'Status',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"]). " <small class=\"text-muted\">({$item["jam"]})</small>"',
            '_status'        => 'ucwords($item["status"])'
		),
	);

	protected $list_field_volunteer = array(
		'field' 	=> array(
			'day' 	=> 'Jadwal Pendampingan',
			'clarification' => 'Keterangan',
            '_status' => 'Status',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"]). " <small class=\"text-muted\">({$item["jam"]})</small>"',
            '_status'        => 'ucwords($item["status"])'
		),
	);

	protected $input_field  = array(
		'accompaniment_id' => array(
			'label'	=> 'Jadwal Pendampingan',
			'type' => 'select',
			'select_type' => 'key_value',
			'select_data' => 'data_pendampingan',
		),
		'clarification' => array(
			'label'	=> 'Keterangan',
			'type' => 'textarea',
		),
	);

	protected $action_url  	= array(
		'input',
        'edit',
        'delete',
	);

	public function __construct()
	{
        $this->protected_page['active'] = 'member';
//		$this->protected_page['edit'] = 'denied';
//		$this->protected_page['duplicate'] = 'denied';
//		$this->protected_page['delete'] = 'denied';

		parent::__construct('member');

		$this->data_hari = $this->config->item('data_hari');
		$this->fcontrol->set_meta_data('data_hari', $this->data_hari);
		$this->aquery->set_meta_data('data_hari', $this->data_hari);

		$this->load->model($this->admin_group . 'izin/izin_model');
		$this->model =& $this->izin_model;

		$this->model->set_student_id($this->user_data['student_id']);
		$this->model->set_semester_id($this->current_semester);

		$this->load->model($this->admin_group . 'pendampingan/pendampingan_model');

		$this->pendampingan_model->set_student_id($this->user_data['student_id']);
		$this->pendampingan_model->set_semester_id($this->current_semester);

        foreach (array('edit', 'delete') as $item) {
            $this->action_url[$item]['id'] = $this->model->primary_key;
        }
	}

	public function index($id = false)
	{
		if ($this->capability === 'difabel') {
			$this->list_field = $this->list_field_difabel;
			$this->model->prepar_difabel();
		}else{
			$this->list_field = $this->list_field_volunteer;
			$this->model->prepar_volunteer();
		}

		parent::index($id);
	}

	protected function set_data_pendampingan($id = false)
	{
		if ($this->capability === 'difabel') {
			$this->pendampingan_model->prepar_difabel();
		}else{
			$this->pendampingan_model->prepar_volunteer();
		}

		$temp = $this->pendampingan_model->where('date >=', date('Y-m-d'))->gets_view();
		$temp = array_column($temp, null, $this->pendampingan_model->primary_key);
		$data_pendampingan = array();

		if ($this->capability === 'difabel') {
			$this->model->prepar_difabel();
		}else{
			$this->model->prepar_volunteer();
		}

		$data_izin = $this->model->gets_view();
		$data_izin = array_column($data_izin, 'accompaniment_id', $this->model->primary_key);
		foreach ($temp as $index => $item) {
			if ($this->capability === 'difabel') {
				$status = $item['student_status'];
			}else{
				$status = $item['volunteer_status'];
			}
			if ((in_array($status, array(null, 'Dilihat', 'terjadwal', 'Dijadawalkan', 'Dikonfirmasi')) === true
							&& in_array($item['accompaniment_id'], $data_izin) === false) || ($status === 'Izin' && isset($data_izin[$id]))) {
				$data_pendampingan[$index] = $this->data_hari[(empty($item['day']) ? date("w", strtotime($item['date'])): $item['day'])] . ', '. date_html($item['date']) .' ('. time_html($item['start_at']) . '-'. time_html($item['end_at']).')';
			}
		}

		$this->fcontrol->set_meta_data('data_pendampingan', $data_pendampingan);
		$this->data_pendampingan = $data_pendampingan;
	}

	public function input($id=false)
	{
		if ($id !== false) {
			$data_post = array(
				'accompaniment_id' => $id,
			);
			$this->fcontrol->set_data($data_post);
		}
		$this->set_data_pendampingan();
		parent::input($id);
	}

	protected function do_input($post)
	{
		$this->validation->prepar($post, $this->model->rules);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;

		if ($form_valid === true) {
			if (isset($this->data_pendampingan[$post['accompaniment_id']]) === false) {
				$form_valid = false;
				$form_errors[] = 'Jadwal pendampingan tidak ditemukan.';
			}
		}

		if ($form_valid === false) {
			$this->errors = $form_errors;
		}else{
			$this->validation->data['semester_id'] = $this->current_semester;
			$this->validation->data['student_id'] = $this->user_data['student_id'];
			$this->validation->data['student'] = $this->capability;

			$insert_id = $this->model->create($this->validation->data);

			if ($this->capability === 'difabel') {
				$data_update = array('student_status' => 'Izin');
			}else{
				$data_update = array('volunteer_status' => 'Izin');
			}
			$this->pendampingan_model->update($post['accompaniment_id'], $data_update);

			$this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function edit($id=false)
	{
		$this->set_data_pendampingan($id);
		parent::edit($id);
	}

    public function delete($id = false)
    {
        if ($this->capability === 'difabel') {
            $this->model->prepar_difabel();
        }else{
            $this->model->prepar_volunteer();
        }
        parent::delete($id);
    }
}
