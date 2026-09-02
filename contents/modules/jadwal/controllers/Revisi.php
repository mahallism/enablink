<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Revisi extends App_Controller {
    protected $protected_page = array(
        'index' 	=> 'member',
    );

    protected $module_main  = 'jadwal/revisi';

    protected $load_model = false;

    protected $list_view  	= 'revisi-jadwal-list';
    protected $list_field_difabel  	= array(
        'field' 	=> array(
            'day' 			=> 'Hari',
            'jam' 			=> 'Jam',
            'room' 			=> 'Ruang',
            'courses' 		=> 'Mata Kuliah',
            'sks' 			=> 'SKS',
        ),
        'custom' 	=> array(
            'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
            'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
            'day' 			=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
        ),
    );

    protected $input_field_difabel  = array(
        'day' => array(
            'label' 	=> 'Hari',
            'required' 	=> true,
            'input_size' => 6,
            'type' 		=> 'select',
            'select_type' => 'key_value',
            'select_data' => 'data_hari',
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
            'select_type' => 'value',
            'select_data' => ['kuliah', 'uts', 'uas'],
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

    protected $input_field_volunteer = array(
        'day' => array(
            'label' 	=> 'Hari',
            'required' 	=> true,
            'input_size' => 6,
            'type' 		=> 'select',
            'select_type' => 'key_value',
            'select_data' => 'data_hari',
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
            'select_type' => 'value',
            'select_data' => ['kuliah', 'uts', 'uas'],
        ),
    );

    public function __construct()
    {
        $this->protected_page['active'] = 'member';

        parent::__construct('member');

        $data_hari = $this->config->item('data_hari');
        $this->fcontrol->set_meta_data('data_hari', $data_hari);
        $this->aquery->set_meta_data('data_hari', $data_hari);

        $this->active_menu = 'revisi';

        if ($this->capability === 'difabel') {
            $this->module_name  = 'revisi jadwal kuliah';
            $this->param['module_name']  = 'revisi jadwal kuliah';

            $this->load->model($this->admin_group . 'jadwal/jadwal_difabel_rev_model');
            $this->model =& $this->jadwal_difabel_rev_model;

            $this->list_field = $this->list_field_difabel;
            $this->input_field = $this->input_field_difabel;
        }else{
            $this->module_name  = 'revisi jadwal kuliah';
            $this->param['module_name']  = 'revisi jadwal kuliah';

            $this->load->model($this->admin_group . 'jadwal/jadwal_volunteer_rev_model');
            $this->model =& $this->jadwal_volunteer_rev_model;

            $this->list_field = $this->list_field_volunteer;
            $this->input_field = $this->input_field_volunteer;
        }

        if (empty($this->data_active) || empty($this->data_active['approver_id'])) {
            $this->set_message('Belum ada Jadwal Aktif untuk direvisi.');
            $this->redirect($this->modele_main . "jadwal");
        }

        $this->model->set_student_id($this->user_data['student_id']);
        $this->model->set_semester_id($this->current_semester);
        $this->model->set_rev($this->data_active['rev']+1);
    }

    public function index($id = false)
    {
        $this->model->prepar_student();
        parent::index($id);
    }

    public function input($id = false)
    {
        if ($this->data_active == false) {
            $this->set_message('Belum ada jadwal aktif, ' . $this->module_name . ' tidak dapat ditambah.');
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
            $this->load->model('/admin/Semester/Semester_model', 'Semester_model');//
            $tanggal_main = $this->Semester_model->get_semester_end_date($this->current_semester);//
            $tanggal_main2 =  date('Y-m-d', strtotime($tanggal_main . ' +1 day'));//

			$this->validation->data['waktu_revisi'] = $tanggal_main2;
            $insert_id = $this->model->create($this->validation->data);
            
            $this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
            $this->redirect($this->module_main);
        }
    }

    public function edit($id = false)
    {
        if ($this->data_active == false) {
            $this->set_message('Belum ada jadwal aktif, data ' . $this->module_name . ' tidak dapat ubah.');
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
            }else{
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

    public function submit()
    {
        if ($this->data_active == false) {
            $this->set_message('Belum ada jadwal aktif.');
        }else{
            $this->model->prepar_student();
            $data = $this->model->gets();
            if (count($data) === 0) {
                $this->set_message('Pengajuan dapat dilakukan setidaknya harus menambahkan 1 ' . $this->module_name . '.');
            }
            else if(!empty($data_active['rev_at'])) {
                $this->set_message('Pengajuan ' . $this->module_name . ' Sudah dilakukan pada ' . date("d/M/Y H:i", strtotime($data_active['rev_at'])) . '.');
            }
            else{
                $data = array(
                    'rev_at' => date("Y-m-d H:i:s"),
                    'approver_id'=>null
                );
                $this->mahasiswa_active_model->update($this->data_active['register_id'], $data);
                $this->set_message('Data pengajuan ' . $this->module_name . ' telah berhasil diajukan, silahkan tunggu untuk disetujui.', 'success');
            }
        }
        $this->redirect($this->module_main);
    }

    public function delete($id = false)
    {
        if ($this->data_active == false) {
            $this->set_message('Belum ada jadwal aktif, data ' . $this->module_name . ' tidak dapat dihapus.');
            $this->redirect($this->modele_main);
        }
        $this->model->prepar_student();
        parent::delete($id);
    }

    public function duplicate($id = false) {
        if ($this->data_active == false) {
            $this->set_message('Belum ada jadwal aktif, data ' . $this->module_name . ' tidak dapat dihapus.');
            $this->redirect($this->modele_main);
        }

        if ($this->capability === 'difabel') {
            $this->load->model($this->admin_group . 'jadwal/jadwal_difabel_model');
            $this->model_aktif = $this->jadwal_difabel_model;
        }else{
            $this->load->model($this->admin_group . 'jadwal/jadwal_volunteer_model');
            $this->model_aktif = $this->jadwal_volunteer_model;
        }
        $this->model_aktif->set_student_id($this->user_data['student_id']);
        $this->model_aktif->set_semester_id($this->current_semester);
        $this->model_aktif->prepar_student();

        if($id == "active") {
            $data = $this->model_aktif->where("date IS NULL")->where("deleted", 'false')->gets();
            $num_crash = 0;
            foreach ($data as $item){
                unset($item['date']);
                if ($this->capability === 'difabel') {
                    unset($item['schedule_student_id']);
                    unset($item['volunteer_id']);
                }else{
                    unset($item['schedule_volunteer_id']);
                }

                $check_jadwal = $this->model->check_jadwal($item);
                if ($check_jadwal === false) {
                    $num_crash++;
                }
                else {
                    $item['rev'] = $this->data_active['rev']+1;
                    $insert_id = $this->model->create($item);
                }
            }

            if ($num_crash > 0) {
                $this->set_message($num_crash . ' Jadwal Bentrok dan tidak tercopy.', 'warning');
            }else{
                $this->set_message('Data Jadwal aktif telah berhasil di copy.', 'success');
            }
            $this->redirect($this->module_main);
        }
        else{
            $data = $this->model->get($id);
            if (!$data) {
                $this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
                $this->redirect($this->module_main);
            }
            if (isset($this->meta_table_model) && $this->meta_table_model !== null) {
                $data = array_merge($data, $this->meta_table_model->where($this->model->primary_key, $id)->get());
            }
            $this->param['post'] = $data;
            $this->fcontrol->set_data($data);
            $this->param['form_action'] = $this->group . $this->module_main.'/input';
            $this->input();
        }
    }
}
