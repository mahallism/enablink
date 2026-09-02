<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Fcontrol {
	public $base_input = array(
		'text', 
		'email',
		'password',
		'email',
		'number',
		'date',
		'time',
		'color',
		'range',
		'url',
	);

	public $meta_data = array();
	public $data = array();// form format data
	public $post = array();// value
	public $cursor = 'default';// cursor form control

	protected $defult_attr = array(
		'label' 		=> '',
		'value' 		=> '',
		'star_required' => false,
		'auto_filled' 	=> true,
		'required'		=> false,
		'class'			=> '',
		'info'			=> '',
		'group_text'	=> array(),
		'attr'			=> array(),
		'hide'			=> false,

	);
	protected $defult_input_attr = array(
		'base' => array(
			'base_type' 	=> 'text',
			'size' 			=> '',
			'placeholder' 	=> '',
		),
		'hidden' => array(),
		'textarea' => array(
			'placeholder' 	=> '',
			'size' 			=> '',
		),
		'radiobox' => array(
			'radiobox_data' => array(),
			'radiobox_type' => 'value', 	// value, key_value
			'radiobox_size' => 'col',
			'custom' 		=> false,
		),
		'checkbox' => array(
			'checkbox_data' 	=> array(),
			'checkbox_type' 	=> 'value', // boolean, value, key_value
			'checkbox_true_value' 	=> '1',	// boolean attr
			'checkbox_label' 	=> '',		// boolean attr
			'checkbox_size' 	=> 'col-12',
			'custom' 			=> false,
		),
		'select' => array(
			'size' 			=> '',
			'select_type' 	=> 'value', 	// value, key_value, group
			'multiple' 		=> false,
			'custom' 		=> false,
			'group_index' 	=> false, // group type
			'group_key' 	=> false, // group type
			'group_value' 	=> false, // group type
		),
		'file' => array(
			'multiple' 		=> false,
			'file_format' 	=> array(),
			'custom' 		=> false,
			'link_file' 	=> false,
		),
		'button' => array(
			'size' 			=> '',
			'button_type' 	=> 'button',
			'button_label' 	=> '',
			'button_color' 	=> 'secondary',
			'button_block' 	=> false,
			'button_icon' 	=> '',
		),
	);

	protected $default_layout_attr = array(
		'horizontal' => array(
			'label_size' 	=> 'col-sm-4',
			'input_size' 	=> 'col-sm-8',
		),
		'group' => array(
			'row_type' 		=> 'form-row', 	//form-row, row
			'column_size' 	=> 'col-sm-12',
			'input_size' 	=> 'col-sm-12',
		),
		'inline' => array(),
	);

	public $result = array();

	public function set_data(&$post)
	{
		$this->post = array_merge($this->post, $post);
		return $this;
	}

	public function init(&$data, $control_name = 'default', $form_layout = 'horizontal')
	{
		if (isset($this->default_layout_attr[$form_layout])) {
			$this->data[$control_name] = array(
				'form_layout' 	=> $form_layout,
				'data'			=> &$data,
			);
			$this->cursor = $control_name;
		}else{
			show_error("Failed form layout: {$form_layout}, use horizontal, group, or inline.");
			log_message('error', "Failed form layout: {$form_layout}.");
		}
		return $this;
	}

	public function set_meta_data($key, $value = false)
	{
		if (is_array($key)) {
			$this->meta_data = array_merge($this->meta_data, $key);
		}else{
			$this->meta_data[$key] =& $value;
		}
		return $this;
	}

	public function set_custom_input_all($custom_value = true)
	{
		$this->defult_input_attr['radiobox']['custom'] = $custom_value;
		$this->defult_input_attr['checkbox']['custom'] = $custom_value;
		$this->defult_input_attr['select']['custom'] = $custom_value;
		$this->defult_input_attr['file']['custom'] = $custom_value;
		return $this;
	}

	public function custom_input_attr($type, $key, $value = false)
	{
		if (is_array($key)) {
			$this->defult_input_attr[$type] = array_merge($this->defult_input_attr[$type], $key);
		}else{
			$this->defult_input_attr[$type][$key] = $value;
		}
		return $this;
	}

	public function custom_layout_attr($layout, $key, $value = false)
	{
		if (is_array($key)) {
			$this->default_layout_attr[$layout] = array_merge($this->default_layout_attr[$layout], $key);
		}else{
			$this->default_layout_attr[$layout][$key] = $value;
		}
		return $this;
	}

	public function get($control_name = 'default'){
		return $this->result[$control_name];
	}

	public function isset_form($control_name = 'default'){
		return isset($this->result[$control_name]);
	}

	public function show($control_name = 'default'){
		echo $this->result[$control_name];
	}

	public function generate($control_name = 'default')
	{
		if ($control_name === 'default') {
			$control_name = $this->cursor;
		}
		$this->result[$control_name] = '';
		if (isset($this->data[$control_name])) {
			foreach ($this->data[$control_name]['data'] as $name => $attr) {
				if (!is_numeric($name)) {
					if (!isset($attr['type'])) {
						$attr['type'] = 'base';
					}
					if (in_array($attr['type'], $this->base_input)) {
						$attr['base_type'] = $attr['type'];
						$attr['type'] = 'base';
					}
					if (!isset($this->defult_input_attr[$attr['type']])) {
						log_message('error', "Failed input type: {$attr['type']}.");
						show_error("Failed input type: {$attr['type']}.");
					}else{
						if (isset($attr['input_size']) && is_numeric($attr['input_size'])) {
							$attr['input_size'] = 'col-sm-'.$attr['input_size'];
						}
						$attr = array_merge($this->default_layout_attr[$this->data[$control_name]['form_layout']], $this->defult_attr, $this->defult_input_attr[$attr['type']], $attr);
						if ($attr['auto_filled'] && isset($this->post[$name])) {
							$attr['value'] = $this->post[$name];
						}
						if ($attr['required'] === true) {
							$attr['attr'][] = 'required';
						}
						if ($attr['type'] === 'hidden') {
							$input_fun = 'input_'.$attr['type'];
							$str_input = $this->$input_fun($name, $attr);
							$this->result[$control_name] .= $str_input;
						}else{
							$layout_fun = $this->data[$control_name]['form_layout'] . '_layout';
							$this->$layout_fun($control_name, $name, $attr);
						}
					}
				}else{
					if ($attr === 'divider') {
						if ($this->data[$control_name]['form_layout'] === 'group') {
							$this->result[$control_name] .= '<div class="col-sm-12"><hr class="mt-1"></div>';
						}else{
							$this->result[$control_name] .= '<hr>';
						}
					}elseif($attr === 'new_line'){
						$this->result[$control_name] .= '<div class="w-100"></div>';
					}elseif (is_array($attr)) {
						$attr = array_merge($this->default_layout_attr[$this->data[$control_name]['form_layout']], $attr);
						$layout_fun = $this->data[$control_name]['form_layout'] . '_layout_multi';
						$attr['label'] = isset($attr['label']) ? $attr['label'] : '';
						$attr['input'] = isset($attr['input']) ? $attr['input'] : array();
						$this->$layout_fun($control_name, $attr);
					}
				}
			}
			if ($this->data[$control_name]['form_layout'] === 'group') {
				$this->result[$control_name] = '<div class="' . $this->default_layout_attr['group']['row_type'] . '">' . $this->result[$control_name] . '</div>';
			}
		}else{
			show_error("Failed form control: {$control_name}");
			log_message('error', "Failed form control: {$control_name}.");
		}
		return $this;
	}

	/*
	Layout form group
	 */

	protected function horizontal_layout(&$control_name, &$name, &$attr)
	{
		$input_fun = 'input_'.$attr['type'];
		$str_input = $this->$input_fun($name, $attr);
		$this->group_text($str_input, $attr['group_text']);
		if ($attr['info'] !== '') {
			$attr['info'] = "<small class=\"form-text text-muted\">{$attr['info']}</small>";
		}
		$star = $attr['star_required'] === true && $attr['required'] === true ? '<small class="text-muted">*</small>' : '';
		$this->result[$control_name] .= "<div class=\"form-group row\">
			<label for=\"{$name}\" class=\"{$attr['label_size']} col-form-label\">{$attr['label']}{$star}</label>
			<div class=\"{$attr['input_size']}\"> 
				{$str_input}
				{$attr['info']}
			</div>
		</div>";
	}

	protected function group_layout(&$control_name, &$name, &$attr)
	{
		$input_fun = 'input_'.$attr['type'];
		$str_input = $this->$input_fun($name, $attr);
		$attr['column_size'] = is_numeric($attr['column_size']) ? 'col-sm-'.$attr['column_size'] : $attr['column_size'];
		$attr['input_size'] = is_numeric($attr['input_size']) ? 'col-sm-'.$attr['input_size'] : $attr['input_size'];
		$this->group_text($str_input, $attr['group_text']);
		$star = $attr['star_required'] === true && $attr['required'] === true ? '<small class="text-muted">*</small>' : '';
		$this->result[$control_name] .= '<div class="' . $attr['column_size'] . '">
			<div class="' . $attr['row_type'] . '">
				<div class="' . $attr['input_size'] . '">
					<div class="form-group">
						<label for="' . $name . '">' . $attr['label'] . $star . '</label>' . 
						$str_input . 
						($attr['info'] === '' ? '' : '<small class="form-text text-muted">' . $attr['info'] . '</small>') .
					'</div>
				</div>
			</div>
		</div>';
	}
	protected function horizontal_layout_multi(&$control_name, &$args)
	{
		if ($args['input'] !== array()) {
			$current_name = current(array_keys($args));
			$str_input = $this->input_multi($args['input'], 'horizontal');
			$this->result[$control_name] .= '<div class="form-group row">
				<label id="' . $current_name . '" class="' . $args['label_size'] . ' col-form-label">' . $args['label'] . '</label>
				<div class="' . $args['input_size'] . '">' . 
				$str_input . 
				'</div>
			</div>';
		}
	}

	protected function group_layout_multi(&$control_name, &$args)
	{
		if ($args['input'] !== array()) {
			$args['column_size'] = is_numeric($args['column_size']) ? 'col-sm-'.$args['column_size'] : $args['column_size'];
			$current_name = current(array_keys($args));
			$str_input = $this->input_multi($args['input'], 'group');
			$this->result[$control_name] .= '<div class="' . $args['column_size'] . '">
					<div class="' . $args['row_type'] . '">
						<div class="' . $args['input_size'] . '">
							<div class="form-group">
								<label for="' . $current_name . '">' . $args['label'] . '</label>' . 
								$str_input . 
							'</div>
						</div>
					</div>
				</div>';
		}
	}
	public function inline_layout(&$control_name, &$name, &$attr)
	{
		$attr['class'] .= ' m-1';
		$input_fun = 'input_'.$attr['type'];
		$str_input = $this->$input_fun($name, $attr);
		$this->group_text($str_input, $attr['group_text']);
		$this->result[$control_name] .= $str_input;
	}

	protected function group_text(&$str_input, &$group_text)
	{
		if (isset($group_text['prepend'])) {
			$group_text['prepend'] = is_array($group_text['prepend']) ? $group_text['prepend'] : array($group_text['prepend']);
			$str_prepend = '';
			foreach ($group_text['prepend'] as $value) {
				$str_prepend .= '<span class="input-group-text">' . $value . '</span>';
			}
			$str_input = '<div class="input-group-prepend">
					' . $str_prepend . '
				</div>
				' . $str_input;
		}
		if (isset($group_text['append'])) {
			$group_text['append'] = is_array($group_text['append']) ? $group_text['append'] : array($group_text['append']);
			$str_append = '';
			foreach ($group_text['append'] as $value) {
				$str_append .= '<span class="input-group-text">' . $value . '</span>';
			}
			$str_input = $str_input . '
				<div class="input-group-append">
					' . $str_append . '
				</div>';
		}
		if ($group_text !== array()) {
			$str_input = '<div class="input-group">
				' . $str_input . '
			</div>';
		}
	}

	/*
	Input fill
	 */

	protected function input_multi(&$args, $layout)
	{
		$str_input_multi = '<div class="form-row">';
		$no = 1;
		foreach ($args as $name => $attr) {
			if (!isset($attr['type'])) {
				$attr['type'] = 'base';
			}
			if (in_array($attr['type'], $this->base_input)) {
				$attr['base_type'] = $attr['type'];
				$attr['type'] = 'base';
			}
			if (!isset($this->defult_input_attr[$attr['type']])) {
				log_message('error', "Failed input type: {$attr['type']}.");
				show_error("Failed input type: {$attr['type']}.");
			}else{
				if (isset($attr['input_size']) && is_numeric($attr['input_size'])) {
					$attr['input_size'] = 'col-'.$attr['input_size'];
				}
				$attr = array_merge($this->default_layout_attr[$layout], $this->defult_attr, $this->defult_input_attr[$attr['type']], $attr);
				if ($attr['auto_filled'] && isset($this->post[$name])) {
					$attr['value'] = $this->post[$name];
				}
				if ($attr['required'] === true) {
					$attr['attr'][] = 'required';
				}
				$input_fun = 'input_'.$attr['type'];
				$str_input = $this->$input_fun($name, $attr);
				$this->group_text($str_input, $attr['group_text']);
				if ($attr['input_size'] === '') {
					$str_input_multi .= '<div class="' .($attr['hide'] === true ? 'hide ' : ''). ($no++ === 1 ? 'pl-2' : '') . ' pr-2">
							' . $str_input . 
							($attr['info'] === '' ? '' : '<small class="form-text text-muted">' . $attr['info'] . '</small>') . '
						</div>';
				}else{
					$str_input_multi .= '<div class="' .($attr['hide'] === true ? 'hide ' : ''). $attr['input_size'] . '">
							' . $str_input . 
							($attr['info'] === '' ? '' : '<small class="form-text text-muted">' . $attr['info'] . '</small>') . '
						</div>';
				}
			}
		}
		unset($no);
		$str_input_multi .= '</div>';
		return $str_input_multi;
	}

	protected function get_attr_tag(&$attr_data)
	{
		$str_attr_tag = ''; 
		foreach ($attr_data as $key => $value) {
			if (is_numeric($key)) {
				$str_attr_tag .= ' ' . $value . '="' . $value . '"';
			}else{
				$str_attr_tag .= ' ' . $key . '="' . $value . '"';
			}
		}
		return $str_attr_tag;
	}
	protected function input_base(&$name, &$input_args)
	{
		$defult_attr = array(
			'name' => $name,
			'id' => $name,
			'type' => $input_args['base_type'],
			'value' => $input_args['base_type'] !== 'password' ? $input_args['value'] : '',
			'placeholder' => $input_args['placeholder'] === '' ? $input_args['label'] : $input_args['placeholder'],
			'class' => 'form-control',
		);
		if ($input_args['size'] !== '') {
			$defult_attr['class'] .= ' form-control-' . $input_args['size'];
		}
		if ($input_args['class'] !== '') {
			$defult_attr['class'] .= ' ' . $input_args['class'];
		}
		$input_args['attr'] = $defult_attr + $input_args['attr'];
		$str_input_attr = $this->get_attr_tag($input_args['attr']);
		unset($input_args['attr']);
		return '<input ' . $str_input_attr . '>';
	}
	protected function input_textarea(&$name, &$input_args)
	{
		$defult_attr = array(
			'name' => $name,
			'id' => $name,
			'placeholder' => $input_args['placeholder'] === '' ? $input_args['label'] : $input_args['placeholder'],
			'class' => 'form-control',
		);
		if ($input_args['size'] !== '') {
			$defult_attr['class'] .= ' form-control-' . $input_args['size'];
		}
		if ($input_args['class'] !== '') {
			$defult_attr['class'] .= ' ' . $input_args['class'];
		}
		$input_args['attr'] = $defult_attr + $input_args['attr'];
		$str_input_attr = $this->get_attr_tag($input_args['attr']);
		unset($input_args['attr']);
		return '<textarea ' . $str_input_attr . '>' . $input_args['value'] . '</textarea>';
	}
	protected function input_radiobox(&$name, &$input_args)
	{
		if (is_numeric($input_args['radiobox_size'])) {
			$input_args['radiobox_size'] = 'col-'.$input_args['radiobox_size'];
		}
		$defult_attr = array(
			'name' => $name,
			'type' => 'radio',
		);
		if ($input_args['custom'] === true) {
			$defult_attr['class'] = 'custom-control-input';
		}else{
			$defult_attr['class'] = 'form-check-input';
		}
		if ($input_args['class'] !== '') {
			$class_tag .= ' ' . $input_args['class'];
		}
		$input_args['attr'] = $defult_attr + $input_args['attr'];
		$str_input_attr = $this->get_attr_tag($input_args['attr']);
		unset($input_args['attr']);
		$data_option = is_array($input_args['radiobox_data']) ? $input_args['radiobox_data'] : $this->meta_data[$input_args['radiobox_data']];
		$str_input = '';
		foreach ($data_option as $key => $value) {
			$key = $input_args['radiobox_type'] === 'value' ? $value : $key;
			$str_input .= '<div class="' . $input_args['radiobox_size'] . '">
				<div class="' . ( $input_args['custom'] === true ? 'custom-control custom-radio' : 'form-check' ) . ' pt-2">
					<input ' . ($input_args['value'] === $key ? 'checked=""': '') . ' value="' . $key . '" id="' . $name . '_' . get_slug($key) . '" ' . $str_input_attr . '>
					<label class="' . ( $input_args['custom'] === true ? 'custom-control-label' : 'form-check-label' ) . '" for="' . $name . '_' . get_slug($key) . '">' . 
						ucfirst($value) . 
					'</label>
				</div>
			</div>';
		}
		return '<div><div class="form-row">' . $str_input . '</div></div>';
	}
	protected function input_checkbox(&$name, &$input_args)
	{
		if (is_numeric($input_args['checkbox_size'])) {
			$input_args['checkbox_size'] = 'col-'.$input_args['checkbox_size'];
		}
		$defult_attr = array(
			'type' => 'checkbox',
		);
		if ($input_args['custom'] === true) {
			$defult_attr['class'] = 'custom-control-input';
		}else{
			$defult_attr['class'] = 'form-check-input';
		}
		if ($input_args['class'] !== '') {
			$class_tag .= ' ' . $input_args['class'];
		}
		$input_args['attr'] = $defult_attr + $input_args['attr'];
		$str_input_attr = $this->get_attr_tag($input_args['attr']);
		unset($input_args['attr']);
		if ($input_args['checkbox_type'] === 'boolean') {
			return '<div class="' . ( $input_args['custom'] === true ? 'custom-control custom-checkbox' : 'form-check' ) . ' pt-2">
					<input name="' . $name . '" ' . ($input_args['value'] === $input_args['checkbox_true_value'] ? 'checked=""': '') . ' value="' . $input_args['checkbox_true_value'] . '" id="' . $name . '" ' . $str_input_attr . '>
					<label class="' . ( $input_args['custom'] === true ? 'custom-control-label' : 'form-check-label' ) . '" for="' . $name . '">' . 
						ucfirst($input_args['checkbox_label']) . 
					'</label>
				</div>';
		}elseif ($input_args['checkbox_type'] === 'tree') {
			# kerjakan default dulu
		}else{
			$data_option = is_array($input_args['checkbox_data']) ? $input_args['checkbox_data'] : $this->meta_data[$input_args['checkbox_data']];
			$input_args['value'] = is_string($input_args['value']) ? array($input_args['value']) : $input_args['value'];
			$str_input = '';
			foreach ($data_option as $key => $value) {
				$key = $input_args['checkbox_type'] === 'value' ? $value : $key;
				$checked = '';
				if (($input_args['checkbox_type'] === 'value' && in_array($key, $input_args['value'])) || ($input_args['checkbox_type'] === 'key_value' && isset($input_args['value'][$input_args['value']]))) {
					$checked = 'checked=""';
				}
				$str_input .= '<div class="' . $input_args['checkbox_size'] . '">
					<div class="' . ( $input_args['custom'] === true ? 'custom-control custom-checkbox' : 'form-check' ) . ' pt-2">
						<input name="' . $name . '[]" ' . (in_array($value, $input_args['value']) ? 'checked=""': '') . ' value="' . $key . '" id="' . $name . '_' . get_slug($key) . '" ' . $str_input_attr . '>
						<label class="' . ( $input_args['custom'] === true ? 'custom-control-label' : 'form-check-label' ) . '" for="' . $name . '_' . get_slug($key) . '">' . 
							ucfirst($value) . 
						'</label>
					</div>
				</div>';
			}
			return '<div><div class="form-row">' . $str_input . '</div></div>';
		}
	}
	protected function input_select(&$name, &$input_args)
	{
		$defult_attr = array(
			'name' => $name,
			'id' => $name,
		);
		if ($input_args['custom'] === true) {
			$defult_attr['class'] = 'custom-select';
			if ($input_args['size'] !== '') {
				$defult_attr['class'] .= ' custom-select-' . $input_args['size'];
			}
		}else{
			$defult_attr['class'] = 'form-control';
			if ($input_args['size'] !== '') {
				$defult_attr['class'] .= ' form-control-' . $input_args['size'];
			}
		}
		if ($input_args['class'] !== '') {
			$defult_attr['class'] .= ' ' . $input_args['class'];
		}
		if ($input_args['multiple'] === true) {
			$input_args['attr'][] = 'multiple';
			$input_args['value'] = is_string($input_args['value']) ? array($input_args['value']) : $input_args['value'];
			$defult_attr['name'] .= '[]';
		}
		$input_args['attr'] = $defult_attr + $input_args['attr'];
		$str_input_attr = $this->get_attr_tag($input_args['attr']);
		unset($input_args['attr']);
		$str_input = '';
		if ($input_args['select_type'] === 'group') {
			$data_option = is_array($input_args['select_data']) ? $input_args['select_data'] : $this->meta_data[$input_args['select_data']];
			$temp = false;
			foreach ($data_option as $i => $value) {
				$key =  $value[$input_args['group_key']];
				if (is_numeric($key)) {
					$selected = $input_args['value'] == $key;
				}else{
					$selected = $input_args['value'] === $key;
				}
				if ($temp !== $value[$input_args['group_index']]) {
					$temp = $value[$input_args['group_index']];
					$str_input .= '<optgroup label="' . $value[$input_args['group_index']] . '">';
				}
				$str_input .= '<option value="' . $key . '" ' . ( $selected === true ? 'selected=""': '') . '>' . $value[$input_args['group_value']] . '</option>';
				if (!isset($data_option[$i + 1]) || $data_option[$i + 1][$input_args['group_index']] !== $temp) {
					$str_input .= '</optgroup>';
				}
			}
		}else{
			$data_option = is_array($input_args['select_data']) ? $input_args['select_data'] : $this->meta_data[$input_args['select_data']];
			foreach ($data_option as $key => $value) {
				if ($input_args['select_type'] === 'value') {
					$key =  $value;
					$selected = $input_args['value'] == $value;
				}elseif ($input_args['multiple'] === true) {
					$selected = in_array($key, $input_args['value']);
				}else{
					if (is_numeric($key)) {
						$selected = $input_args['value'] == $key;
					}else{
						$selected = $input_args['value'] === $key;
					}
				}
				$str_input .= '<option value="' . $key . '" ' . ( $selected === true ? 'selected=""': '') . '>' . ucfirst($value) . '</option>';
			}
		}

		return '<select ' . $str_input_attr . '>
				' . $str_input . '
			</select>';
	}

	protected function input_file(&$name, &$input_args)
	{
		$defult_attr = array(
			'name' => $name,
			'id' => $name,
			'class' => 'form-control-file mt-2' . ($input_args['class'] === '' ? '' : ' ' . $input_args['class']),
		);
		if ($input_args['multiple'] === true) {
			$input_args['attr'][] = 'multiple';
			$defult_attr['name'] .= '[]';
		}
		if ($input_args['file_format'] !== array()) {
			if (is_array($input_args['file_format'])) {
				$defult_attr['accept'] = '.'.implode(', .', $input_args['file_format']);
			}else{
				$defult_attr['accept'] = $input_args['file_format'];
			}
		}
		$input_args['attr'] = $defult_attr + $input_args['attr'];
		if ($input_args['link_file'] === true && $input_args['value'] !== '') {
			$input_args['attr']['class'] .= ' hide';
		}
		$str_input_attr = $this->get_attr_tag($input_args['attr']);
		unset($input_args['attr']);
		$str_input = '<input type="file" ' . $str_input_attr . '>';
		if ($input_args['custom']) {
			$str_input = '<div class="custom-file">
				' . $str_input . '
				<label class="custom-file-label text-truncate" for="' . $name .  '">Choose file</label>
			</div>';
		}
		if ($input_args['link_file'] === true && $input_args['value'] !== '') {
			$file_name = explode('/', $input_args['value']);
			$file_name = end($file_name);
			$span_link = '<span class="form-control text-truncate"><a href="'.$input_args['value'].'" class="" target="_blank">'.$file_name.'</a></span>';
			$span_link_times = array('append' => array('<a href="#" class="text-muted" hide="#link_' . $name . '" show="#' . $name . '"><i class="fa fa-times" ></i></a>'));
			$this->group_text($span_link, $span_link_times);
			$str_input .= '<div id="link_' . $name . '">'.$span_link.'</div>';
		}
		return $str_input;
	}

	protected function input_hidden(&$name, &$input_args)
	{
		$defult_attr = array(
			'name' => $name,
			'value' => $input_args['value'],
		);
		$input_args['attr'] = $defult_attr + $input_args['attr'];
		$str_input_attr = $this->get_attr_tag($input_args['attr']);
		unset($input_args['attr']);
		return '<input type="hidden" ' . $str_input_attr . '>';
	}
	protected function input_button(&$name, &$input_args)
	{
		$class_tag = 'btn';
		$class_tag .= ' btn-' . $input_args['button_color'];
		if ($input_args['button_block'] === true) {
			$class_tag .= ' btn-block';
		}
		if ($input_args['size'] !== '') {
			$class_tag .= ' btn-' . $input_args['size'];
		}
		if ($input_args['class'] !== '') {
			$class_tag .= ' ' . $input_args['class'];
		}
		if ($input_args['button_icon'] !== '') {
			$input_args['button_icon'] = '<i class="' . $input_args['button_icon'] . '"></i>';
		}
		$defult_attr = array(
			'type' => $input_args['button_type'],
			'class' => $class_tag,
		);
		$input_args['attr'] = $defult_attr + $input_args['attr'];
		$str_input_attr = $this->get_attr_tag($input_args['attr']);
		unset($input_args['attr']);
		return '<button ' . $str_input_attr . '>' . $input_args['button_icon'] .' '. $input_args['button_label'] . '</button>';
	}
}