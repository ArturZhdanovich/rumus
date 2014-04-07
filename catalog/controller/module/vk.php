<?php  
class ControllerModuleVk extends Controller {
	protected function index($setting) {
		$this->language->load('module/vk');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['vk_width'] = $setting['image_width'];
		$this->data['vk_height'] = $setting['image_height'];
		$this->data['vk_mode'] = $setting['mode'];
		$this->data['vk_id'] = $setting['vk_id'];
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/vk.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/vk.tpl';
		} else {
			$this->template = 'default/template/module/vk.tpl';
		}
		
		$this->render();
  	}
}
?>