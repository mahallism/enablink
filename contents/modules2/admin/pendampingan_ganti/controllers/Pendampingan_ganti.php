<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pendampingan_ganti extends App_Controller
{
	protected $module_main = 'pendampingan_ganti';
	protected $module_name = 'Riwayat Ganti Pendamping';

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

		// $data_pendampingan = $this->db->get_where('app_accompaniment_view', array('new_volunteer_id IS NOT NULL' => null))->result_array();
		$data_pendampingan = $this->db->get_where('app_accompaniment_view', array('new_volunteer_id IS NOT NULL' => null));
		$data_pendampingan_result = $data_pendampingan->result_array();

		foreach ($data_pendampingan->result() as $index => $row) {
			$original_volunteer_id = $this->db->get_where('app_accompaniment', array('accompaniment_id' => $row->accompaniment_id))->row()->volunteer_id;
			$data_pendampingan_result[$index]['id_pendamping_lama'] = $original_volunteer_id;
			$data_pendampingan_result[$index]['id_pendamping_baru'] = $row->new_volunteer_id;
			$data_pendampingan_result[$index]['nama_pendamping_lama'] = $this->db->get_where('app_students', array('student_id' => $original_volunteer_id))->row()->nick_name;
			$data_pendampingan_result[$index]['nama_pendamping_baru'] = empty($row->new_volunteer_id) ? 'kosong' : $this->db->get_where('app_students', array('student_id' => $row->new_volunteer_id))->row()->nick_name;
		}

		// var_dump(json_encode($data_pendampingan_result));

		$this->param['data'] = $data_pendampingan_result;
		// $this->list_field['field']['pendamping_pengganti'] = $data_pendampingan['new_volunteer_id'];
		$this->param['list_field'] = $this->list_field['field'];
		if ($this->list_field['custom']) {
			$this->param['data'] = $this->aquery->prepar($this->param['data'])
				->add_column($this->list_field['custom'])
				->gets();
		}

		$this->title = 'Data ' . ucwords($this->module_name);
		$this->param['size'] = $this->list_size;

		$this->build('pendampingan-list-change');
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
				$get['start_at'] = isset($get['start_at']) === false ? $get_data['start_at'] : $get['start_at'];
				$get['end_at'] = isset($get['end_at']) === false ? $get_data['end_at'] : $get['end_at'];
			} else {
				$get['semester_id'] = isset($get['semester_id']) === false ? $get_data['semester_id'] : $get['semester_id'];
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
			$filter_jadwal_difabel['day >='] = date('w', strtotime($current_start));
			$filter_jadwal_difabel['day <='] = date('w', strtotime($current_end));

			$filter_jadwal_pendampingan['semester_id'] = $get_data['semester_id'];
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

			$filter_jadwal_difabel['semester_id'] = $get_data['semester_id'];
			$filter_jadwal_difabel['day'] = date('w', strtotime($get_data['date']));

			$filter_jadwal_pendampingan['semester_id'] = $get_data['semester_id'];
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
	
}
