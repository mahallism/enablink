<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Volunteer extends App_Controller {

	protected $module_main = 'jadwal/volunteer';
	protected $module_name = 'jadwal volunteer';
	
	protected $gets_view 	= true;
	
	protected $list_field  	= array(
		'field' 	=> array(
			'name' 			=> 'Nama',
			'day' 			=> 'Hari',
			'jam' 			=> 'Jam',
			'clarification' => 'Keterangan',
			'room' 			=> 'Ruangan',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'day' 			=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
		),
	);

	protected $list_field_single = array(
		'field' 	=> array(
			'day' 			=> 'Hari',
			'jam' 			=> 'Jam',
			'clarification' => 'Keterangan',
			'room' 			=> 'Ruangan',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'day' 			=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
		),
	);

	protected $input_field  = array(
		'student_id' => array(
			'label' 	=> 'Mahasiswa',
			'required' 	=> true,
			'type' 		=> 'select',
			'select_type' => 'key_value',
			'select_data' => 'data_mahasiswa',
		),
		'divider', 
		'day' => array(
			'label' 	=> 'Hari',
			'required' 	=> true,
			'input_size' => 6,
			'type' 		=> 'select',
			'select_type' => 'key_value',
			'select_data' => 'data_hari',
		),
		'schedule_type' => array(
			'label' 	=> 'Jenis Jadwal',
			'required' 	=> true,
			'input_size' => 6,
			'type' 		=> 'select',
			'select_type' => 'key_value',
			'select_data' => [
				'kuliah'=>'Kuliah'
			]
			//, 'uts', 'uas'],
		),
		array(
			'label' => 'Jam Kuliah',
			'input' => array(
				'start_at' => array(
					'label' => 'Jam Mulai',
					'type' => 'time',
					'info' => 'Jam Mulai',
					'required' => true,
					'input_size' => 6,
				),
				'end_at' => array(
					'label' => 'Jam Selesai',
					'type' => 'time',
					'info' => 'Jam Selesai',
					'required' => true,
					'input_size' => 6,
				),
			),
		),
		'clarification' => array(
			'label' 	=> 'Keterangan',
			'required' 	=> true,
		),
		'room' => array(
			'label' 	=> 'Ruangan (Jika tidak ada isi dengan kosong)',
			'required' 	=> true,
		),
	);

	protected $protected_page = array(
		'index' 	=> 'admin',
		'input' 	=> 'admin',
		'edit' 		=> 'admin',
		'duplicate' => 'admin',
		'delete' 	=> 'admin_master',
		'detail' 	=> 'admin',
		'field' 	=> 'denied',
	);

	public function __construct()
	{
		parent::__construct();

		$this->load->model($this->group.'mahasiswa/mahasiswa_model');
		// $data_mahasiswa = $this->mahasiswa_model->where('capability', 'volunteer')->order_by('name')->gets_view();
		$this->db->from('app_student_active_view');
		$this->db->where('capability', 'volunteer');
		$this->db->where('semester_id', $this->option_model->get_value('current_semester'));
		$this->db->order_by("name", "asc");
		$data_mahasiswa = $this->db->get()->result_array();
		$data_mahasiswa = $this->aquery->prepar($data_mahasiswa)
			->add_column(array('name' => '$item["username"] . " - " . $item["name"]'))
			->gets();
		$data_mahasiswa = array_column($data_mahasiswa, 'name', 'student_id');
		$this->fcontrol->set_meta_data('data_mahasiswa', $data_mahasiswa);
		$data_hari = $this->config->item('data_hari');
		$this->fcontrol->set_meta_data('data_hari', $data_hari);
		$this->aquery->set_meta_data('data_hari', $data_hari);
	}

	public function index($id=false)
	{
		$this->filter();
        $this->model->where('day IS NOT NULL');
        $this->model->where('approver_id IS NOT NULL');
		foreach (array('duplicate', 'edit', 'delete') as $item) {
			$this->action_url[$item]['id'] = $this->model->primary_key;
		}

        $custom_field_name = '"<div class=\"row justify-content-between align-items-center\"><div class=\"col-auto\"><a href=\"' . $this->group . 'mahasiswa/edit/{$item["user_id"]}\">{$item["name"]}</a> <small class=\"text-muted\">({$item["nick_name"]})</small></small><br/><small><a href=\"tel:{$item["no_hp"]}\">{$item["no_hp"]}</a></small></div>"';
        $custom_field_name .= ' . "<div class=\"col-auto text-md-center\">{$item["faculty_name"]}<br/><small>{$item["majors_name"]}</small></div>"';
        $custom_field_name .= ' . "<div class=\"col-auto\"> <a href=\"' . $this->group . $this->module_main . '/input/{$item["student_id"]}\" class=\"btn btn-sm btn-primary my-1 mr-1\"><i class=\"fa fa-plus-circle fa-fw mr-1\"></i>Input Jadwal</a>"';
        $custom_field_name .= ' . "<a href=\"' . $this->group . $this->module_main . '/detail/{$item["student_id"]}\" class=\"btn btn-sm btn-primary my-1\"><i class=\"fa fa-eye fa-fw mr-1\"></i>Lihat Jadwal</a></div></div>"';
        $this->list_field['custom']['name'] = $custom_field_name;

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
			'day' => array(
				'label' 	=> 'Hari',
				'input_size' => 6,
				'type' 		=> 'select',
				'select_type' => 'key_value',
				'select_data' => 'data_hari',
			),
		);

		$this->load->model($this->group.'semester/semester_model');
		$data_semester = $this->semester_model->gets();
		$data_semester = array_column($data_semester, 'semester_name', 'semester_id');
		$this->fcontrol->set_meta_data('data_semester', $data_semester);

		$data_hari = $this->config->item('data_hari');
		$data_hari = array('' => 'Semua Hari') + $data_hari;
		$this->fcontrol->set_meta_data('data_hari', $data_hari);

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
        if (isset($get_data['day']) === true && $get_data['day'] !== '') {
        	$this->model->where('day', $get_data['day']);
        }
	}

	public function detail($id = false)
	{
		$data_mahasiswa = $this->mahasiswa_model->get_view($id);
		if ($data_mahasiswa === false) {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
			$this->redirect($this->module_main);
		}
		$data = $this->model->where('student_id', $id)->where('semester_id', $this->current_semester)->where('day IS NOT NULL')->gets_view();
		$this->title = 'Jadwal Mahasiswa';
		$this->param['size'] = 'md';
		$this->param['action_url']['input']['url'] = $this->group.$this->module_main.'/input/'.$id;
		$this->param['action_url']['duplicate']['url'] = $this->group.$this->module_main.'/duplicate';
		$this->param['action_url']['duplicate']['id'] = $this->model->primary_key;
		$this->param['action_url']['edit']['url'] = $this->group.$this->module_main.'/edit';
		$this->param['action_url']['edit']['id'] = $this->model->primary_key;
		$this->param['action_url']['delete']['url'] = $this->group.$this->module_main.'/delete';
		$this->param['action_url']['delete']['id'] = $this->model->primary_key;
		$this->param['action_url']['delete']['protection'] = 'admin_master';
		$this->param['can_delete_first'] = false;
		$this->param['data'] = $data;
		$this->param['list_field'] = $this->list_field_single['field'];
		$this->param['data'] = $this->aquery->prepar($this->param['data'])->add_column($this->list_field_single['custom'])->gets();
		$this->param['data_mahasiswa'] = $data_mahasiswa;
		$this->build('data-detail');
	}

    public function revisi($id = false, $rev = 1)
    {
        $data_mahasiswa = $this->mahasiswa_model->get_view($id);
        if ($data_mahasiswa === false) {
            $this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
            $this->redirect($this->module_main);
        }
        $this->load->model('jadwal_volunteer_rev_model');
        $data = $this->jadwal_volunteer_rev_model->where('student_id', $id)->where('semester_id', $this->current_semester)->where('rev', $rev)->gets_view();
        $this->title = 'Jadwal Revisi-'.$rev.' Mahasiswa';
        $this->param['size'] = 'md';
        $this->param['action_url']['input']['url'] = $this->group.$this->module_main.'/input/'.$id;
        $this->param['action_url']['duplicate']['url'] = $this->group.$this->module_main.'/duplicate';
        $this->param['action_url']['duplicate']['id'] = $this->jadwal_volunteer_rev_model->primary_key;
        $this->param['action_url']['edit']['url'] = $this->group.$this->module_main.'/edit';
        $this->param['action_url']['edit']['id'] = $this->jadwal_volunteer_rev_model->primary_key;
        $this->param['action_url']['delete']['url'] = $this->group.$this->module_main.'/delete';
        $this->param['action_url']['delete']['id'] = $this->jadwal_volunteer_rev_model->primary_key;
        $this->param['action_url']['delete']['protection'] = 'admin_master';
        $this->param['can_delete_first'] = false;
        $this->param['data'] = $data;
        $this->param['list_field'] = $this->list_field_single['field'];
        $this->param['data'] = $this->aquery->prepar($this->param['data'])->add_column($this->list_field_single['custom'])->gets();
        $this->param['data_mahasiswa'] = $data_mahasiswa;
        $this->build('data-detail');
    }

    public function ujian($id = false)
    {
        $data_mahasiswa = $this->mahasiswa_model->get_view($id);
        if ($data_mahasiswa === false) {
            $this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
            $this->redirect($this->module_main);
        }
        $data = $this->model->where('student_id', $id)->where('semester_id', $this->current_semester)->gets_view("app_schedule_exam_volunteer_view");
        $this->title = 'Jadwal Ujian Mahasiswa';
        $this->param['size'] = 'md';
        $this->param['action_url']['input']['url'] = $this->group.$this->module_main.'/input/'.$id;
        $this->param['action_url']['duplicate']['url'] = $this->group.$this->module_main.'/duplicate';
        $this->param['action_url']['duplicate']['id'] = $this->model->primary_key;
        $this->param['action_url']['edit']['url'] = $this->group.$this->module_main.'/edit';
        $this->param['action_url']['edit']['id'] = $this->model->primary_key;
        $this->param['action_url']['delete']['url'] = $this->group.$this->module_main.'/delete';
        $this->param['action_url']['delete']['id'] = $this->model->primary_key;
        $this->param['action_url']['delete']['protection'] = 'admin_master';
        $this->param['can_delete_first'] = false;
        $this->param['data'] = $data;
        $this->param['list_field'] = $this->list_field_single['field'];
        $this->param['data'] = $this->aquery->prepar($this->param['data'])->add_column($this->list_field_single['custom'])->gets();
        $this->param['data_mahasiswa'] = $data_mahasiswa;
        $this->build('data-detail');
    }

	public function input($id=false)
	{
		$this->param['post']['student_id'] = $id;
		parent::input($id);
	}

	protected function do_input($post)
	{
		$this->model->set_semester_id($this->current_semester);

		$this->validation->prepar($post, $this->model->rules);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;

		if ($form_valid === true) {
			if (strtotime($post['start_at']) >= strtotime($post['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Jam yang di input tidak sesuai.';
			}else{
				$check_jadwal = $this->model->check_jadwal($post);
				if ($check_jadwal === false) {
					$form_valid = false;
					$form_errors[] = 'Jadwal bertabrakan dengan jadwal lain.';
				}
			}
		}

		if ($form_valid === false) {
			$this->errors = $form_errors;
		}else{
			$insert_id = $this->model->create($this->validation->data);

			$this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main.'/detail/'.$this->validation->data['student_id']);
		}
	}

	protected function do_edit($id, $data, $post)
	{
		$this->validation->prepar($post, $this->model->rules);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;

		if ($form_valid === true) {
			if (strtotime($post['start_at']) >= strtotime($post['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Jam yang di input tidak sesuai.';
			}else{
				$this->model->set_semester_id($this->current_semester);
				$this->model->update($id, ['deleted' => 'true']);

				$this->model->where($this->model->primary_key . ' <>', $id);
				$check_jadwal = $this->model->check_jadwal($post);
				if ($check_jadwal === false) {
					$form_valid = false;
					$form_errors[] = 'Jadwal bertabrakan dengan jadwal lain.';
					$this->model->set_semester_id($this->current_semester);
					$this->model->update($id, ['deleted' => 'false']);
				}
			}
		}

		if ($form_valid === false) {
			$this->errors = $form_errors;
		}else{
			// $this->model->update($id, $this->validation->data);

			$this->model->set_semester_id($this->current_semester);
			$this->model->create($this->validation->data);
			
			$this->set_message('Data ' . $this->module_name . ' telah berhasil diubah.', 'success');
			$this->redirect($this->module_main.'/detail/'.$this->validation->data['student_id']);
		}
	}
	
	public function delete($id = false)
	{
		$data = $this->model->get($id);
		if ($data === false) {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
			$this->redirect($this->module_main);
		}

		$this->model->delete($id);
		$this->set_message('Data ' . $this->module_name . ' telah berhasil dihapus.', 'success');
		$this->redirect($this->module_main.'/detail/'.$data['student_id']);
	}
}
