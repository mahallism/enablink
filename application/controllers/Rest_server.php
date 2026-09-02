<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Rest_server extends Aplego_Controller {

    public function index()
    {
        $this->load->helper('url');
        $this->load->helper('session');

        $this->load->view('rest_server');
    }
}
