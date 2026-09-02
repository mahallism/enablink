<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Aplego_Controller extends MX_Controller {
	public $aplego_folder = '';
	public $group = '';
	
	protected $folder_view = '';
	protected $folder_view_base = '';

	protected $title;
	protected $menu_name = 'main_menu';
	protected $active_menu;

	protected $param = array();
	protected $param_header = array();
	protected $param_footer = array();
	protected $errors = array();

	protected $middleware = array(
		'protected_page',
	);

	protected $protected_page = array();
	protected $protected_page_message = true;
	protected $protected_page_direct = true;

	public function __construct()
	{
		parent::__construct();

		// group user
		$this->user_group = $this->config->item('user_group');
		
		if ($this->middleware !== false && is_string($this->middleware)) {
			$middleware = $this->middleware;
			$this->$middleware();
		}else if($this->middleware !== false){
			foreach ($this->middleware as $item) {
				$this->$item();
			}
		}
	}

	protected function protected_page()
	{
		$method = $this->router->fetch_method();
		if (isset($this->protected_page[$method])) {
			$this->user_model->protected_page($this->user_group[$this->protected_page[$method]], $this->protected_page_message, $this->protected_page_direct);
		}
	}
    // Direct Function
   
	protected function refresh()
	{
		redirect($this->uri->uri_string());
	}

	protected function redirect($url)
	{
		redirect($this->group.$url);
	}

	protected function show_404()
	{
		show_404();
		// $route_404 = $this->config->item('route_404');
		// echo Modules::run($route_404);
	}

    // Setter Function

	protected function set_message($content, $type = "danger")
	{
		$data = array('type' => $type,'content' => $content, );
		$this->session->set_flashdata('message', $data);
	}

    // Template

	protected function get_title()
	{
		return ($this->title ? $this->title . ' &middot; ' : '') . $this->config->item('app_name');
	}

	protected function get_message()
	{
		$html_message = "";
		$message = $this->session->flashdata('message');
		if (isset($message)){
			$this->session->unset_userdata('message');
			$html_message = <<<EOF
			<div class="alert alert-{$message['type']}">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<p class="mb-0 message">{$message['content']}</p>
			</div>
EOF;
		}
		unset($message);
		return $html_message;
	}
	protected function get_errors()
	{
		$html_errors = "";
		if ($this->errors) {
			$errors = "";
			foreach ($this->errors as $error) {
				$errors .= '<p class="mb-0 message">' . $error . '</p>';
			}
			$html_errors = <<<EOF
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				{$errors}
			</div>
EOF;
		}
		$this->errors = array();
		return $html_errors;
	}

	// Template view
	protected function show_view($view, $param = false)
	{
		$this->load->view($this->folder_view_base.$view, ($param ? $param : $this->param));
	}

	protected function get_view($view, $param = false)
	{
		return $this->load->view($this->folder_view_base.$view, ($param ? $param : $this->param), true);
	}

	protected function set_header_attr()
	{
		$this->param_header['title'] = $this->get_title();
		if (!isset($this->param['message']) || $this->param['message'] == "") {
			$this->param['message'] = $this->get_message();
		}
		$this->param_header['menu_name'] = $this->menu_name;
		$this->param['errors'] = $this->get_errors();
	}

	protected function show_header()
	{
		$this->set_header_attr();
		$this->load->view($this->folder_view.'header', $this->param_header);
	}
	protected function show_footer()
	{
		$this->load->view($this->folder_view.'footer', $this->param_footer);
	}

	protected function build($view)
	{
		$this->show_header();
		$this->load->view($this->folder_view_base.$view, $this->param);
		$this->show_footer();
	}

	protected function custom_build($view, $type = "simple")
	{
		$this->set_header_attr();
		$this->load->view($this->folder_view.$type.'-header', $this->param_header);
		$this->load->view($this->folder_view_base.$view, $this->param);
		$this->load->view($this->folder_view.$type.'-footer', $this->param_footer);
	}
}
