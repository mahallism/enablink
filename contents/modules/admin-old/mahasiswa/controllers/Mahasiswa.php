<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Mahasiswa extends App_Controller
{

	protected $module_main = 'mahasiswa';
	// protected $module_name = 'mahasiswa';

	protected $load_model = false;
	protected $gets_view = 'app_students_view';

	protected $list_field  	= array(
		'field' 	=> array(
			'name' 			=> 'Nama',
			'username' 		=> 'NIM',
			'faculty_name' 	=> 'Fakultas',
			// 'class_of_college' 	=> 'Angkatan',
			'no_hp' 		=> 'No. Hp',
			'capability' 	=> 'Kapabilitas',
			'last_login' 	=> 'Last Login',
		),
		'custom' 	=> array(
			'capability' => '"Mahasiswa " . ucwords($item["capability"])',
			'login_count' => '"<div class=\"badge badge-" . ($item["active"] === "active" ? "primary" : "secondary") . " mr-1\">{$item["login_count"]}</div>"',
			'last_login' => '$item["login_count"] . date_html($item["last_login"])',
		),
	);

	protected $input_field  = array(
		'username' => array(
			'label' => 'NIM',
			'required' => true,
		),
		'name' => array(
			'label' => 'Nama Lengkap',
			'required' => true,
		),
		'email' => array(
			'label' => 'Email',
			'type' => 'email',
			'required' => true,
		),
		'birth_date' => array(
			'label' => 'Tanggal Lahir',
			'required' => true,
			'column_size' => 5,
			'type' => 'date',
		),
		'ktm' => array(
			'label' 	=> 'Upload Foto KTM',
			// 'required' 	=> true,
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
		'active' => array(
			'label' => 'User Aktif',
			'type' => 'radiobox',
			'radiobox_data' => array(
				'active',
				'inactive'
			),
			'required' => true,
		),
	);

	protected $mahasiswa_input_field  = array(
		'nick_name' => array(
			'label' 	=> 'Nama Panggilan',
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
			'input_size' => 4,
		),
		'no_hp' => array(
			'label' 	=> 'Nomor Hp',
			'required' 	=> true,
			'input_size' => 6,
		),
		'capability' => array(
			'label' 		=> 'Kapabilitas',
			'type' 			=> 'radiobox',
			'required' 		=> true,
			'radiobox_type' => 'key_value',
			'radiobox_data' => 'data_capability',
			'radiobox_size' => 12,
			// 'attr' 			=> array(
			// 	'show-on' 		=> '#disabilitas',
			// 	'show-on-value' => 'difabel',
			// ),
		),
	);

	protected $form_difabel = array(
		'jenis_difabel' => array(
			'label' 		=> 'Jenis Difabel',
			// 'required' 		=> true,
			'type' 			=> 'select',
			'select_type' 	=> 'value',
			'select_data' 	=> 'data_jenis_difabel',
		),
	);

	protected $form_volunteer = array(
		'jenis_preferensi' => array(
			'label' 		=> 'Jenis Preferensi',
			'column_size' 	=> 6,
			'type' 			=> 'checkbox',
			'checkbox_type' 	=> 'value',
			'checkbox_data' 	=> 'data_jenis_preferensi',
		),
	);

	public function __construct()
	{
		parent::__construct();

		$this->model = &$this->user_model;
		$this->model->crud_capability = $this->user_group['member'];
		$this->load->model('mahasiswa_model');
		$this->meta_table_model = &$this->mahasiswa_model;

		$this->load->model($this->group . 'fakultas/fakultas_model');
		$data_jurusan = $this->fakultas_model->order_by('faculty_name, majors_name')->gets_view();
		$this->fcontrol->set_meta_data('data_jurusan', $data_jurusan);

		$data_capability = array(
			'difabel' 	=> 'Mahasiswa Difabel',
			'volunteer' => 'Mahasiswa Volunteer',
		);
		$this->fcontrol->set_meta_data('data_capability', $data_capability);

		$data_jenis_difabel = $this->option_model->gets_data('difabel');
		$data_jenis_difabel = array_column($data_jenis_difabel, 'option_value');
		$this->fcontrol->set_meta_data('data_jenis_difabel', $data_jenis_difabel);

		$data_jenis_preferensi = $this->option_model->gets_data('preferensi');
		$data_jenis_preferensi = array_column($data_jenis_preferensi, 'option_value');
		$this->fcontrol->set_meta_data('data_jenis_preferensi', $data_jenis_preferensi);

		$this->model->rules['capability'][0] = 'Jenis Difabel';
	}

	public function input($id = false)
	{
		$form_password = array(
			'password' => array(
				'label' => 'Password',
				'type' => 'password',
				'required' => true,
				'attr' => array(
					'minlength' => 6
				),
			),
			'repeat_password' => array(
				'label' => 'Repeat Password',
				'type' => 'password',
				'required' => true,
				'attr' => array(
					'minlength' => 6
				),
			),
		);
		$this->fcontrol->init($form_password, 'form_password')->generate();
		if ($post = $this->input->post()) {
			$this->fcontrol->set_data($post);
		}
		$this->fcontrol->init($this->mahasiswa_input_field, 'form_mahasiswa')->generate();

		$this->fcontrol->init($this->form_difabel, 'form_difabel')->generate();
		$this->fcontrol->init($this->form_volunteer, 'form_volunteer')->generate();
		$this->param['route'] = 'input';
		parent::input();
	}

	protected function do_input($post)
	{
		if (isset($post['username'])) {
			if ($this->model->check_isset('username', $post['username'])) {
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
		}

		$user_meta_rules = array();
		$mahasiswa_difabel = isset($post['capability']) === true && $post['capability'] === 'difabel';
		if ($mahasiswa_difabel === true) {
			$user_meta_rules = array(
				'jenis_difabel'		=> array('Jenis Difabel', array('have', 'required')),
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		} else {
			$user_meta_rules = array(
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		}

		$this->validation->prepar($post, $this->model->rules, $this->mahasiswa_model->rules, $user_meta_rules);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;

		$data_form = $this->validation->data[1];

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
			$insert_id = $this->model->create($this->validation->data[0]);
			$data_form[$this->model->primary_key] = $insert_id;
			$this->meta_table_model->create($data_form);

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

			$this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function edit($id = false)
	{
		$this->input_field['change_password'] = array(
			'type'	=> 'checkbox',
			'checkbox_type'	=> 'boolean',
			'checkbox_label' => 'Change Password',
			'attr' => array(
				'show-change' => "#change_password_box",
			),
		);
		$form_password = array(
			'password' => array(
				'label' => 'Password',
				'type' => 'password',
				'attr' => array(
					'minlength' => 6
				),
			),
			'repeat_password' => array(
				'label' => 'Repeat Password',
				'type' => 'password',
				'attr' => array(
					'minlength' => 6
				),
			),
		);
		$this->fcontrol->init($form_password, 'form_password')->generate();

		$data = $this->model->get($id);
		if (!$data) {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
			$this->redirect($this->module_main);
		}

		if (isset($this->meta_table_model) && $this->meta_table_model !== null) {
			$data_meta_triple = $this->user_meta_model->where('user_id', $id)->gets();
			$data_meta_triple = array_column($data_meta_triple, 'meta_value', 'meta_key');
			$data = array_merge($data, $this->meta_table_model->where($this->model->primary_key, $id)->get(), $data_meta_triple);
		}

		if (!isset($this->param['post'])) {
			$this->param['post'] = array();
		}
		$this->param['post'] = array_merge($this->param['post'], (array)$data);
		$this->param['action_url'] = $this->action_url;

		if ($post = $this->input->post()) {
			$this->param['post'] = array_merge((array)$data, $post);
			$this->do_edit($id, $data, $post);
		}
		$this->fcontrol->set_data($this->param['post'])->init($this->input_field)->generate();
		$this->fcontrol->init($this->mahasiswa_input_field, 'form_mahasiswa')->generate();
		$this->fcontrol->init($this->form_difabel, 'form_difabel')->generate();
		$this->fcontrol->init($this->form_volunteer, 'form_volunteer')->generate();

		$this->title = 'Edit ' . ucwords($this->module_name);
		$this->param['mode_add'] = false;
		$this->param['size'] = $this->input_size;
		$this->param['route'] = 'edit';
		$this->param['data_jenis_preferensi'] = $this->option_model->gets_data('preferensi');
		$data_preferensi = $this->user_meta_model->where([
			'user_id' 		=> $id,
			'meta_key' 		=> 'jenis_preferensi',
		])->gets();

		$this->param['data_preferensi'] = array_column($data_preferensi, 'meta_value');

		$this->build('data-input');
	}

	protected function do_edit($id, $data, $post)
	{
		if (isset($post['username'])) {
			if ($this->model->check_isset('username', $post['username']) && $post['username'] != $data['username']) {
				$this->errors[] = "NIM telah digunakan.";
				return;
			}
		}
		if (isset($post['change_password']) && $post['change_password']) {
			if (!isset($post['password']) || !$post['password']) {
				$this->errors[] = "Password tidak boleh kosong.";
				return;
			} else if (!isset($post['repeat_password']) || !$post['repeat_password']) {
				$this->errors[] = "Pengulangan password tidak boleh kosong.";
				return;
			} else if ($post['password'] != $post['repeat_password']) {
				$this->errors[] = "Pengulangan password tidak sesuai.";
				return;
			}
		} else {
			unset($this->model->rules['password']);
		}

		$user_meta_rules = array();
		$mahasiswa_difabel = isset($post['capability']) === true && $post['capability'] === 'difabel';
		if ($mahasiswa_difabel === true) {
			$user_meta_rules = array(
				'jenis_difabel'		=> array('Jenis Difabel', array('have', 'required')),
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		} else {
			$user_meta_rules = array(
				'jenis_preferensi'		=> array('Jenis Preferensi', array('have', 'required')),
			);
		}

		$this->validation->prepar($post, $this->model->rules, $this->meta_table_model->rules, $user_meta_rules);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;
		if ($form_valid === true && $mahasiswa_difabel === true && isset($_FILES['surat_keterangan_disabilitas']) && $_FILES['surat_keterangan_disabilitas']['error'] === 0) {
			$this->load->library('upload');

			$config['file_name'] 	 = $post['username'] . '_surat-keterangan-disabilitas_' . rand(1, 999);
			$config['upload_path']   = './uploads/surat/';
			$config['allowed_types'] = 'pdf|jpg|jpeg|png';

			$this->upload->initialize($config);

			if ($this->upload->do_upload('surat_keterangan_disabilitas')) {
				$file_data = $this->upload->data();
				$this->validation->data[2]['surat_keterangan_disabilitas'] = 'uploads/surat/' . $file_data['file_name'];
				unlink('./' . $data['surat_keterangan_disabilitas']);
			} else {
				$form_valid = false;
				$form_errors[] = $this->upload->display_errors('', '<br>');
			}
		}

		if ($form_valid === false) {
			$this->errors = $form_errors;
		} else {
			$data_form = $this->validation->data[1];
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

			$this->model->update($id, $this->validation->data[0]);
			$this->meta_table_model->update($data[$this->meta_table_model->primary_key], $data_form);
			if ($mahasiswa_difabel === true) {
				$this->db->where(array(
					'user_id' 		=> $id,
					'meta_key' 		=> 'jenis_preferensi',
				))->delete('aplego_user_meta');

				$this->db->where(array(
					'user_id' 		=> $id,
					'meta_key' 		=> 'jenis_difabel',
				))->delete('aplego_user_meta');

				foreach ($this->validation->data[2] as $key => $value) {
					if ($key != 'jenis_preferensi') {
						$array_where = array(
							'user_id' 		=> $id,
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
								'user_id' 		=> $id,
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
					'user_id' 		=> $id,
					'meta_key' 		=> 'jenis_preferensi',
				))->delete('aplego_user_meta');

				$this->db->where(array(
					'user_id' 		=> $id,
					'meta_key' 		=> 'jenis_difabel',
				))->delete('aplego_user_meta');

				foreach ($this->validation->data[2] as $key => $value) {
					foreach ($value as $preferensi) {
						$array_where = array(
							'user_id' 		=> $id,
							'meta_key' 		=> $key,
							'meta_value' 	=> $preferensi,
						);
						$this->user_meta_model->create($array_where + array(
							'meta_value' 	=> $preferensi,
						));
					}
				}
			}

			$this->set_message('Data ' . $this->module_name . ' telah berhasil diubah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function delete($id = false)
	{
		$this->load->model($this->group . 'active/mahasiswa_active_model');
		$this->load->model($this->group . 'mahasiswa/mahasiswa_model');
		$data_mahasiswa = $this->mahasiswa_model->where('user_id', $id)->get();
		if ($data_mahasiswa !== false) {
			$data_mahasiswa_active = $this->mahasiswa_active_model->where('student_id', $data_mahasiswa['student_id'])->get();
			$this->mahasiswa_active_model->delete(array('student_id' => $data_mahasiswa['student_id']));
		}
		if ($this->model->delete($id)) {
			$this->set_message('Data ' . $this->module_name . ' telah berhasil dihapus.', 'success');
		} else {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
		}
		$this->redirect($this->module_main);
	}
}
