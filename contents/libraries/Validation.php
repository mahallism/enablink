<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Validation {
    public $message_errors = array(
        'have'      => '[field_name] harus diisi',
        'required'  => '[field_name] tidak boleh kosong',
        'matches'   => '[field_name] harus sama dengan [field_target]',
    );

	public $suffix = "";
	public $rules;
	public $single_rules = false;
    public $validate_data;

    public $data = array();
    public $value = true;
    public $errors = array();

    public function set_suffix($suffix)
    {
        $this->suffix = $suffix;
        return $this;
    }
    public function prepar($data, $rule)
    {
        $this->validate_data = $data;
        $this->data = array();
        $this->value = true;
        $this->errors = array();
        $rules = array_slice(func_get_args(), 1);
        if (count($rules) == 1) {
            $this->single_rules = true;
            $rules = $rules[0];
        }
        $this->rules = $rules;
        return $this;
    }

    public function run()
    {
        if ($this->single_rules) {
            $this->data = $this->do_validation($this->rules);
        }else{
            foreach ($this->rules as $item) {
                $this->data[] = $this->do_validation($item);
            }
        }
        return $this->value;
    }

    private function do_validation($rules)
    {
        $new_data = array();
        foreach ($rules as $field => $rule) {
            if ($rule === array()) {
                $new_data[$field] = isset($this->validate_data[$field]) ? $this->validate_data[$field] : false;
            }else{
                if (isset($rule[1]) && !empty($rule[1])) {
                    foreach ($rule[1] as $key => $value) {
                        if (is_int($key)) {
                            $new_data[$field] = $this->{$value}($field, $rule[0]);
                        }else{
                            $new_data[$field] = $this->{$key}($field, $rule[0], $value);
                        }
                        if (!$this->value) break;
                    }
                }
                else if(!empty($this->validate_data[$field])) {
                    $new_data[$field] = $this->validate_data[$field];
                }
            }
        }
        return $new_data;
    }

    // item validation
    private function trim($field, $field_name)
    {
        if (isset($this->validate_data[$field])) {
            $this->validate_data[$field] = trim($this->validate_data[$field]);
            return $this->validate_data[$field];
        }
        return false;
    }

    private function have($field, $field_name)
    {
        $temp = isset($this->validate_data[$field]);
        $this->value = $this->value && $temp;
        if (!$temp) {
            $this->errors[$field] = str_replace('[field_name]', $field_name, $this->message_errors['have']) . $this->suffix . '.';
            return false;
        }
        return $this->validate_data[$field];
    }

    private function required($field, $field_name)
    {
        $temp = isset($this->validate_data[$field]) && $this->validate_data[$field];
        $this->value = $this->value && $temp;
        if (!$temp) {
            $this->errors[$field] = str_replace('[field_name]', $field_name, $this->message_errors['required']) . $this->suffix . '.';
            return false;
        }
        return $this->validate_data[$field];
    }
    private function matches($field, $field_name, $param)
    {
        $temp = isset($this->validate_data[$field]) && isset($this->validate_data[$param[0]]) && $this->validate_data[$field] == $this->validate_data[$param[0]];
        $this->value = $this->value && $temp;
        if (!$temp) {
            $this->errors[$field] = str_replace('[field_name]', $field_name, $this->message_errors['matches']) . $this->suffix . '.';
            $this->errors[$field] = str_replace('[field_target]', $param[1], $this->errors[$field]);
            return false;
        }
        return $this->validate_data[$field];
    }
}

?>
