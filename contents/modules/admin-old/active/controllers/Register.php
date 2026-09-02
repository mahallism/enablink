<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Register extends App_Controller
{

	protected $protected_page = array(
		'index' 	=> 'admin',
		'approve' 	=> 'admin',
		'input' 	=> 'admin',
		'edit' 		=> 'denied',
		'duplicate' => 'denied',
		'delete' 	=> 'admin_master',
		'detail' 	=> 'denied',
		'field' 	=> 'denied',
	);

	protected $load_model = false;
	protected $gets_view = true;

	protected $module_main = 'active/register';
	protected $module_name = 'mahasiswa register';

	protected $list_field  	= array(
		'field' 	=> array(
			'name' 			=> 'Nama',
			'username' 		=> 'NIM',
			'no_hp' 		=> 'No. Hp',
			'capability' 	=> 'Mahasiswa',
			'created_at' 	=> 'Pengajuan',
			'approved' 		=> 'Persetujuan',
		),
		'custom' 	=> array(
			'capability' 	=> 'ucwords($item["capability"])',
			'created_at' 	=> 'datetime_html($item["created_at"])',
			'approved' 		=> '$item["approver_id"] === null ? (!empty($item["rev_at"]) ? "Belum Disetujui Revisi-".($item["rev"]+1) : "Belum Disetujui") : "Disetujui"',
		),
	);

	protected $action_url  	= array(
		'input',
		'delete',
		// 'edit', 'duplicate', 
	);
	protected $input_view  	= 'register-input';
	protected $input_size  	= 'xl';

	function __construct()
	{
		parent::__construct();

		$this->load->model('mahasiswa_active_model');
		$this->model = &$this->mahasiswa_active_model;
	}

	public function index($id = false)
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
			'capability' => array(
				'label' 		=> 'Mahasiswa',
				'type' 			=> 'select',
				'select_type' 	=> 'key_value',
				'select_data' 	=> array(
					'' => 'Semua Mahasiswa',
					'difabel' => 'Semua Difabel',
					'volunteer' => 'Semua Volunteer',
				),
			),
			'approved' => array(
				'label' 		=> 'Persetujuan',
				'type' 			=> 'select',
				'select_type' 	=> 'key_value',
				'select_data' 	=> array(
					'' => 'Semua Data',
					'disetujui' => 'Disetujui',
					'belum' => 'Belum Disetujui',
				),
			),
		);

		$this->load->model($this->group . 'semester/semester_model');
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
		if (isset($get_data['capability']) === true && $get_data['capability'] !== '') {
			$this->model->where('capability', $get_data['capability']);
		}
		if (isset($get_data['approved']) === true && $get_data['approved'] === 'disetujui') {
			$this->model->where('approver_id is not null');
		} else if (isset($get_data['approved']) === true && $get_data['approved'] === 'belum') {
			$this->model->where('approver_id is null');
		}
	}

	public function approve($id = false)
	{
		$data = $this->model->get($id);
		if (!$data) {
			$this->set_message('Data pengajuan tidak ditemukan.');
		} else {
			$this->model->update($id, array('approver_id' => current_user_session('user_id')));
			$this->set_message('Data pengajuan telah berhasil disetujui.', 'success');
		}

		$this->load->model($this->group.'mahasiswa/mahasiswa_model');

		$mahasiswa = $this->mahasiswa_model->where('student_id', $data['student_id'])->get();

		$this->load->model('user_model');
		$user = $this->user_model->where('user_id', $mahasiswa['user_id'])->get();
		$app_name = $this->config->item('app_name');
		$subject = 'Status Registrasi - ' . $app_name;
		$message = 'Halo, <br><br> Akun anda telah di verifikasi, selamat bergabung di Enablink';
		if ($this->send_email($user['email'], $subject, $message)) {
			$this->set_message('Berhasil mengirim email pemberitahuan');
		}else{
			$this->set_message('Gagal mengirim email pemberitahuan');

		}

		$this->redirect($this->module_main);

	}

	protected function send_email($to, $subject, $message)
	{
		$config = [
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'protocol'  => 'smtp',
			'smtp_host' => getenv('MAIL_SMTP_HOST'),
			'smtp_port' => getenv('MAIL_SMTP_PORT'),
			'smtp_user' => getenv('MAIL_SMTP_USER'),
			'smtp_pass' => getenv('MAIL_SMTP_PASS'),
			'crlf'      => "\r\n",
			'newline'   => "\r\n"
		];

		$this->load->library('email', $config);
		$this->email->from(getenv('MAIL_SENDER_EMAIL'), getenv('MAIL_SENDER_NAME'));
		$this->email->to($to);
		$this->email->subject($subject);
		$this->email->message($message);
		return $this->email->send();
	}

	public function input($id = false)
	{
		unset($this->list_field['field']['approved']);
		unset($this->list_field['custom']['approved']);
		$this->list_field['custom']['created_at'] = '$item["register_id"] === null ? "Tidak Mengajuka<span class=\"hide\">a</span>n" : "Mengajukan <small class=\"text-muted\">(" . date_html($item["created_at"]) . ")</small>"';
		$this->list_field['field']['action'] = 'Aksi';
		$this->list_field['custom']['action'] = '"<a target=\"blank\" href=\"' . $this->group . 'jadwal/{$item["capability"]}/detail/{$item["student_id"]}\"><i class=\"fa mr-1 fa-calendar-alt\"></i></a> &nbsp;"';
		$this->list_field['custom']['action'] .= '."<input type=\"checkbox\" name=\"" . ($item["register_id"] === null ? "new" : "approve") . "[]\" value=\"{$item["student_id"]}\"> &nbsp;<i class=\"fas fa-check text-success\"></i>"';
		$sql="SELECT `app_student_active`.`register_id` AS `register_id`, `app_students`.`student_id` AS `student_id`, `app_student_active`.`semester_id` AS `semester_id`, `app_student_active`.`approver_id` AS `approver_id`, `approver`.`name` AS `approver_name`, `app_student_active`.`created_at` AS `created_at`, `app_students`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`capability` AS `capability`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp` FROM((((( `app_students` LEFT JOIN `app_student_active` ON ( `app_students`.`student_id` = `app_student_active`.`student_id` AND `app_student_active`.`semester_id` = ".$this->current_semester.")) JOIN `app_majors` ON ( `app_majors`.`majors_id` = `app_students`.`majors_id` )) JOIN `app_faculties` ON ( `app_faculties`.`faculty_id` = `app_majors`.`faculty_id` )) JOIN `aplego_user` ON ( `app_students`.`user_id` = `aplego_user`.`user_id` )) LEFT JOIN `aplego_user` `approver` ON ( `app_student_active`.`approver_id` = `approver`.`user_id` )) WHERE `app_student_active`.`approver_id` IS NULL";    
    	$this->param['data'] = $this->db->query($sql)->result_array();
		// $this->param['data'] = $this->model->where('semester_id', $this->current_semester)->or_where('semester_id is null')->gets_view('app_student_not_active_view');

		$this->param['list_field'] = $this->list_field['field'];
		if ($this->list_field['custom']) {
			$this->param['data'] = $this->aquery->prepar($this->param['data'])
				->add_column($this->list_field['custom'])
				->gets();
		}

		parent::input($id);
	}

	public function do_input($post)
	{
		if (isset($post['new']) === false && isset($post['approve']) === false) {
			$this->errors[] = "Centang data mahasiswa setidaknya satu data mahasiswa.";
		} else {
			if (empty($post['new']) === false) {
				$approved = isset($post['approved']) ? current_user_session('user_id') : null;
				$new_data = array();
				foreach ($post['new'] as $item) {
					$new_data[] = array(
						'student_id' 	=> $item,
						'semester_id' 	=> $this->current_semester,
						'approver_id' 	=> $approved,
					);
				}
				$this->model->create_bulk($new_data);
			}
			if (empty($post['approve']) === false) {
				$approver = array(
					'approver_id' 	=> current_user_session('user_id'),
				);
				$where = array(
					'semester_id' 	=> $this->current_semester,
				);
				foreach ($post['approve'] as $item) {
					$where_arg = $where + array(
						'student_id' 	=> $item,
					);
					$this->model->update($where_arg, $approver);
				}
			}

			$this->set_message('Data ' . $this->module_name . ' telah berhasil ditambahkan', 'success');
			$this->redirect($this->module_main);
		}
	}
}
