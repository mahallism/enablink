<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pendampingan extends App_Controller
{
	protected $module_main = 'pendampingan';
	protected $module_name = 'jadwal pendampingan';

	protected $status_pendampingan = array();

	protected $list_field  	= array(
		'field' 	=> array(
			'name' 			=> 'Nama',
			'day' 			=> 'Hari dan Tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Pendamping',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'date' 			=> '$this->meta_data["date_data"][$item["day"]]',
			'date_day' 		=> 'date_html($this->meta_data["date_data"][$item["day"]])',
			'day' 			=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"] . ", " . $item["date_day"]',
			'pendamping' 	=> '"Pendamping"',
		),
	);
	protected $action_url  	= array('edit', 'delete',);

	protected $input_field = array(
		'volunteer_id' => array(
			'label' => 'Pendamping',
			'type'	=> 'select',
			'select_type' => 'key_value',
			'select_data' => 'volunteer_data',
		),
	);

	public function __construct()
	{
		$this->protected_page['generate'] = 'admin';

		parent::__construct();

		$data_hari = $this->config->item('data_hari');
		$this->fcontrol->set_meta_data('data_hari', $data_hari);
		$this->aquery->set_meta_data('data_hari', $data_hari);

		$this->load->model($this->group . 'jadwal/jadwal_difabel_model');
		$this->load->model($this->group . 'jadwal/jadwal_volunteer_model');

		$custom_field_name = '"<a href=\"' . $this->group . 'report/pendampingan/detail/{$item["student_id"]}\" target=\"blank\">{$item["name"]}</a> <small class=\"text-muted\">({$item["nick_name"]})</small>"';
		$custom_field_name .= ' . "<div><small>{$item["faculty_name"]} - {$item["majors_name"]}</small></div>"';
		$custom_field_name .= ' . $item["no_hp"]';
		$this->list_field['custom']['name'] = $custom_field_name;

		$this->list_field['custom'][$this->model->primary_key] = 'isset($item["' . $this->model->primary_key . '"]) ? $item["' . $this->model->primary_key . '"] : null';

		$str_kosong = '"<span class=\"text-danger\">Belum ada</span>"';
		$str_pendamping = '"<a href=\"' . $this->group . 'report/volunteer/detail/{$item["volunteer_id"]}\" target=\"blank\">{$item["volunteer_nick_name"]}</a>"';
		$this->list_field['custom']['pendamping'] = 'isset($item["volunteer_id"]) ? ' . $str_pendamping . ' : ' . $str_kosong;
	}

	public function index($id = false)
	{
		foreach (array('edit', 'delete') as $item) {
			$this->action_url[$item]['id'] = $this->model->primary_key;
		}

		$filter_jadwal_difabel = array();
		$filter_jadwal_pendampingan = array();

		$this->get_filter($filter_jadwal_difabel, $filter_jadwal_pendampingan);

		if (empty($filter_jadwal_difabel) === false) {
			$this->jadwal_difabel_model->where($filter_jadwal_difabel);
		}

		$data_jadwal_difabel = $this->jadwal_difabel_model->gets_view($this->jadwal_difabel_model->table_active_view_name);
		$data_jadwal_difabel = array_column($data_jadwal_difabel, null, 'schedule_student_id');

		if (empty($filter_jadwal_pendampingan) === false) {
			$this->model->where($filter_jadwal_pendampingan);
		}

		$data_pendampingan = $this->model->gets_view($this->model->table_base_view_name);
		foreach ($data_pendampingan as $item) {
			$data_jadwal_difabel[$item['schedule_student_id']]['accompaniment_id'] = $item['accompaniment_id'];
			$data_jadwal_difabel[$item['schedule_student_id']]['volunteer_id'] = $item['volunteer_id'];
			$data_jadwal_difabel[$item['schedule_student_id']]['volunteer_nick_name'] = $item['nick_name'];
			if (!empty($item['start_at']) && !empty($item['end_at'])) {
				$data_jadwal_difabel[$item['schedule_student_id']]['accompaniment_id'] = $item['accompaniment_id'];
				$data_jadwal_difabel[$item['schedule_student_id']]['volunteer_id'] = $item['volunteer_id'];
				$data_jadwal_difabel[$item['schedule_student_id']]['name'] = $item['name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['volunteer_nick_name'] = $item['volunteer_nick_name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['nick_name'] = $item['nick_name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['faculty_name'] = $item['faculty_name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['majors_name'] = $item['majors_name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['day'] = $item['day'];
				$data_jadwal_difabel[$item['schedule_student_id']]['student_id'] = $item['student_id'];
				$data_jadwal_difabel[$item['schedule_student_id']]['no_hp'] = $item['no_hp'];
				$data_jadwal_difabel[$item['schedule_student_id']]['room'] = $item['room'];
				$data_jadwal_difabel[$item['schedule_student_id']]['courses'] = $item['courses'];
				$data_jadwal_difabel[$item['schedule_student_id']]['start_at'] = $item['start_at'];
				$data_jadwal_difabel[$item['schedule_student_id']]['end_at'] = $item['end_at'];
			}
		}

		$this->param['data'] = $data_jadwal_difabel;

		$this->param['list_field'] = $this->list_field['field'];
		if ($this->list_field['custom']) {
			$this->param['data'] = $this->aquery->prepar($this->param['data'])
				->add_column($this->list_field['custom'])
				->gets();
		}

		$this->title = 'Data ' . ucwords($this->module_name);
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

		$this->build('pendampingan-list');
	}

	// public function index_volunteer_change($id = false)
	// {
	// 	$this->module_main = 'volunteer_change';
	// 	$this->module_name = 'Riwayat Ganti Jadwal Pendampingan';

	// 	$filter_jadwal_difabel = array();
	// 	$filter_jadwal_pendampingan = array();

	// 	$this->get_filter($filter_jadwal_difabel, $filter_jadwal_pendampingan);

	// 	if (empty($filter_jadwal_difabel) === false) {
	// 		$this->jadwal_difabel_model->where($filter_jadwal_difabel);
	// 	}

	// 	$data_jadwal_difabel = $this->jadwal_difabel_model->gets_view($this->jadwal_difabel_model->table_active_view_name);
	// 	$data_jadwal_difabel = array_column($data_jadwal_difabel, null, 'schedule_student_id');

	// 	if (empty($filter_jadwal_pendampingan) === false) {
	// 		$this->model->where($filter_jadwal_pendampingan);
	// 	}

	// 	// $data_pendampingan = $this->db->get_where('app_accompaniment_view', array('new_volunteer_id IS NOT NULL' => null))->result_array();
	// 	$data_pendampingan = $this->db->get_where('app_accompaniment_view', array('new_volunteer_id IS NOT NULL' => null));
	// 	$data_pendampingan_result = $data_pendampingan->result_array();

	// 	foreach ($data_pendampingan->result() as $index => $row) {
	// 		$original_volunteer_id = $this->db->get_where('app_accompaniment', array('accompaniment_id' => $row->accompaniment_id))->row()->volunteer_id;
	// 		$data_pendampingan_result[$index]['id_pendamping_lama'] = $original_volunteer_id;
	// 		$data_pendampingan_result[$index]['id_pendamping_baru'] = $row->new_volunteer_id;
	// 		$data_pendampingan_result[$index]['nama_pendamping_lama'] = $this->db->get_where('app_students', array('student_id' => $original_volunteer_id))->row()->nick_name;
	// 		$data_pendampingan_result[$index]['nama_pendamping_baru'] = empty($row->new_volunteer_id) ? 'kosong' : $this->db->get_where('app_students', array('student_id' => $row->new_volunteer_id))->row()->nick_name;
	// 	}

	// 	// var_dump(json_encode($data_pendampingan_result));

	// 	$this->param['data'] = $data_pendampingan_result;
	// 	// $this->list_field['field']['pendamping_pengganti'] = $data_pendampingan['new_volunteer_id'];
	// 	$this->param['list_field'] = $this->list_field['field'];
	// 	if ($this->list_field['custom']) {
	// 		$this->param['data'] = $this->aquery->prepar($this->param['data'])
	// 			->add_column($this->list_field['custom'])
	// 			->gets();
	// 	}

	// 	$this->title = 'Data ' . ucwords($this->module_name);
	// 	$this->param['size'] = $this->list_size;

	// 	$this->build('pendampingan-list-change');
	// }

	public function input($id = false)
	{
		$data = $this->jadwal_difabel_model->where('semester_id', $this->current_semester)->get_view($id);
		if ($data === false || $id === false) {
			$this->set_message('Data jadwal mahasiswa difabel tidak ditemukan tidak ditemukan.');
			$this->redirect($this->module_main);
		}

		$this->param['data'] = $data;
		$date = $this->input->get('date');

		$temp_data = $this->model->where('schedule_student_id', $id)->where('date', $date)->get_count();

		if ($temp_data > 0) {
			$this->set_message('Data jadwal pendampingan telah dibuat sebelumnya.');
			$this->redirect($this->module_main);
		}

		if ($post = $this->input->post()) {
			$this->param['post'] = $post;
			$this->do_input($post);
		} else if (!$date) {
			$this->set_message('Failed url input jadwal pendampingan.');
			$this->redirect($this->module_main);
		} elseif (strtotime($date) < strtotime(date('Y-m-d'))) {
			$this->set_message('Tanggal input melebihi hari ini.');
			$this->redirect($this->module_main);
		}

		$data_jadwal_volunteer_group = $this->jadwal_volunteer_model
			->where('semester_id', $this->current_semester)
			->gets_view('app_group_schedule_volunteer_view');

		$data_pendampingan = $this->model
			->where('semester_id', $this->current_semester)
			->where('date', $date)
			->gets_view('app_accompaniment_schedule_volunteer_view');

		$day = date('w', strtotime($date));
		$volunteer_data = array();

		foreach ($data_jadwal_volunteer_group as $index_jadwal_volunteer => $item_jadwal_volunteer) {
			$find = true;
			$jadwal_hari = json_decode($item_jadwal_volunteer["day" . $day]);
			if ($jadwal_hari == array()) {
				$find_jadwal = $index_jadwal_volunteer;
			}
			foreach ($jadwal_hari as $key => $item_hari) {
				if ((strtotime($data['start_at']) < strtotime($item_hari[0]) &&
						strtotime($data['end_at']) > strtotime($item_hari[0])) ||
					(strtotime($data['start_at']) < strtotime($item_hari[1]) &&
						strtotime($data['end_at']) > strtotime($item_hari[1])) ||
					(strtotime($data['start_at']) >= strtotime($item_hari[0]) &&
						strtotime($data['end_at']) <= strtotime($item_hari[1]))
				) {
					$find = false;
				}
			}

			if ($find !== false) {
				if (empty($data_pendampingan) === false) {
					$tidak_kres = true;
					foreach ($data_pendampingan as $item) {
						if (
							$item['volunteer_id'] === $item_jadwal_volunteer['student_id'] &&
							((strtotime($data['start_at']) < strtotime($item['start_at']) &&
								strtotime($data['end_at']) > strtotime($item['start_at'])) ||
								(strtotime($data['start_at']) < strtotime($item['end_at']) &&
									strtotime($data['end_at']) > strtotime($item['end_at'])) ||
								(strtotime($data['start_at']) >= strtotime($item['start_at']) &&
									strtotime($data['end_at']) <= strtotime($item['end_at'])))
						) {
							$tidak_kres = false;
							break;
						}
					}
					if ($tidak_kres === true) {
						$volunteer_data[$item_jadwal_volunteer['student_id']] = $item_jadwal_volunteer['name'] . ' (' . $item_jadwal_volunteer['nick_name'] . ')';
					}
				} else {
					$volunteer_data[$item_jadwal_volunteer['student_id']] = $item_jadwal_volunteer['name'] . ' (' . $item_jadwal_volunteer['nick_name'] . ')';
				}
			}
		}

		$this->fcontrol->set_meta_data('volunteer_data', $volunteer_data);
		$this->volunteer_data = $volunteer_data;

		$this->param['post'] = array();
		$this->param['date'] = $date;
		$this->param['day'] = $this->config->item('data_hari');
		if ($post = $this->input->post()) {
			$post['semester_id'] = $this->current_semester;
			$post['schedule_student_id'] = $id;
			$post['date'] = $date;
			$this->param['post'] = $post;
			$this->do_input($post);
		}

		$this->fcontrol->set_data($this->param['post'])->init($this->input_field)->generate();

		$this->title = 'Input ' . ucwords($this->module_name);
		$this->param['mode_add'] = true;
		$this->param['size'] = $this->input_size;
		$this->build('pendampingan-input');
	}

	protected function do_input($post)
	{
		if (isset($post['volunteer_id']) === false) {
			$this->errors[] = "Pendamping harus di isi.";
		} elseif (isset($this->volunteer_data[$post['volunteer_id']]) === false) {
			$this->errors[] = "Data pendamping tidak ditemukan.";
		} else {
			$data_form = elements(array('semester_id', 'schedule_student_id', 'date', 'volunteer_id'), $post);
			$this->model->create($data_form);
			$this->set_message('Data jadwal pendampingan telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function edit($id = false)
	{
		$data = $this->model->get_view($id);
		if (!$data) {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
			$this->redirect($this->module_main);
		}

		$data_jadwal_volunteer_group = $this->jadwal_volunteer_model
			->where('semester_id', $this->current_semester)
			->gets_view('app_group_schedule_volunteer_view');

		$data_pendampingan = $this->model
			->where('semester_id', $this->current_semester)
			->where('date', $data['date'])
			->gets_view('app_accompaniment_schedule_volunteer_view');

		$day = date('w', strtotime($data['date']));
		$volunteer_data = array();

		foreach ($data_jadwal_volunteer_group as $index_jadwal_volunteer => $item_jadwal_volunteer) {
			$find = true;
			$jadwal_hari = json_decode($item_jadwal_volunteer["day" . $day]);
			if ($jadwal_hari == array()) {
				$find_jadwal = $index_jadwal_volunteer;
			}
			foreach ($jadwal_hari as $key => $item_hari) {
				if ((strtotime($data['start_at']) < strtotime($item_hari[0]) &&
						strtotime($data['end_at']) > strtotime($item_hari[0])) ||
					(strtotime($data['start_at']) < strtotime($item_hari[1]) &&
						strtotime($data['end_at']) > strtotime($item_hari[1])) ||
					(strtotime($data['start_at']) >= strtotime($item_hari[0]) &&
						strtotime($data['end_at']) <= strtotime($item_hari[1]))
				) {
					$find = false;
				}
			}

			if ($find !== false) {
				if (empty($data_pendampingan) === false) {
					$tidak_kres = true;
					foreach ($data_pendampingan as $item) {
						if (
							$data['volunteer_id'] !== $item['volunteer_id'] &&
							$item['volunteer_id'] === $item_jadwal_volunteer['student_id'] &&
							((strtotime($data['start_at']) < strtotime($item['start_at']) &&
								strtotime($data['end_at']) > strtotime($item['start_at'])) ||
								(strtotime($data['start_at']) < strtotime($item['end_at']) &&
									strtotime($data['end_at']) > strtotime($item['end_at'])) ||
								(strtotime($data['start_at']) >= strtotime($item['start_at']) &&
									strtotime($data['end_at']) <= strtotime($item['end_at'])))
						) {
							$tidak_kres = false;
							break;
						}
					}
					if ($tidak_kres === true) {
						$volunteer_data[$item_jadwal_volunteer['student_id']] = $item_jadwal_volunteer['name'] . ' (' . $item_jadwal_volunteer['nick_name'] . ')';
					}
				} else {
					$volunteer_data[$item_jadwal_volunteer['student_id']] = $item_jadwal_volunteer['name'] . ' (' . $item_jadwal_volunteer['nick_name'] . ')';
				}
			}
		}

		$this->fcontrol->set_meta_data('volunteer_data', $volunteer_data);
		$this->volunteer_data = $volunteer_data;

		$this->param['day'] = $this->config->item('data_hari');

		if (!isset($this->param['post'])) {
			$this->param['post'] = array();
		}

		$this->param['post'] = array_merge($this->param['post'], (array)$data);

		if ($post = $this->input->post()) {
			$this->param['post'] = array_merge((array)$data, $post);
			$this->do_edit($id, $data, $post);
		}
		$this->fcontrol->set_data($this->param['post'])->init($this->input_field)->generate();

		$this->title = 'Edit ' . ucwords($this->module_name);
		$this->param['mode_add'] = false;
		$this->param['size'] = $this->input_size;
		$this->build('pendampingan-input');
	}

	protected function do_edit($id, $data, $post)
	{
		if (isset($post['volunteer_id']) === false) {
			$this->errors[] = "Pendamping harus di isi.";
		} elseif (isset($this->volunteer_data[$post['volunteer_id']]) === false) {
			$this->errors[] = "Data pendamping tidak ditemukan.";
		} else {
			$data_form = array(
				'volunteer_id' 		=> $post['volunteer_id'],
				'new_volunteer_id' 	=> null,
				'volunteer_change_status' 	=> null,
				'student_status' 	=> "kosong",
				'volunteer_status' 	=> "kosong",
			);

			//ganti jadwal izin jika ada
			$this->db->where('accompaniment_id', $id);
			$this->db->where('status', 'menunggu konfirmasi');
			$this->db->update('app_permit', array('status' => 'diterima', 'new_volunteer_id' => $post['volunteer_id']));

			$this->model->update($id, $data_form);
			$this->set_message('Data jadwal pendampingan telah berhasil diubah.', 'success');
			$this->redirect($this->module_main);
		}
	}

	public function delete($id = false)
	{
		if ($this->model->delete($id)) {
			$this->set_message('Data ' . $this->module_name . ' telah berhasil dihapus.', 'success');
		} else {
			$this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
		}
		$this->redirect($this->module_main . array_to_get_url($this->input->get(), false));
	}

	protected function get_filter(&$filter_jadwal_difabel, &$filter_jadwal_pendampingan)
	{
		$rules_form = array(
			'semester_id' => array(
				'label' 		=> 'Semester',
				'type' 			=> 'select',
				'select_type' 	=> 'key_value',
				'select_data' 	=> 'data_semester',
			),
			'type' => array(
				'label' 		=> 'Tampilkan dalam',
				'input_size' 	=> 6,
				'type' 			=> 'select',
				'select_type' 	=> 'value',
				'select_data' 	=> array('minggu', 'hari',),
				'attr'	=> array(
					'show-type' => '[value-type]'
				),
			),
			'schedule_type' => array(
				'label' 		=> 'Jenis Jadwal',
				'input_size' 	=> 6,
				'type' 			=> 'select',
				'select_type' 	=> 'value',
				'select_data' 	=> array('kuliah', 'uts', 'uas'),
			),
		);

		$this->load->model($this->group . 'semester/semester_model');
		$data_semester = $this->semester_model->gets();
		$data_semester = array_column($data_semester, 'semester_name', 'semester_id');
		$this->fcontrol->set_meta_data('data_semester', $data_semester);

		$data_hari = $this->config->item('data_hari');
		$data_hari = array('' => 'Semua Hari') + $data_hari;
		$this->fcontrol->set_meta_data('data_hari', $data_hari);

		$get_data = array(
			'semester_id' 	=> $this->current_semester,
			'type' 			=> $this->input->get('type') === 'minggu' ? 'minggu' : 'hari',
			'schedule_type' => $this->input->get('tyschedule_type') ?: 'kuliah',
			'date' 			=> date('Y-m-d'),
			'start_at' 		=> date('Y-m-01'),
			'end_at' 		=> date('Y-m-d', strtotime('last day of this month')),
			'tab_id' 		=> false,
		);

		if ($get_data['type'] === 'minggu') {
			$str_time_today = strtotime(date('Y-m-d'));
			$temp_data_semester = $this->semester_model->get($this->current_semester);
			if ($str_time_today < strtotime($temp_data_semester['start_at'])) {
				$get_data['start_at'] = $temp_data_semester['start_at'];
				$get_data['end_at'] = date('Y-m-d', strtotime('+1 month', strtotime($temp_data_semester['start_at'])));
			} elseif ($str_time_today > strtotime($temp_data_semester['end_at'])) {
				$get_data['start_at'] = date('Y-m-d', strtotime('-1 month', strtotime($temp_data_semester['end_at'])));
				$get_data['end_at'] = $temp_data_semester['end_at'];
			} else {
				if (strtotime($get_data['start_at']) < strtotime($temp_data_semester['start_at'])) {
					$get_data['start_at'] = $temp_data_semester['start_at'];
					$get_data['end_at'] = date('Y-m-d', strtotime('+1 month', strtotime($temp_data_semester['start_at'])));
				}
				if (strtotime($get_data['end_at']) > strtotime($temp_data_semester['end_at'])) {
					$get_data['start_at'] = date('Y-m-d', strtotime('-1 month', strtotime($temp_data_semester['end_at'])));
					$get_data['end_at'] = $temp_data_semester['end_at'];
				}
			}

			$rules_filter = array(
				'semester_id' 	=> array('Semester', array('required')),
				'schedule_type' => array('Jenis Jadwal', array('required')),
				'start_at' 		=> array('Tanggal Awal', array('required')),
				'end_at' 		=> array('Tanggal Akhir', array('required')),
			);
		} else {
			$rules_filter = array(
				'semester_id' 	=> array('Semester', array('required')),
				'date' 			=> array('Tanggal', array('required')),
			);
		}


		if ($get = $this->input->get()) {
			if ($get_data['type'] === 'minggu') {
				$get['semester_id'] = isset($get['semester_id']) === false ? $get_data['semester_id'] : $get['semester_id'];
				$get['schedule_type'] = isset($get['schedule_type']) === false ? $get_data['schedule_type'] : $get['schedule_type'];
				$get['start_at'] = isset($get['start_at']) === false ? $get_data['start_at'] : $get['start_at'];
				$get['end_at'] = isset($get['end_at']) === false ? $get_data['end_at'] : $get['end_at'];
			} else {
				$get['semester_id'] = isset($get['semester_id']) === false ? $get_data['semester_id'] : $get['semester_id'];
				$get['schedule_type'] = isset($get['schedule_type']) === false ? $get_data['schedule_type'] : $get['schedule_type'];
				$get['date'] = isset($get['date']) === false ? $get_data['date'] : $get['date'];
			}

			$this->validation->prepar($get, $rules_filter);

			$form_valid = $this->validation->run();
			$form_errors = $this->validation->errors;
			$form_data = $this->validation->data;

			if ($form_valid === true) {
				$data_semester = $this->semester_model->get($form_data['semester_id']);
				if ($data_semester === false) {
					$form_valid = false;
					$form_errors[] = 'Failed filter, data semester tidak ditemukan.';
				}
			}

			if ($form_valid === true) {
				if ($get_data['type'] === 'minggu') {
					if (strtotime($form_data['start_at']) > strtotime($form_data['end_at'])) {
						$form_valid = false;
						$form_errors[] = 'Failed filter, tanggal awal tidak boleh lebih besar dari tanggal akhir.';
					} else if (strtotime($form_data['start_at']) < strtotime($data_semester['start_at']) || strtotime($form_data['start_at']) > strtotime($data_semester['end_at'])) {
						$form_valid = false;
						$form_errors[] = 'Failed filter, tanggal awal diluar tanggal semesater.';
					} else if (strtotime($form_data['end_at']) < strtotime($data_semester['start_at']) || strtotime($form_data['end_at']) > strtotime($data_semester['end_at'])) {
						$form_valid = false;
						$form_errors[] = 'Failed filter, tanggal akhir diluar tanggal semesater.';
					}
				} else {
					if (strtotime($form_data['date']) < strtotime($data_semester['start_at']) || strtotime($form_data['date']) > strtotime($data_semester['end_at'])) {
						$form_valid = false;
						$form_errors[] = 'Failed filter, tanggal diluar tanggal semesater.';
					}
				}
			}

			if ($form_valid === false) {
				$this->errors = $form_errors;
			} else {
				$get_data = array_merge($get_data, $get);
			}
		}

		if ($get_data['type'] === 'minggu') {
			$tab = array();
			$tab_data = array();

			$max_tab = $this->get_tab($get_data, $tab, $tab_data);

			if ($get_data['tab_id'] === false) {
				$get_data['tab_id'] = 1;
			}
			if ($get_data['tab_id'] > $max_tab) {
				$get_data['tab_id'] = $max_tab;
			}

			$this->param['tab'] = $tab;
			$this->param['tab_id'] = $get_data['tab_id'];
			$this->param['get_data'] = $get_data;
			$this->param['key_tab'] = 'tab_id';

			$this->fcontrol->set_data($get_data)->init($rules_form)->generate();

			$current_start = $tab_data[$get_data['tab_id']]['start_at'];
			$current_end = $tab_data[$get_data['tab_id']]['end_at'];

			$date_data = array();
			$temp_date = $current_start;
			while (strtotime($temp_date) <= strtotime($current_end)) {
				$date_data[date('w', strtotime($temp_date))] = date('Y-m-d', strtotime($temp_date));
				$temp_date = date('Y-m-d', strtotime('next day', strtotime($temp_date)));
			}

			$this->aquery->set_meta_data('date_data', $date_data);

			$filter_jadwal_difabel['semester_id'] = $get_data['semester_id'];
			$filter_jadwal_difabel['schedule_type'] = $get_data['schedule_type'];
			$filter_jadwal_difabel['day >='] = date('w', strtotime($current_start));
			$filter_jadwal_difabel['day <='] = date('w', strtotime($current_end));

			$filter_jadwal_pendampingan['semester_id'] = $get_data['semester_id'];
			$filter_jadwal_pendampingan['schedule_type'] = $get_data['schedule_type'];
			$filter_jadwal_pendampingan['date >='] = date('Y-m-d', strtotime($current_start));
			$filter_jadwal_pendampingan['date <='] = date('Y-m-d', strtotime($current_end));
		} else {
			$tab_label = array();

			$this->get_tab_hari($get_data, $tab_label);

			$this->param['tab'] = $tab_label;
			$this->param['tab_id'] = $get_data['date'];
			$this->param['get_data'] = $get_data;
			$this->param['key_tab'] = 'date';

			$this->fcontrol->set_data($get_data)->init($rules_form)->generate();

			$date_data[date('w', strtotime($get_data['date']))] = date('Y-m-d', strtotime($get_data['date']));

			$this->aquery->set_meta_data('date_data', $date_data);
			
			$filter_jadwal_difabel['schedule_type'] = $get_data['schedule_type'];
			$filter_jadwal_difabel['semester_id'] = $get_data['semester_id'];
			$filter_jadwal_difabel['day'] = date('w', strtotime($get_data['date']));

			$filter_jadwal_pendampingan['semester_id'] = $get_data['semester_id'];
			$filter_jadwal_pendampingan['schedule_type'] = $get_data['schedule_type'];
			$filter_jadwal_pendampingan['date'] = date('Y-m-d', strtotime($get_data['date']));
		}
	}

	protected function get_tab(&$date, &$tab_label, &$tab_data)
	{
		$start_date = date('Y-m-d', strtotime($date['start_at']));
		if (date('w', strtotime($start_date)) === '0') {
			$start_date = date('Y-m-d', strtotime("next Monday", strtotime($start_date)));
		}
		$no_tab = 1;
		$str_time_today = strtotime(date('Y-m-d'));
		while (strtotime($start_date) <= strtotime($date['end_at'])) {
			if ($no_tab === 1 && date('w', strtotime($start_date)) === '6') {
				$end_date = $start_date;
			} else {
				$end_date = date('Y-m-d', strtotime("next Saturday", strtotime($start_date)));
			}
			if (strtotime($end_date) >= strtotime($date['end_at'])) {
				$end_date = date('Y-m-d', strtotime($date['end_at']));
			}
			if ($date['tab_id'] === false) {
				if (strtotime($start_date) <= $str_time_today && strtotime($end_date) >= $str_time_today) {
					$date['tab_id'] = $no_tab;
				}
			}

			$tab_data[$no_tab]['start_at'] = $start_date;
			$tab_data[$no_tab]['end_at'] = $end_date;

			if (date('Y-m-d', strtotime($start_date)) === date('Y-m-d', strtotime($end_date))) {
				$tab_label[$no_tab++] = date_html($start_date);
			} elseif (date('Y-m', strtotime($start_date)) === date('Y-m', strtotime($end_date))) {
				$tab_label[$no_tab++] = date('d', strtotime($start_date)) . ' - ' . date('d', strtotime($end_date)) . date(' M Y', strtotime($end_date));
			} elseif (date('Y', strtotime($start_date)) === date('Y', strtotime($end_date))) {
				$tab_label[$no_tab++] = date('d M', strtotime($start_date)) . ' - ' . date('d M', strtotime($end_date)) . date(' Y', strtotime($end_date));
			} else {
				$tab_label[$no_tab++] = date('d M Y', strtotime($start_date)) . ' - ' . date('d M Y', strtotime($end_date));
			}
			$start_date = date('Y-m-d', strtotime("next Monday", strtotime($end_date)));
		}
		return $no_tab - 1;
	}

	protected function get_tab_hari(&$date, &$tab_label)
	{
		$data_hari = $this->config->item('data_hari');

		$start_date = date('Y-m-d', strtotime("-3 day", strtotime($date['date'])));
		if (date('w', strtotime($start_date)) === '0') {
			$start_date = date('Y-m-d', strtotime("next Monday", strtotime($start_date)));
		}
		$end_date = date('Y-m-d', strtotime("+3 day", strtotime($date['date'])));

		while (strtotime($start_date) <= strtotime($end_date)) {
			$index_hari = date('w', strtotime($start_date));
			if ($index_hari !== '0') {
				$tab_label[$start_date] = $data_hari[$index_hari] . ', ' . date_html($start_date);
			}

			$start_date = date('Y-m-d', strtotime("+1 day", strtotime($start_date)));
		}
	}

	public function generate()
	{
		$this->load->model($this->group . 'semester/semester_model');
		$data_semester = $this->semester_model->get($this->current_semester);

		$this->param['post'] = array();
		$this->param['data_pendampingan'] = array();
		if (($post = $this->input->post()) && $this->input->post('action') === 'generate') {
			$this->param['post'] = $post;
			$this->do_generate($post, $data_semester);
		}

		if (($accompaniment = $this->input->post('accompaniment')) && $this->input->post('action') === 'use') {
			$this->do_use($accompaniment);
		}

		$form_generete = array(
			'start_at' => array(
				'label' => 'Tanggal Mulai Generate',
				'type' => 'date',
				'label_size' => 'col-sm-3',
				'input_size' => 'col-sm-4',
				'attr' => array(
					'min' => $data_semester['start_at'],
					'max' => $data_semester['end_at'],
				),
			),
			'end_at' => array(
				'label' => 'Tanggal Selesai Generate',
				'type' => 'date',
				'label_size' => 'col-sm-3',
				'input_size' => 'col-sm-4',
				'attr' => array(
					'min' => $data_semester['start_at'],
					'max' => $data_semester['end_at'],
				),
			),
			'schedule_type' => array(
				'label' => 'Jenis Jadwal',
				'type' => 'select',
				'label_size' => 'col-sm-3',
				'input_size' => 'col-sm-4',
				'select_type' 	=> 'value',
				'select_data' 	=> array('kuliah', 'uts', 'uas'),
			),
			'submit' => array(
				'type' => 'button',
				'button_type' => 'submit',
				'button_color' => 'primary',
				'button_label' => 'Generate ' . ucwords($this->module_name),
				'label_size' => 'col-sm-3',
				'input_size' => 'col-sm-4',
				'attr' => array(
					'name' => 'action',
					'value' => 'generate',
				),
			),
		);

		$this->fcontrol->set_data($this->param['post'])->init($form_generete)->generate();

		$this->title = 'Generate ' . ucwords($this->module_name);
		$this->param['size'] = 'xl';
		$this->build('pendampingan-generate');
	}

	protected function do_generate($post, $data_semester)
	{
		$rules_generate = array(
			'start_at' => array('Tanggal Mulai Generate', array('required')),
			'end_at' => array('Tanggal Selesai Generate', array('required')),
			'schedule_type' => array('Jenis Jadwal', array('required')),
		);
		$this->validation->prepar($post, $rules_generate);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;
		$form_data = $this->validation->data;

		if ($form_valid === true) {
			if (strtotime($form_data['start_at']) > strtotime($form_data['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Tanggal mulai generate tidak boleh lebih besar dari tanggal selesai generate.';
			} else if (strtotime($form_data['start_at']) < strtotime($data_semester['start_at']) || strtotime($form_data['start_at']) > strtotime($data_semester['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Tanggal mulai generate diluar tanggal semesater.';
			} else if (strtotime($form_data['end_at']) < strtotime($data_semester['start_at']) || strtotime($form_data['end_at']) > strtotime($data_semester['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Tanggal selesai generate diluar tanggal semesater.';
			}
		}
		if ($form_valid === true) {
			$jumlah = $this->model->where('date >=', $form_data['start_at'])->where('date <=', $form_data['end_at'])->where('new_day =', null)->get_count();
			if ($jumlah > 0) {
				$form_valid = false;
				$form_errors[] = 'Sudah terdapat jadwal pendampingan dari tanggal yang ingin di generate.';
			}
		}

		if ($form_valid === false) {
			$this->errors = $form_errors;
		} else {
			$form_data['tab_id'] = 1;
			$tab_label = array();
			$tab_data = array();

			$this->get_tab($form_data, $tab_label, $tab_data);

			$max_volunteer = (int)$this->option_model->get_value('max_volunteer');

			$this->param['data_pendampingan']['label'] = $tab_label;

			$data_jadwal_difabel = $this->jadwal_difabel_model->where('semester_id', $this->current_semester)->where('schedule_type', $form_data['schedule_type'])->gets_view($this->jadwal_difabel_model->table_active_view_name);
			$data_jadwal_difabel = array_column($data_jadwal_difabel, null, 'schedule_student_id');
			$data_jadwal_volunteer_group = $this->jadwal_volunteer_model->where('semester_id', $this->current_semester)->gets_view('app_group_schedule_volunteer_view');

			$data_jadwal_difabel_group = array();
			foreach ($data_jadwal_difabel as $i => $item) {
				$data_jadwal_difabel_group[$item['day']][$i] = $item;
			}

			$data_jadwal_result = array();

			$not_found = 0;

			foreach ($tab_data as $index_tab => $item_tab) {
				$temp_date = $item_tab['start_at'];
				shuffle($data_jadwal_volunteer_group);
				$temp_data_volunteer = $data_jadwal_volunteer_group;
				$data_pendamping = array();
				// $counter_data_pendampingan = array_column($data_jadwal_volunteer_group, 'student_id', 'name');
				foreach ($data_jadwal_volunteer_group as $jadwal_volunteer) {
					array_push($data_pendamping, ['student_id' => $jadwal_volunteer['student_id'], 'frequency' => $this->accompanimentcounter($jadwal_volunteer['student_id'], $temp_date)]);
				}
				// print(json_encode(array_column($data_pendamping, 'frequency', 'student_id')));
				$counter_data_pendampingan = array_column($data_pendamping, 'frequency', 'student_id');
				while (strtotime($temp_date) <= strtotime($item_tab['end_at'])) {
					$day = date('w', strtotime($temp_date));
					if (isset($data_jadwal_difabel_group[$day]) === true) {
						foreach ($data_jadwal_difabel_group[$day] as $index_jadwal_difabel => $item_jadwal_difabel) {
							$temp_jadwal_difabel = $data_jadwal_difabel[$item_jadwal_difabel['schedule_student_id']];
							$temp_jadwal_difabel += array(
								'date' => $temp_date,
							);

							$find_jadwal = false;
							foreach ($temp_data_volunteer as $index_jadwal_volunteer => $item_jadwal_volunteer) {

								$jadwal_hari = json_decode($item_jadwal_volunteer["day" . $day]);

								// jika jadwal sama
								foreach ($jadwal_hari as $key => $item_hari) {
									if (
										strtotime($item_jadwal_difabel['start_at']) == strtotime($item_hari[0]) &&
										strtotime($item_jadwal_difabel['end_at']) == strtotime($item_hari[1]) &&
										$item_hari[2] == $form_data['schedule_type'] &&
										$item_jadwal_difabel['room'] == $item_hari[3] &&
										$item_jadwal_difabel['majors_id'] == $item_jadwal_volunteer['majors_id'] &&
										$this->ability_check($item_jadwal_difabel['user_id'], $item_jadwal_volunteer['user_id']) > 0
									) {
										// echo $item_jadwal_difabel['nick_name'];
										// echo $item_jadwal_volunteer['nick_name'];
										$find_jadwal = $index_jadwal_volunteer;
										break;
									}
								}

								// echo $find_jadwal;
							}

							if ($find_jadwal == false) {
								foreach ($temp_data_volunteer as $index_jadwal_volunteer => $item_jadwal_volunteer) {

									// cek apakah jadwal volunteer pada hari pilihan kosong/tidak
									// jika kosong, maka akan dipasangkan jadwalnya
									if ($jadwal_hari == array() && $counter_data_pendampingan[$item_jadwal_volunteer['student_id']] < $max_volunteer && $this->ability_check($item_jadwal_difabel['user_id'], $item_jadwal_volunteer['user_id']) > 0) {
										$find_jadwal = $index_jadwal_volunteer;
										break;
									}

									$find = true;


									// jika jadwal volunteer pada hari pilihan tidak kosong, maka akan dicek waktunya
									// jika waktunya bertabrakan dengan madif, maka akan diskip
									foreach ($jadwal_hari as $key => $item_hari) {
										if ((strtotime($item_jadwal_difabel['start_at']) < strtotime($item_hari[0]) &&
												(strtotime($item_jadwal_difabel['end_at']) + 1800) > strtotime($item_hari[0])) ||
											((strtotime($item_jadwal_difabel['start_at']) - 1800) < strtotime($item_hari[1]) &&
												strtotime($item_jadwal_difabel['end_at']) > strtotime($item_hari[1])) ||
											(strtotime($item_jadwal_difabel['start_at']) >= strtotime($item_hari[0]) &&
												strtotime($item_jadwal_difabel['end_at']) <= strtotime($item_hari[1])) && $item_hari[2] != $form_data['schedule_type']
										) {
											$find = false;
											break;
										}
									}
									// jika waktunya tidak bertabrakan dengan madif, maka jadwal dipasangkan
									if ($find === true && $counter_data_pendampingan[$item_jadwal_volunteer['student_id']] < $max_volunteer && $this->ability_check($item_jadwal_difabel['user_id'], $item_jadwal_volunteer['user_id']) > 0) {
										$find_jadwal = $index_jadwal_volunteer;
										break;
									}
								}
							}

							// proses penambahan data pairing jadwal
							if ($find_jadwal !== false) {
								$temp_jadwal_difabel['volunteer_id'] = $temp_data_volunteer[$find_jadwal]['student_id'];
								$temp_jadwal_difabel['volunteer_nick_name'] = $temp_data_volunteer[$find_jadwal]['nick_name'] . " - " . $counter_data_pendampingan[$temp_data_volunteer[$find_jadwal]['student_id']];

								$jadwal_hari[] = array($item_jadwal_difabel['start_at'], $item_jadwal_difabel['end_at']);

								$temp_data_volunteer[$find_jadwal]['day' . $day] = json_encode($jadwal_hari);
								$counter_data_pendampingan[$temp_data_volunteer[$find_jadwal]['student_id']] += 1;

								$temp_data_volunteer[] = $temp_data_volunteer[$find_jadwal];
								unset($temp_data_volunteer[$find_jadwal]);
							} else {
								$not_found += 1;
							}

							$data_jadwal_result[$index_tab][$index_jadwal_difabel] = $temp_jadwal_difabel;
						}
					}
					$temp_date = date('Y-m-d', strtotime("next day", strtotime($temp_date)));
				}
				if (empty($data_jadwal_result[$index_tab]) === false) {
					ksort($data_jadwal_result[$index_tab]);
				}
			}

			unset($this->list_field['custom']['date']);
			$this->list_field['custom']['date_day'] = 'date_html($item["date"])';

			$this->list_field['field']['day'] = 'Hari';

			foreach ($data_jadwal_result as $index_result => $item_result) {
				$data_jadwal_result[$index_result] = $this->aquery->prepar($item_result)->add_column($this->list_field['custom'])->gets();
			}
			$this->param['list_field'] = $this->list_field['field'];
			$this->param['data_pendampingan']['result'] = $data_jadwal_result;

			if ($not_found > 0) {
				$this->errors[] = "Terdapat " . $not_found . " mahasiswa tidak mendapatkan pendamping.";
			}
		}
	}

	protected function ability_check($student_user_id, $volunteer_user_id)
	{
		$student_ability = $this->db->get_where('aplego_user_meta', array('user_id' => $student_user_id, 'meta_key' => 'jenis_preferensi'));
		$volunteer_ability = $this->db->get_where('aplego_user_meta', array('user_id' => $volunteer_user_id, 'meta_key' => 'jenis_preferensi'));

		// $array_student_ability = array_column($student_ability, 'meta_value');
		// $array_volunteer_ability = array_column($volunteer_ability, 'meta_value');

		$array_student_ability = array();
		$array_volunteer_ability = array();

		foreach ($student_ability->result_array() as $student_ability) {
			array_push($array_student_ability, $student_ability['meta_value']);
		}

		foreach ($volunteer_ability->result_array() as $volunteer_ability) {
			array_push($array_volunteer_ability, $volunteer_ability['meta_value']);
		}

		$result = array_intersect($array_student_ability, $array_volunteer_ability);

		return count($result);
	}

	protected function accompanimentcounter($student_id, $date)
	{
		$sql = "Select * from app_accompaniment_schedule_volunteer_view where volunteer_id = " . $student_id . " and semester_id = " . $this->current_semester . " and WEEKOFYEAR(date)=WEEKOFYEAR('" . $date . "')";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}

	protected function do_use($accompaniment)
	{
		$this->model->create_bulk($accompaniment['data']);
		$this->set_message('Success generate jadwal.', 'success');
		$filter_current = array(
			'semester_id' 	=> $this->current_semester,
			'start_at' 		=> $accompaniment['start_at'],
			'end_at' 		=> $accompaniment['end_at'],
		);
		$this->redirect($this->module_main . array_to_get_url($filter_current, false));
	}

	public function multidelete()
	{
		$this->load->model($this->group . 'semester/semester_model');
		$data_semester = $this->semester_model->get($this->current_semester);

		$form_delete = array(
			'start_at' => array(
				'label' => 'Tanggal Awal Delete',
				'type' => 'date',
				'label_size' => 'col-sm-3',
				'input_size' => 'col-sm-4',
				'attr' => array(
					'min' => $data_semester['start_at'],
					'max' => $data_semester['end_at'],
				),
			),
			'end_at' => array(
				'label' => 'Tanggal Akhir Delete',
				'type' => 'date',
				'label_size' => 'col-sm-3',
				'input_size' => 'col-sm-4',
				'attr' => array(
					'min' => $data_semester['start_at'],
					'max' => $data_semester['end_at'],
				),
			),
			'submit' => array(
				'type' => 'button',
				'button_type' => 'submit',
				'button_color' => 'primary',
				'button_label' => 'Lihat Data ' . ucwords($this->module_name),
				'label_size' => 'col-sm-3',
				'input_size' => 'col-sm-4',
				'attr' => array(
					'name' => 'action',
					'value' => 'view',
				),
			),
		);

		$post = array();
		if ($post = $this->input->post()) {
			$this->do_multidelete($post, $data_semester);
		}

		$this->fcontrol->set_data($post)->init($form_delete)->generate();

		$this->title = 'Delete Multi ' . ucwords($this->module_name);
		$this->param['size'] = 'xl';
		$this->build('pendampingan-delete');
	}

	protected function do_multidelete(&$post, &$data_semester)
	{
		$rules_generate = array(
			'start_at' => array('Tanggal Mulai Generate', array('required')),
			'end_at' => array('Tanggal Selesai Generate', array('required')),
			'action' => array('Aksi', array('required')),
		);

		$this->validation->prepar($post, $rules_generate);

		$form_valid = $this->validation->run();
		$form_errors = $this->validation->errors;
		$form_data = $this->validation->data;

		if ($form_valid === true) {
			if (strtotime($form_data['start_at']) > strtotime($form_data['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Tanggal awal tidak boleh lebih besar dari tanggal akhir.';
			} else if (strtotime($form_data['start_at']) < strtotime($data_semester['start_at']) || strtotime($form_data['start_at']) > strtotime($data_semester['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Tanggal awal diluar tanggal semesater.';
			} else if (strtotime($form_data['end_at']) < strtotime($data_semester['start_at']) || strtotime($form_data['end_at']) > strtotime($data_semester['end_at'])) {
				$form_valid = false;
				$form_errors[] = 'Tanggal akhir diluar tanggal semesater.';
			}
		}

		if ($form_valid === false) {
			$this->errors = $form_errors;
		} else {
			if ($post['action'] === 'view') {
				$this->view_delete($form_data);
			} else {
				$this->model->delete(array('date >=' => $form_data['start_at'], 'date <=' => $form_data['end_at'],));
				$this->set_message('Data ' . $this->module_name . ' telah berhasil dihapus.', 'success');
				$this->redirect($this->module_main);
			}
		}
	}

	protected function view_delete($data)
	{
		$list_field  	= array(
			'field' 	=> array(
				'day' 			=> 'Hari dan Tanggal',
				'jam' 			=> 'Jam',
				'room' 			=> 'Ruang',
				'courses' 		=> 'Mata Kuliah',
				'sks' 			=> 'SKS',
				'nick_name' 	=> 'Mahasiswa',
				'student_status' 	=> 'Status',
				'volunteer_nick_name' 	=> 'Pendamping',
				'volunteer_status' 	=> 'Status',
				'review_mc' 	=> 'Review',
			),
			'custom' 	=> array(
				'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
				'day_custom' 	=> '$item["day"] === null ? "" : $this->meta_data["data_hari"][$item["day"]]',
				'date' 			=> '$item["date"]',
				'date_day' 		=> 'date_html($item["date"])',
				'day' 			=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"] . ", " . $item["date_day"]',
				'student_status' 	=> '$item["student_status"] === null ? "Dijadawalkan" : ucwords($item["student_status"])',
				'volunteer_status' 	=> '$item["volunteer_status"] === null ? "Dijadawalkan" : ucwords($item["volunteer_status"])',
				'review' 		=> '$item["review"] === null ? 0 : ucwords($item["review"])',
				'review_mc' 	=> '$this->meta_data["data_star"][$item["review"]]',
			),
		);

		$data_hari = $this->config->item('data_hari');
		$this->fcontrol->set_meta_data('data_hari', $data_hari);
		$this->aquery->set_meta_data('data_hari', $data_hari);

		$this->load->model($this->group . 'pendampingan/pendampingan_model');
		$this->model = &$this->pendampingan_model;

		$list_field['custom']['nick_name'] = '"<a target=\"blank\" href=\"' . $this->group . 'mahasiswa/edit/{$item["user_id"]}\">{$item["nick_name"]}</a>"';
		$list_field['custom']['volunteer_nick_name'] = '"<a target=\"blank\" href=\"' . $this->group . 'mahasiswa/edit/{$item["volunteer_user_id"]}\">{$item["volunteer_nick_name"]}</a>"';

		$data_star = array();
		for ($i = 0; $i <= 5; $i++) {
			$data_star[$i] = '';
			for ($j = 0; $j < 5; $j++) {
				$data_star[$i] .= '<i class="fa fa-fw fa-star' . ($i <= $j ? ' text-light' : '') . '"></i>';
			}
			$data_star[$i] = '<div class="text-nowrap"><span class="hide">' . $i . '</span>' . $data_star[$i] . '</div>';
		}

		$this->aquery->set_meta_data('data_star', $data_star);

		$this->param['data'] = $this->model->where(array('date >=' => $data['start_at'], 'date <=' => $data['end_at'],))->gets_view();
		$this->param['list_field'] = $list_field['field'];
		$this->param['data'] = $this->aquery->prepar($this->param['data'])
			->add_column($list_field['custom'])
			->gets();
	}

	public function change($id = false)
	{
		$data_pendampingan = $this->model->where('semester_id', $this->current_semester)->get($id);
		if ($data_pendampingan === false || $id === false) {
			$this->set_message('Data jadwal pendampingan tidak ditemukan tidak ditemukan.');
			$this->redirect($this->module_main);
		}

		$schedule_student_id = $data_pendampingan['schedule_student_id'];

		$data = $this->jadwal_difabel_model->where('semester_id', $this->current_semester)->get_view($data_pendampingan['schedule_student_id']);

		$this->param['data'] = $data;
		$date = $data_pendampingan['date'];

		$temp_data = $this->model->where('schedule_student_id', $id)->where('date', $date)->get_count();

		if ($temp_data > 0) {
			$this->set_message('Data jadwal pendampingan telah dibuat sebelumnya.');
			$this->redirect($this->module_main);
		}

		$data_jadwal_volunteer_group = $this->jadwal_volunteer_model
			->where('semester_id', $this->current_semester)
			->gets_view('app_group_schedule_volunteer_view');

		$data_pendampingan = $this->model
			->where('semester_id', $this->current_semester)
			->where('date', $date)
			->gets_view('app_accompaniment_schedule_volunteer_view');

		$day = date('w', strtotime($date));
		$volunteer_data = array();

		foreach ($data_jadwal_volunteer_group as $index_jadwal_volunteer => $item_jadwal_volunteer) {
			$find = true;
			$jadwal_hari = json_decode($item_jadwal_volunteer["day" . $day]);
			if ($jadwal_hari == array()) {
				$find_jadwal = $index_jadwal_volunteer;
			}
			foreach ($jadwal_hari as $key => $item_hari) {
				if ((strtotime($data['start_at']) < strtotime($item_hari[0]) &&
						strtotime($data['end_at']) > strtotime($item_hari[0])) ||
					(strtotime($data['start_at']) < strtotime($item_hari[1]) &&
						strtotime($data['end_at']) > strtotime($item_hari[1])) ||
					(strtotime($data['start_at']) >= strtotime($item_hari[0]) &&
						strtotime($data['end_at']) <= strtotime($item_hari[1]))
				) {
					$find = false;
				}
			}

			if ($find !== false) {
				if (empty($data_pendampingan) === false) {
					$tidak_kres = true;
					foreach ($data_pendampingan as $item) {
						if (
							$item['volunteer_id'] === $item_jadwal_volunteer['student_id'] &&
							((strtotime($data['start_at']) < strtotime($item['start_at']) &&
								strtotime($data['end_at']) > strtotime($item['start_at'])) ||
								(strtotime($data['start_at']) < strtotime($item['end_at']) &&
									strtotime($data['end_at']) > strtotime($item['end_at'])) ||
								(strtotime($data['start_at']) >= strtotime($item['start_at']) &&
									strtotime($data['end_at']) <= strtotime($item['end_at'])))
						) {
							$tidak_kres = false;
							break;
						}
					}
					if ($tidak_kres === true) {
						$volunteer_data[$item_jadwal_volunteer['student_id']] = $item_jadwal_volunteer['name'] . ' (' . $item_jadwal_volunteer['nick_name'] . ')';
					}
				} else {
					$volunteer_data[$item_jadwal_volunteer['student_id']] = $item_jadwal_volunteer['name'] . ' (' . $item_jadwal_volunteer['nick_name'] . ')';
				}
			}
		}

		if (empty($volunteer_data)) {
			$this->errors[] = 'Tidak ada mahasiswa pendamping yang bisa mendampingi.';
		}

		$this->fcontrol->set_meta_data('volunteer_data', $volunteer_data);
		$this->volunteer_data = $volunteer_data;

		$this->param['post'] = array();
		$this->param['date'] = $date;
		$this->param['day'] = $this->config->item('data_hari');
		if ($post = $this->input->post()) {
			$post['semester_id'] = $this->current_semester;
			$post['schedule_student_id'] = $schedule_student_id;
			$post['date'] = $date;
			$this->param['post'] = $post;
			$this->do_change($post);
		}

		$this->fcontrol->set_data($this->param['post'])->init($this->input_field)->generate();

		$this->title = 'Input ' . ucwords($this->module_name);
		$this->param['mode_add'] = true;
		$this->param['size'] = $this->input_size;
		$this->build('pendampingan-input');
	}

	protected function do_change($post)
	{
		if (isset($post['volunteer_id']) === false) {
			$this->errors[] = "Pendamping harus di isi.";
		} elseif (isset($this->volunteer_data[$post['volunteer_id']]) === false) {
			$this->errors[] = "Data pendamping tidak ditemukan.";
		} else {
			$data_form = elements(array('semester_id', 'schedule_student_id', 'date', 'volunteer_id'), $post);
			$this->model->create($data_form);
			$this->set_message('Data jadwal pendampingan telah berhasil ditambah.', 'success');
			$this->redirect($this->module_main . '?date=' . $post['date']);
		}
	}
}
