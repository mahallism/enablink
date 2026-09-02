<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Register extends Subsystem_Controller
{

	public function __construct()
	{
		parent::__construct('member');
	}

	public function index()
	{
		if (current_user_session()) {
			$this->set_message('Anda sudah login.');
			$direct_url = $this->config->item('main_url');
			redirect($direct_url[current_user_session('capability')]);
		}

		$register_field = array(
			'username' => array(
				'label' => 'NIM',
				'required' => true,
				'column_size' => 7,
			),
			'birth_date' => array(
				'label' => 'Tanggal Lahir',
				'required' => true,
				'column_size' => 5,
				'type' => 'date',
			),
			'name' => array(
				'label' => 'Nama Lengkap',
				'required' => true,
				'column_size' => 7,
			),
			'nick_name' => array(
				'label' 	=> 'Nama Panggilan',
				'required' 	=> true,
				'column_size' => 5,
			),
			'majors_id' => array(
				'label' 		=> 'Jurusan',
				'required' 		=> true,
				'type' 			=> 'select',
				'select_type' 	=> 'group',
				'select_data' 	=> 'data_jurusan',
				'group_index' 	=> 'faculty_name',
				'group_key' 	=> 'majors_id',
				'group_value' 	=> 'majors_name',
				'column_size' => 7,
			),
			'class_of_college' => array(
				'label' 	=> 'Angkatan',
				'type' 		=> 'number',
				'required' 	=> true,
				'column_size' => 5,
			),
			'email' => array(
				'label' => 'Email Address',
				'type' => 'email',
				'required' => true,
				'column_size' => 6,
			),
			'no_hp' => array(
				'label' 	=> 'Nomor Hp',
				'required' 	=> true,
				'column_size' => 6,
			),
			'ktm' => array(
				'label' 	=> 'Upload Foto KTM',
				'required' 	=> true,
				'type'		=> 'file',
				'column_size' => 6,
				'attr' 			=> array(
					'accept' 		=> 'image/*',
				),
			),
			'photo' => array(
				'label' 	=> 'Upload Foto Diri',
				'type'		=> 'file',
				'column_size' => 6,
				'attr' 			=> array(
					'accept' 		=> 'image/*',
				),
			),
			'divider',

		);
		$capability_register_field = array(
			'capability' => array(
				'label' 		=> 'Register sebagai',
				'required' 		=> true,
				'type' 			=> 'radiobox',
				'radiobox_type' => 'key_value',
				'radiobox_size' => 4,
				'radiobox_data' => array(
					'difabel' 	=> 'Mahasiswa Difabel',
					'volunteer' => 'Mahasiswa Volunteer'
				),
				// 'attr' 			=> array(
				// 	'show-on' 		=> '#disabilitas',
				// 	'show-on-value' => 'difabel',
				// ),
				// 'attr' 			=> array(
				// 	'show-on' 		=> '#preferensi',
				// 	'show-on-value' => 'volunteer',
				// ),
			),
		);
		$disabilitas_register_field = array(
			'jenis_difabel' => array(
				'label' 		=> 'Jenis Disabilitas',
				'column_size' 	=> 6,
				'type' 			=> 'select',
				'select_type' 	=> 'value',
				'select_data' 	=> 'data_jenis_difabel',
			),
		);
		$volunteer_register_field = array(
			'jenis_preferensi' => array(
				'label' 		=> 'Jenis Preferensi',
				'column_size' 	=> 6,
				'type' 			=> 'checkbox',
				'checkbox_type' 	=> 'value',
				'checkbox_data' 	=> 'data_jenis_preferensi',
				// 'multiple'		=> true
				// 'required' 		=> true,
				// 'attr' => array(
				// 	'checked' => false
				// ),
			),
		);
		$footer_register_field = array(
			'divider',
			'password' => array(
				'label' => 'Password',
				'type' => 'password',
				'required' => true,
				'column_size' => 6,
				'attr' => array(
					'minlength' => 6
				),
			),
			'repeat_password' => array(
				'label' => 'Repeat Password',
				'type' => 'password',
				'required' => true,
				'column_size' => 6,
				'attr' => array(
					'minlength' => 6
				),
			),
			'agree' => array(
				'label' 		=> 'Agreement',
				'type' 			=> 'checkbox',
				'checkbox_type' => 'boolean',
				'checkbox_label' => 'Saya menyetujui <a href="https://enablink.id/syaratketentuan">Terms of Service</a>',
				'required' 		=> true,
			),
		);

		$this->load->model($this->admin_group . 'fakultas/fakultas_model');
		$data_jurusan = $this->fakultas_model->order_by('faculty_name, majors_name')->gets_view();
		$this->fcontrol->set_meta_data('data_jurusan', $data_jurusan);

		$data_jenis_difabel = $this->option_model->gets_data('difabel');
		$data_jenis_difabel = array_column($data_jenis_difabel, 'option_value');
		$this->fcontrol->set_meta_data('data_jenis_difabel', $data_jenis_difabel);

		$data_jenis_preferensi = $this->option_model->gets_data('preferensi');
		$data_jenis_preferensi = array_column($data_jenis_preferensi, 'option_value');
		$this->fcontrol->set_meta_data('data_jenis_preferensi', $data_jenis_preferensi);

		$this->param['post'] = array();
		if ($post = $this->input->post()) {
			$this->do_register($post);
			$this->param['post'] = $post;
		}

		$this->fcontrol->set_data($this->param['post']);
		$this->fcontrol->init($register_field, 'default', 'group')->generate();
		$this->fcontrol->init($capability_register_field, 'capability', 'group')->generate('capability');
		$this->fcontrol->init($disabilitas_register_field, 'disabilitas', 'group')->generate('disabilitas');
		$this->fcontrol->init($volunteer_register_field, 'preferensi', 'group')->generate('preferensi');
		$this->fcontrol->init($footer_register_field, 'footer', 'group')->generate('footer');

		$this->title = 'Register';
		$this->active_menu = 'register';
		$this->build('register');
	}

	protected function do_register($post)
	{
		$mahasiswa_difabel = false;
		$user_meta_rules = array();
		if (isset($post['username'])) {
			if ($this->user_model->check_isset('username', $post['username'])) {
				$this->errors[] = "NIM telah digunakan.";
				return;
			}
		}
		if (!isset($post['password']) || !$post['password']) {
			$this->errors[] = "Password tidak boleh kosong.";
			return;
		} else if (!isset($post['repeat_password']) || !$post['repeat_password']) {
			$this->errors[] = "Pengulangan password tidak boleh kosong.";
			return;
		} else if ($post['password'] != $post['repeat_password']) {
			$this->errors[] = "Pengulangan password tidak sesuai.";
			return;
		} else if (!isset($post['capability'])) {
			$this->errors[] = "Register sebagai tidak boleh kosong.";
			return;
		} else if (!in_array($post['capability'], array('difabel', 'volunteer'))) {
			$this->errors[] = "Register sebagai tidak sesuai.";
			return;
		} else if (!isset($post['birth_date'])) {
			$this->errors[] = "Tanggal lahir tidak boleh kosong.";
			return;
		}
		if (isset($post['capability']) && $post['capability'] == 'difabel') {
			$mahasiswa_difabel = true;
			$user_meta_rules = array(
				'jenis_difabel' => array('Jenis Disabilitas', array('have', 'required')),
			);
		}

		if (isset($post['capability']) && $post['capability'] == 'volunteer') {
			$mahasiswa_difabel = false;
			$user_meta_rules = array(
				'jenis_preferensi' => array('Jenis Preferensi', array('have', 'required')),
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
			$this->errors = $this->validation->errors;
		} else {
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
					$data_meta_triple[] = array(
						'user_id' 		=> $insert_id,
						'meta_key' 		=> $key,
						'meta_value' 	=> $value,
					);
				}
				$this->user_meta_model->create_bulk($data_meta_triple);
			} else {
				$data_meta_triple = array();
				foreach ($this->validation->data[2] as $key => $value) {
					foreach ($value as $preferensi) {
						$data_meta_triple[] = array(
							'user_id' 		=> $insert_id,
							'meta_key' 		=> $key,
							'meta_value' 	=> $preferensi,
						);
					}
				}
			}


			$this->user_meta_model->create_bulk($data_meta_triple);

			$this->user_model->login_by_register($insert_id);
			$this->set_message('Success register, terimakasih telah bergabung.', 'success');
			$this->redirect('dashboard');
		}
	}
}
