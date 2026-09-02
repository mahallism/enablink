<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Permission extends App_Controller {
	protected $module_main = 'izin/permission';
	protected $module_name = 'Izin Terjadwal';

	protected $gets_view = true;

	protected $list_field  	= array(
		'field' 	=> array(
			'pengirim' 		=> 'Pengirim',
			'student' 		=> 'Mahasiswa',
            'date_start' 	=> 'Tgl Mulai',
            'date_end' 	    => 'Tgl Selesai',
			'clarification' => 'Keterangan',
			'status'		=> 'Status Izin',
			'created_at' 	=> 'Dibuat',
		),
		'custom' 	=> array(
			'student' 		=> 'ucwords($item["student"])',
            'date_start' 	=> 'date_html($item["date_start"])',
            'date_end' 	    => 'date_html($item["date_end"])',
			'created_at' 	=> 'datetime_html($item["created_at"])',
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
            'label'     => 'Keterangan',
            'required' 	=> true,
            'type'      => 'text'
        )
    );

	protected $protected_page = array(
		'index' 	=> 'admin',
		'input' 	=> 'admin',
		'edit' 		=> 'admin',
		'duplicate' => 'denied',
		'delete' 	=> 'admin_master',
		'detail' 	=> 'denied',
		'field' 	=> 'denied',
	);
	protected $action_url  	= array(
        'input',
        'edit',
        'delete',
	);

	function __construct()
	{
		parent::__construct();

        $this->load->model($this->group . 'mahasiswa/mahasiswa_model');
        // $data_mahasiswa = $this->mahasiswa_model->where('capability', 'difabel')->order_by('name')->gets_view();
        $this->db->from('app_student_active_view');
        $this->db->where('semester_id', $this->option_model->get_value('current_semester'));
        $this->db->order_by("username", "asc");
        $data_mahasiswa = $this->db->get()->result_array();
        $data_mahasiswa = $this->aquery->prepar($data_mahasiswa)
            ->add_column(array('name' => '$item["username"] . " - " . $item["name"] . " - " . $item["capability"]'))
            ->gets();
        $data_mahasiswa = array_column($data_mahasiswa, 'name', 'student_id');
        $this->fcontrol->set_meta_data('data_mahasiswa', $data_mahasiswa);

		$this->list_field['custom']['pengirim'] = '"<a href=\"' . $this->group . 'mahasiswa/edit/{$item["user_id"]}\">{$item["name"]}</a> <small class=\"text-muted\">({$item["nick_name"]})</small>"';
	}

	public function index($id=false)
	{
		$this->filter();
        foreach (array('edit') as $item) {
            $this->action_url[$item]['id'] = $this->model->primary_key;
        }
        $this->list_view = 'data-list-permission';
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
			)
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

    public function input($id = false)
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
            if (strtotime($post['date_start']) >= strtotime($post['date_end'])) {
                $form_valid = false;
                $form_errors[] = 'Jam yang di input tidak sesuai.';
            }
        }

        if ($form_valid === false) {
            $this->errors = $form_errors;
        } else {
            $this->load->model($this->group . 'mahasiswa/mahasiswa_model');
            // $data_mahasiswa = $this->mahasiswa_model->where('capability', 'difabel')->order_by('name')->gets_view();
            $this->db->from('app_student_active_view');
            $this->db->where('semester_id', $this->option_model->get_value('current_semester'));
            $this->db->where('student_id', $this->validation->data['student_id']);
            $data_mahasiswa = $this->db->get()->row_array();

            $this->validation->data['student'] = $data_mahasiswa['capability'];
            $this->validation->data['semester_id'] = $this->current_semester;
            $this->validation->data['status'] = 'menunggu konfirmasi';
            $insert_id = $this->model->create($this->validation->data);

            $this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
            $this->redirect($this->module_main);
        }
    }

    function gen_change(){
        if(empty($_GET['permission'])){
            $this->set_message('Izin tidak ditemukan');
            $this->redirect($this->module_main);
        }
        $data = $this->model->get($_GET['permission']);
        if (!$data) {
            $this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
            $this->redirect($this->module_main);
        }
        if($data['student'] == 'volunteer'){
            $this->load->model('admin/pendampingan/pendampingan_model');
            $max_freq_accompanisment = $this->option_model->get_value('max_frequensi_accompaniment');
            $accompaniments = $this->model->get_accompaniment_volunteer(array(
                'date_start'=>$data['date_start'],
                'date_end'=>$data['date_end'],
                'volunteer_id'=>$data['student_id']));

            foreach ($accompaniments as $accompaniment){
                $volunteer = $this->pendampingan_model->get_free_volunteer(array(
                    "semester_id" => $this->current_semester,
                    "date" => $accompaniment['date'],
                    "day" => date("w", strtotime($accompaniment["date"])),
                    "start_at" => $accompaniment['start_at'],
                    "end_at" => $accompaniment['end_at'],
                    "prior_volunteer_id" => (!empty($accompaniment["prior_volunteer_id"]) ? $accompaniment["prior_volunteer_id"] : null),
                    "prior_majors_id" => $accompaniment["majors_id"],
                    "prior_faculty_id" => $accompaniment["faculty_id"],
                    "prior_majors_focus" => $accompaniment["majors_focus"],
                    "limit_count_accompaniment" => $max_freq_accompanisment,
                    "pick_one" => true
                ));

                $this->pendampingan_model->update($accompaniment['accompaniment_id'], array(
                    'volunteer_id'=>$volunteer['student_id'],
                    'note'=>'Izin ' .$data['student_id']. ' mulai ' . $data['date_start'] . " sampai " . $data['date_end']
                ));
            }
            $this->model->update($data['permission_id'], array(
                'status'=>'diterima'
            ));
        }
        redirect($this->module_main, 'refresh');
    }

    function cancel(){
        if(empty($_GET['permission'])){
            $this->set_message('Izin tidak ditemukan');
            $this->redirect($this->module_main);
        }
        $data = $this->model->get($_GET['permission']);
        if (!$data) {
            $this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
            $this->redirect($this->module_main);
        }
        if($data['student'] == 'difabel'){
            $this->load->model('admin/pendampingan/pendampingan_model');
            $accompaniments = $this->model->get_accompaniment_student(array(
                'date_start'=>$data['date_start'],
                'date_end'=>$data['date_end'],
                'student_id'=>$data['student_id']));

            foreach ($accompaniments as $accompaniment) {
                $this->pendampingan_model->update($accompaniment['accompaniment_id'], array(
                    'student_status'=>'izin'
                ));
            }
            $this->model->update($data['permission_id'], array(
                'status'=>'diterima'
            ));

            $this->set_message('Izin pendampingan telah berhasil disimpan', 'success');
            $this->redirect("izin/permission");
        }
        redirect($this->module_main, 'refresh');
    }

}
