<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth_model extends Aplego_Model
{
	public $table_name 			= "aplego_user";
	public $primary_key 		= "user_id";
	protected $table_view_name 	= "app_students_view";

	private $allowed_session 	= array(
		'student_id',
		'username',
		'name',
		'nick_name',
		'faculty_id',
		'faculty_name',
		'majors_id',
		'majors_name',
		'class_of_college',
		'no_hp',
		'email',
		'photo',
		'capability',
	);

	public function login($data, $capability)
	{
		$this->where('username', $data['username']);
		if ($user_data = $this->get()) {
			$this->load->library('PasswordHash');
			$pass_check = $this->passwordhash->CheckPassword($data['password'], $user_data['password']);

			if ($pass_check === true) {
				if ($user_data['active'] == 'inactive') {
					return ['error' => true, 'message' => 'akun anda belum aktif'];
				} else if ($user_data['active'] == 'notactive') {
					return ['error' => true, 'message' => 'akun anda belum aktif'];
				}

				if ($capability && !in_array($user_data['capability'], $capability)) {
					return ['error' => true, 'message' => 'error kapabilitas, silahkan hubungi admin'];
				}

				$token = sha1(rand(1, 10000000000));
				$temp_where = array(
					'user_id' => $user_data['user_id'],
					'meta_key' => 'token',
				);
				if ($this->user_meta_model->check_isset($temp_where)) {
					$this->user_meta_model->update($temp_where, array('meta_value' => $token));
				} else {
					$this->user_meta_model->create($temp_where + array('meta_value' => $token));
				}

				$sess_data = $this->get_view($user_data['user_id']);
				$sess_data = elements($this->allowed_session, $sess_data);
				$data_meta = $this->user_meta_model->where('user_id', $user_data['user_id'])->where('meta_key !=', 'jenis_preferensi')->gets();
				foreach ($data_meta as $item) {
					$sess_data[$item['meta_key']] = $item['meta_value'];
				}

				$data_meta_preferensi = $this->user_meta_model->where('user_id', $user_data['user_id'])->where('meta_key', 'jenis_preferensi')->gets();
				$array_preferensi = array();

				foreach ($data_meta_preferensi as $preferensi) {
					array_push($array_preferensi, $preferensi['meta_value']);
				}

				$this->update($user_data['user_id'], array(
					'last_login' => date('Y-m-d H:i:s'),
					'login_count' => $user_data['login_count'] + 1,
				));

				$sess_data = array_merge($sess_data, ['preferensi' => $array_preferensi]);

				return $sess_data;
			} else {
				return ['error' => true, 'message' => 'Password anda salah'];
			}
		}
		return ['error' => true, 'message' => 'Username anda salah'];
	}

	public function check_token($data, $capability)
	{
		$user_data = $this->get_view(array('student_id' => $data['student_id']));
		if ($user_data !== false) {
			$temp_where = array(
				'user_id' => $user_data['user_id'],
				'meta_key' => 'token',
				'meta_value' => $data['token'],
			);

			$data_token = $this->user_meta_model->where($temp_where)->get();
			if ($data_token !== false) {
				if (in_array($user_data['capability'], $capability) === false) {
					return 405;
				}

				$sess_data = $user_data;
				$data_meta = $this->user_meta_model->where('user_id', $user_data['user_id'])->gets();
				$data_meta = array_column($data_meta, 'meta_value', 'meta_key');
				$sess_data = array_merge($sess_data, $data_meta);
				return $sess_data;
			}
		}
		return 401;
	}

	public function logout($data)
	{
		$this->user_meta_model->delete(array(
			'user_id' => $data['user_id'],
			'meta_key' => 'token',
		));
	}

	public function get_profile($data)
	{
		$sess_data = elements($this->allowed_session, $data);
		$data_meta = $this->user_meta_model->where('user_id', $data['user_id'])->where('meta_key !=', 'jenis_preferensi')->gets();
		$data_meta = array_column($data_meta, 'meta_value', 'meta_key');

		$data_meta['birth_date'] = $this->db->get_where('app_students', array('user_id' => $data['user_id']))->row()->birth_date;

		$data_meta_preferensi = $this->user_meta_model->where('user_id', $data['user_id'])->where('meta_key', 'jenis_preferensi')->gets();
		// $data_meta_preferensi = array_column($data_meta, 'meta_value', 'meta_key');

		$array_preferensi = array();

		foreach ($data_meta_preferensi as $preferensi) {
			array_push($array_preferensi, $preferensi['meta_value']);
		}

		$sess_data = array_merge($sess_data, $data_meta, ['preferensi' => $array_preferensi]);
		return $sess_data;
	}
}
