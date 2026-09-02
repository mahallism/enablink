<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Jadwal extends Api_Controller
{

	protected $protected_page = array(
		'index' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'input' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'edit' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'edit_delete' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'delete' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'activate' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
	);

	protected $model = null;

	public function __construct()
	{
		parent::__construct();

		if ($this->current_user['capability'] === 'difabel') {
			$this->load->model($this->admin_group . 'jadwal/jadwal_difabel_model');
			$this->model = &$this->jadwal_difabel_model;
		} else {
			$this->load->model($this->admin_group . 'jadwal/jadwal_volunteer_model');
			$this->model = &$this->jadwal_volunteer_model;
		}
		$this->current_semester = $this->option_model->get_value('current_semester');

		$this->model->set_student_id($this->current_user['student_id']);
		$this->model->set_semester_id($this->current_semester);
	}

	public function index()
	{
		$get = $this->input->get();

		$this->model->prepar_student();
		if (isset($get['schedule_type']) === true) {
			$this->model->where('schedule_type =', $get['schedule_type']);
		}
		$this->model->where('deleted', 'false');
		$data = $this->model->gets();
		$this->build($data);
	}

	public function input()
	{
		// if ($this->data_active() !== false) {
		// 	// $this->build(['error' => true, 'message' => 'Anda telah mengajukan jadwal sebelumnya.'], 406);
		// 	$this->build(null, 406, true, 'Anda telah mengajukan jadwal sebelumnya.');
		// }

		$post = $this->input->post();

		$this->validation->prepar($post, $this->model->rules);

		$form_valid = $this->validation->run();

		if ($form_valid === true) {
			if (strtotime($post['start_at']) >= strtotime($post['end_at'])) {
				// $this->build(['error' => true, 'message' => 'Jam yang di input tidak sesuai.'], 406);
				$this->build(null, 406, true, 'Jam yang di input tidak sesuai.');
			} else {
				$check_jadwal = $this->model->check_jadwal($post);
				if ($check_jadwal === false) {
					// $this->build(['error' => true, 'message' => 'Jam pilihan bertabrakan dengan jadwal lain.'], 406);
					$this->build(null, 406, true, 'Jam pilihan bertabrakan dengan jadwal lain.');
				} else {
					$this->model->create($this->validation->data);
					// $this->build(['error' => false, 'message' => 'Jadwal berhasil ditambahkan.']);
					$this->build(null, 201, false, 'Jadwal berhasil ditambahkan.');
				}
			}
		} else {
			// $this->build(['error' => true, 'message' => $this->validation->errors], 406);
			$this->build(null, 406, true, $this->validation->errors);
		}
	}

	public function edit($id)
	{
		if ($this->data_active() !== false) {
			// $this->build(['error' => true, 'message' => 'Anda telah mengajukan jadwal sebelumnya.'], 406);
			$this->build(null, 406, true, 'Anda telah mengajukan jadwal sebelumnya.');
		}

		$post = $this->input->post();

		$this->validation->prepar($post, $this->model->rules);

		$form_valid = $this->validation->run();

		if ($form_valid === true) {
			if (strtotime($post['start_at']) >= strtotime($post['end_at'])) {
				// $this->build(['error' => true, 'message' => 'Jam yang di input tidak sesuai.'], 406);
				$this->build(null, 406, true, 'Jam yang di input tidak sesuai.');
			} else {
				$this->model->where($this->model->primary_key . ' <>', $id);
				$check_jadwal = $this->model->check_jadwal($post);
				if ($check_jadwal === false) {
					// $this->build(['error' => true, 'message' => 'Jadwal bertabrakan dengan jadwal lain.'], 406);
					$this->build(null, 406, true, 'Jadwal bertabrakan dengan jadwal lain.');
				} else {
					$this->model->update($id, $this->validation->data);
					// $this->build(['error' => false, 'message' => 'Jadwal berhasil diubah.']);
					$this->build(null, 200, false, 'Jadwal berhasil diubah.');
				}
			}
		} else {
			// $this->build(['error' => true, 'message' => $this->validation->errors], 406);
			$this->build(null, 406, true, $this->validation->errors);
		}
	}

	public function edit_delete($id)
	{
		$post = $this->input->post();

		$this->validation->prepar($post, $this->model->rules);

		$form_valid = $this->validation->run();

		if ($form_valid === true) {
			if (strtotime($post['start_at']) >= strtotime($post['end_at'])) {
				// $this->build(['error' => true, 'message' => 'Jam yang di input tidak sesuai.'], 406);
				$this->build(null, 406, true, 'Jam yang di input tidak sesuai.');
			} else {

				$this->model->update($id, ['deleted' => 'true']);
				
				$this->model->where($this->model->primary_key . ' <>', $id);
				$check_jadwal = $this->model->check_jadwal($post);
				if ($check_jadwal === false) {
					// $this->build(['error' => true, 'message' => 'Jadwal bertabrakan dengan jadwal lain.'], 406);
					$this->model->update($id, ['deleted' => 'false']);
					$this->build(null, 406, true, 'Jadwal bertabrakan dengan jadwal lain.');
				}
				// 	$this->model->update($id, ['deleted' => 'true']);
				// 	$this->model->create($this->validation->data);
				// 	// $this->build(['error' => false, 'message' => 'Jadwal berhasil diubah.']);
				// 	$this->build(null, 200, false, 'Jadwal berhasil diubah.');
				// }
				// $this->model->update($id, ['deleted' => 'true']);
				$this->model->create($this->validation->data);
				// $this->build(['error' => false, 'message' => 'Jadwal berhasil diubah.']);
				$this->build(null, 200, false, 'Jadwal berhasil diubah.');
			}
		} else {
			// $this->build(['error' => true, 'message' => $this->validation->errors], 406);
			$this->build(null, 406, true, $this->validation->errors);
		}
	}

	public function delete($id = false)
	{
		if ($this->data_active() !== false) {
			// $this->build(['error' => true, 'message' => 'Anda telah mengajukan jadwal sebelumnya.'], 406);
			$this->build(null, 406, true, 'Anda telah mengajukan jadwal sebelumnya.');
		}

		if ($this->model->delete($id)) {
			// $this->build(['error' => false, 'message' => 'Jadwal berhasil dihapus.']);
			$this->build(null, 200, false, 'Jadwal berhasil dihapus.');
		} else {
			// $this->build(['error' => true, 'message' => 'Gagal menghapus jadwal.'], 406);
			$this->build(null, 406, true, 'Gagal menghapus jadwal.');
		}
	}

	public function activate()
	{
		if ($this->data_active() !== false) {
			// $this->build(['error' => true, 'message' => 'Anda telah mengajukan jadwal sebelumnya.'], 406);
			$this->build(null, 406, true, 'Anda telah mengajukan jadwal sebelumnya.');
		}

		$this->model->prepar_student();

		$data = $this->model->gets();
		if (count($data) === 0) {
			// $this->build(['error' => true, 'message' => 'Pengajuan dapat dilakukan setidaknya harus menambahkan 1 jadwal.'], 406);
			$this->build(null, 406, true, 'Pengajuan dapat dilakukan setidaknya harus menambahkan 1 jadwal.');
		} else {
			$data = array(
				'student_id' => $this->current_user['student_id'],
				'semester_id' => $this->current_semester,
			);
			$this->load->model($this->admin_group . 'active/mahasiswa_active_model');
			$this->mahasiswa_active_model->create($data);
			// $this->build(['error' => false, 'message' => 'Data pengajuan telah berhasil diajukan, silahkan tunggu untuk disetujui.']);
			$this->build(null, 201, true, 'Data pengajuan telah berhasil diajukan, silahkan tunggu untuk disetujui.');
		}
	}

	protected function data_active()
	{
		$this->load->model($this->admin_group . 'active/mahasiswa_active_model');

		return $this->mahasiswa_active_model
			->where('student_id', $this->current_user['student_id'])
			->where('semester_id', $this->current_semester)
			->get();
	}
}
