<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Permission extends App_Controller {
    protected $protected_page = array(
        'index' 	=> 'member',
    );

    protected $module_main  = 'izin/permission';
    protected $module_name  = 'Cuti';
    protected $list_view  	= 'izin-permission-list';

    protected $load_model = false;
    protected $gets_view = true;

    protected $list_field_difabel  	= array(
        'field' 	        => array(
            'date_start' 	=> 'Tanggal Mulai',
            'date_end' 	    => 'Tanggal Selesai',
            'clarification' => 'Keterangan',
            '_status'       => 'Status',
        ),
        'custom' 	=> array(
            'date_start' 	=> '"<span class=\"hide\">{$item["date_start"]}</span>" . date_html($item["date_start"])',
            'date_end' 	    => '"<span class=\"hide\">{$item["date_end"]}</span>" . date_html($item["date_end"])',
            '_status'        => 'ucwords($item["status"])'
        ),
    );

    protected $list_field_volunteer = array(
        'field' 	=> array(
            'date_start' 	=> 'Tanggal Mulai',
            'date_end' 	    => 'Tanggal Selesai',
            'clarification' => 'Keterangan',
            '_status' => 'Status',
        ),
        'custom' 	=> array(
            'date_start' 	=> '"<span class=\"hide\">{$item["date_start"]}</span>" . date_html($item["date_start"])',
            'date_end' 	    => '"<span class=\"hide\">{$item["date_end"]}</span>" . date_html($item["date_end"])',
            '_status'        => 'ucwords($item["status"])'
        ),
    );

    protected $input_field  = array(
        'date_start' => array(
            'label' 	=> 'Tanggal Mulai Izin',
            'required' 	=> true,
            'input_size' => 6,
            'type' 		=> 'date'
        ),
        'date_end' => array(
            'label' 	=> 'Tanggal Akhir Izin',
            'required' 	=> true,
            'input_size' => 6,
            'type' 		=> 'date'
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

        $this->load->model($this->admin_group . 'izin/izin_permission_model');
        $this->model =& $this->izin_permission_model;

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

    public function input($id=false)
    {
        parent::input($id);
    }

    protected function do_input($post)
    {
        $this->model->set_semester_id($this->current_semester);
        $post['student_id'] = $this->user_data['student_id'];
        $this->validation->prepar($post, $this->model->rules);

        $form_valid = $this->validation->run();
        $form_errors = $this->validation->errors;

        if ($form_valid === true) {
            if (strtotime($post['date_start']) >= strtotime($post['date_end'])) {
                $form_valid = false;
                $form_errors[] = 'Jam yang di input tidak sesuai.';
            }
        }

        if ($form_valid === false) {
            $this->errors = $form_errors;
        }else{
            $this->validation->data['semester_id'] = $this->current_semester;
            $this->validation->data['student'] = $this->capability;
            $insert_id = $this->model->create($this->validation->data);

            $this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
            $this->redirect($this->module_main);
        }
    }

    protected function do_edit($id, $data, $post) {
        $this->model->set_semester_id($this->current_semester);
        $post['student_id'] = $this->user_data['student_id'];
        $this->validation->prepar($post, $this->model->rules);

        $form_valid = $this->validation->run();
        $form_errors = $this->validation->errors;

        if ($form_valid === true) {
            if (strtotime($post['date_start']) >= strtotime($post['date_end'])) {
                $form_valid = false;
                $form_errors[] = 'Jam yang di input tidak sesuai.';
            }
        }

        if ($form_valid === false) {
            $this->errors = $form_errors;
        }else{
            $this->validation->data['semester_id'] = $this->current_semester;
            $this->validation->data['student'] = $this->capability;
            $this->model->update($id, $this->validation->data);

            $this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
            $this->redirect($this->module_main);
        }
    }
}
