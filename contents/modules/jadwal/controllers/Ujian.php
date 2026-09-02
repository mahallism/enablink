<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ujian extends App_Controller {
	protected $protected_page = array(
		'index' 	=> 'member',
	);

	protected $module_main  = 'jadwal/ujian';

    protected $load_model = false;
	
	protected $list_view  	= 'ujian-list';

	protected $list_field_difabel  	= array(
		'field' 	=> array(
            'schedule_type' => 'Kategori',
			'date' 			=> 'Tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'sks' 			=> 'SKS',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'schedule_type'  => 'strtoupper($item["schedule_type"])',
            'date' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . date("d/M/Y", strtotime($item["date"]))',
		),
	);

	protected $input_field_difabel  = array(
		'date' => array(
			'label' 	=> 'Tanggal',
			'required' 	=> true,
			'input_size' => 6,
			'type' 		=> 'date'
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
		'room' => array(
			'label' 	=> 'Ruangan',
			'required' 	=> true,
			'input_size' => 6,
		),
		'courses' => array(
			'label' 	=> 'Mata Kuliah',
			'required' 	=> true,
		),
		'schedule_type' => array(
			'label' 	=> 'Jenis Jadwal',
			'required' 	=> true,
			'input_size' => 6,
			'type' 		=> 'select',
			'select_type' => 'key_value',
			'select_data' => array(
                'uts'=>"UTS",
                'uas'=>"UAS",
                'kuliah'=>"Kuliah"
            ),
		),
		'sks' => array(
			'label' 	=> 'Jumlah SKS',
			'type' 		=> 'number',
			'required' 	=> true,
			'input_size' => 4,
		),
	);

	protected $list_field_volunteer = array(
		'field' 	=> array(
            'schedule_type' => 'kategori',
			'date' 			=> 'Tanggal',
			'jam' 			=> 'Jam',
			'clarification' => 'Keterangan',
			'room' 			=> 'Ruangan',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
            'schedule_type'  => 'strtoupper($item["schedule_type"])',
			'date' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . date("d/M/Y", strtotime($item["date"]))',
		),
	);

	protected $input_field_volunteer = array(
		'date' => array(
			'label' 	=> 'Tanggal',
			'required' 	=> true,
			'input_size' => 6,
			'type' 		=> 'date'
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
		'schedule_type' => array(
			'label' 	=> 'Jenis Jadwal',
			'required' 	=> true,
			'input_size' => 6,
			'type' 		=> 'select',
			'select_type' => 'key_value',
            'select_data' => array(
                'uts'=>"UTS",
                'uas'=>"UAS",
                'kuliah'=>"Kuliah"
            ),
		),
	);

	public function __construct()
	{
		$this->protected_page['active'] = 'member';

		parent::__construct('member');

		$data_hari = $this->config->item('data_hari');
		$this->fcontrol->set_meta_data('data_hari', $data_hari);
		$this->aquery->set_meta_data('data_hari', $data_hari);

		$this->active_menu = 'jadwal_ujian';

		if ($this->capability === 'difabel') {
            $this->gets_view = 'app_schedule_exam_student_view';
			$this->module_name  = 'jadwal kegiatan lain/ujian';
			$this->param['module_name']  = 'jadwal kegiatan lain/ujian';

			$this->load->model($this->admin_group . 'jadwal/jadwal_difabel_model');
			$this->model =& $this->jadwal_difabel_model;

			$this->list_field = $this->list_field_difabel;
			$this->input_field = $this->input_field_difabel;
		}
        else{
            $this->gets_view = 'app_schedule_exam_volunteer_view';
			$this->module_name  = 'jadwal kegiatan lain/ujian';
			$this->param['module_name']  = 'jadwal kegiatan lain/ujian';

			$this->load->model($this->admin_group . 'jadwal/jadwal_volunteer_model');
			$this->model =& $this->jadwal_volunteer_model;

			$this->list_field = $this->list_field_volunteer;
			$this->input_field = $this->input_field_volunteer;
		}

		$this->model->set_student_id($this->user_data['student_id']);
		$this->model->set_semester_id($this->current_semester);
	}

	public function index($id = false)
	{
		$this->model->prepar_student();
        $this->param['semester'] = $this->semester;
		parent::index($id);
	}

	public function input($id = false)
	{
		if ($this->data_active == false) {
			$this->set_message('Pengajuan telah dilakukan sebelumnya, data ' . $this->module_name . ' tidak dapat ditambah.');
			$this->redirect($this->modele_main);
		}
		parent::input($id);
	}

	protected function do_input($post)
	{
		$this->validation->prepar($post, $this->model->rules);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;

		if ($form_valid === true) {
			if (strtotime($post['start_at']) >= strtotime($post['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Jam yang di input tidak sesuai.';
			}else if (strtotime($post['date']) < strtotime(date("Y-m-d"))) {
                $form_valid = false;
                $form_errors[] = 'Input Tanggal harus harus lebih dari tanggal Saat ini';
            }else{
                if($post['schedule_type'] == 'uts' &&
                    strtotime($post['date']) >= strtotime($this->semester['uts_start_at']) &&
                    strtotime($post['date']) >= strtotime($this->semester['uts_end_at']) ){
                    $form_valid = false;
                    $form_errors[] = 'Tanggal yang dipilih tidak dalam range jadwal UTS <br/><b>('.date("d/M/Y", strtotime($this->semester['uts_start_at'])).' - '.date("d/M/Y", strtotime($this->semester['uts_end_at'])).')</b>';
                }
                else if($post['schedule_type'] == 'uas' &&
                    strtotime($post['date']) >= strtotime($this->semester['uas_start_at']) &&
                    strtotime($post['date']) <= strtotime($this->semester['uas_end_at'])){
                    $form_valid = false;
                    $form_errors[] = 'Tanggal yang dipilih tidak dalam range jadwal UAS <br/><b>('.date("d/M/Y", strtotime($this->semester['uas_start_at'])).' - '.date("d/M/Y", strtotime($this->semester['uas_end_at'])).')</b>';
                }
                else {
                    $check_jadwal = $this->model->check_jadwal($post);
                    if ($check_jadwal === false) {
                        $form_valid = false;
                        $form_errors[] = 'Jadwal bertabrakan dengan jadwal lain.';
                    }
                }

                $this->load->model($this->admin_group.'pendampingan/pendampingan_model');
                $post['semester_id'] = $this->current_semester;
		        $post['student_id'] = $this->user_data['student_id'];
                if(!$this->pendampingan_model->is_free_accompaniment($post)){
                    $form_valid = false;
                    $form_errors[] = 'Sudah ada jadwal pendampingan, mohon mengajukan izin';
                }
			}
		}

		if ($form_valid === false) {
			$this->errors = $form_errors;
		}else{
			$insert_id = $this->model->create($this->validation->data);
			$this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function edit($id = false)
	{
		if ($this->data_active == false) {
			$this->set_message('Pengajuan telah dilakukan sebelumnya, data ' . $this->module_name . ' tidak dapat ubah.');
			$this->redirect($this->modele_main);
		}
		$this->model->prepar_student();
		parent::edit($id);
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
			}
            if($post['schedule_type'] == 'uts' &&
                strtotime($post['date']) >= strtotime($this->semester['uts_start_at']) &&
                strtotime($post['date']) >= strtotime($this->semester['uts_end_at']) ){
                $form_valid = false;
                $form_errors[] = 'Tanggal yang dipilih tidak dalam range jadwal UTS <br/><b>('.date("d/M/Y", strtotime($this->semester['uts_start_at'])).' - '.date("d/M/Y", strtotime($this->semester['uts_end_at'])).')</b>';
            }
            else if($post['schedule_type'] == 'uas' &&
                strtotime($post['date']) >= strtotime($this->semester['uas_start_at']) &&
                strtotime($post['date']) <= strtotime($this->semester['uas_end_at'])){
                $form_valid = false;
                $form_errors[] = 'Tanggal yang dipilih tidak dalam range jadwal UAS <br/><b>('.date("d/M/Y", strtotime($this->semester['uas_start_at'])).' - '.date("d/M/Y", strtotime($this->semester['uas_end_at'])).')</b>';
            }
            else{
				$this->model->where($this->model->primary_key . ' <>', $id);
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
			$this->model->update($id, $this->validation->data);
			
			$this->set_message('Data ' . $this->module_name . ' telah berhasil diubah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function delete($id = false)
	{
		if ($this->data_active == false) {
			$this->set_message('Pengajuan telah dilakukan sebelumnya, data ' . $this->module_name . ' tidak dapat dihapus.');
			$this->redirect($this->modele_main);
		}
		$this->model->prepar_student();
		parent::delete($id);
	}
}
