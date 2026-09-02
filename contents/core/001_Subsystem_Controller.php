

<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subsystem_Controller extends Aplego_Controller {
	protected $folder_view = '';

    protected $middleware = false;

    public function __construct($subsystem = false)
    {
        parent::__construct();

        if ($subsystem === false) {
        	$this->default_subsystem();
        }else{
        	$param = func_get_args();
            $this->$subsystem($param);
        }
    }

    protected function default_subsystem()
    {
        $this->group = $this->config->item('default_subsystem').'/';
        $this->user_model->group = $this->group;

        $this->protected_page();
        
        $this->load->config('admin');

        $this->param_header = array(
            'group'         => $this->group,
            'user_group'    =>& $this->user_group,
            'active_menu'   => function($active_menu, $echo = true){
                if (is_array($active_menu) && in_array($this->active_menu, $active_menu) || $active_menu == $this->active_menu) {
                    if ($echo) echo " active";
                    else return true;
                }
                if (!$echo) return false;
            },
        );
        $this->param = $this->param_header;
        
        $this->current_semester = $this->option_model->get_value('current_semester');
    }

    protected function member($args)
    {
        $this->group = '';
        $this->user_model->group = $this->group;
        if (isset($this->load_model)) {
            $this->protected_page = array_merge($this->protected_page, array(
                'index'     => 'member',
                'input'     => 'member',
                'edit'      => 'member',
                'duplicate' => 'member',
                'delete'    => 'member',
                'detail'    => 'member',
                'field'     => 'denied',
            ));
        }

        $this->protected_page();
        $this->load->config('member');

        // prepar to member data
        $this->capability = $this->user_model->current_user_session('capability');
        $this->user_data = $this->user_model->current_user_session();
        $this->admin_group = $this->config->item('admin_module') . '/';

        $this->load->model($this->admin_group.'active/mahasiswa_active_model');

        $this->current_semester = $this->option_model->get_value('current_semester');
        $this->load->model("admin/semester/semester_model");
        $this->semester = $this->semester_model->get($this->current_semester);

        $this->data_active = false;
        if ($this->user_data !== array()) {
            $this->data_active = $this->mahasiswa_active_model
                ->where('student_id', $this->user_data['student_id'])
                ->where('semester_id', $this->current_semester)
                ->get();
        }

        $this->load->config('member');
        
        $this->param_header = array(
            'group'         => $this->group,
            'user_group'    =>& $this->user_group,
            'active_menu'   => function($active_menu, $echo = true){
                if (is_array($active_menu) && in_array($this->active_menu, $active_menu) || $active_menu == $this->active_menu) {
                    if ($echo) echo " active";
                    else return true;
                }
                if (!$echo) return false;
            },
        );
        
        $this->param = $this->param_header;
        $this->param['data_active'] =& $this->data_active;
        $this->param['is_difabel'] = $this->capability === 'difabel';

        $this->folder_view = 'member/';
        if (isset($this->load_model)) {
            $this->folder_view_base = 'member/';
            if ($this->load_model === true) {
                $this->load_model = false;
                $model_name = $this->module_main.'_model';
                $full_model_name = $this->admin_group.$this->module_main.'/'.$model_name;
                $this->load->model($full_model_name);
                $this->model =& $this->$model_name;
            }
        }
    }
}