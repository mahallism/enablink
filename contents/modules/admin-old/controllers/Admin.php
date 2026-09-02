<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends Subsystem_Controller {
	public function index()
	{
		if (current_user_session()) {
			$this->user_model->protected_page($this->user_group['admin'], false, false);
			$this->redirect('dashboard');
		}else{
			$this->redirect('user/login');
		}
	}
}
