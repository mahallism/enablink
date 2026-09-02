<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Post_Controller extends App_Controller {
	protected $module_name  	= 'post';

	protected $gets_view  		= true;
	protected $load_model  		= false;

	protected $status_active 	= array('active', 'nonactive');

	protected $with_category  	= true;

	public function __construct()
	{
		parent::__construct();

		$this->param['status_active'] = $this->status_active;

		$this->load->library($this->group.'media/media_plugin', $this);

		$this->load->model($this->group.'post/post_model', 'model');
		if ($this->module_name != 'post') {
			$this->model->post_type = $this->module_name;
		}

		if ($this->with_category) {
			$this->load->model($this->group.'post/post_category_model');
			if ($this->module_name != 'post') {
				$this->post_category_model->category_type = $this->module_name;
			}
			$this->param['data_category'] = $this->post_category_model->prepar()->gets();
			$this->load->model($this->group.'post/category_post_model');
		}
	}

	public function index()
	{
		$this->model->join_author($this->gets_view)->prepar();
		parent::index();
	}

	protected function do_input($post)
	{
		if (isset($post['publish_at']) && isset($post['publish_at_time'])) {
			$post['publish_at']  = $post['publish_at'] .' '. $post['publish_at_time'];
		}
		$this->load->library($this->group."validation");
		$this->validation->prepar($post, $this->model->rules);

		if (!$this->validation->run()) {
			$this->errors = $this->validation->errors;
			$this->param['post'] = $post;
		}else{
			$insert_id = $this->model->create($this->validation->data);
			if ($this->with_category) {
				$temp_data = array();
				if (isset($post['category_id']) && is_array($post['category_id'])) {
					foreach ($post['category_id'] as $category_id) {
						$temp_data[] = array(
							'post_id' 		=> $insert_id,
							'category_id' 	=> $category_id,
						);
					}
					$this->category_post_model->create_bulk($temp_data);
				}
			}

			$this->set_message('Data ' . $this->module_name . ' telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main."/edit/".$insert_id);
		}
	}

	public function edit($id = false)
	{
		if ($this->with_category) {
			$temp_category = $this->category_post_model->where('post_id', $id)->gets();
			$data_category = array();
			foreach ($temp_category as $item) {
				$data_category[] = $item->category_id;
			}
			$this->param['post']['category_id'] = $data_category;
		}
		parent::edit($id);
	}

	protected function do_edit($id,$data, $post)
	{
		if (isset($post['publish_at']) && isset($post['publish_at_time'])) {
			$post['publish_at']  = $post['publish_at'] .' '. $post['publish_at_time'];
		}
		$this->load->library($this->group."validation");
		$this->validation->prepar($post, $this->model->rules);

		if (!$this->validation->run()) {
			$this->errors = $this->validation->errors;
			$this->param['post'] = array_merge((array)$data, $post);
		}else{
			$this->model->update($id, $this->validation->data);
			if ($this->with_category) {
				$this->category_post_model->delete(array('post_id' => $id));
				$temp_data = array();
				if (isset($post['category_id']) && is_array($post['category_id'])) {
					foreach ($post['category_id'] as $category_id) {
						$temp_data[] = array(
							'post_id' 		=> $id,
							'category_id' 	=> $category_id,
						);
					}
					$this->category_post_model->create_bulk($temp_data);
				}
			}

			$this->set_message('Data ' . $this->module_name . ' telah berhasil diubah.', 'success');
			$this->redirect($this->module_main."/edit/".$id);
		}
	}
}
