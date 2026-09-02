<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Input extends CI_Input {
    function get($index = null, $xss_clean = TRUE)
    {
        return parent::get($index, $xss_clean);
    }

    function post($index = null, $xss_clean = TRUE)
    {
        return parent::post($index, $xss_clean);
    }

}
