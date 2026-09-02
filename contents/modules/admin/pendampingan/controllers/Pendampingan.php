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
			'schedule_type' => 'Jadwal',
            'student_status'=> 'Status Madif',
            'pendamping' 	=> 'Pendamping',
            'note' 	        => 'Catatan',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? $this->meta_data["data_hari"][date("w", strtotime($item["date"]))] : $this->meta_data["data_hari"][$item["day"]]',
			'date' 			=> '$item["day"] === null ? $item["date"] : $this->meta_data["date_data"][$item["day"]]',
			'date_day' 		=> '$item["day"] === null ? "" : date_html($this->meta_data["date_data"][$item["day"]])',
			'day' 			=> '"<span class=\"hide\">{$item["day"]}</span>" . ($item["day"] === null ? $item["date"] : ($item["day_custom"] . ", " . $item["date_day"]))',
			'pendamping' 	=> '"Pendamping"',
            'student_status'=> '!empty($item["student_status"]) ? ($item["student_status"] == "izin" ? "<code>Izin</code>" : ucwords($item["student_status"])) : ""',
            'note'          => 'empty($item["note"])?"":$item["note"]'
		),
	);
	protected $action_url  	= array('edit_more', 'edit', 'delete');

	protected $input_field = array(
		'volunteer_id' => array(
			'label' => 'Pendamping',
			'type'	=> 'select',
			'select_type' => 'key_value',
			'select_data' => 'volunteer_data',
		),
        'note' => array(
            'label' 	=> 'Catatan',
            'required' 	=> true,
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

        $custom_field_name = '"<div class=\"row justify-content-between\">"';
		$custom_field_name .= ' . "<div class=\"col-auto\"><a href=\"' . $this->group . 'report/pendampingan/detail/{$item["student_id"]}\" target=\"blank\">{$item["name"]}</a> <small class=\"text-muted\">({$item["nick_name"]})</small></div>"';
		$custom_field_name .= ' . "<div class=\"col-auto\">{$item["faculty_name"]} - {$item["majors_name"]}</div>"';
		$custom_field_name .= ' . "<div class=\"col-auto\">" . $item["no_hp"] . "</div></div>"';
		$this->list_field['custom']['name'] = $custom_field_name;

		$this->list_field['custom'][$this->model->primary_key] = 'isset($item["' . $this->model->primary_key . '"]) ? $item["' . $this->model->primary_key . '"] : null';

		$str_kosong = '"<span class=\"text-danger\">Belum ada</span>"';
		$str_pendamping = '"<a href=\"' . $this->group . 'report/volunteer/detail/{$item["volunteer_id"]}\" target=\"blank\">{$item["volunteer_nick_name"]}</a>" . 
            ($item["volunteer_majors_focus"]!=$item["majors_focus"]?"<br/><span class=\"text-muted\">Beda Fokus Jurusan</span>": 
                ($item["volunteer_faculty_id"]!=$item["faculty_id"]?"<br/><span class=\"text-muted\">Beda Fakultas (".$item["volunteer_faculty_name"].")</span>":
                    ($item["volunteer_majors_id"]!=$item["majors_id"]?"<br/><span class=\"text-muted\">Beda Prodi (".$item["volunteer_majors_name"].")</span>":"")))';
		$this->list_field['custom']['pendamping'] = 'isset($item["volunteer_id"]) ? ' . $str_pendamping . ' : ' . $str_kosong;
	}

	public function index($id = false)
	{
		foreach (array('edit', 'edit_more', 'delete') as $item) {
			$this->action_url[$item]['id'] = $this->model->primary_key;
		}
        $this->action_url['generate_jadwal'] = $this->group.$this->module_main;

		$filter_jadwal_difabel = array();
		$filter_jadwal_pendampingan = array();

		$this->get_filter($filter_jadwal_difabel, $filter_jadwal_pendampingan);

		if (empty($filter_jadwal_difabel) === false) {
            if(isset($filter_jadwal_difabel['day']) && !empty($this->input->get("date"))){
                $this->jadwal_difabel_model->where("IF(date IS NOT NULL, date='".$this->input->get("date")."', day='".$filter_jadwal_difabel['day']."')");
                unset($filter_jadwal_difabel['day']);
            }
           else 
			if (isset($filter_jadwal_difabel['day']) && empty($this->input->get("date"))){
                $this->jadwal_difabel_model->where("IF(date IS NOT NULL, date='".date("Y-m-d")."', day='".$filter_jadwal_difabel['day']."')");
                unset($filter_jadwal_difabel['day']);
            }
			if(empty($filter_jadwal_difabel['schedule_type'])){
                unset($filter_jadwal_difabel['schedule_type']);
            }
			$this->jadwal_difabel_model->where($filter_jadwal_difabel);
		}
		if (empty($filter_jadwal_pendampingan) === false){
            if(empty($filter_jadwal_pendampingan['schedule_type'])){
                unset($filter_jadwal_pendampingan['schedule_type']);
            }
        }

		$data_jadwal_difabel = $this->jadwal_difabel_model->gets_view($this->jadwal_difabel_model->table_active_view_name);
        if(!empty($this->input->get("date"))){
            foreach($data_jadwal_difabel as $key=>$item){
                if(!empty($item['accompaniment_id']) && $item['accompaniment_date'] != $this->input->get("date")){
                    unset($data_jadwal_difabel[$key]['accompaniment_id']);
				}
            }
        }
		$data_jadwal_difabel = array_column($data_jadwal_difabel, null, 'schedule_student_id');

		if (empty($filter_jadwal_pendampingan) === false) {
			$this->model->where($filter_jadwal_pendampingan);
		}
		$tanggal_filter = $this->input->get("date");
		if (empty($tanggal_filter)){
			$tanggal_filter = date('Y-m-d');
		}else $tanggal_filter = $this->input->get("date");
		// echo 'tanggale = ',$tanggal_filter;
		// exit;

		$this->load->model($this->group.'pendampingan/pendampingan_model','pendampingan_model2');
		$data_pendampingan_new = $this->pendampingan_model2->gets_view();
		
		$data_pendampingan_new = $this->pendampingan_model2->gets_view($this->pendampingan_model2->table_base_view_name);
		foreach ($data_pendampingan_new as $item) {
			
            if(!isset($data_jadwal_difabel[$item['schedule_student_id']])){
                continue;
            }
			if ($item['date'] !== $tanggal_filter) {
				continue; // Skip jika tanggal tidak cocok
			}
			$data_jadwal_difabel[$item['schedule_student_id']]['accompaniment_id'] = $item['accompaniment_id'];
			$data_jadwal_difabel[$item['schedule_student_id']]['volunteer_id'] = $item['volunteer_id'];
			$data_jadwal_difabel[$item['schedule_student_id']]['volunteer_nick_name'] = $item['nick_name'];
            $data_jadwal_difabel[$item['schedule_student_id']]['note'] = $item['note'];
            $data_jadwal_difabel[$item['schedule_student_id']]['student_status'] = $item['student_status'];
			if (!empty($item['start_at']) && !empty($item['end_at'])) {
				$data_jadwal_difabel[$item['schedule_student_id']]['accompaniment_id'] = $item['accompaniment_id'];
				$data_jadwal_difabel[$item['schedule_student_id']]['volunteer_id'] = $item['volunteer_id'];
                $data_jadwal_difabel[$item['schedule_student_id']]['volunteer_majors_focus'] = $item['volunteer_majors_focus'];
                $data_jadwal_difabel[$item['schedule_student_id']]['volunteer_faculty_id'] = $item['volunteer_faculty_id'];
                $data_jadwal_difabel[$item['schedule_student_id']]['volunteer_faculty_name'] = $item['volunteer_faculty_name'];
                $data_jadwal_difabel[$item['schedule_student_id']]['volunteer_majors_id'] = $item['volunteer_majors_id'];
                $data_jadwal_difabel[$item['schedule_student_id']]['volunteer_majors_name'] = $item['volunteer_majors_name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['name'] = $item['name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['volunteer_nick_name'] = $item['volunteer_nick_name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['nick_name'] = $item['nick_name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['faculty_name'] = $item['faculty_name'];
				$data_jadwal_difabel[$item['schedule_student_id']]['majors_name'] = $item['majors_name'];
                $data_jadwal_difabel[$item['schedule_student_id']]['date'] = $item['date'];
                $data_jadwal_difabel[$item['schedule_student_id']]['day'] = $item['day'];
				$data_jadwal_difabel[$item['schedule_student_id']]['student_id'] = $item['student_id'];
				$data_jadwal_difabel[$item['schedule_student_id']]['no_hp'] = $item['no_hp'];
				$data_jadwal_difabel[$item['schedule_student_id']]['room'] = $item['room'];
				$data_jadwal_difabel[$item['schedule_student_id']]['courses'] = $item['courses'];
				$data_jadwal_difabel[$item['schedule_student_id']]['start_at'] = $item['start_at'];
				$data_jadwal_difabel[$item['schedule_student_id']]['end_at'] = $item['end_at'];
				
			}
		}
		
// 		echo "Tanggal filter: " . $this->input->get("date") . "<br>";
// // foreach ($data_pendampingan_new as $item) {
// //     echo $item['schedule_student_id'] . " | accompaniment_date = " . $item['date'] . "<br>";
// //} 
// print_r($data_jadwal_difabel);
// exit;
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
            if(empty($post['semester_id'])) $post['semester_id'] = $this->current_semester;
            if(empty($post['schedule_student_id'])) $post['schedule_student_id'] = $id;
            if(empty($post['date'])) $post['date'] = $date;
			$this->do_input($post);
		} else if (!$date) {
			$this->set_message('Failed url input jadwal pendampingan.');
			$this->redirect($this->module_main);
		} elseif (strtotime($date) < strtotime(date('Y-m-d'))) {
			$this->set_message('Tanggal input melebihi hari ini.');
			$this->redirect($this->module_main);
		}

        $day = date('w', strtotime($date));
        $max_freq_accompanisment = $this->option_model->get_value('max_frequensi_accompaniment');

        $volunteer_data = array();
        $volenteers = $this->pendampingan_model->get_free_volunteer(array(
            "semester_id"=>$this->current_semester,
            "date"=>$date,
            "day"=>$day,
            "start_at"=>$data['start_at'],
            "end_at"=>$data['end_at'],
            "prior_majors_id" => $data["majors_id"],
            "prior_faculty_id" => $data["faculty_id"],
            "prior_majors_focus" => $data["majors_focus"],
            "limit_count_accompaniment"=>$max_freq_accompanisment
        ));

        foreach ($volenteers as $item){
            $volunteer_data[$item['student_id']] = $item['name'] . " (".$item['majors_name'].")";
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
//			$this->do_input($post);
		}

		$this->fcontrol->set_data($this->param['post'])->init($this->input_field)->generate();

		$this->title = 'Input ' . ucwords($this->module_name);
		$this->param['mode_add'] = true;
		$this->param['size'] = $this->input_size;
		$this->build('pendampingan-input');
	}
	
    public function input_more($id = false)
    {
		$this->load->model($this->group . 'semester/semester_model');
        $data_semester = $this->semester_model->get($this->current_semester);
		
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
            if(empty($post['semester_id'])) $post['semester_id'] = $this->current_semester;
            if(empty($post['schedule_student_id'])) $post['schedule_student_id'] = $id;
            if(empty($post['date'])) $post['date'] = $date;
            $this->do_input($post);
        } else if (!$date) {
            $this->set_message('Failed url input jadwal pendampingan.');
            $this->redirect($this->module_main);
        } elseif (strtotime($date) < strtotime(date('Y-m-d'))) {
            $this->set_message('Tanggal input melebihi hari ini.');
            $this->redirect($this->module_main);
        }

        $day = date('w', strtotime($date));
        $max_freq_accompanisment = $this->option_model->get_value('max_frequensi_accompaniment');

        $volunteer_data = array();
        $volenteers = $this->pendampingan_model->get_free_volunteer(array(
            "semester_id"=>$this->current_semester,
            "date"=>$date,
            "day"=>$day,
            "start_at"=>$data['start_at'],
            "end_at"=>$data['end_at'],
            "prior_majors_id" => $data["majors_id"],
            "prior_faculty_id" => $data["faculty_id"],
            "prior_majors_focus" => $data["majors_focus"],
            "limit_count_accompaniment"=>$max_freq_accompanisment,
            "filter_all"=>true
        ));

        foreach ($volenteers as $item){
            $bentrok = [];
            if(strpos($item['is_free_schedule'], 'FALSE') !== false){
                array_push($bentrok, "Jadwal");
            }
            if(strpos($item['is_free_accompaniment'], 'FALSE') !== false){
                array_push($bentrok, "Pendampingan");
            }

            $volunteer_data[$item['student_id']] = $item['name'] . " (".
                ($item['majors_id'] == $data['majors_id'] ? "Prodi Sama: " .$item['majors_name']  : (
                $item['faculty_id'] == $data['faculty_id'] ? "Fakultas Sama" : (
                !empty($item['majors_focus']) && $item['majors_focus'] == $data['majors_focus'] ? "Focus Studi Sama " . $item['majors_focus'] : $item['majors_name'])
                )).")" . (!empty($bentrok)? " * Bentrok " . join(", ", $bentrok) : " | Possible");
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
//			$this->do_input($post);
        }
        $this->input_field['volunteer_id']['class'] = "form-control select2";
		$this->input_field['start_at'] = array(
            'label' => 'Tanggal Mulai Generate',
            'type' => 'date',
            'label_size' => 'col-sm-4',
            'input_size' => 'col-sm-8',
            'attr' => array(
                'min' => $data_semester['start_at'],
                'max' => $data_semester['end_at'],
            ),
        );
        $this->input_field['end_at'] = array(
            'label' => 'Tanggal Selesai Generate',
            'type' => 'date',
            'label_size' => 'col-sm-4',
            'input_size' => 'col-sm-8',
            'attr' => array(
                'min' => $data_semester['start_at'],
                'max' => $data_semester['end_at'],
            ),
        );

        $this->fcontrol->set_data($this->param['post'])->init($this->input_field)->generate();

        $this->title = 'Input ' . ucwords($this->module_name);
        $this->param['mode_add'] = true;
        $this->param['size'] = $this->input_size;
        $this->build('pendampingan-input-more');
    }

	protected function do_input($post)
	{
        $this->load->model($this->group . 'semester/semester_model');
        $data_semester = $this->semester_model->get($this->current_semester);

        $form_valid = true;
        $form_errors = [];
        if(!empty($post['start_at'])){
            if (strtotime($post['start_at']) < strtotime($data_semester['start_at']) || strtotime($post['start_at']) > strtotime($data_semester['end_at'])) {
                $form_valid = false;
                $form_errors[] = 'Tanggal mulai generate diluar tanggal semesater.';
            } else if (strtotime($post['end_at']) < strtotime($data_semester['start_at']) || strtotime($post['end_at']) > strtotime($data_semester['end_at'])) {
                $form_valid = false;
                $form_errors[] = 'Tanggal selesai generate diluar tanggal semesater.';
            }
        }

        $schdule = $this->jadwal_difabel_model->get($post['schedule_student_id']);
        if(empty($schdule)){
            $form_valid = false;
            $form_errors[] = 'Master jadwal madif tidak ditemukan.';
        }

        if ($form_valid === false) {
            $this->errors = $form_errors;
            $this->redirect($this->module_main);
            return ;
        }
        if(!empty($post['start_at'])){
            $currentDate = $post['start_at'];
            while (true) {
                if (date("w", strtotime($currentDate)) == $schdule['day']) {
                    $data_form = elements(array('semester_id', 'schedule_student_id', 'date', 'volunteer_id', 'note'), $post);
                    $data_form['date'] = date("Y-m-d", strtotime($currentDate));
                    $data_form['code_attending'] = random_int(100000,900000);
                    $this->model->create($data_form);
                }
                $currentDate = date("Y-m-d", strtotime("+1 day", strtotime($currentDate)));
                if ($currentDate > $post['end_at']) {
                    break;
                }
            }
            $this->set_message('Data jadwal pendampingan telah berhasil ditambah.', 'success');
            $this->redirect($this->module_main);
        }else{
            $data_form = elements(array('semester_id', 'schedule_student_id', 'date', 'volunteer_id', 'note'), $post);
            $data_form['code_attending'] = random_int(100000,900000);
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

		$day = date('w', strtotime($data['date']));
        $max_freq_accompanisment = $this->option_model->get_value('max_frequensi_accompaniment');

		$volunteer_data = array();
        $volenteers = $this->pendampingan_model->get_free_volunteer(array(
            "semester_id"=>$this->current_semester,
            "date"=>$data['date'],
            "day"=>$day,
            "start_at"=>$data['start_at'],
            "end_at"=>$data['end_at'],
            "prior_majors_id" => $data["majors_id"],
            "prior_faculty_id" => $data["faculty_id"],
            "prior_majors_focus" => $data["majors_focus"],
            "limit_count_accompaniment"=>$max_freq_accompanisment
        ));

        foreach ($volenteers as $item){
            $volunteer_data[$item['student_id']] = $item['name'] . " (".
                ($item['majors_id'] == $data['majors_id'] ? "Prodi Sama: " .$item['majors_name']  : (
                    $item['faculty_id'] == $data['faculty_id'] ? "Fakultas Sama" : (
                    !empty($item['majors_focus']) && $item['majors_focus'] == $data['majors_focus'] ? "Focus Studi Sama " . $item['majors_focus'] : $item['majors_name'])
                )).")";
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
        $this->load->model($this->group . 'semester/semester_model');
        $data_semester = $this->semester_model->get($this->current_semester);
		$this->load->model($this->group.'pendampingan/pendampingan_model','pendampingan_model2');

        $data_form = array(
            'note' 		        => $post['note'],
            'new_volunteer_id' 	=> null,
            'volunteer_change_status' 	=> null,
        );
        if(!empty($post['volunteer_id'])){
            $data_form['volunteer_id'] = $post['volunteer_id'];
        }

        $form_valid = true;
        $form_errors = [];
        if(!empty($post['start_at'])){
            if (strtotime($post['start_at']) < strtotime($data_semester['start_at']) || strtotime($post['start_at']) > strtotime($data_semester['end_at'])) {
                $form_valid = false;
                $form_errors[] = 'Tanggal mulai generate diluar tanggal semesater.';
            } else if (strtotime($post['end_at']) < strtotime($data_semester['start_at']) || strtotime($post['end_at']) > strtotime($data_semester['end_at'])) {
                $form_valid = false;
                $form_errors[] = 'Tanggal selesai generate diluar tanggal semesater.';
            }
        }

        if ($form_valid === false) {
            $this->errors = $form_errors;
            $this->redirect($this->module_main);
            return ;
        }
		

        if(!empty($post['start_at'])){
            // $accompaniments = $this->pendampingan_model2->where("schedule_student_id", $data['schedule_student_id'])
            //     ->where("date between '".$post['start_at']."' AND '".$post['end_at']."'")->gets_view();
            // foreach ($accompaniments as $item){
            //     $this->model->update($item['accompaniment_id'], $data_form);
            // }
			$this->db->where("schedule_student_id", $data['schedule_student_id']);
			$this->db->where("date >=", $post['start_at']);
			$this->db->where("date <=", $post['end_at']);
			$accompaniments = $this->db->get("app_accompaniment")->result_array();
			foreach ($accompaniments as $item){
				     $this->model->update($item['accompaniment_id'], $data_form);
				 }
        }else{
            $this->model->update($id, $data_form);
        }
		

		
        //ganti jadwal izin jika ada
        $this->db->where('accompaniment_id', $id);
        $this->db->where('status', 'menunggu konfirmasi');
        $this->db->update('app_permit', array('status' => 'diterima', 'new_volunteer_id' => $post['volunteer_id']));

        $this->set_message('Data jadwal pendampingan telah berhasil diubah.', 'success');
        $this->redirect($this->module_main);
	}

    public function edit_more($id = false)
    {
        $data = $this->model->get_view($id);
        if (!$data) {
            $this->set_message('Data ' . $this->module_name . ' tidak ditemukan.');
            $this->redirect($this->module_main);
        }

        $day = date('w', strtotime($data['date']));
        $max_freq_accompanisment = $this->option_model->get_value('max_frequensi_accompaniment');

        $volunteer_data = array();
        $volenteers = $this->pendampingan_model->get_free_volunteer(array(
            "semester_id"=>$this->current_semester,
            "date"=>$data['date'],
            "day"=>$day,
            "start_at"=>$data['start_at'],
            "end_at"=>$data['end_at'],
            "prior_majors_id" => $data["majors_id"],
            "prior_faculty_id" => $data["faculty_id"],
            "prior_majors_focus" => $data["majors_focus"],
            "limit_count_accompaniment"=>$max_freq_accompanisment,
            "filter_all"=>true
        ));

        foreach ($volenteers as $item){
            $bentrok = [];
            if(strpos($item['is_free_schedule'], 'FALSE') !== false){
                array_push($bentrok, "Jadwal");
            }
            if(strpos($item['is_free_accompaniment'], 'FALSE') !== false){
                array_push($bentrok, "Pendampingan");
            }

            $volunteer_data[$item['student_id']] = $item['name'] . " (".
                ($item['majors_id'] == $data['majors_id'] ? "Prodi Sama: " .$item['majors_name']  : (
                $item['faculty_id'] == $data['faculty_id'] ? "Fakultas Sama" : (
                !empty($item['majors_focus']) && $item['majors_focus'] == $data['majors_focus'] ? "Focus Studi Sama " . $item['majors_focus'] : $item['majors_name'])
                )).")" . (!empty($bentrok)? " * Bentrok " . join(", ", $bentrok) : " | Possible");
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

        $this->load->model($this->group . 'semester/semester_model');
        $data_semester = $this->semester_model->get($this->current_semester);
        $this->input_field['volunteer_id']['class'] = "form-control select2";

        $this->input_field['start_at'] = array(
            'label' => 'Tanggal Mulai Generate',
            'type' => 'date',
            'label_size' => 'col-sm-4',
            'input_size' => 'col-sm-8',
            'attr' => array(
                'min' => $data_semester['start_at'],
                'max' => $data_semester['end_at'],
            ),
        );
        $this->input_field['end_at'] = array(
            'label' => 'Tanggal Selesai Generate',
            'type' => 'date',
            'label_size' => 'col-sm-4',
            'input_size' => 'col-sm-8',
            'attr' => array(
                'min' => $data_semester['start_at'],
                'max' => $data_semester['end_at'],
            ),
        );

        $this->fcontrol->set_data($this->param['post'])->init($this->input_field)->generate();

        $this->title = 'Edit ' . ucwords($this->module_name);
        $this->param['mode_add'] = false;
        $this->param['size'] = $this->input_size;
        $this->build('pendampingan-edit-more');
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
				'select_type' 	=> 'key_value',
				'select_data' 	=> array(
                    ''=>'Semua Jadwal',
                    'kuliah'=>"Kuliah",
                    'uts'=>"UTS",
                    'uas'=>"UAS"
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
			'schedule_type' => $this->input->get('tyschedule_type') ?: '',
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
                'label_size' => 'col-sm-4',
                'input_size' => 'col-sm-8',
				'attr' => array(
					'min' => $data_semester['start_at'],
					'max' => $data_semester['end_at'],
				),
			),
			'end_at' => array(
				'label' => 'Tanggal Selesai Generate',
				'type' => 'date',
                'label_size' => 'col-sm-4',
                'input_size' => 'col-sm-8',
				'attr' => array(
					'min' => $data_semester['start_at'],
					'max' => $data_semester['end_at'],
				),
			),
			'schedule_type' => array(
				'label' => 'Jenis Jadwal',
				'type' => 'select',
                'label_size' => 'col-sm-4',
                'input_size' => 'col-sm-8',
				'select_type' 	=> 'value',
				'select_data' 	=> array('kuliah', 'uts', 'uas', 'kegiatan lain'),
			),
			'submit' => array(
				'type' => 'button',
				'button_type' => 'submit',
				'button_color' => 'primary',
				'button_label' => 'Generate ' . ucwords($this->module_name),
				'label_size' => 'col-sm-4',
				'input_size' => 'col-sm-8',
				'attr' => array(
					'name' => 'action',
					'value' => 'generate',
				),
			),
		);

		$this->fcontrol->set_data($this->param['post'])->init($form_generete)->generate();

		$this->title = 'Generate ' . ucwords($this->module_name);
		$this->param['size'] = 'md';
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
			/*$jumlah = $this->model->where('date >=', $form_data['start_at'])->where('date <=', $form_data['end_at'])->where('new_day =', null)->get_count();
			if ($jumlah > 0) {
				$form_valid = false;
				$form_errors[] = 'Sudah terdapat jadwal pendampingan dari tanggal yang ingin di generate.';
			}*/
		}

		if ($form_valid === false) {
			$this->errors = $form_errors;
		} else {
			$form_data['tab_id'] = 1;
			$tab_label = array();
			$tab_data = array();
            $not_found = 0;

			$this->get_tab($form_data, $tab_label, $tab_data);

            $max_freq_accompanisment = $this->option_model->get_value('max_frequensi_accompaniment');

            if(in_array($form_data['schedule_type'], array("uts", "uas", "kegiatan lain"))){
                $data_jadwal_difabel = $this->jadwal_difabel_model
                    ->where('semester_id', $this->current_semester)
                    ->where('schedule_type', $form_data['schedule_type'])
                    ->where('accompaniment_id IS NULL')
                    ->where('date IS NOT NULL')
                    ->order_by('day ASC, date ASC, start_at ASC')
                    ->gets_view($this->jadwal_difabel_model->table_active_view_name);
                foreach ($data_jadwal_difabel as $key => $item) {
                    if(empty($item['date'])){
                        continue;
                    }
                    $pendampingan = $this->model
                        ->where('semester_id', $this->current_semester)
                        ->where('date', $item['date'])
                        ->where('schedule_student_id', $item['schedule_student_id'])
                        ->get();
                    if(!empty($pendampingan) && strtolower($pendampingan['volunteer_status']) == 'hadir'){
                        continue;
                    }

                    $volunteer = $this->findFreeVolunteer($item['date'], $max_freq_accompanisment, $item);

                    //jika ketemu
                    if (!empty($volunteer)) {
                        $data = array(
                            "semester_id" => $this->current_semester,
                            "schedule_student_id" => $item['schedule_student_id'],
                            "volunteer_id" => $volunteer['student_id'],
                            "date" => $item['date'],
                            "updated_at" => date("Y-m-d H:i:s")
                        );
                        if(!empty($pendampingan)){
                            if(empty($pendampingan['code_attending'])){
                                $data['code_attending'] = random_int(100000,900000);
                            }
                            $this->pendampingan_model->update($pendampingan['accompaniment_id'], $data);
                        }else {
                            $data['student_status'] = "terjadwal";
                            $data['volunteer_status'] = "terjadwal";
                            $data['code_attending'] = random_int(100000,900000);
                            $data['created_at'] = date("Y-m-d H:i:s");
                            $this->pendampingan_model->insert($this->pendampingan_model->table_name, $data);
                        }
                    } else {
                        $not_found++;
                    }
                }
            }
            else {
                $data_jadwal_difabel = $this->jadwal_difabel_model
                    ->where('semester_id', $this->current_semester)
                    ->where('schedule_type', $form_data['schedule_type'])
                    ->where('date IS NULL')
                    ->where('approver_id IS NOT NULL')
                    ->order_by('IF(volunteer_id IS NOT NULL, "1", "0") desc')
                    ->order_by('start_at ASC, day ASC, date ASC')
                    ->gets_view($this->jadwal_difabel_model->table_view_name);

                //loop date
                foreach ($tab_data as $index_tab => $item_tab) {
                    $currentDate = $item_tab['start_at'];
                    while (true) {
                        //find volenteer
                        foreach ($data_jadwal_difabel as $key => $item) {
                            //skip ketika tidak ada hari yg dimaksud dalam looping
                            if (date("w", strtotime($currentDate)) != $item['day']) {
                                continue;
                            }

                            $pendampingan = $this->model
                                ->where('semester_id', $this->current_semester)
                                ->where('date', $currentDate)
                                ->where('schedule_student_id', $item['schedule_student_id'])
                                ->get();
                            if(!empty($pendampingan) && strtolower($pendampingan['volunteer_status']) == 'hadir'){
                                continue;
                            }

                            $volunteer = $this->findFreeVolunteer($currentDate, $max_freq_accompanisment, $item);

                            //jika ketemu
                            if (!empty($volunteer)) {
                                $data = array(
                                    "schedule_student_id" => $item['schedule_student_id'],
                                    "semester_id" => $this->current_semester,
                                    "volunteer_id" => $volunteer['student_id'],
                                    "date" => $currentDate,
                                    "updated_at" => date("Y-m-d H:i:s")
                                );

                                if(!empty($pendampingan)){
                                    if(empty($pendampingan['code_attending'])){
                                        $data['code_attending'] = random_int(100000,900000);
                                    }
                                    $this->pendampingan_model->update($pendampingan['accompaniment_id'], $data);
                                } else {
                                    $data['student_status'] = "terjadwal";
                                    $data['volunteer_status'] = "terjadwal";
                                    $data['code_attending'] = random_int(100000,900000);
                                    $data['created_at'] = date("Y-m-d H:i:s");
                                    $this->pendampingan_model->insert($this->pendampingan_model->table_name, $data);
                                }
                            } else {
                                $not_found++;
                            }
                        }

                        $currentDate = date("Y-m-d", strtotime("+1 day", strtotime($currentDate)));
                        if ($currentDate > $item_tab['end_at']) {
                            break;
                        }
                    }
                }
            }

            redirect('/admin/pendampingan?semester_id='.$this->current_semester.'&type=hari&schedule_type='.$form_data['schedule_type'].'&date='.$tab_data[array_keys($tab_data)[0]]['start_at'], 'refresh');
        }
	}

    private function findFreeVolunteer($currentDate, $max_freq_accompanisment, $item){
        $volenteer = $this->pendampingan_model->get_free_volunteer(array(
            "semester_id" => $this->current_semester,
            "date" => $currentDate,
            "day" => $item['day'],
            "start_at" => $item['start_at'],
            "end_at" => $item['end_at'],
            "prior_volunteer_id" => (isset($item["volunteer_id"]) ? $item["volunteer_id"] : (isset($item["volunteer_id_prior"]) ? $item["volunteer_id_prior"] : null)),
            "prior_majors_id" => $item["majors_id"],
            "prior_faculty_id" => $item["faculty_id"],
            "prior_majors_focus" => $item["majors_focus"],
            "limit_count_accompaniment" => $max_freq_accompanisment,
            "pick_one" => true
        ));
        return $volenteer;
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
				$this->model->delete(array('date >=' => $form_data['start_at'], 'date <=' => $form_data['end_at']));
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
				'day_custom' 	=> '$item["day"] === null ? $this->meta_data["data_hari"][date("w", strtotime($item["date"]))] : $this->meta_data["data_hari"][$item["day"]]',
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

		$day = date('w', strtotime($date));
        $max_freq_accompanisment = $this->option_model->get_value('max_frequensi_accompaniment');

        $volenteers = $this->pendampingan_model->get_free_volunteer(array(
            "semester_id"=>$this->current_semester,
            "date"=>$date,
            "day"=>$day,
            "start_at"=>$data['start_at'],
            "end_at"=>$data['end_at'],
            "prior_majors_focus" => $data["majors_focus"],
            "prior_majors_id" => $data["majors_id"],
            "prior_faculty_id" => $data["faculty_id"],
            "limit_count_accompaniment"=>$max_freq_accompanisment
        ));
		$volunteer_data = array();

        foreach ($volenteers as $item){
            $volunteer_data[$item['student_id']] = $item['name'] . " (".$item['majors_name'].")";
        }

        $this->fcontrol->set_meta_data('volunteer_data', $volunteer_data);
        $this->volunteer_data = $volunteer_data;
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
            $post['accompaniment_id'] = $id;
            $post['volunteer_status'] = 'terjadwal';
            if(!empty($this->input->get("permit"))){
                $post['permit_id'] = $this->input->get("permit");
            }
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
			$data_form = elements(array('volunteer_id', 'volunteer_status', 'note'), $post);
			$this->model->update($post['accompaniment_id'], $data_form);

            if(!empty($post['permit_id'])){
                $post['status'] = 'diterima';
                $data_form_permit_accept = elements(array('new_volunteer_id', 'status'), $post);
                $this->load->model($this->group . 'izin/izin_model');
                $this->izin_model->update($post['permit_id'], $data_form_permit_accept);
            }
			$this->set_message('Data Perubahan pendampingan telah berhasil disimpan', 'success');
			$this->redirect($this->module_main . '?date=' . $post['date']);
		}
	}

    public function cancel($id = null)
    {
        $data_pendampingan = $this->model->where('semester_id', $this->current_semester)->get($id);
        if ($data_pendampingan === false || $id === false) {
            $this->set_message('Data jadwal pendampingan tidak ditemukan tidak ditemukan.');
            $this->redirect($this->module_main);
        }

        if(!empty($post['permit_id'])){
            $this->errors[] = "Izin tidak boleh kosong";
        } else {
            $post = $this->input->post();
            $post['semester_id'] = $this->current_semester;
            $post['schedule_student_id'] = $data_pendampingan['schedule_student_id'];
            $post['date'] = $data_pendampingan['date'];
            $post['accompaniment_id'] = $id;
            $post['volunteer_status'] = 'terjadwal';
            $post['student_status'] = 'izin';
            if(!empty($this->input->get("permit"))){
                $post['permit_id'] = $this->input->get("permit");
            }
            $this->param['post'] = $post;

            $data_form = elements(array('student_status'), $post);
            $this->model->update($post['accompaniment_id'], $data_form);

            $post['status'] = 'diterima';
            $data_form_permit_accept = elements(array('status'), $post);
            $this->load->model($this->group . 'izin/izin_model');
            $this->izin_model->update($post['permit_id'], $data_form_permit_accept);

            $this->set_message('Izin pendampingan telah berhasil disimpan', 'success');
            $this->redirect("izin");
        }
    }
}
