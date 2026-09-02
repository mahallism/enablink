<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pendampingan extends Api_Controller
{

	protected $protected_page = array(
		'jadwal' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'jenis_difabel' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'detail' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'raw_detail' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'confirm' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'present' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'not_present' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'change_accompaniment' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'review' => array(
			'method' => array('POST'),
			'capability' => 'difabel',
		),
		'grafik' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'available_volunteer' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'submit_new_volunteer' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'do_accompaniment_application' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'notif_test' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
	);

	protected $model = null;

	public function __construct()
	{
		parent::__construct();

		$this->current_semester = $this->option_model->get_value('current_semester');

		$this->load->model($this->admin_group . 'jadwal/jadwal_difabel_model');
		$this->load->model($this->admin_group . 'jadwal/jadwal_volunteer_model');

		$this->load->model($this->admin_group . 'pendampingan/pendampingan_model');
		$this->model = &$this->pendampingan_model;

		$this->model->set_student_id($this->current_user['student_id']);
		$this->model->set_semester_id($this->current_semester);
	}

	public function jadwal()
	{
		$get = $this->input->get();

		// if ((isset($get['date']) === true) === false) {
		// 	$this->build(null, 406, true, 'Tanggal wajib diisi');
		// }

		$str_status = $this->current_user['capability'] === 'difabel' ? 'student_status' : 'volunteer_status';

		if ($this->current_user['capability'] === 'difabel') {
			$this->model->prepar_difabel();
			// $temp = $this->model->gets_view();
			// $temp = array_column($temp, $this->model->primary_key);
			// if (empty($temp) === false) {
			// 	$this->model->where_in($this->model->primary_key, $temp)->update(array(
			// 		'semester_id' => $this->current_semester,
			// 		// 	'student_status' => null,
			// 		'student_status' => 'kosong',
			// 	), array(
			// 		'student_status' => 'terjadwal',
			// 	));
			// }
			// $this->model->prepar_difabel();
		} else {
			// $this->model->update(array(
			// 	'volunteer_id' => $this->current_user['student_id'],
			// 	'semester_id' => $this->current_semester,
			// 	// 'volunteer_status' => null,
			// 	'volunteer_status' => 'kosong',
			// ), array(
			// 	'volunteer_status' => 'Dilihat',
			// ));

			if ((isset($get['volunteer_change_status']) === true)) {
				$this->model->prepar_new_volunteer();
			} else {
				$this->model->prepar_volunteer();
			}
		}

		if (isset($get['start_date']) === true && isset($get['end_date']) === true) {
			$this->model->where('date >=', $get['start_date']);
			$this->model->where('date <=', $get['end_date']);
		} else if (isset($get['date']) === true) {
			$this->model->where('date =', $get['date']);
		}

		if (isset($get['schedule_type']) === true) {
			$this->model->where('schedule_type =', $get['schedule_type']);
		}

		if (isset($get['status']) === true) {
			$this->model->where($str_status, $get['status']);
		}

		if (isset($get['volunteer_change_status']) === true) {
			$this->model->where('volunteer_change_status =', $get['volunteer_change_status']);
		}

		$data = $this->model->gets_view();

		$this->build($data);
	}

	public function jenis_difabel($user_id = false)
	{
		if ($user_id === false) {
			// $this->show_status(400);
			$this->build(null, 400, true, 'Id pendampingan tidak ditemukan');
		}
		// 		$sess_data = array();
		$data_meta = $this->user_meta_model->where('user_id', $user_id)->gets();
		foreach ($data_meta as $item) {
			$sess_data[$item['meta_key']] = $item['meta_value'];
		}
		$this->build($sess_data);
	}

	public function grafik()
	{
		$get = $this->input->get();

		// 		if ((isset($get['date']) === true) === false) {
		// // 			$this->show_status(400);
		// 		}

		if ($this->current_user['capability'] === 'difabel') {

			$arg_where = array(
				'student_id' 	=> $this->current_user['student_id'],
				'semester_id' 	=> $this->current_semester,
				'date'			=> $get['date'],
			);

			// $data = $this->model->where($arg_where)->gets_view('app_chart_accompainiment_pendampingan_view');
			$data = $this->db->get_where('app_chart_accompainiment_pendampingan_view', $arg_where);
		} else {

			$arg_where = array(
				'volunteer_id' 	=> $this->current_user['student_id'],
				'semester_id' 	=> $this->current_semester,
				'date'			=> $get['date'],
			);

			// $data = $this->model->where($arg_where)->gets_view('app_chart_accompainiment_volunteer_view');
			$data = $this->db->get_where('app_chart_accompainiment_volunteer_view', $arg_where);
		}

		// $this->load->model($this->group.'active/mahasiswa_active_model');
		// $arg_where = array(
		// 	'student_id' 	=> $id,
		// 	'semester_id' 	=> $this->current_semester,
		// );
		// $data = $this->mahasiswa_active_model->where($arg_where)->get();

		// $this->load->model($this->group.'mahasiswa/mahasiswa_model');
		// $data_mahasiswal = $this->mahasiswa_model->get_view($data['student_id']);
		//$this->param['data_mahasiswal'] = $data_mahasiswal;

		if (empty($data->row())) {
			$this->build([
				"semester_id" => $this->current_semester,
				"volunteer_id" => $this->current_user['student_id'],
				"date" => $get['date'],
				"belum_datang" => "0",
				"selesai" => "0",
				"izin" => "0",
				"tidak_datang" => "0"
			]);
		}

		$this->build($data->row());
	}

	public function detail($id = false)
	{
		if ($id === false) {
			// $this->show_status(400);
			$this->build(null, 400, true, 'Id pendampingan tidak ditemukan');
		}

		if ($this->current_user['capability'] === 'difabel') {
			$this->model->prepar_difabel();
		} else {
			$this->model->prepar_volunteer();
		}

		$data = $this->model->get_view($id);

		if ($data === false) {
			// $this->show_status(404);
			$this->build(null, 400, true, 'Data pendampingan tidak ditemukan');
		}

		// $str_status = $this->current_user['capability'] === 'difabel' ? 'student_status' : 'volunteer_status';
		// if ($data[$str_status] === null) {
		// 	$this->model->update($id, array(
		// 		$str_status => 'Dilihat',
		// 	));
		// }

		$this->build($data);
	}

	//api detail jadwal tanpa merubah status kehadiran
	public function raw_detail($id = false)
	{
		if ($id === false) {
			// $this->show_status(400);
			$this->build(null, 400, true, 'Hanya mahasiswa disabilitas yang bisa melakukan aksi ini');
		}

		if ($this->current_user['capability'] === 'difabel') {
			$this->model->prepar_difabel();
		} else {
			$this->model->prepar_volunteer();
		}

		$data = $this->model->get_view($id);

		if ($data === false) {
			$this->show_status(404);
		}

		$this->build($data);
	}

	public function confirm($id = false)
	{
		if ($id === false) {
			$this->build(null, 406, true, 'id pendampingan tidak ditemukan');
		}

		if ($this->current_user['capability'] === 'difabel') {
			$this->model->prepar_difabel();
		} else {
			$this->model->prepar_volunteer();
		}

		$data = $this->model->get_view($id);
		$post = $this->input->post();

		if ($data === false) {
			$this->build(null, 406, true, 'Data pendampingan tidak ditemukan');
		}
		$str_status = $this->current_user['capability'] === 'volunteer' ? 'volunteer_status' : 'student_status';
		// 		$str_status = $this->current_user['capability'] === 'difabel' ? 'student_status' : 'volunteer_status';
		// if (in_array($data[$str_status], array('Kosong', 'Dilihat')) === false) {
		// 	$this->show_status(404);
		// }

		if ($this->current_user['capability'] == 'volunteer') {
			$this->model->update($id, array(
				$str_status => 'Dikonfirmasi',
				'accompaniment_note' => $post['accompaniment_note']
			));
		} else {
			$this->model->update($id, array(
				$str_status => 'Dikonfirmasi',
			));
		}

		$data = $this->model->get_view($id);

		// $data[$str_status] = 'Dikonfirmasi';
		// $this->build($data);
		$this->build($data, 200, false, 'Berhasil konfirmasi pendampingan');
	}

	public function present($id = false)
	{
		if ($id === false) {
			// $this->show_status(400);
			$this->build(null, 400, true, 'id tidak ditemukan');
		}

		if ($this->current_user['capability'] === 'difabel') {
			$this->model->prepar_difabel();
		} else {
			$this->model->prepar_volunteer();
		}

		$data = $this->model->get_view($id);

		if ($data === false) {
			// $this->show_status(404);
			$this->build(null, 406, true, 'Data pendampingan tidak ditemukan');
		}

		// 		$str_status = $this->current_user['capability'] === 'difabel' ? 'volunteer_status' : 'student_status';
		// $str_status = $this->current_user['capability'] === 'difabel' ? 'student_status' : 'volunteer_status';
		// $this->model->update($id, array(
		// 	$str_status => 'Hadir',
		// ));

		$this->model->update($id, array(
			'student_status' => 'Hadir',
			'volunteer_status' => 'Hadir',
		));

		$data = $this->model->get_view($id);

		$this->build($data, 200, false, 'Berhasil konfirmasi kehadiran');
	}

	public function not_present($id = false)
	{
		if ($id === false) {
			// $this->show_status(400);
			$this->build(null, 400, true, 'Id pendampingan tidak ditemukan');
		}

		$this->model->prepar_difabel();

		if (!$this->current_user['capability'] === 'difabel') {
			// $this->build(['error' => true, 'message' => 'Hanya mahasiswa disabilitas yang bisa melakukan aksi ini'], 406);
			$this->build(null, 400, true, 'Hanya mahasiswa disabilitas yang bisa melakukan aksi ini');
		}

		$data = $this->model->get_view($id);

		if ($data === false) {
			// $this->show_status(404);
			$this->build(null, 406, true, 'Data pendampingan tidak ditemukan');
		}

		$this->model->update($id, array(
			'volunteer_status' => 'Dibatalkan',
			'student_status' => 'Dibatalkan',
		));

		// $data['message'] = 'Berhasil membatalkan proses pendampingan';
		// $this->build($data);
		$this->build($data, 200, false, 'Berhasil membatalkan proses pendampingan');
	}

	public function review($id = false)
	{
		$post = $this->input->post();
		if (isset($post['review']) === false || $id === false) {
			$this->show_status(400);
		}

		if ($this->current_user['capability'] === 'difabel') {
			$this->model->prepar_difabel();
		} else {
			$this->model->prepar_volunteer();
		}

		$data = $this->model->get_view($id);

		if ($data === false) {
			$this->show_status(404);
		}

		// $str_status = $this->current_user['capability'] === 'difabel' ? 'volunteer_status' : 'student_status';

		$this->model->update($id, array(
			'student_status' => 'Selesai',
			'volunteer_status' => 'Selesai',
			'review' => $post['review'],
			'review_note' => $post['review_note'],
		));

		$data = $this->model->get_view($id);

		// $data['student_status'] = 'Selesai';
		// $data['volunteer_status'] = 'Selesai';
		$data['review'] = $post['review'];
		$this->build($data, 200, false, 'Pendampingan selesai');
	}

	public function available_volunteer($id)
	{
		$date = $this->input->post('date');

		$data = $this->jadwal_difabel_model->where('semester_id', $this->current_semester)->get_view($id);
		$data_jadwal_volunteer_group = $this->jadwal_volunteer_model
			->where('semester_id', $this->current_semester)
			->gets_view('app_group_schedule_volunteer_view');

		$data_pendampingan = $this->model
			->where('semester_id', $this->current_semester)
			->where('date', $date)
			->gets_view('app_accompaniment_schedule_volunteer_view');

		$day = date('w', strtotime($date));
		$volunteer_data = array();

		foreach ($data_jadwal_volunteer_group as $index_jadwal_volunteer => $item_jadwal_volunteer) {
			$find = true;
			$jadwal_hari = json_decode($item_jadwal_volunteer["day" . $day]);
			if ($jadwal_hari == array()) {
				$find_jadwal = $index_jadwal_volunteer;
			}
			foreach ($jadwal_hari as $key => $item_hari) {
				if ((strtotime($data['start_at']) < strtotime($item_hari[0]) &&
						strtotime($data['end_at']) > strtotime($item_hari[0])) ||
					(strtotime($data['start_at']) < strtotime($item_hari[1]) &&
						strtotime($data['end_at']) > strtotime($item_hari[1])) ||
					(strtotime($data['start_at']) >= strtotime($item_hari[0]) &&
						strtotime($data['end_at']) <= strtotime($item_hari[1]))
				) {
					$find = false;
				}
			}

			if ($find !== false) {
				if (empty($data_pendampingan) === false) {
					$tidak_kres = true;
					foreach ($data_pendampingan as $item) {
						if (
							$item['volunteer_id'] === $item_jadwal_volunteer['student_id'] &&
							((strtotime($data['start_at']) < strtotime($item['start_at']) &&
								strtotime($data['end_at']) > strtotime($item['start_at'])) ||
								(strtotime($data['start_at']) < strtotime($item['end_at']) &&
									strtotime($data['end_at']) > strtotime($item['end_at'])) ||
								(strtotime($data['start_at']) >= strtotime($item['start_at']) &&
									strtotime($data['end_at']) <= strtotime($item['end_at'])))
						) {
							$tidak_kres = false;
							break;
						}
					}
					if ($tidak_kres === true) {
						array_push($volunteer_data, ['student_id' => $item_jadwal_volunteer['student_id'], 'user_id' => $item_jadwal_volunteer['user_id'], 'name' => $item_jadwal_volunteer['name'], 'nick_name' => $item_jadwal_volunteer['nick_name'], 'majors_name' => $item_jadwal_volunteer['majors_name'], 'faculty_name' => $item_jadwal_volunteer['faculty_name'], 'class_of_college' => $item_jadwal_volunteer['class_of_college'], 'no_hp' => $item_jadwal_volunteer['no_hp'], 'photo' => $item_jadwal_volunteer['photo']]);
						// array_push($volunteer_data, $item_jadwal_volunteer);
					}
				} else {
					// array_push($volunteer_data, $item_jadwal_volunteer);
					array_push($volunteer_data, ['student_id' => $item_jadwal_volunteer['student_id'], 'user_id' => $item_jadwal_volunteer['user_id'], 'name' => $item_jadwal_volunteer['name'], 'nick_name' => $item_jadwal_volunteer['nick_name'], 'majors_name' => $item_jadwal_volunteer['majors_name'], 'faculty_name' => $item_jadwal_volunteer['faculty_name'], 'class_of_college' => $item_jadwal_volunteer['class_of_college'], 'no_hp' => $item_jadwal_volunteer['no_hp'], 'photo' => $item_jadwal_volunteer['photo']]);
				}
			}
		}

		$this->build($volunteer_data);
	}

	public function change_accompaniment($id = false)
	{
		if ($id === false) {
			$this->show_status(400);
		}

		$post = $this->input->post();

		$this->model->prepar_difabel();

		$data = $this->model->get_view($id);

		if ($data === false) {
			// $this->show_status(404);
			$this->build(null, 400, true, 'Data pendampingan tidak ditemukan');
		}

		$this->model->update($id, array(
			// 'student_status' => 'Penggantian Jadwal',
			// 'volunteer_status' => 'Jadwal Diganti',
			'date' => $post['date'],
			'new_start_at' => $post['start_at'],
			'new_end_at' => $post['end_at'],
			'new_room' => $post['room'],
			'new_day' => $post['day'],
		));
		// $data['message'] = 'Berhasil mengganti jadwal pendampingan';
		// $this->build($data);
		$this->build($data, 200, false, 'Berhasil mengganti jadwal pendampingan');
	}

	public function submit_new_volunteer($id = false)
	{
		if ($id === false) {
			// $this->show_status(400);
			$this->build(null, 400, true, 'Id pendampingan tidak ditemukan');
		}

		$post = $this->input->post();

		$this->model->prepar_volunteer();

		$data = $this->model->get_view($id);

		if ($data === false) {
			// $this->show_status(404);
			$this->build(null, 400, true, 'Data pendampingan tidak ditemukan');
		}

		$this->model->update($id, array(
			'volunteer_change_status' => 'awaiting_confirmation',
			'new_volunteer_id' => $post['new_volunteer_id'],
		));
		// $data['message'] = 'Berhasil melakukan pengajuan pendamping baru';
		// $this->build($data);
		$this->build($data, 200, false, 'Berhasil melakukan pengajuan pendamping baru');
	}

	public function do_accompaniment_application($id = false)
	{
		if ($id === false) {
			// $this->show_status(400);
			$this->build(null, 400, true, 'Id pendampingan tidak ditemukan');
		}

		$post = $this->input->post();

		$this->model->prepar_new_volunteer();

		$data = $this->model->get_view($id);

		if ($data === false) {
			// $this->show_status(404);
			$this->build(null, 400, true, 'Data pendampingan tidak ditemukan');
		}

		if ($post['status'] == 'accepted') {
			$this->model->update($id, array(
				'volunteer_change_status' => $post['status'],
			));
			$message = 'Berhasil melakukan terima pendamping baru yang ditujukan ke Anda';
		} else {
			$this->model->update($id, array(
				'volunteer_change_status' => $post['status'],
				'new_volunteer_id' => null,
			));
			$message = 'Berhasil melakukan penolakan pendamping baru yang ditujukan ke Anda';
		}
		$this->build($data, 200, false, $message);
	}

	public function notif_test()
	{
		$this->sendNotif("Test notif");
	}

	protected function sendNotif($message)
	{
		$where = array(
			'user_id' => $this->current_user['user_id'],
			'meta_key' => 'device_id',
		);

		$meta_data = $this->user_meta_model->where($where)->get();
		if ($meta_data !== false) {
			$url = 'https://fcm.googleapis.com/fcm/send';

			$fields = array(
				'registration_ids' => array(
					$meta_data['meta_value']
				),
				'data' => array(
					"message" => $message
				)
			);
			$fields = json_encode($fields);

			$headers = array(
				'Authorization: key=' . getenv('FIREBASE_SERVER_KEY'),
				'Content-Type: application/json'
			);

			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_POST, true);
			curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

			$result = curl_exec($ch);
			echo $result;
			curl_close($ch);
		}
	}
}
