<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends Subsystem_Controller {
	
	public function login()
	{
		if (current_user_session()) {
			$this->set_message('Anda sudah login.');
			$direct_url = $this->config->item('main_url');
			redirect($direct_url[current_user_session('capability')]);
		}

        if ($post = $this->input->post()) {
        	$this->load->library($this->group."validation");
            $this->validation->prepar($post, array(
                'username' 	=> array('Username', array('have', 'required')),
                'password' 	=> array('Password', array('have', 'required')),
            ));

			if (!$this->validation->run()) {
                $this->errors = $this->validation->errors;
			}else{
				$login = $this->user_model->login($this->validation->data, true, $this->user_group['admin']);
				if ($login['value']) {
					$this->set_message($login['message'], 'success');
					if (isset($post['go'])) {
						redirect(urldecode($post['go']));
					}

					$direct_url = $this->config->item('main_url');
					redirect($direct_url[current_user_session('capability')]);
				}else{
                    $this->errors[] = $login['message'];
				}
			}
            $this->param['post'] = $post;
        }

        $this->title = 'Login';
		$this->param['go'] = $this->input->get('go');
		$this->custom_build('login');
	}

	public function logout()
	{
		$this->user_model->logout();
		$this->set_message('Success Logout.', 'success');
		$this->redirect('user/login');
	}
	public function profile()
	{
        $this->user_model->protected_page($this->user_group['admin'], false, true);
		$data = current_user_session();
		$this->title = 'Profile';
		$this->active_menu = 'profile';
		$this->param['data'] = $data;
		$this->build('profile-view');
	}
	public function _change_profile()
	{
        $this->user_model->protected_page($this->user_group['admin'], false, true);

		$data = current_user_session();

		$this->param['post'] = $data;

		if ($post = $this->input->post()) {
			$this->load->library($this->group."validation");
			$user_rules = array(
				'name' 			=> array('Nama', array('have', 'trim', 'required')),
				'email' 		=> array('Email', array('have', 'trim', 'required')),
			);

			if (isset($post['change_password'])) {
				$user_rules['last_password'] = array('Password', array('have', 'required'));
				$user_rules['password'] = array('Password', array('have', 'required'));
				$password_rules = array('repeat_password'=> array(
					'Pengulangan Password', array('have', 'required', 'matches' => array('password', 'Password')),
				));
			}else{
				$password_rules = array();
			}

			$this->validation->prepar($post, $user_rules, $password_rules);

			if (isset($post['email']) && $post['email'] != $data['email'] && $this->user_model->check_isset('email', $post['email'])) {
				$this->errors['email'] = 'Email sudah ada yang menggunakan';
				$form_invalid = true;
			}

			if (!$this->validation->run() || isset($form_invalid)) {
				$this->errors = array_merge($this->errors, $this->validation->errors);
			}else{
				$change_profile = $this->user_model->change_profile($this->validation->data[0]);
				if ($change_profile['value']) {
					$this->set_message('Data profile telah berhasil diubah.', 'success');
					$this->redirect('user/profile');
				}else{
					$this->errors[] = $change_profile['message'];
				}
			}

			$this->param['post'] = array_merge($data, $post);
		}

		$this->title = 'Change Profile';
		$this->active_menu = 'change_profile';
		$this->build('profile-change');
	}

	public function change_profile()
	{
		$data = current_user_session();

		$this->param['post'] = $data;

		if ($post = $this->input->post()) {
			$this->do_change_profile($post, $data);
			$this->param['post'] = array_merge($data, $post);
		}

		$data_form = array(
			'username' => array(
				'label' => 'NIM',
				'required' => true,
				'attr' => array(
					'disabled'
				),
			),
			'name' => array(
				'label' => 'Nama Lengkap',
				'required' => true,
			),
			'email' => array(
				'label' => 'Email Address',
				'type' => 'email',
				'required' => true,
			),
		);

		$this->fcontrol->set_data($this->param['post'])->init($data_form)->generate();

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
			$password_rules = array('repeat_password'=> array(
				'Pengulangan Password', array('have', 'required', 'matches' => array('password', 'Password')),
			));
		}else{
			$password_rules = array();
		}


		$this->validation->prepar($post, $user_rules);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;
		if ($form_valid === false) {
			$this->errors = $form_errors;
		}else{
			$change_profile = $this->user_model->change_profile($this->validation->data);
			if ($change_profile['value']) {
				$this->set_message('Data profile telah berhasil diubah.', 'success');
				$this->redirect('dashboard');
			}else{
				$this->errors[] = $change_profile['message'];
			}
		}
	}
}
