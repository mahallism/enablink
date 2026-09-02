<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Payout extends App_Controller {
	protected $module_main = 'payout';
	protected $module_name = 'payout';

	protected $load_model = false;
	protected $gets_view = true;

	protected $list_field  	= array(
		'field' 	=> array(
			'payout_label' 		=> 'Hari dan Tanggal',
			'payout_max_date' 	=> 'Jam',
			'payout_keterangan' => 'Ruang',
			'count_volunteer' 	=> 'Ruang',
			'sum_payout' 		=> 'Ruang',
		),
		'custom' 	=> array(
		),
	);

	protected $protected_page = array(
		'index' 	=> 'admin',
		'input' 	=> 'denied',
		'edit' 		=> 'denied',
		'duplicate' => 'denied',
		'delete' 	=> 'denied',
		'detail' 	=> 'denied',
		'field' 	=> 'denied',
	);
	protected $action_url  	= array();

	function __construct()
	{
		parent::__construct();

		$data_hari = $this->config->item('data_hari');
		$this->fcontrol->set_meta_data('data_hari', $data_hari);
		$this->aquery->set_meta_data('data_hari', $data_hari);

		$this->load->model($this->group.'pendampingan/pendampingan_model');
		$this->model =& $this->pendampingan_model;

		$this->list_field['custom']['nick_name'] = '"<a href=\"' . $this->group . 'mahasiswa/edit/{$item["user_id"]}\">{$item["nick_name"]}</a>"';
		$this->list_field['custom']['volunteer_nick_name'] = '"<a href=\"' . $this->group . 'mahasiswa/edit/{$item["volunteer_user_id"]}\">{$item["volunteer_nick_name"]}</a>"';

		$data_star = array();
		for ($i=0; $i <= 5; $i++) {
			$data_star[$i] = '';
			for ($j=0; $j < 5; $j++) { 
				$data_star[$i] .= '<i class="fa fa-fw fa-star' . ($i <= $j ? ' text-light' : '') . '"></i>';
			}
			$data_star[$i] = '<div class="text-nowrap"><span class="hide">' . $i . '</span>'.$data_star[$i].'</div>';
		}

		$this->aquery->set_meta_data('data_star', $data_star);
	}

	public function index($id=false)
	{
		$this->filter();
		parent::index($id);
	}

	protected function filter()
	{
		$rules_form = array(
			'semester_id' => array(
				'label' 		=> 'Semester',
				'type' 			=> 'select',
				'select_type' 	=> 'key_value',
				'select_data' 	=> 'data_semester',
			),
			'date' => array(
				'label' 		=> 'Tgl. Pendampingan',
				'type' 			=> 'date',
			),
		);

		$this->load->model($this->group.'semester/semester_model');
		$data_semester = $this->semester_model->gets();
		$data_semester = array_column($data_semester, 'semester_name', 'semester_id');
		$this->fcontrol->set_meta_data('data_semester', $data_semester);

		$get_data = array(
			'semester_id' => $this->current_semester,
		);
		if ($get = $this->input->get()) {
			$get_data = array_merge($get_data, $get);
		}

        $this->fcontrol->set_data($get_data)->init($rules_form)->generate();
        if (isset($get_data['semester_id']) === true) {
        	$this->model->where('semester_id', $get_data['semester_id']);
        }
        if (isset($get_data['date']) === true && $get_data['date']) {
        	$this->model->where('date', $get_data['date']);
        }
	}

}
