<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pergantian_volunteer extends App_Controller
{
	protected $module_main = 'pergantian_volunteer';
	protected $module_name = 'pergantian_volunteer';
	protected $gets_view = true;

	public function notify($email, $message)
	{
		$config = [
			'protocol' => 'smtp',
			'smtp_host' => 'smtp.gmail.com',
			'smtp_port' => 465,
			'smtp_user' => 'bappakau69@gmail.com',
			'smtp_pass' => 'mddiibfxlijcpzpt',
			'mailtype' => 'html',
			'charset' => 'utf-8',
			'smtp_crypto' => 'ssl',
			'newline' => "\r\n",
			'crlf' => "\r\n",
			'wordwrap' => TRUE

		];
		$this->load->library('email', $config);
		$this->email->from('bappakau69@gmail.com', 'Enablink');
		$this->email->to($email);
		$this->email->subject('Ajuan Jadwal Pendampingan');
		$this->email->message($message);

		if ($this->email->send()) {
			echo '✅ Email berhasil dikirim!';
		} else {
			echo '❌ Email gagal dikirim:<br><pre>';
			print_r($this->email->print_debugger());
			echo '</pre>';
		}

	}

	protected $list_field_pergantian = array(
		'field' => array(
			'pengaju' => 'Pengaju',
			'waktu_pengajuan' => 'Waktu Pengajuan',
			'mulai' => 'Mulai',
			'selesai' => 'Selesai',
			'atas_nama' => 'Atas Nama',

		),
		'custom' => array(

		),
	);




	public function get_Available()
	{
		try {
			$hari = $this->input->post('hari');
			$mulai = $this->input->post('mulai');
			$selesai = $this->input->post('selesai');
			$id = $this->input->post('id');
			$fakultas = $this->input->post('fakultas');
			$user_id = $this->input->post('user_id');
			$tanggal = $this->input->post('tanggal');

			$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');

			$tanggalJadwal= date("l, d F Y", strtotime($tanggal));
			$data['recom'] = $this->Volunteer_model->get_Available($hari, $mulai, $selesai, $id, $tanggal);
			$data['user_id'] = $user_id;
			$data['jadwal'] = [$tanggalJadwal, $mulai, $selesai];

			usort($data['recom'], function ($a, $b) use ($fakultas) {
				$a_match = ($a->faculty_name == $fakultas) ? 1 : 0;
				$b_match = ($b->faculty_name == $fakultas) ? 1 : 0;
				return $b_match - $a_match ?: strcmp($a->name, $b->name);
			});

				$html = $this->load->view('recomended-list', $data, TRUE);
				//$html = $this->build('recomended-list', $data, TRUE);
				echo $html;
			
		} catch (Exception $e) {
			echo 'Terjadi kesalahan: ' + $e->getMessage();
		}
	}

	public function cari()
	{
		try {
			$param = $this->input->post('nama');
			$id = $this->input->post('id');
			$user_id = $this->input->post('user_id');
			$this->load->model('/admin/Pendampingan/Pendampingan_model', 'Accompaniment_model');
			$loaded['data'] = $this->Accompaniment_model->where(
				'accompaniment_id = ',
				$id
			)->gets_view();
			$utils = $loaded['data'][0];
			$tanggalJadwal= date("l, d F Y", strtotime($utils['date']));
			$data['jadwal'] = [$tanggalJadwal, $utils['start_at'], $utils['end_at']];

			$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
			$data['recom'] = $this->Volunteer_model->get_volunteer($param, $id);
			$data['user_id'] = $user_id;

			if (!empty($data['recom'])) {
				$html = $this->load->view('recomended-list', $data, TRUE);
				echo $html;
			} else {
				$html = $this->load->view('recomended-list', $data, TRUE);
				echo $html;
				echo 'Tidak ada volunteer dengan nama tersebut.';
			}

		} catch (Exception $e) {
			echo 'Terjadi kesalahan: ' + $e->getMessage();
		}
	}



	public function testConnection()
	{
		$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
		$data['volunteers'] = $this->Volunteer_model->get_volunteer('volunteer1', 1231); // Mengambil data dari model

		// Cek apakah data berhasil diambil
		if (!empty($data['volunteers'])) {
			echo "Sambungan berhasil! Data volunteer ditemukan:";
			print_r($data['volunteers']); // Tampilkan data
		} else {
			echo "Sambungan berhasil, tetapi tidak ada data volunteer ditemukan.";
		}
	}

	public function ajukan()
	{
		$pengaju = $this->input->post('pengaju');
		$id_jadwal = $this->input->post('id_jadwal');
		$penerima = $this->input->post('penerima');
		$email = $this->input->post('email');
		//$token = bin2hex(random_bytes(16));

		$this->load->model('/pergantian/pergantian_volunteer_model', 'Volunteer_model');

		$masukan = [
			's_jd_id' => $id_jadwal,
			's_pengaju' => $pengaju,
			's_penerima' => $penerima,
			'waktu_pengajuan' => date('Y-m-d H:i:s'),
			//'token' => $token
		];

		$insert = $this->Volunteer_model->create($masukan);


		if ($insert) {
			echo "Berhasil mengajukan pergantian volunteer.";
		} else {
			echo "Gagal mengajukan pergantian.";
			return false;
		}
		$this->load->model('/admin/Pendampingan/Pendampingan_model', 'Accompaniment_model');
		$loaded['data'] = $this->Accompaniment_model->where(
			'accompaniment_id = ',
			$id_jadwal
		)->gets_view();
		$utils = $loaded['data'][0];
		$tgl = date("l, d F Y", strtotime($utils['date']));
		$message = "
		<p>Halo Volunteers,</p>

<p>Kami ingin menginformasikan permintaan penggantian jadwal pendampingan dengan detail berikut:</p>

<ul>
    <li><strong>Nama:</strong> {$utils['name']} ({$utils['nick_name']})</li>
    <li><strong>Tanggal:</strong> {$tgl}</li>
    <li><strong>Waktu:</strong> {$utils['start_at']} - {$utils['end_at']}</li>
	<li><strong>Fakultas:</strong> {$utils['faculty_name']}</li>
    <li><strong>Lokasi:</strong> {$utils['room']}</li>
</ul>

<p>Mohon konfirmasi di <a href='https://enablink.ub.ac.id/'>enablink</a> apakah kamu bersedia menggantikan jadwal ini.</p>

<p>Terima kasih atas bantuan dan dedikasi kamu!</p>

		";

		$this->notify($email, $message);

	}

	// public function index($id = false)
	// {
	// 	$this->protected_page['confirm'] = 'member';
	// 	$this->list_field = $this->list_field_pergantian;
	// 	$this->filter();
	// 	parent::index($id);
	// }

	// protected function filter()
	// {
	// 	$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
	// 	$user_id = $this->user->id;  
	// 	$this->Volunteer_model->where('respon', NULL);

	// 	$this->param['data'] = $this->model->filter_by_penerima($user_id);
	// }

	public function terima()
	{
		try {
			$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
			$this->load->model('/admin/Pendampingan/Pendampingan_model', 'Accompaniment_model');

			$jadwal_id = $this->input->post('jadwal_id');
			$volunteer_id = $this->input->post('volunteer_id');
			$ajuan_id = $this->input->post('ajuan_id');
			if ($this->cekRespon($ajuan_id) == true) {
				$data1 = [
					'volunteer_id' => $volunteer_id
				];
				$where1 = [
					'accompaniment_id' => $jadwal_id
				];
				$this->Accompaniment_model->update($where1, $data1);


				$ajuan_id = $this->input->post('ajuan_id');
				$email_pengaju =  $this->input->post('email_pengaju');

				$data2 = [
					'respon' => 'Diterima',
					'waktu_respon' => date('Y-m-d H:i:s')
				];
				$where2 = [
					's_id' => $ajuan_id
				];
				$this->Volunteer_model->update($data2, $where2);
				$loaded['data'] = $this->Volunteer_model->where(
					's_id = ',$ajuan_id
				)->gets_view();
				$utils = $loaded['data'][0];
				$date = date("l, d F Y", strtotime($utils["tanggal"]));
				$message = "
				<p>Ajuan Anda untuk jadwal pada $date pada pukul {$utils['mulai']} - {$utils['selesai']} telah diterima oleh {$utils['penerima']}.</p>
				";
				//echo  $data2['respon'];
				echo 'success|Ajuan berhasil diterima, Silahkan cek Jadwal Pendampinganmu';
				$this->notify($email_pengaju, $message);
			} else {
				echo 'error|Ajuan telah ditarik oleh yang mengajukan';
				//redirect('/dashboard');
			}

		} catch (Exception $e) {

			echo 'error|' . $e->getMessage();
		}

	}
	public function tolak()
	{
		try {
			$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
			$ajuan_id = $this->input->post('ajuan_id');
			$email_pengaju =  $this->input->post('email_pengaju');

			if ($this->cekRespon($ajuan_id) == true) {
				$data = [
					'respon' => 'Ditolak',
					'waktu_respon' => date('Y-m-d H:i:s')
				];
				$where = [
					's_id' => $ajuan_id
				];
				$this->Volunteer_model->update($data, $where);
				$loaded['data'] = $this->Volunteer_model->where(
					's_id = ',
					$ajuan_id
				)->gets_view();
				$utils = $loaded['data'][0];
				$date = date("l, d F Y", strtotime($utils["tanggal"]));
				$message = "
				<p>Ajuan Anda untuk jadwal pada $date pada pukul {$utils['mulai']} - {$utils['selesai']} telah ditolak oleh {$utils['penerima']}. Terima kasih atas pengertiannya, dan jika ada hal yang ingin didiskusikan lebih lanjut, jangan ragu untuk menghubungi admin.</p>
				";
				echo 'success|Ajuan berhasil ditolak';
				$this->notify($email_pengaju, $message);
			} else {
				echo 'error|Ajuan telah ditarik oleh yang mengajukan';
			}

		} catch (Exception $e) {
			echo 'error|' . $e->getMessage();
		}
	}
	public function tarik()
	{
		try {
			$id = $this->input->post('id');
			$user = $this->input->post('user');
			$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
			if ($this->cekRespon2($id, $user) == true) {
				$data = [
					'respon' => 'Ditarik',
					'waktu_respon' => date('Y-m-d H:i:s')
				];
				$where = [
					's_jd_id' => $id,
					'respon' => 'Menunggu Respon'
				];
				$this->Volunteer_model->update($data, $where);
				$loaded['data'] = $this->Volunteer_model->where(
					's_jd_id = ',
					$id
				)->where('s_pengaju=', $user)
				->gets_view();
				$utils = $loaded['data'][0];
				$email_pengaju = $utils['email_penerima'];
				$date = date("l, d F Y", strtotime($utils["tanggal"]));
				$message = "
				<p>Ajuan untuk jadwal pada $date pada pukul {$utils['mulai']} - {$utils['selesai']} telah ditarik oleh {$utils['penerima']}. Terima kasih atas pengertiannya, dan jika ada hal yang ingin didiskusikan lebih lanjut, jangan ragu untuk menghubungi admin.</p>
				";
				echo 'success|Ajuan berhasil ditarik';
				$this->notify($email_pengaju, $message);
			} else {
				echo 'error|Ajuan telah direspon, cek kembali ';
			}

		} catch (Exception $e) {
			echo 'error|' . $e->getMessage();
		}

	}

	protected function cekRespon($id)
	{
		$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
		$this->db->where('s_id', $id);
		$this->db->where('respon', 'Menunggu Respon');
		$query = $this->db->get('app_pergantian');
		if ($query->num_rows() > 0) {
			return true;
		} else
			return false;
	}
	protected function cekRespon2($id, $user)
	{
		$this->load->model('pergantian/pergantian_volunteer_model', 'Volunteer_model');
		$this->db->where('s_jd_id', $id);
		$this->db->where('s_pengaju', $user);
		$this->db->where('respon', 'Menunggu Respon');
		$query = $this->db->get('app_pergantian');
		if ($query->num_rows() > 0) {
			return true;
		} else
			return false;
	}

	public function tes()
	{
		$this->load->model('/admin/jadwal/Jadwal_difabel_model', 'difabel_model');
		$active_ids = array_column(
			$this->difabel_model->where('deleted =', 'false')->gets(),
			'schedule_student_id'
		);
		print_r($active_ids);
	}


}



