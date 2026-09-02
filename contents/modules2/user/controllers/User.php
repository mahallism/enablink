<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends Subsystem_Controller
{

	protected $protected_page = array(
		'profile' 			=> 'member',
		'change_profile' 	=> 'member',
	);

	public function __construct()
	{
		parent::__construct('member');

		$this->load->model($this->admin_group . 'mahasiswa/mahasiswa_model');
		$this->user_model->meta_table_model = &$this->mahasiswa_model;
	}

	public function login()
	{
		if (current_user_session()) {
			$this->set_message('Anda sudah login.');
			$direct_url = $this->config->item('main_url');
			redirect($direct_url[current_user_session('capability')]);
		}

		if ($post = $this->input->post()) {
			$this->validation->prepar($post, array(
				'username' 	=> array('NIM', array('have', 'required')),
				'password' 	=> array('Password', array('have', 'required')),
			));
			if (!$this->validation->run()) {
				$this->errors = $this->validation->errors;
			} else {
				$login = $this->user_model->login($this->validation->data, false, $this->user_group['member']);
				if ($login['value']) {
					$this->set_message($login['message'], 'success');
					if (isset($post['go'])) {
						redirect(urldecode($post['go']));
					}

					$direct_url = $this->config->item('main_url');
					redirect($direct_url[current_user_session('capability')]);
				} else {
					$this->errors[] = str_replace("Username", "NIM", $login['message']);
				}
			}
			$this->param['post'] = $post;
		}

		$this->title = 'Login';
		$this->active_menu = 'login';
		$this->param['go'] = $this->input->get('go');
		$this->build('login');
	}

	public function logout()
	{
		$this->user_model->logout();
		$this->set_message('Success Logout.', 'success');
		$this->redirect('user/login');
	}

	public function profile()
	{
		// $this->user_model->refresh_session();
		$data = $this->user_model->current_user_session();
		// var_dump($data);
		$this->title = 'Profile';
		$this->active_menu = 'profile';
		$this->load->model($this->admin_group . 'fakultas/fakultas_model');
		$this->param['data_fakultas'] = $this->fakultas_model->get_view(array('majors_id' => $data['majors_id']));
		$this->param['data'] = $data;

		$data_preferensi = $this->user_meta_model->where([
			'user_id' 		=> $data['user_id'],
			'meta_key' 		=> 'jenis_preferensi',
		])->gets();

		$this->param['data_preferensi'] = array_column($data_preferensi, 'meta_value');
		$this->build('profile-view');
	}

	public function change_profile()
	{
		$data = current_user_session();

		$this->param['post'] = $data;

		if ($post = $this->input->post()) {
			$this->do_change_profile($post, $data);
			$this->param['post'] = array_merge($data, $post);
		}

		$this->load->model($this->admin_group . 'fakultas/fakultas_model');
		$data_jurusan = $this->fakultas_model->order_by('faculty_name, majors_name')->gets_view();
		$this->fcontrol->set_meta_data('data_jurusan', $data_jurusan);

		$data_form = array(
			'username' => array(
				'label' => 'NIM',
				'required' => true,
				'attr' => array(
					'readonly'
				),
			),
			'name' => array(
				'label' => 'Nama Lengkap',
				'required' => true,
			),
			'nick_name' => array(
				'label' 	=> 'Nama Panggilan',
				'required' 	=> true,
				'input_size' => 6,
			),
			'birth_date' => array(
				'label' 	=> 'Tanggal Lahir',
				'type' 		=> 'date',
				'required' 	=> true,
				'input_size' => 6,
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
			),
			'class_of_college' => array(
				'label' 	=> 'Angkatan',
				'type' 		=> 'number',
				'required' 	=> true,
				'input_size' => 6,
			),
			'divider',
			'email' => array(
				'label' => 'Email Address',
				'type' => 'email',
				'required' => true,
			),
			'no_hp' => array(
				'label' 	=> 'Nomor Hp',
				'required' 	=> true,
				'input_size' => 6,
			),
			'birth_date' => array(
				'label' => 'Tanggal Lahir',
				'required' => true,
				'input_size' => 6,
				'type' => 'date',
			),
			'photo' => array(
				'label' 	=> 'Photo',
				'type'		=> 'file',
				'input_size' => 6,
				'attr' 			=> array(
					'accept' 		=> 'image/*',
				),
			),
			'ktm' => array(
				'label' 	=> 'Foto KTM',
				'type'		=> 'file',
				'input_size' => 6,
				'attr' 			=> array(
					'accept' 		=> 'image/*',
				),
			),
			// 'jenis_preferensi' => array(
			// 	'label' 		=> 'Jenis Preferensi',
			// 	'column_size' 	=> 6,
			// 	'type' 			=> 'checkbox',
			// 	'checkbox_type' 	=> 'value',
			// 	'checkbox_data' 	=> 'data_jenis_preferensi',
			// 	'attr' => array(
			// 		'checked' => ('value' == 'meta_value' ? true : false )
			// 	),
			// 	// 'multiple'		=> true
			// 	'required' 		=> true,
			// ),

		);

		$data_jenis_preferensi = $this->option_model->gets_data('preferensi');
		// $data_jenis_preferensi = array_column($data_jenis_preferensi, 'option_value');
		$this->param['data_jenis_preferensi'] = $data_jenis_preferensi;

		$data_preferensi = $this->user_meta_model->where([
			'user_id' 		=> $data['user_id'],
			'meta_key' 		=> 'jenis_preferensi',
		])->gets();

		$this->param['data_preferensi'] = array_column($data_preferensi, 'meta_value');

		$this->fcontrol->set_data($this->param['post'])->init($data_form)->generate();

		// mahasiswa difabel
		if ($this->user_model->protected_item($this->user_group['difabel'])) {
			$data_jenis_difabel = $this->option_model->gets_data('difabel');
			$data_jenis_difabel = array_column($data_jenis_difabel, 'option_value');
			$this->fcontrol->set_meta_data('data_jenis_difabel', $data_jenis_difabel);

			$data_form_disabilitas = array(
				'jenis_difabel' => array(
					'label' 		=> 'Jenis Disabilitas',
					'required' 		=> true,
					'type' 			=> 'select',
					'select_type' 	=> 'value',
					'select_data' 	=> 'data_jenis_difabel',
				),
			);
			$this->fcontrol->init($data_form_disabilitas, 'form_disabilitas')->generate('form_disabilitas');
		}

		$this->title = 'Change Profile';
		$this->active_menu = 'change_profile';
		$this->build('profile-change');
	}

	protected function do_change_profile($post, $data)
	{
		$user_rules = array(
			'name'				=> array('Nama Lengkap', array('have', 'trim', 'required')),
			'email'				=> array('Email', array('have', 'trim', 'required')),
		);

		if (isset($post['change_password'])) {
			$user_rules['last_password'] = array('Password', array('have', 'required'));
			$user_rules['password'] = array('Password', array('have', 'required'));
			$password_rules = array('repeat_password' => array(
				'Pengulangan Password', array('have', 'required', 'matches' => array('password', 'Password')),
			));
		} else {
			$password_rules = array();
		}

		$this->load->model($this->admin_group . 'mahasiswa/mahasiswa_model');

		$mahasiswa_difabel = $this->user_model->protected_item($this->user_group['difabel']);

		$user_meta_rules = array();
		if ($mahasiswa_difabel === true) {
			$user_meta_rules = array(
				'jenis_difabel'		=> array('Jenis Difabel', array('have', 'required')),
			);
		} else {
			$user_meta_rules = array(
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		}

		$this->validation->prepar($post, $user_rules, $this->mahasiswa_model->rules, $user_meta_rules, $password_rules);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;
		if ($form_valid === false) {
			$this->errors = $form_errors;
		} else {
			if (isset($_FILES['photo']) && $_FILES['photo']['error'] === 0) {
				$config['upload_path'] = './uploads/';
				$config['allowed_types'] = 'jpg|jpeg|png';
				$config['file_name'] = trim($post['username']);

				$this->load->library('upload', $config);
				$this->upload->initialize($config);

				if ($this->upload->do_upload('photo') === true) {
					$temp_data = $this->upload->data();
					$this->validation->data[1]['photo'] = 'uploads/' . $temp_data['file_name'];
					if ($data['photo']) {
						@unlink('./' . $data['photo']);
					}
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
					$this->validation->data[1]['ktm'] = 'uploads/' . $temp_data['file_name'];
					if ($data['ktm']) {
						@unlink('./' . $data['ktm']);
					}
				}
			}

			$change_profile = $this->user_model->change_profile($this->validation->data[0], $this->validation->data[1]);
			if ($change_profile['value']) {
				if ($mahasiswa_difabel === true) {
					foreach ($this->validation->data[2] as $key => $value) {
						$array_where = array(
							'user_id' 		=> $data['user_id'],
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
					}
				} else {
					$this->db->where(array(
						'user_id' 		=> $data['user_id'],
						'meta_key' 		=> 'jenis_preferensi',
					))->delete('aplego_user_meta');
					
					foreach ($this->validation->data[2] as $key => $value) {
						foreach ($value as $preferensi) {
							$array_where = array(
								'user_id' 		=> $data['user_id'],
								'meta_key' 		=> $key,
								'meta_value' 	=> $preferensi,
							);
							$this->user_meta_model->create($array_where + array(
								'meta_value' 	=> $preferensi,
							));
						}
					}
				}

				$this->user_model->refresh_session();
				$this->set_message('Data profile telah berhasil diubah.', 'success');
				$this->redirect('dashboard');
			} else {
				$this->errors[] = $change_profile['message'];
			}
		}
	}

	public function forgot_password()
	{
		if ($post = $this->input->post()) {
			$form_valid = true;
			if (!isset($post['username']) || $post['username'] === '') {
				$this->errors[] = 'NIM harus diisi.';
				$form_valid = false;
			} elseif (!isset($post['email']) || $post['email'] === '') {
				$this->errors[] = 'Email harus diisi.';
				$form_valid = false;
			} else {
				$data_user = $this->user_model->where('username', $post['username'])->get();
				if ($data_user === false) {
					$this->errors[] = 'NIM tidak terdaftar.';
					$form_valid = false;
				} elseif ($data_user['email'] !== $post['email']) {
					$this->errors[] = 'Email yang anda masukkan salah.';
					$form_valid = false;
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
				$message = 'Selamat pagi, <br><br> Password pemuliahan : ' . $random_str . '<br>Silahkan mengubah password seletelah berhasil login.<br><br>Admin <a href="' . base_url() . '">' . $app_name . '</a>';
				if ($this->send_email($post['email'], $subject, $message) === false) {
					$this->errors[] = 'Email pemulihan password gagal dikirim.';
				} else {
					$this->user_model->update(array('username' => $post['username']), array('password' => $random_str));
					$this->set_message('Email pemulihan password berhasil dikirim, silahkan melihat email.', 'success');
					$this->redirect('user/login');
				}
			}
		}

		$this->title = 'Forgot Password';
		$this->build('forgot-password');
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
}
