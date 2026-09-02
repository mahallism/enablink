<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends App_Controller {

	protected $module_main = 'admin';
	protected $module_name = 'administrator';
	
	protected $load_model = false;

	protected $list_field  	= array(
		'field' 	=> array(
			'username' 	=> 'Username',
			'name' 		=> 'Name',
			'email' 	=> 'Email',
			'capability' => 'Kapabilitas',
			'last_login' => 'Last Login',
		),
		'custom' 	=> array(
			'capability' => 'ucfirst($item["capability"])',
			'login_count' => '"<div class=\"badge badge-" . ($item["active"] === "active" ? "primary" : "secondary") . " mr-1\">{$item["login_count"]}</div>"',
			'last_login' => '$item["login_count"] . datetime_html($item["last_login"])',
		),
	);
	protected $input_field  = array(
		'name' => array(
			'label' => 'Name',
			'required' => true,
		),
		'username' => array(
			'label' => 'Username',
			'required' => true,
		),
		'email' => array(
			'label' => 'Email',
			'type' => 'email',
			'required' => true,
		),
		'capability' => array(
			'label' 		=> 'Kapabilitas',
			'type' 			=> 'select',
			'select_type' 	=> 'value',
			'select_data' 	=> 'capability_data',
			'input_size' 	=> 6,
		),
		'active' => array(
			'label' => 'User Aktif',
			'type' => 'radiobox',
			'radiobox_data' => array(
				'active',
				'inactive'
			),
			'required' => true,
			'input_size' 	=> 6,
		),
	);

	protected $can_delete_first = false;

	public function __construct()
	{
		parent::__construct();

		$this->model =& $this->user_model;
		$this->fcontrol->set_meta_data('capability_data', $this->user_group['admin']);
		$this->model->set_crud_capability($this->user_group['admin']);
	}

	public function input($id = false)
	{
		$form_password = array(
			'password' => array(
				'label' => 'Password',
				'type' => 'password',
				'required' => true,
			),
			'repeat_password' => array(
				'label' => 'Repeat Password',
				'type' => 'password',
				'required' => true,
			),
		);
		$this->fcontrol->init($form_password, 'form_password')->generate(); 
		parent::input();
	}

	protected function do_input($post)
	{
		if (isset($post['username'])) {
			if ($this->model->check_isset('username', $post['username'])) {
				$this->errors[] = "Username telah digunakan.";
				return;
			}
		}
		if (!isset($post['password']) || !$post['password']) {
			$this->errors[] = "Password tidak boleh kosong.";
			return;
		}else if (!isset($post['repeat_password']) || !$post['repeat_password']) {
			$this->errors[] = "Pengulangan password tidak boleh kosong.";
			return;
		}else if ($post['password'] != $post['repeat_password']) {
			$this->errors[] = "Pengulangan password tidak sesuai.";
			return;
		}
		parent::do_input($post);
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
			),
			'repeat_password' => array(
				'label' => 'Repeat Password',
				'type' => 'password',
			),
		);
		$this->fcontrol->init($form_password, 'form_password')->generate(); 
		parent::edit($id);
	}

	protected function do_edit($id, $data, $post)
	{
		if (isset($post['username'])) {
			if ($this->model->check_isset('username', $post['username']) && $post['username'] != $data['username']) {
				$this->errors[] = "Username telah digunakan.";
				return;
			}
		}
		if (isset($post['change_password']) && $post['change_password']) {
			if (!isset($post['password']) || !$post['password']) {
				$this->errors[] = "Password tidak boleh kosong.";
				return;
			}else if (!isset($post['repeat_password']) || !$post['repeat_password']) {
				$this->errors[] = "Pengulangan password tidak boleh kosong.";
				return;
			}else if ($post['password'] != $post['repeat_password']) {
				$this->errors[] = "Pengulangan password tidak sesuai.";
				return;
			}
		}else{
			unset($this->model->rules['password']);
		}
		parent::do_edit($id, $data, $post);
	}
	public function delete($id = false)
	{
		if ($this->user_model->current_user_session('user_id') == $id) {
			$this->set_message('Data ' . $this->module_name . ' tidak dapat di hapus.');
			$this->redirect($this->module_main);
		}
		parent::delete($id);
	}
}
