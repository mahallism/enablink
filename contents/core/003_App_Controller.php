<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App_Controller extends Subsystem_Controller {
    public $group = '';
    
	protected $module_name  = false;
	protected $module_main  = false;

	protected $model  		= null;
	protected $meta_table_model = null;
	protected $meta_triple_model = null;

	protected $single_page  = false;
	protected $load_model  	= true;
	protected $gets_view  	= false;

	protected $list_view  	= true;
	protected $single_view  = true;
	protected $input_view  	= true;
	protected $action_url  	= array('input', 'edit', 'duplicate', 'delete',);

	 // size : xl, lg, md, atau sm 
	protected $list_size  	= 'xl';
	protected $input_size  	= 'sm';

	protected $list_field  	= array(
		'field' 	=> array(),
		'custom' 	=> array(),
	);
	protected $can_delete_first = true;
	protected $input_field  = array();
	protected $change_field  = array();

	protected $protected_page = array(
		'index' 	=> 'admin',
		'input' 	=> 'admin',
		'edit' 		=> 'admin',
		'duplicate' => 'admin',
		'delete' 	=> 'admin_master',
		'detail' 	=> 'denied',
		'field' 	=> 'denied',
	);
	public function __construct()
	{
    	$param = func_get_args();
    	if (isset($param[0])) {
			parent::__construct($param[0]);
    	}else{
			parent::__construct();
    	}

		if ($this->module_name === false) {
			$this->module_name = $this->module_main;
		}

		$module_main_uri = str_replace('/', '_', $this->module_main);

		$this->active_menu = $module_main_uri;
		$this->param['module_name'] = $this->module_name;
		$this->param['module_main'] = $this->module_main;

		if ($this->load_model === true) {
			$model_name = $module_main_uri."_model";
			$this->load->model($model_name);
			$this->model =& $this->$model_name;
		}

		if (!is_assoc($this->action_url)) {
			foreach ($this->action_url as $key => $value) {
				$this->action_url[$value]['url'] = $this->group.$this->module_main.'/'.$value;
				unset($this->action_url[$key]);
			}
		}
	}

	public function index()
	{
		if ($this->gets_view) {
			if ($this->gets_view === true) {
				$this->param['data'] = $this->model->gets_view();
			}else{
				$this->param['data'] = $this->model->gets_view($this->gets_view);
			}
		}else{
			$this->param['data'] = $this->model->gets();
		}

		if ($this->list_field['field'] === array() && $this->list_view === true) {
			$this->show_404();
		}

		$this->title = 'Data ' . ucwords($this->module_name);
		if ($this->list_field['field']) {
			$this->param['list_field'] = $this->list_field['field'];
			if ($this->list_field['custom']) {
				$this->param['data'] = $this->aquery->prepar($this->param['data'])
					->add_column($this->list_field['custom'])
					->gets();
			}
		}
		$this->param['mode_add'] = $this->single_page;
		$this->param['size'] = $this->list_size;
		$this->param['action_url'] = $this->action_url;
		if (isset($this->param['action_url']['delete']) === true) {
			$this->param['action_url']['delete']['protection'] = $this->protected_page['delete'];
			if ($this->can_delete_first === false) {
				$first_data = $this->model->get();
				$this->can_delete_first = $first_data ? current($first_data) : false;
			}
			$this->param['can_delete_first'] = $this->can_delete_first;
		}

		if ($this->list_view === true) {
			if (!$this->single_page) {
				$this->build('data-list');
			}else if (!is_bool($this->single_page)) {
				$this->build('data');
			}
		}else{
			$this->build($this->list_view);
		}
	}

	public function detail($id)
	{
		# code...
	}

	public function field($key, $value, $id)
	{
		if (!$this->change_field) {
			$this->show_404();
		}

		if (!in_array($key, $this->change_field) || !in_array($value, $this->change_field[$key])) {
			$this->set_message('Data ' . $this->module_main . ' gagal diubah.');
		}else{
			$this->model->update($id, array('active' => 'active'));

			$this->set_message('Data ' . $this->module_main . ' telah berhasil diubah.', 'success');
		}

		$this->redirect($this->module_main);
	}

	public function input($id = false)
	{
		if ($this->single_page) {
			if ($this->gets_view) {
				if ($this->gets_view === true) {
					$this->param['data'] = $this->model->gets_view();
				}else{
					$this->param['data'] = $this->model->gets_view($this->gets_view);
				}
			}else{
				$this->param['data'] = $this->model->gets();
			}
		}

		if (!$this->input_field && $this->input_view === true) {
			$this->show_404();
		}

		if (!isset($this->param['post'])) {
        	$this->param['post'] = array();
		}

		if ($post = $this->input->post()) {
			$this->param['post'] = $post;
			$this->do_input($post);
		}

		$this->fcontrol->set_data($this->param['post'])->init($this->input_field)->generate();

		$this->title = 'Input ' . ucwords($this->module_name);
		$this->param['mode_add'] = true;
		$this->param['size'] = $this->input_size;
		if ($this->input_view === true) {
			if (!$this->single_page) {
				$this->build('data-input');
			}else if (!is_bool($this->single_page)) {
				$this->build('data');
			}
		}else{
			$this->build($this->input_view);
		}
	}

	protected function do_input($post)
	{
		if (isset($this->meta_table_model) && $this->meta_table_model !== null) {
			$this->validation->prepar($post, $this->model->rules, $this->meta_table_model->rules);
		}else{
			$this->validation->prepar($post, $this->model->rules);
		}

		if ($this->validation->run() === false) {
			$this->errors = $this->validation->errors;
		}else{
			if (isset($this->meta_table_model) && $this->meta_table_model !== null) {
				$insert_id = $this->model->create($this->validation->data[0]);
				$this->validation->data[1][$this->model->primary_key] = $insert_id;
				$this->meta_table_model->create($this->validation->data[1]);
			}else{
				$insert_id = $this->model->create($this->validation->data);
			}

			$this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function edit($id = false)
	{
		$data = $this->model->get($id);
		if (!$data) {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
			$this->redirect($this->module_main);
		}

		if (isset($this->meta_table_model) && $this->meta_table_model !== null) {
			$data = array_merge($data, $this->meta_table_model->where($this->model->primary_key, $id)->get());
		}

		if ($this->single_page) {
			if ($this->gets_view) {
				if ($this->gets_view === true) {
					$this->param['data'] = $this->model->gets_view();
				}else{
					$this->param['data'] = $this->model->gets_view($this->gets_view);
				}
			}else{
				$this->param['data'] = $this->model->gets();
			}
		}

		if (!$this->input_field && $this->input_view === true) {
			$this->show_404();
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

		$this->title = 'Edit ' . ucwords($this->module_name);
		$this->param['mode_add'] = false;
		$this->param['size'] = $this->input_size;
		if ($this->input_view === true) {
			if (!$this->single_page) {
				$this->build('data-input');
			}else if (!is_bool($this->single_page)) {
				$this->build('data');
			}
		}else{
			$this->build($this->input_view);
		}
	}
	
	protected function do_edit($id, $data, $post)
	{
		if (isset($this->meta_table_model) && $this->meta_table_model !== null) {
			$this->validation->prepar($post, $this->model->rules, $this->meta_table_model->rules);
		}else{
			$this->validation->prepar($post, $this->model->rules);
		}

		if ($this->validation->run() === false) {
			$this->errors = $this->validation->errors;
		}else{
			if (isset($this->meta_table_model) && $this->meta_table_model !== null) {
				$this->model->update($id, $this->validation->data[0]);
				$this->meta_table_model->update($data[$this->meta_table_model->primary_key], $this->validation->data[1]);
			}else{
				$this->model->update($id, $this->validation->data);
			}

			$this->set_message('Data ' . $this->module_name . ' telah berhasil diubah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function duplicate($id = false)
	{
		$data = $this->model->get($id);
		if (!$data) {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
			$this->redirect($this->module_main);
		}
		if (isset($this->meta_table_model) && $this->meta_table_model !== null) {
			$data = array_merge($data, $this->meta_table_model->where($this->model->primary_key, $id)->get());
		}
		$this->param['post'] = $data;
		$this->fcontrol->set_data($data);
		$this->param['form_action'] = $this->group . $this->module_main.'/input';
		$this->input();
	}

	public function delete($id = false)
	{
		if ($this->can_delete_first === false) {
			$first_data = $this->model->get();
			$this->can_delete_first = $first_data ? current($first_data) : false;
		}
		if ($this->can_delete_first !== true && $id == $this->can_delete_first) {
			$this->set_message('Data ' . $this->module_name . ' tidak dapat dihapus.');
		}else if ($this->model->delete($id)) {
			$this->set_message('Data ' . $this->module_name . ' telah berhasil dihapus.', 'success');
		}else{
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
		}
		$this->redirect($this->module_main);
	}
}
