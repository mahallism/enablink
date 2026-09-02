<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Profile extends Api_Controller
{

	protected $protected_page = array(
		'index' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'change' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'change_photo' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'change_password' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
		'notification' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'delete_notification' => array(
			'method' => array('GET'),
			'capability' => 'member',
		),
		'insert_device_id' => array(
			'method' => array('POST'),
			'capability' => 'member',
		),
	);

	public function index()
	{
		$data_profile = $this->auth_model->get_profile($this->current_user);
		$this->build($data_profile);
	}

	public function notification()
	{
		$this->db->from('app_notifications');
		$this->db->where('student_id', $this->current_user['student_id']);
		$data = $this->db->get()->result_array();

		$this->build($data);
	}

	public function delete_notification()
	{
		$this->db->where("student_id", $this->current_user['student_id']);
		$this->db->delete("app_notifications");

		$this->build(null, 200, false, 'berhasil menghapus semua notif anda');
	}

	public function insert_device_id()
	{
		$post = $this->input->post();

		$this->load->model($this->admin_group . 'mahasiswa/mahasiswa_model');

		$temp_where = array(
			'user_id' => $this->current_user['user_id'],
			'meta_key' => 'device_id',
		);

		if ($this->user_meta_model->check_isset($temp_where)) {
			$this->user_meta_model->update($temp_where, array('meta_value' => $post['device_id']));
		} else {
			$this->user_meta_model->create($temp_where + array('meta_value' => $post['device_id']));
		}
		$this->build(['error' => false, 'message' => 'berhasil insert data device id']);
	}

	public function change()
	{
		$post = $this->input->post();

		$user_rules = array(
			'name'	=> array('Nama Lengkap', array('have', 'trim', 'required')),
			'email'	=> array('Email', array('have', 'trim', 'required')),
		);

		$this->load->model($this->admin_group . 'mahasiswa/mahasiswa_model');

		$rules_difabel = array();

		$user_meta_rules = array();
		if ($this->current_user['capability'] === 'difabel') {
			$user_meta_rules = array(
				'jenis_difabel'		=> array('Jenis Difabel', array('have', 'required')),
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		} else {
			$user_meta_rules = array(
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		}

		$this->validation->prepar($post, $user_rules, $this->mahasiswa_model->rules, $user_meta_rules);

		if ($this->validation->run() === false) {
			// $this->show_status(400);
			$this->build(null, 406, true, 'Pastikan data yang diinputkan sesuai');
		} else {
			$this->auth_model->update($this->current_user['user_id'], $this->validation->data[0]);
			if (isset($_FILES['photo']) && $_FILES['photo']['error'] === 0) {
				$config['upload_path'] = './uploads/';
				$config['allowed_types'] = 'jpg|jpeg|png';
				$config['file_name'] = trim($post['nick_name']);

				$this->load->library('upload', $config);
				$this->upload->initialize($config);

				if ($this->upload->do_upload('photo') === true) {
					$temp_data = $this->upload->data();
					$this->validation->data[1]['photo'] = 'uploads/' . $temp_data['file_name'];
					if ($this->current_user['photo']) {
						@unlink('./' . $this->current_user['photo']);
					}
				}
			}
			$this->mahasiswa_model->update($this->current_user['student_id'], $this->validation->data[1]);

			if ($this->current_user['capability'] === 'difabel') {
				$this->db->where(array(
					'user_id' 		=> $this->current_user['user_id'],
					'meta_key' 		=> 'jenis_preferensi',
				))->delete('aplego_user_meta');

				foreach ($this->validation->data[2] as $key => $value) {
					if ($key != 'jenis_preferensi') {
						$array_where = array(
							'user_id' 		=> $this->current_user['user_id'],
							'meta_key' 		=> $key,
						);
						if ($this->user_meta_model->check_isset($array_where) === true) {
							$this->user_meta_model->update($array_where, array(
								'meta_value' 	=> $value,
							));
						} else {
							$this->user_meta_model->create($array_where + array(
								'meta_value' 	=> $value,
							));
						}
					} else {
						foreach ($value as $preferensi) {
							$array_where = array(
								'user_id' 		=> $this->current_user['user_id'],
								'meta_key' 		=> $key,
								'meta_value' 	=> $preferensi,
							);
							$this->user_meta_model->create($array_where + array(
								'meta_value' 	=> $preferensi,
							));
						}
					}
				}
			} else {
				$this->db->where(array(
					'user_id' 		=> $this->current_user['user_id'],
					'meta_key' 		=> 'jenis_preferensi',
				))->delete('aplego_user_meta');

				foreach ($this->validation->data[2] as $key => $value) {
					foreach ($value as $preferensi) {
						$array_where = array(
							'user_id' 		=> $this->current_user['user_id'],
							'meta_key' 		=> $key,
							'meta_value' 	=> $preferensi,
						);
						$this->user_meta_model->create($array_where + array(
							'meta_value' 	=> $preferensi,
						));
					}
				}
			}


			// 			$this->show_status(201);
			$data_profile = $this->auth_model->get_profile($this->current_user);
			$this->build($data_profile);
		}
	}

	public function change_photo()
	{
		$post = $this->input->post();

		$user_rules = array();

		$this->load->model($this->admin_group . 'mahasiswa/photo_model');

		$rules_difabel = array();

		$this->validation->prepar($post, $user_rules, $this->photo_model->rules);

		if ($this->validation->run() === false) {
			// $this->show_status(400);
			$this->build(null, 406, true, 'Pastikan data yang diinputkan sesuai');
		} else {

			if (isset($_FILES['photo']) && $_FILES['photo']['error'] === 0) {
				$config['upload_path'] = './uploads/';
				$config['allowed_types'] = 'jpg|jpeg|png';
				// $config['file_name'] = trim($post['nick_name']);

				$this->load->library('upload', $config);
				$this->upload->initialize($config);

				if ($this->upload->do_upload('photo') === true) {
					$temp_data = $this->upload->data();
					$this->validation->data[1]['photo'] = 'uploads/' . $temp_data['file_name'];
					if ($this->current_user['photo']) {
						@unlink('./' . $this->current_user['photo']);
					}
					$this->photo_model->update($this->current_user['student_id'], $this->validation->data[1]);


					// 			$this->show_status(200);
					//             $data_profile = $this->auth_model->get_profile($this->current_user);
					// 			$this->build($data_profile);
					// $this->build(array('error' => false));
					$this->build(null, 200, false, 'Berhasil mengganti foto');
				} else {
					// $this->show_status(400);
					// $this->build(array('error' => true));
					$this->build(null, 406, true, 'Pastikan data yang diinputkan sesuai');
				}
			}
		}
	}

	public function change_password()
	{
		$post = $this->input->post();
		$user_rules = array();
		$user_rules['last_password'] = array('Password', array('have', 'required'));
		$user_rules['password'] = array('Password', array('have', 'required'));

		$this->load->model($this->admin_group . 'mahasiswa/mahasiswa_model');

		$this->validation->prepar($post, $user_rules);

		$form_valid = $this->validation->run();
		if ($form_valid === false) {
			// $this->build(array('error' => 'true', 'message' => 'cek input anda'), 401);
			$this->build(null, 401, true, 'Pastikan data yang diinputkan sesuai');
		} else {
			if (strlen($post['password']) < 6) {
				$this->build(null, 406, true, 'pastikan password lebih dari 6 karakter');
			}

			$this->load->library('PasswordHash');
			$this->db->where('username', $this->current_user['username']);
			$user_data = $this->db->get('aplego_user');
			$data_user = $user_data->row();
			$pass_check = $this->passwordhash->CheckPassword($post['last_password'], $data_user->password);

			if ($pass_check === true) {
				$do_change = $this->user_model->update(array('username' => $this->current_user['username']), array('password' => $post['password']));
				if ($do_change) {
					// $this->build(array('error' => 'false', 'message' => 'berhasil mengganti password'));
					$this->build(null, 201, false, 'Berhasil mengganti password');
				} else {
					// $this->build(array('error' => 'true', 'message' => 'gagal mengganti password'), 406);
					$this->build(null, 406, true, 'Gagal mengganti password');
				}
			} else {
				// $this->build(array('error' => 'true', 'message' => 'password lama anda salah'), 406);
				$this->build(null, 406, true, 'Password lama anda salah');
			}
		}
	}

	// public function ubah_password(){
	//     $post = $this->input->post();
	//     $user_rules = array(
	// 		'name'				=> array('Nama Lengkap', array('have', 'trim', 'required')),
	// 		'email'				=> array('Email', array('have', 'trim', 'required')),
	// 	);

	// 	if (isset($post['change_password'])) {
	// 		$post['last_password'] = array('Password', array('have', 'required'));
	// 		$post['password'] = array('Password', array('have', 'required'));
	// 		$password_rules = array('repeat_password'=> array(
	// 			'Pengulangan Password', array('have', 'required', 'matches' => array('password', 'Password')),
	// 		));
	// 	}else{
	// 		$password_rules = array();
	// 	}

	// 	$this->load->model($this->admin_group.'mahasiswa/mahasiswa_model');

	// 	$mahasiswa_difabel = $this->user_model->protected_item($this->user_group['difabel']);

	// 	$rules_difabel = array();
	// 	if ($mahasiswa_difabel === true) {
	// 		$rules_difabel = array(
	// 			'jenis_difabel'		=> array('Jenis Difabel', array('have', 'required')),
	// 		);
	// 	}
	// 	$this->validation->prepar($post, $user_rules, $this->mahasiswa_model->rules, $rules_difabel, $password_rules);

	// 	$form_valid = $this->validation->run();
	// 	$form_errors = $this->validation->errors;
	// 	if ($form_valid === false) {
	// 		$this->errors = $form_errors;
	// 	}else{
	// 		if (isset($_FILES['photo']) && $_FILES['photo']['error'] === 0) {
	// 			$config['upload_path'] = './uploads/';
	// 			$config['allowed_types'] = 'jpg|jpeg|png';
	// 			$config['file_name'] = trim($post['nick_name']);

	// 			$this->load->library('upload', $config);
	// 			$this->upload->initialize($config);

	// 			if($this->upload->do_upload('photo') === true){
	// 				$temp_data = $this->upload->data();
	// 				$this->validation->data[1]['photo'] = 'uploads/'.$temp_data['file_name'];
	// 				if ($data['photo']) {
	// 					@unlink('./'.$data['photo']);
	// 				}
	// 			}
	// 		}

	// 		$change_profile = $this->user_model->update($this->validation->data[0], $this->validation->data[1]);
	// 		if ($change_profile['value']) {
	// 			if ($mahasiswa_difabel === true){
	// 				foreach ($this->validation->data[2] as $key => $value) {
	// 					$array_where = array(
	// 						'user_id' 		=> $data['user_id'], 
	// 						'meta_key' 		=> $key, 
	// 					);
	// 					if ($this->user_meta_model->check_isset($array_where) === true) {
	// 						$this->user_meta_model->update($array_where, array(
	// 							'meta_value' 	=> $value, 
	// 						));
	// 					}else{
	// 						$this->user_meta_model->create($array_where + array(
	// 							'meta_value' 	=> $value, 
	// 						));
	// 					}
	// 				}
	// 			}

	// 			$this->user_model->refresh_session();
	// 			$this->set_message('Data profile telah berhasil diubah.', 'success');
	// 			$this->redirect('dashboard');
	// 			$this->show_status(406);
	// 		}else{
	// 			$this->errors[] = $change_profile['message'];
	// 			$this->show_status(406);
	// 		}
	// 	}
	// }

	public function change_password2()
	{
		$post = $this->input->post();

		$this->load->model($this->admin_group . 'mahasiswa/password_model');
		$this->validation->prepar($post, $this->password_model->rules);

		if ($this->validation->run() === false) {
			$this->show_status(400);
		} else {

			$this->password_model->update($this->current_user['user_id'], $this->validation->data[1]);
		}
		// 			$this->show_status(201);
		$data_profile = $this->auth_model->get_profile($this->current_user);
		$this->build($data_profile);
	}
}
