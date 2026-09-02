<?php
(defined('BASEPATH')) OR exit('No direct script access allowed');

global $CFG;

$CFG->load(APLEGO_OFFSET. '/config/config');

/* load the MX_Router class */

require APPPATH."third_party/MX/Router.php";

class MY_Router extends MX_Router{
    protected function _set_default_controller()
    {
        if ($this->uri->uri_string != '') {
            $this->_set_404override_controller();
            return;
        }

        global $CFG;
        $route = $CFG->item('route');

        if (isset($route) && is_array($route)){
            isset($route['default_controller']) && $this->default_controller = $route['default_controller'];
            isset($route['translate_uri_dashes']) && $this->translate_uri_dashes = $route['translate_uri_dashes'];
            unset($route['default_controller'], $route['translate_uri_dashes']);
            $this->routes = $route;
        }

        parent::_set_default_controller();
    }

    protected function _set_404override_controller(){
        global $CFG;
        $route = $CFG->item('route');

        if (isset($route) && is_array($route)){
            isset($route['404_override']) && $this->routes['404_override'] = $route['404_override'];
            unset($route);
        }

        parent::_set_404override_controller();
    }
}
