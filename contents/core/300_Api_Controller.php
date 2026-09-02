<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api_Controller extends MX_Controller {
	protected $protected_page = array(
		// 'fun' => array(
		// 	'method' => array(),
		// 	'capability' => array(),
		// ),
	);
	
	protected $status_code = array(
		200 => 'Oke',
		201 => 'Created',
		400 => 'Bad Request',
		401 => 'Unauthorized',
		404 => 'Not Found',
		405 => 'Not allowed',
		406 => 'Failed Login',
	);

	protected $current_user = false;

	public function __construct()
	{
		parent::__construct();

		$this->user_group = $this->config->item('user_group');
        $this->admin_group = $this->config->item('admin_module') . '/';

		$this->load->model('api/auth_model');
		$this->protection();
	}

	protected function protection()
	{
		$route_method = $this->router->fetch_method();
		$request_method = $this->input->server('REQUEST_METHOD');
		if (isset($this->protected_page[$route_method]['method']) === true) {
			if (in_array($request_method, $this->protected_page[$route_method]['method']) === false) {
				$this->show_status(400);
			}
		}
		if (isset($this->protected_page[$route_method]['capability']) === true) {
			if ($this->protected_page[$route_method]['capability'] !== '') {
				$headers = $this->input->request_headers();
				
				$headers['student_id'] = isset($headers['X-Student-Id']) ? $headers['X-Student-Id'] : $headers['student_id'];
				$headers['token'] = isset($headers['X-Token']) ? $headers['X-Token'] : $headers['token'];
				// echo json_encode($headers);
				if ((isset($headers['student_id']) === true && isset($headers['token']) === true) === false) {
					$this->show_status(401);
				}
				$auth = $this->auth_model->check_token($headers, $this->user_group[$this->protected_page[$route_method]['capability']]);
				if (is_numeric($auth) === true) {
					$this->show_status($auth);
				}else{
					$this->current_user = $auth;
				}
			}
		}
	}

	// protected function build($data, $status_code = 200)
	// {
	// 	$this->output
	// 		->set_status_header($status_code)
	// 		->set_content_type('application/json')
	// 		->set_output(json_encode($data))
	// 		->_display();
	// 	exit;
	// }

	protected function build($data, $status_code = 200, $error = false, $message = "Berhasil di kirimkan")
	{
		$this->output
			->set_status_header($status_code)
			->set_content_type('application/json')
			->set_output(json_encode(['error'=> $error, 'data' => $data, 'message' => $message]))
			->_display();
		exit;
	}

	protected function show_status($status_code = 200)
	{
        $this->build($this->status_code[$status_code], $status_code);
	}
}
