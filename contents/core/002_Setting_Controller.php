<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Setting_Controller extends Subsystem_Controller {

    protected $form_size = 'lg';

	protected function setting($module, $rules, $rules_form)
	{
        $data = $this->option_model->gets_in(array_keys($rules));

        $this->param['post'] = $data;
        if ($post = $this->input->post()) {
            $this->do_setting($post, $rules);
            $this->param['post'] = array_merge($this->param['post'], $post);
        }

        $this->fcontrol->set_data($this->param['post'])->init($rules_form)->generate();
        
        $this->title = "Setting " . ucwords($module);
        $this->active_menu = 'setting_'.$module;
        $this->param['size'] = $this->form_size;
        $this->param['module_name'] = $module;
        $this->build('setting');
	}

    protected function do_setting($post, $rules)
    {
        $this->validation->prepar($post, $rules);

        if ($this->validation->run() === false) {
            $this->errors = $this->validation->errors;
            $this->param['post'] = array_merge($data, $post);
        }else{
            foreach ($this->validation->data as $key => $value) {
                if ($this->option_model->check_isset('option_key', $key)) {
                    $this->option_model->update(array(
                        'option_key'   => $key,
                    ), array(
                        'option_value' => $value,
                    ));
                }else{
                    $this->option_model->create(array(
                        'option_key'   => $key,
                        'option_value' => $value,
                    ));
                }
            }

            $this->set_message('Data setting berhasil diubah.', 'success');
            $this->refresh();
        }
    }
}
