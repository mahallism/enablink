<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Easter_Controller extends Subsystem_Controller {
    public $group = '';
    
	protected $easter_type  = false;

	protected $module_name  = false;
	protected $module_main  = false;

	protected $action_url  	= array('input', 'edit', 'duplicate', 'delete',);

	 // size : xl, lg, md, atau sm 
	protected $list_size  	= 'sm';
	protected $input_size  	= 'sm';

	protected $protected_page = array(
		'index' 	=> 'admin',
		'input' 	=> 'admin',
		'edit' 		=> 'admin',
		'duplicate' => 'admin',
		'delete' 	=> 'admin_master',
	);

	public function __construct()
	{
    	$param = func_get_args();
    	if (isset($param[0])) {
			parent::__construct($param[0]);
    	}else{
			parent::__construct();
    	}

		if ($this->module_main === false) {
			$this->module_main = $this->easter_type;
		}
		if ($this->module_name === false) {
			$this->module_name = $this->module_main;
		}

		$module_main_uri = str_replace('/', '_', $this->module_main);

		$this->active_menu = $module_main_uri;
		$this->param['module_name'] = $this->module_name;
		$this->param['module_main'] = $this->module_main;

		if (!is_assoc($this->action_url)) {
			foreach ($this->action_url as $key => $value) {
				$this->action_url[$value]['url'] = $this->group.$this->module_main.'/'.$value;
				unset($this->action_url[$key]);
			}
		}
	}

	public function index()
	{
		$this->param['data'] = $this->option_model->where('option_key', $this->easter_type)->gets();

		$this->title = 'Data ' . ucwords($this->module_name);
		$list_field = array(
			'option_value' => ucwords($this->module_name),
		);
		$this->param['list_field'] = $list_field;
		
		$this->param['size'] = $this->list_size;
		$this->param['action_url'] = $this->action_url;
		$this->param['action_url']['delete']['protection'] = $this->protected_page['delete'];
		$this->param['can_delete_first'] = false;

		$this->build('data-list');
	}

	public function input($id = false)
	{
		if (!isset($this->param['post'])) {
        	$this->param['post'] = array();
		}
		if ($post = $this->input->post()) {
			$this->param['post'] = $post;
			$this->do_input($post);
		}

		$input_field = array(
			'option_value' => array(
				'label'	=> ucwords($this->module_name),
				'required' => true,
			),
		);
		$this->fcontrol->set_data($this->param['post'])->init($input_field)->generate();

		$this->title = 'Input ' . ucwords($this->module_name);
		$this->param['mode_add'] = true;
		$this->param['size'] = $this->input_size;
		$this->build('data-input');
	}

	protected function do_input($post)
	{
		$rules = array(
			'option_value' => array(ucwords($this->module_name), array('required'))
		);
		$this->validation->prepar($post, $rules);

		if ($this->validation->run() === false) {
			$this->errors = $this->validation->errors;
		}else{
			$new_data = $this->validation->data;
			$new_data['option_key'] = $this->easter_type;
			$insert_id = $this->option_model->create($new_data);

			$this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function edit($id = false)
	{
		$data = $this->option_model->where('option_key', $this->easter_type)->get($id);
		if (!$data) {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
			$this->redirect($this->module_main);
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
		$input_field = array(
			'option_value' => array(
				'label'	=> ucwords($this->module_name),
				'required' => true,
			),
		);
		$this->fcontrol->set_data($this->param['post'])->init($input_field)->generate();

		$this->title = 'Edit ' . ucwords($this->module_name);
		$this->param['mode_add'] = false;
		$this->param['size'] = $this->input_size;
		$this->build('data-input');
	}
	
	protected function do_edit($id, $data, $post)
	{
		$rules = array(
			'option_value' => array(ucwords($this->module_name), array('required'))
		);
		$this->validation->prepar($post, $rules);

		if ($this->validation->run() === false) {
			$this->errors = $this->validation->errors;
		}else{
			$this->option_model->update($id, $this->validation->data);

			$this->set_message('Data ' . $this->module_name . ' telah berhasil diubah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function duplicate($id = false)
	{
		$data = $this->option_model->where('option_key', $this->easter_type)->get($id);
		if (!$data) {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
			$this->redirect($this->module_main);
		}
		$this->param['post'] = $data;
		$this->fcontrol->set_data($data);
		$this->param['form_action'] = $this->group . $this->module_main.'/input';
		$this->input();
	}

	public function delete($id = false)
	{
		if ($this->option_model->where('option_key', $this->easter_type)->delete($id)) {
			$this->set_message('Data ' . $this->module_name . ' telah berhasil dihapus.', 'success');
		}else{
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
		}
		$this->redirect($this->module_main);
	}
}
