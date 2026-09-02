<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Password_model extends Aplego_Model {
	public $group = '';

	public $table_name 			= "aplego_user";
	public $primary_key 		= "user_id";
	protected $table_view_name 	= "user_view";
	protected $timestamp 		= true;

	public $rules = array(
		'password'			=> array('Password', array('have', 'required')),
	);

	private $auth_session_name 	= null; // set from config
	private $allowed_session 	= array('user_id', 'username', 'name', 'email', 'capability', 'created_at');
	private $session_data 		= array();

	public $meta_table_model 	= null;// set from controllers

	public $username_login 	= true;

	public $crud_capability 	= 'admin';

	public function __construct()
	{
		parent::__construct();

		$this->key_user = $this->username_login ? 'username' : 'email';
		$this->rules_login = array(
			$this->key_user		=> array(ucwords($this->key_user), array('have', 'required')),
			'password'			=> array('Password', array('have', 'required')),
		);

		$this->auth_session_name = $this->config->item('auth_session_name');

		if ($session = $this->session->userdata($this->auth_session_name)) {
			$this->session_data = $session;
		}
	}

	// auth data
	
	

	public function refresh_session()
	{
		$user_data = (array)$this->get($this->session_data['user_id']);
		$sess_array = elements($this->allowed_session, $user_data);
		$data_meta = $this->user_meta_model->where('user_id', $this->session_data['user_id'])->gets();
		foreach ($data_meta as $item) {
			$sess_array[$item['meta_key']] = $item['meta_value'];
		}
		if ($this->meta_table_model !== null) {
			$data_meta = $this->meta_table_model->where('user_id', $user_data['user_id'])->get();
			$sess_array = array_merge($sess_array, $data_meta);
		}
		$this->session_data = $sess_array;
		$this->session->set_userdata($this->auth_session_name, $sess_array);
	}

	public function create_session($user_id)
	{
		$user_data = (array)$this->get($user_id);
		$sess_array = elements($this->allowed_session, $user_data);
		$this->session_data = $sess_array;
		$this->session->set_userdata($this->auth_session_name, $sess_array);
	}

	public function current_user_session($key = false)
	{
		if($key) {
			if(isset($this->session_data[ $key ])){
				return $this->session_data[ $key ];
			}
			return false;
		}
		else return $this->session_data;
	}

	// protect data

	public function protected_page($roles, $message = true, $direct = true){
		if ($this->session_data) {
			$capability = $this->session_data['capability'];
		}else{
			$capability = false;
		}

		$temp_rule = $roles;
		if (is_array($roles)) {
			$temp_rule = $temp_rule[0];
		}

		$user_group = $this->config->item('user_group');
		$login_url 	= 'user/login';
		$no_go 		= array('user/logout');

		$uri_string = uri_string().array_to_get_url(array(), false);
		if (!in_array($uri_string, $no_go) && $uri_string != "") {
			$login_url .= ('?go='.urlencode($uri_string));
		}

		if ($capability === false) {
			if ($direct === false) {
				show_404();
			}else{
				if ($message === true) {
					set_message('Anda harus masuk terlebih dahulu.');
				}
				redirect($this->group . $login_url);
			}
		}
		if (!in_array($capability, $roles)) {
			if ($direct === false) {
				show_404();
			}else{
				$main_url = $this->config->item('main_url');
				if ($message === true) {
					set_message('Anda tidak memiliki akses halaman tersebut.');
				}
				redirect($main_url[$capability]);
			}
		}
	}

	public function protected_item($roles){
		$capability = isset($this->session_data['capability']) ? $this->session_data['capability'] : false;
		return in_array($capability, $roles);
	}

	// CRUD Data 
	
	public function set_crud_capability(&$capability)
	{
		$this->crud_capability =& $capability;
	}

	public function gets()
	{
		if (is_string($this->crud_capability)) {
			$this->db->where('capability', $this->crud_capability);
		}else{
			$this->db->where_in('capability', $this->crud_capability);
		}
		return parent::gets();
	}

	public function gets_view($table_view_name = false)
	{
		if (is_string($this->crud_capability)) {
			$this->db->where('capability', $this->crud_capability);
		}else{
			$this->db->where_in('capability', $this->crud_capability);
		}
		return parent::gets_view($table_view_name);
	}

	public function create($data)
	{
		$this->load->library('PasswordHash');
		$data['password'] = $this->passwordhash->HashPassword($data['password']);
		if (is_string($this->crud_capability)) {
			$data['capability'] = $this->crud_capability;
		}
		return parent::create($data);
	}

	public function update($id, $data)
	{
		if (isset($data['password'])) {
			$this->load->library('PasswordHash');
			$data['password'] = $this->passwordhash->HashPassword($data['password']);
		}
		return parent::update($id, $data);
//         if(parent::update($id, $data)){
//             return array(
// 			'value' 	=> true,
// 		);
//         }else{
//             return array(
// 			'value' 	=> false,
// 		);
        // }
	}
	
	public function update_password($data)
	{
		if (isset($data['password'])) {
			$this->load->library('PasswordHash');
			$user_data = $this->get($this->session_data[$this->primary_key]);
			$pass_check = $this->passwordhash->CheckPassword($data['last_password'], $user_data['password']);
			if (!$pass_check) {
				return array(
					'value' 	=> false,
					'message' 	=> "Password lama salah."
				);
			}else{
				unset($data['last_password']);
				$data['password'] = $this->passwordhash->HashPassword($data['password']);
			}
		}
        
	}


}
