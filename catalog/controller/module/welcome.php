<?php  
class ControllerModuleWelcome extends Controller {
	protected function index($setting) {
		$this->language->load('module/welcome');
		
    	$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
		
		$this->data['setting'] = $setting;
		
		$this->data['top_bottom'] = $setting['position'] == 'content_top' || $setting['position'] == 'content_bottom';
		$this->data['side_left'] = $setting['position'] == 'column_left';
		$this->data['side_right'] = $setting['position'] == 'column_right';
		$this->data['side'] = $setting['position'] == 'column_left' || $setting['position'] == 'column_right';
    	
		$this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/welcome.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/welcome.tpl';
		} else {
			$this->template = 'default/template/module/welcome.tpl';
		}
		
		$this->render();
	}
}
?>