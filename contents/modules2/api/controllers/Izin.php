<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Izin extends Api_Controller
{

	protected $protected_page = array(
		'index' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'izin_masuk' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'detail' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'input' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'update_permit' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
	);

	protected $model = null;

	public function __construct()
	{
		parent::__construct();

		$this->current_semester = $this->option_model->get_value('current_semester');

		$this->load->model($this->admin_group . 'izin/izin_model');
		$this->model = &$this->izin_model;

		$this->model->set_student_id($this->current_user['student_id']);
		$this->model->set_semester_id($this->current_semester);


		$this->load->model($this->admin_group . 'pendampingan/pendampingan_model');

		$this->pendampingan_model->set_student_id($this->current_user['student_id']);
		$this->pendampingan_model->set_semester_id($this->current_semester);
	}

	public function index()
	{
		if ($this->current_user['capability'] === 'difabel') {
			$this->model->prepar_difabel();
		} else {
			$this->model->prepar_volunteer();
		}

		$get = $this->input->get();

		if (isset($get['status']) === true) {
			$this->model->where('status =', $get['status']);
		}

		if (isset($get['start_date']) === true && isset($get['end_date']) === true) {
			$this->model->where('date >=', $get['start_date']);
			$this->model->where('date <=', $get['end_date']);
		}

		$data = $this->model->gets_view();
		$this->build($data);
	}

	public function izin_masuk()
	{
		if ($this->current_user['capability'] === 'difabel') {
			$this->build(null, 404, true, 'Hanya khusus mahasiswa volunteer.');
		}

		$get = $this->input->get();

		$this->db->from('app_permit_view');
		$this->db->where('new_volunteer_id', $this->current_user['student_id']);
		if (isset($get['status']) === true) {
			$this->db->where('status =', $get['status']);
		}

		if (isset($get['start_date']) === true && isset($get['end_date']) === true) {
			$this->db->where('date >=', $get['start_date']);
			$this->db->where('date <=', $get['end_date']);
		}

		$data = $this->db->get()->result_array();
		$this->build($data);
	}

	public function detail($id = false)
	{
		if ($id === false) {
			$this->build(null, 400, true, 'Id tidak ditemukan.');
		}

		$this->db->from('app_permit_view');
		$this->db->where('permit_id', $id);
		$data = $this->db->get()->row();

		if (!$data) {
			$this->build(null, 404, true, 'Data izin tidak ditemukan.');
		}

		$this->build($data);
	}

	public function input($id = false)
	{
		if ($id === false) {
			$this->build(null, 400, true, 'Id tidak ditemukan.');
		}

		$data_pendampingan = $this->pendampingan_model->get_view($id);

		if ($data_pendampingan === false) {
			$this->build(null, 404, true, 'Jadwal tidak ditemukan.');
		}

		$post = $this->input->post();

		$this->db->from('app_permit');
		$this->db->where('accompaniment_id', $id);
		$this->db->where('student_id', $this->current_user['student_id']);
		$this->db->where('status', $this->current_user['capability'] === 'difabel' ? 'izin' : 'menunggu konfirmasi');

		$cek = $this->db->count_all_results();

		if ($cek > 0) {
			$this->build(null, 400, true, $this->current_user['capability'] === 'difabel' ? 'Anda sudah mengajukan izin sebelumnya' : 'Anda sudah mengajukan izin sebelumnya, silahkan tunggu kabar dari calon volunteer pengganti');
		}

		if (isset($post['clarification']) === false) {
			$this->build(null, 400, true, 'Pastikan alasan izin diisi.');
		}

		if ($this->current_user['capability'] === 'volunteer' && isset($post['new_volunteer_id']) === false) {
			$this->build(null, 400, true, 'Pastikan calon volunteer baru dipilih.');
		}

		$str_status = $this->current_user['capability'] === 'difabel' ? 'student_status' : 'volunteer_status';

		$this->pendampingan_model->update($id, array(
			$str_status => 'Izin',
		));

		$data_input = array(
			'accompaniment_id' => $id,
			'clarification' => $post['clarification'],
			'semester_id' => $this->current_semester,
			'student_id' => $this->current_user['student_id'],
			'new_volunteer_id' => $post['new_volunteer_id'],
			'status' => $this->current_user['capability'] === 'difabel' ? 'izin' : 'menunggu konfirmasi',
			'student' => $this->current_user['capability'],
		);

		$insert_id = $this->model->create($data_input);
		$data = $this->model->get_view($insert_id);

		$this->notification($post['new_volunteer_id'], 'ganti_jadwal', $insert_id, 'Anda mendapatkan permintaan untuk menggantikan jadwal pendampingan');

		$this->build($data);
	}

	public function update_permit($id = false)
	{
		if ($id === false) {
			$this->build(null, 400, true, 'Id tidak ditemukan');
		}

		$post = $this->input->post();

		// $this->model->prepar_new_volunteer();

		// $data = $this->model->get_view($id);

		// if ($data === false) {
		// 	$this->build(null, 400, true, 'Data pendampingan tidak ditemukan');
		// }

		$this->db->from('app_permit_view');
		$this->db->where('permit_id', $id);
		$data = $this->db->get()->row();

		if (!$data) {
			$this->build(null, 404, true, 'Data izin tidak ditemukan.');
		}

		if ($post['status'] == 'diterima') {

			$this->db->where('accompaniment_id', $data->accompaniment_id);
			$this->db->update('app_accompaniment', array(
				'volunteer_id' => $this->current_user['student_id'],
				'volunteer_status' => 'terjadwal'
			));

			$this->db->where('permit_id', $id);
			$this->db->where('new_volunteer_id', $this->current_user['student_id']);
			$this->db->update('app_permit', array('status' => 'diterima'));

			$message = 'Berhasil melakukan terima pendamping baru yang ditujukan ke Anda';
			$notif_message = 'Pengajuan penggantian pendampingan Anda telah diterima';
		} else {
			$this->db->where('permit_id', $id);
			$this->db->where('new_volunteer_id', $this->current_user['student_id']);
			$this->db->update('app_permit', array('status' => 'ditolak'));

			$message = 'Berhasil melakukan penolakan pendamping baru yang ditujukan ke Anda';
			$notif_message = 'Pengajuan penggantian pendampingan Anda telah ditolak. Silahkan ajukan izin ulang';
		}

		$this->notification($data->student_id, 'ganti_jadwal', $id, $notif_message);

		$this->build($data, 200, false, $message);
	}

	public function notification($student_id, $notif_type, $notif_type_id, $message){
		$data_input = array(
			'student_id' => $student_id,
			'notif_type' => $notif_type,
			'notif_type_id' => $notif_type_id,
			'message' => $message,
		);

		return $this->db->insert('app_notifications', $data_input);
	}
}
