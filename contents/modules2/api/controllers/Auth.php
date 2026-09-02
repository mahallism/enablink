<?php
defined('BASEPATH') or exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");

class Auth extends Api_Controller
{

	protected $protected_page = array(
		'login' => array(
			'method' => array('POST'),
			'capability' => '',
		),
		'register' => array(
			'method' => array('POST'),
			'capability' => '',
		),
		'logout' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'cektoken' => array(
			'method' => array('POST'),
			'capability' => '',
		),
		'cekaktif' => array(
			'method' => array('POST'),
			'capability' => '',
		),
		'forgot_password' => array(
			'method' => array('POST'),
			'capability' => '',
		),
	);

	public function login()
	{
		$post = $this->input->post();

		if ((isset($post['username']) === true && isset($post['password']) === true) === false) {
			// $this->show_status(400);
			$this->build(null, 406, true, 'pastikan username/password terisi');
		}

		$login_result = $this->auth_model->login($post, $this->user_group['member']);
		if (isset($login_result['error']) && $login_result['error'] === true) {
			$this->build(null, 406, true, $login_result['message']);
		} else {
			$this->build($login_result);
		}
	}

	public function register()
	{
		$post = $this->input->post();

		$mahasiswa_difabel = false;
		$user_meta_rules = array();

		if ((isset($post['capability']) === true && isset($post['no_hp']) === true && isset($post['email']) === true && isset($post['class_of_college']) === true && isset($post['majors_id']) === true && isset($post['nick_name']) === true && isset($post['name']) === true && isset($post['birth_date']) === true && isset($post['username']) === true && isset($post['password']) === true && isset($post['jenis_preferensi']) === true) === false) {
			// $this->show_status(400);
			$this->build(null, 406, true, 'pastikan field terisi semua');
		}

		if (strlen($post['password']) < 6) {
			$this->build(null, 406, true, 'pastikan password lebih dari 6 karakter');
		}

		if (isset($post['capability']) && $post['capability'] == 'difabel') {
			$mahasiswa_difabel = true;
			$user_meta_rules = array(
				'jenis_difabel' => array('Jenis Disabilitas', array('have', 'required')),
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		} else {
			$user_meta_rules = array(
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		}

		$user_rules = array(
			'username'			=> array('NIM', array('have', 'required')),
			'name'				=> array('Nama Lengkap', array('have', 'trim', 'required')),
			'email'				=> array('Email', array('have', 'trim', 'required')),
			'password'			=> array('Password', array('have', 'required')),
		);
		$this->load->model($this->admin_group . 'mahasiswa/mahasiswa_model');
		$this->user_model->meta_table_model = &$this->mahasiswa_model;
		$this->validation->prepar($post, $user_rules, $this->mahasiswa_model->rules, $user_meta_rules);

		if ($this->validation->run() === false) {
			// $this->show_status(400);
			// $this->build(['error' => true, 'message' => $this->validation->errors]);
			$this->build(null, 406, true, $this->validation->errors);
		} else {
			if ($this->user_model->where('username', $post['username'])->get() > 0) {
				$this->build(null, 406, true, "username telah digunakan");
			}
			if ($this->user_model->where('email', $post['email'])->get() > 0) {
				$this->build(null, 406, true, "email telah digunakan");
			}
			$capability = $post['capability'];
			$this->user_model->set_crud_capability($capability);
			$data_form = $this->validation->data[0];
			$data_form['active'] = 'active';

			$insert_id = $this->user_model->create($data_form);

			$data_form = $this->validation->data[1];
			$data_form[$this->user_model->primary_key] = $insert_id;

			if (isset($_FILES['photo']) && $_FILES['photo']['error'] === 0) {
				$config['upload_path'] = './uploads/';
				$config['allowed_types'] = 'jpg|jpeg|png';
				$config['file_name'] = trim($post['username']);

				$this->load->library('upload', $config);
				$this->upload->initialize($config);

				if ($this->upload->do_upload('photo') === true) {
					$temp_data = $this->upload->data();
					$data_form['photo'] = 'uploads/' . $temp_data['file_name'];
				} else {
					print("error");
				}
			}

			if (isset($_FILES['ktm']) && $_FILES['ktm']['error'] === 0) {
				$config['upload_path'] = './uploads/';
				$config['allowed_types'] = 'jpg|jpeg|png';
				$config['file_name'] = 'ktm' . trim($post['username']);

				$this->load->library('upload', $config);
				$this->upload->initialize($config);

				if ($this->upload->do_upload('ktm') === true) {
					$temp_data = $this->upload->data();
					$data_form['ktm'] = 'uploads/' . $temp_data['file_name'];
				}
			}
			$this->mahasiswa_model->create($data_form);

			if ($mahasiswa_difabel === true) {
				$data_meta_triple = array();
				foreach ($this->validation->data[2] as $key => $value) {
					if ($key != 'jenis_preferensi') {
						$data_meta_triple[] = array(
							'user_id' 		=> $insert_id,
							'meta_key' 		=> $key,
							'meta_value' 	=> $value,
						);
					} else {
						foreach ($value as $preferensi) {
							$array_where = array(
								'user_id' 		=> $insert_id,
								'meta_key' 		=> $key,
								'meta_value' 	=> $preferensi,
							);
							$this->user_meta_model->create($array_where + array(
								'meta_value' 	=> $preferensi,
							));
						}
					}
				}
				$this->user_meta_model->create_bulk($data_meta_triple);
			} else {
				$this->db->where(array(
					'user_id' 		=> $insert_id,
					'meta_key' 		=> 'jenis_preferensi',
				))->delete('aplego_user_meta');

				foreach ($this->validation->data[2] as $key => $value) {
					foreach ($value as $preferensi) {
						$array_where = array(
							'user_id' 		=> $insert_id,
							'meta_key' 		=> $key,
							'meta_value' 	=> $preferensi,
						);
						$this->user_meta_model->create($array_where + array(
							'meta_value' 	=> $preferensi,
						));
					}
				}
			}

			$this->build(null, 200, false, "registrasi berhasil");
		}
	}

	// public function cektoken()
	// {
	// 	$post = $this->input->post();

	// 	if ((isset($post['student_id']) === true) === false) {
	// 		$this->show_status(400);
	// 	}

	// 	$check_result = $this->auth_model->check_token($post, $this->user_group['member']);
	// 	if ($check_result === false) {
	// 		$this->show_status(406);
	// 	} else {
	// 		$this->build($check_result);
	// 	}
	// }

	public function cektoken()
	{
		$post = $this->input->post();

		if ((isset($post['token']) === true) === false) {
			$this->build(null, 400, true, "token harus diinput");
		}

		$temp_where = array(
			'meta_key' => 'token',
			'meta_value' => $post['token'],
		);

		$check_result = $this->user_meta_model->where($temp_where)->get();
		if ($check_result === false) {
			$this->build(null, 406, true, "token tidak valid");
		} else {
			$this->build(null, 200, false, "token masih aktif");
		}
	}

	public function cekaktif()
	{
		$post = $this->input->post();

		if ((isset($post['student_id']) === true) === false) {
			$this->build(null, 400, true, "student id harus diinput");
		}

		$temp_where = array(
			'semester_id' => $this->option_model->get_value('current_semester'),
			'student_id' => $post['student_id'],
		);

		$check_result = $this->db->get_where('app_student_active', $temp_where);
		if (!empty($check_result->row())) {
			if ($check_result->row()->approver_id == null) {
				$this->build(['status' => 'inactive'], 406, true, "user belum aktif");
			} else {
				$this->build(['status' => 'active'], 200, false, "user telah aktif");
			}
		} else {
			$this->build(['status' => 'awaiting_confirmation'], 406, true, "user dalam pengajuan");
		}
	}

	public function forgot_password()
	{
		if ($post = $this->input->post()) {
			$form_valid = true;
			if (!isset($post['username']) || $post['username'] === '') {
				// $this->errors[] = 'NIM harus diisi.';
				$form_valid = false;
				$this->build(null, 406, true, 'NIM harus diisi');
			} elseif (!isset($post['email']) || $post['email'] === '') {
				// $this->errors[] = 'Email harus diisi.';
				$form_valid = false;
				$this->build(null, 406, true, 'Email harus diisi');
			} else {
				$data_user = $this->user_model->where('username', $post['username'])->get();
				if ($data_user === false) {
					$form_valid = false;
					$this->build(null, 406, true, 'NIM tidak terdaftar');
				} elseif ($data_user['email'] !== $post['email']) {
					$form_valid = false;
					$this->build(null, 406, true, 'Email salah');
				}
			}

			if ($form_valid !== false) {
				$len = 8;
				$charset = str_split("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");

				shuffle($charset);
				$random_str = '';
				foreach (array_rand($charset, $len) as $k) $random_str .= $charset[$k];

				$app_name = $this->config->item('app_name');
				$subject = 'Pemulihan Password - ' . $app_name;
				$message = 'Hi, ' . $post['username'] . ' , <br><br> Kamu telah menggunakan fitur lupa password. Berikut data kamu untuk melakukan login ke aplikasi enablink.id <br><br> NIM : ' . $post['username'] . '<br>Password : ' . $random_str . '<br>Diharapkan tidak memberikan akun ini kepada orang lain. Kamu juga dapat mengganti password dihalaman profile. <br><br>Terimakasih - Admin PT Karya Generus Bangsa';
				if ($this->send_email($post['email'], $subject, $message) === false) {
					$this->build(null, 406, true, 'Gagal mengirim email pemulihan');
				} else {
					$forget_response = $this->user_model->update(array('username' => $post['username']), array('password' => $random_str));
					$this->build($forget_response, 406, false, 'Kirim email pemulihan berhasil');
				}
			}
		}
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

	public function logout()
	{
		$this->auth_model->logout($this->current_user);
		$this->build(null, 200, false, "logout berhasil");
	}
}
