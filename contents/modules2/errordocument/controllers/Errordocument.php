<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Errordocument extends MX_Controller {

	public function show()
	{
		$status_code = http_response_code();
		if ($status_code == 403) {
			 show_error("You don't have permission to access.", $status_code, "403 Forbidden");
		}else{
			show_404();
		}
	}
}