<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends Subsystem_Controller {
	protected $protected_page = array(
		'index' 	=> 'member',
	);

	protected $list_field_difabel_jadwal  	= array(
		'field' 	=> array(
			'day' 			=> 'Hari dan tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Pendamping',
            'code_attending'=> 'Kode Pendamping',
			'volunteer_status' => 'Status Pendamping',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? $this->meta_data["data_hari"][date("w", strtotime($item["date"]))] : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'fakultas_jurusan' 	=> '"<div><small>{$item["volunteer_faculty_name"]} - {$item["volunteer_majors_name"]}</small></div>"',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"])',
			'pendamping' 	=> '$item["volunteer_name"] . " <small class=\"text-muted\">({$item["volunteer_nick_name"]})</small>".$item["fakultas_jurusan"].$item["volunteer_no_hp"]',
			'volunteer_status' => '$item["volunteer_status"] === null ? "Sedang Dijadawalkan" : ucwords($item["volunteer_status"])',
		),
	);

	protected $list_field_volunteer_jadwal = array(
		'field' 	=> array(
			'day' 			=> 'Hari dan tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Mahasiswa Difabel',
			'student_status' => 'Status',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? $this->meta_data["data_hari"][date("w", strtotime($item["date"]))] : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'fakultas_jurusan' 	=> '"<div><small>{$item["faculty_name"]} - {$item["majors_name"]}</small></div>"',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"])',
			'pendamping' 	=> '$item["name"] . " <small class=\"text-muted\">({$item["nick_name"]})</small>".$item["fakultas_jurusan"].$item["no_hp"]',
			'student_status' => '$item["student_status"] === null ? "Sedang Dijadawalkan" : ucwords($item["student_status"])',
		),
	);

	protected $list_field_difabel_pendampingan  = array(
		'field' 	=> array(
			'day' 			=> 'Hari dan tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Pendamping',
			'volunteer_status' => 'Status',
			'review_mc' 	=> 'Review',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === null ? $this->meta_data["data_hari"][date("w", strtotime($item["date"]))] : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"])',
			'pendamping' 	=> '$item["volunteer_name"] . " <small class=\"text-muted\">({$item["volunteer_nick_name"]})</small>"',
			'volunteer_status' => '$item["volunteer_status"] === null ? "Dijadawalkan" : ucwords($item["volunteer_status"])',
			'review' 		=> '$item["review"] === null ? 0 : ucwords($item["review"])',
			'review_mc' 	=> '$this->meta_data["data_star"][$item["review"]]',
		),
	);

	protected $list_field_volunteer_pendampingan = array(
		'field' 	=> array(
			'day' 			=> 'Hari dan tanggal',
			'jam' 			=> 'Jam',
			'room' 			=> 'Ruang',
			'courses' 		=> 'Mata Kuliah',
			'pendamping' 	=> 'Mahasiswa Difabel',
			'student_status' => 'Status',
			'review_mc' 	=> 'Review',
		),
		'custom' 	=> array(
			'jam'			=> '$item["start_at"] === null ? "" : time_html($item["start_at"]) . " - " . time_html($item["end_at"])',
			'day_custom' 	=> '$item["day"] === $this->meta_data["data_hari"][date("w", strtotime($item["date"]))] ? "" : $this->meta_data["data_hari"][$item["day"]]',
			'day_label' 	=> '"<span class=\"hide\">{$item["day"]}</span>" . $item["day_custom"]',
			'day' 			=> '"<span class=\"hide\">{$item["date"]}</span>" . $item["day_custom"] . ", " . date_html($item["date"])',
			'pendamping' 	=> '$item["name"] . " <small class=\"text-muted\">({$item["nick_name"]})</small>"',
			'student_status' => '$item["student_status"] === null ? "Dijadawalkan" : ucwords($item["student_status"])',
			'review' 		=> '$item["review"] === null ? 0 : ucwords($item["review"])',
			'review_mc' 	=> '$this->meta_data["data_star"][$item["review"]]',
		),
	);
	protected $list_field_pergantian = array(
        'field' => array(
            'pengaju'         => 'Pengaju',
            'waktu_pengajuan' => 'Waktu Pengajuan',
            'mulai' =>'Mulai',
			'selesai' =>'Selesai',
            'atas_nama'       => 'Atas Nama',
			'tanggal'=>'Tanggal',
			'respon' => 'Respon'
            
        ),
        'custom' => array(
            'tanggal' => 'date("l, d F Y", strtotime($item["tanggal"]))',
	
        ),
    );

	public function __construct()
	{
		parent::__construct('member');
		
		$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
		$this->load->model('/admin/Pendampingan/Pendampingan_model', 'Accompaniment_model');
		$this->load->model($this->admin_group.'pendampingan/pendampingan_model','pendampingan_model');
		$this->load->model($this->admin_group.'izin/izin_model');

		$data_hari = $this->config->item('data_hari');
		$this->aquery->set_meta_data('data_hari', $data_hari);

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

	public function index()
	{
		$this->title = 'Dashboard';
		$this->active_menu = 'dashboard';

        $this->param['capability'] = $this->capability;
		if ($this->capability === 'difabel') {
			$fun_where_pendampingan = 'prepar_difabel';
			$field_jadwal = $this->list_field_difabel_jadwal;
			$field_pendampingan = $this->list_field_difabel_pendampingan;
		}else{
			$field_jadwal = $this->list_field_volunteer_jadwal;
			$field_pendampingan = $this->list_field_volunteer_pendampingan;
			$fun_where_pendampingan = 'prepar_volunteer';
		}

		//$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');//
		//$this->load->model('/admin/Pendampingan/Pendampingan_model', 'Accompaniment_model');
		//$this->load->model($this->admin_group.'pendampingan/pendampingan_model','pendampingan_model');
		//$this->load->model($this->admin_group.'izin/izin_model');



		$this->Accompaniment_model->set_student_id($this->user_data['student_id']);
		$this->Accompaniment_model->set_semester_id($this->current_semester);
		$this->Accompaniment_model->$fun_where_pendampingan();
		$count_jadwal = $this->Accompaniment_model
			->get_count('app_accompaniment_view');

		$this->izin_model->set_student_id($this->user_data['student_id']);
		$this->izin_model->set_semester_id($this->current_semester);
		$this->izin_model->$fun_where_pendampingan();
		$count_izin = $this->izin_model
			->get_count();

		$this->Accompaniment_model->set_student_id($this->user_data['student_id']);
		$this->Accompaniment_model->set_semester_id($this->current_semester);
		$this->Accompaniment_model->$fun_where_pendampingan();
		$count_pendamping = $this->Accompaniment_model
			->where('volunteer_status', "Selesai")
			->get_count('app_accompaniment_view');

        $this->param['semester'] = $this->semester;
		$this->param['data_count'] = array(
			'jadwal'	=> $count_jadwal,
			'izin'		=> $count_izin,
			'pendampingan'	=> $count_pendamping
		);

		if (date('w' === '0')) {
			$start_at = date('Y-m-d', strtotime('monday this week'));
			$end_at = date('Y-m-d');
		}elseif (date('w' === '6')){
			$start_at = date('Y-m-d', strtotime('next monday'));
			$end_at = date('Y-m-d', strtotime('sunday this week'));
		}else{
			$start_at = date('Y-m-d', strtotime('monday this week'));
			$end_at = date('Y-m-d', strtotime('sunday this week'));
		}
		
		$this->param['field_jadwal'] = $field_jadwal['field'];
		$this->Accompaniment_model->set_student_id($this->user_data['student_id']);
		$this->Accompaniment_model->set_semester_id($this->current_semester);
		$this->Accompaniment_model->$fun_where_pendampingan();
		$data_jadwal = $this->Accompaniment_model->gets_view();
		$jadwal_minggu_ini = [];
		foreach($data_jadwal as $item){
			if($item['date'] <$start_at ||$item['date'] > $end_at ){
				
				continue;
			}
			$jadwal_minggu_ini[] = $item;
		}

		$this->param['data_jadwal'] = $this->aquery->prepar($jadwal_minggu_ini)
			->add_column($field_jadwal['custom'])
			->gets();
			

			$field_pergantian = $this->list_field_pergantian;//
			$this->param['field_ajuan'] = $field_pergantian['field']; // 
			$data_pergantian = $this->Volunteer_model->where("s_penerima = '{$this->user_data['user_id']}' AND respon = 'Menunggu Respon'", null, false)->gets_view();
			$this->param['data_pergantian'] = $this->aquery->prepar($data_pergantian)
			->add_column($field_pergantian['custom'])
			->gets();
			

		$this->param['field_pendampingan'] = $field_pendampingan['field'];
		$this->Accompaniment_model->set_student_id($this->user_data['student_id']);
		$this->Accompaniment_model->set_semester_id($this->current_semester);
		$this->Accompaniment_model->$fun_where_pendampingan();

		if ($this->capability === 'difabel') {
			$this->pendampingan_model->where('volunteer_status', "Selesai");
		}else{
			$this->pendampingan_model->where('student_status', "Selesai");
		}

		$data_pendampingan = $this->Accompaniment_model->where('date >=', $start_at)->where('date <=', $end_at)->gets_view();
		$this->param['data_pendampingan'] = $this->aquery->prepar($data_pendampingan)
			->add_column($field_pendampingan['custom'])
			->gets();
			// echo '<pre>';
			// echo "Start at: $start_at<br>End at: $end_at<br>";;
			// echo '</pre>';
			//exit;

		if ($this->capability === 'volunteer') {
			$arg_where = array(
				'volunteer_id' 	=> $this->user_data['student_id'],
				'semester_id' 	=> $this->current_semester,
			);

			$data_grafik_pendampingan = $this->Accompaniment_model->where($arg_where)->gets_view('app_chart_accompainiment_volunteer_view');
			$this->param['data_grafik_pendampingan'] = $data_grafik_pendampingan;
		}
		$this->build('dashboard');
	}

    function present(){
        if(empty($_POST) || empty($_POST['accompaniment_id']) || empty($_POST['code_attending'])){
            $this->set_message('Parameter tidak sesuai.', 'warning');
            $this->redirect('dashboard');
        }

        $this->load->model($this->admin_group.'pendampingan/pendampingan_model','pendampingan_model');
		// $this->load->model('/admin/Pendampingan/Pendampingan_model', 'Accompaniment_model');
        $pendampingan = $this->Accompaniment_model->where('accompaniment_id', $_POST['accompaniment_id'])->get();
        if($pendampingan['volunteer_id'] != $this->user_data['student_id']){
            $this->set_message('User volunteer tidak sama.', 'warning');
            $this->redirect('dashboard');
        }
        if($pendampingan['code_attending'] != $_POST['code_attending']){
            $this->set_message('Kode kehadiran tidak sama.', 'warning');
            $this->redirect('dashboard');
        }

        $this->pendampingan_model->update($_POST['accompaniment_id'], array('volunteer_status'=>'Hadir'));
        $this->set_message('Kehadiran dikonfirmasi.', 'success');
        $this->redirect('dashboard');
    }

    function review(){
        if(empty($_POST) || empty($_POST['accompaniment_id']) || !isset($_POST['review'])){
            $this->set_message('Parameter tidak sesuai.', 'warning');
            $this->redirect('dashboard');
        }

        $this->load->model($this->admin_group.'pendampingan/pendampingan_model');
        $this->load->model($this->admin_group.'jadwal/jadwal_difabel_model');
        $pendampingan = $this->pendampingan_model->where('accompaniment_id', $_POST['accompaniment_id'])->get();
        $jadwal = $this->jadwal_difabel_model->where('schedule_student_id', $pendampingan['schedule_student_id'])->get();
        if($jadwal['student_id'] != $this->user_data['student_id']){
            $this->set_message('User Madif tidak sama.', 'warning');
            $this->redirect('dashboard');
        }

        $this->pendampingan_model->update($_POST['accompaniment_id'], array(
            'review'=>$_POST['review'],
            'review_note'=>$_POST['review_note']
        ));
        $this->set_message('Review berhasil disimpan dikonfirmasi.', 'success');
        $this->redirect('dashboard');
    }
}
