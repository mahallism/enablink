<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends Aplego_Controller {
	public function index()
	{
		if ($data = current_user_session()) {
			$this->user_model->protected_page($this->user_group['member'], true, true);
			$this->redirect('dashboard');
		}else{
			$this->load->view('landingpage');
// 			$this->redirect('user/login');
		}
	}
	
	public function send_message()
	{
		if ($post = $this->input->post()) {
			$form_valid = true;
			if ($post['name'] === '' || $post['email'] === '' || $post['message'] === '') {
				// $this->errors[] = 'Pastikan anda mengisi semua form.';
					$this->session->set_flashdata('error', '<div class="alert alert-warning" role="alert">
  Pastikan anda mengisi semua form.</div>');
				$form_valid = false;
				$this->redirect('/#pesan');
			}

			if ($form_valid !== false) {
				
				$app_name = $this->config->item('app_name');
				$subject = 'Pesan Masuk dari - ' . $post['name'];
				$message = 'Selamat pagi, <br><br> anda mendapat pesan dari : ' . $post['name'] . '<br> dengan email : ' . $post['email'] . '<br>. Pesannya sebagai berikut : <br> ' . $post['message'] . '<br>';
				if ($this->send_email('hallo@enablink.id', $subject, $message) === false) {
					$this->session->set_flashdata('error', '<div class="alert alert-warning" role="alert">
  Maaf, pesan anda gagal dikirim. Mohon untuk mencoba kembali.</div>');
				// 	$this->errors[] = 'Maaf, pesan anda gagal dikirim. Mohon untuk mencoba kembali.';
					$this->redirect('/#pesan');
				}else{
				// 	$this->set_message('Pesan anda berhasil terkirim. Kami akan menghubungi anda secepatnya.', 'success');
					$this->session->set_flashdata('success', '<div class="alert alert-primary" role="alert">
  Pesan anda berhasil terkirim. Kami akan menghubungi anda secepatnya </div>');
					$this->redirect('/#pesan');
				}
			}
		}
		

// 		$this->title = 'Send Message';
// 		$this->build('send-message');
	}

	protected function send_email($to, $subject, $message)
	{
		$config = [
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'protocol'  => 'smtp',
			'smtp_host' => getenv('MAIL_SMTP_HOST'),
			'smtp_port' => getenv('MAIL_SMTP_PORT'),
			'smtp_user' => getenv('MAIL_SMTP_USER'),
			'smtp_pass' => getenv('MAIL_SMTP_PASS'),
			'crlf'      => "\r\n",
			'newline'   => "\r\n"
		];

		$this->load->library('email', $config);
		$this->email->from(getenv('MAIL_SENDER_EMAIL'), getenv('MAIL_SENDER_NAME'));
		$this->email->to($to);
		$this->email->subject($subject);
		$this->email->message($message);
		return $this->email->send();
	}
}
