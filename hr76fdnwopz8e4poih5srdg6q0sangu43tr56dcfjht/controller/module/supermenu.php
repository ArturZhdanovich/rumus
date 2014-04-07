<?php
class ControllerModulesupermenu extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/supermenu');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('catalog/category');
		$this->load->model('catalog/information');
		$this->load->model('localisation/language');
		$this->load->model('tool/image');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('supermenu', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('module/supermenu', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_image'] = $this->language->get('text_image');
		$this->data['text_expando'] = $this->language->get('text_expando');
		$this->data['text_tlcolor'] = $this->language->get('text_tlcolor');
		$this->data['text_tlstyle'] = $this->language->get('text_tlstyle');
		$this->data['text_justadd'] = $this->language->get('text_justadd');
		$this->data['text_alldrop'] = $this->language->get('text_alldrop');
		$this->data['text_overdrop'] = $this->language->get('text_overdrop');
		$this->data['text_or'] = $this->language->get('text_or');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['tab_items'] = $this->language->get('tab_items');
		$this->data['tab_settings'] = $this->language->get('tab_settings');
		$this->data['tab_html'] = $this->language->get('tab_html');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$this->data['text_select_all'] = $this->language->get('text_select_all');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_add'] = $this->language->get('entry_add');
		$this->data['text_slist'] = $this->language->get('text_slist');
		$this->data['text_sgrid'] = $this->language->get('text_sgrid');
		$this->data['text_sview'] = $this->language->get('text_sview');
		$this->data['text_dwidth'] = $this->language->get('text_dwidth');
		$this->data['text_iwidth'] = $this->language->get('text_iwidth');
		$this->data['text_chtml'] = $this->language->get('text_chtml');
		$this->data['text_cchtml'] = $this->language->get('text_cchtml');
		$this->data['entry_type'] = $this->language->get('entry_type');
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_custom'] = $this->language->get('entry_custom');
		$this->data['entry_information'] = $this->language->get('entry_information');
		$this->data['entry_advanced'] = $this->language->get('entry_advanced');
		$this->data['custom_name'] = $this->language->get('custom_name');
		$this->data['custom_url'] = $this->language->get('custom_url');
		$this->data['type_cat'] = $this->language->get('type_cat');
		$this->data['type_mand'] = $this->language->get('type_mand');
		$this->data['type_infol'] = $this->language->get('type_infol');
		$this->data['type_infod'] = $this->language->get('type_infod');
		$this->data['type_custom'] = $this->language->get('type_custom');
		$this->data['type_more'] = $this->language->get('type_more');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_count'] = $this->language->get('entry_count');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_add_item'] = $this->language->get('button_add_item');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['more_name'] = $this->language->get('more_name');
		$this->data['more_status'] = $this->language->get('more_status');
		$this->data['entry_image_size'] = $this->language->get('entry_image_size');
		$this->data['entry_show_description'] = $this->language->get('entry_show_description');
		
		
		$this->data['token'] = $this->session->data['token'];
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/supermenu', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/supermenu', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		$this->data['modules'] = array();
		$this->data['items'] = array();
		$this->data['categories'] = array();
		$this->data['informations'] = array();
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		
		$categ = $this->model_catalog_category->getCategories(0);

		foreach ($categ as $cate) {
							
			$this->data['categories'][] = array(
				'category_id' => $cate['category_id'],
				'name'        => $cate['name']
			);
		}
		
		$infos = $this->model_catalog_information->getInformations();
		
		foreach ($infos as $info) {
							
			$this->data['informations'][] = array(
				'information_id' => $info['information_id'],
				'name'           => $info['title']
			);
		}
		
		if (isset($this->request->post['supermenu_module'])) {
			$this->data['modules'] = $this->request->post['supermenu_module'];
		} elseif ($this->config->get('supermenu_module')) { 
			$this->data['modules'] = $this->config->get('supermenu_module');
		}	
		if (isset($this->request->post['supermenu_item'])) {
			$this->data['items'] = $this->request->post['supermenu_item'];
		} elseif ($this->config->get('supermenu_item')) { 
			$this->data['items'] = $this->config->get('supermenu_item');
		}
		if (isset($this->request->post['supermenu_settings'])) {
			$this->data['settings'] = $this->request->post['supermenu_settings'];
		} elseif ($this->config->get('supermenu_settings')) { 
			$this->data['settings'] = $this->config->get('supermenu_settings');
		}
		if (isset($this->request->post['supermenu_settings_status'])) {
			$this->data['supermenu_settings_status'] = $this->request->post['supermenu_settings_status'];
		} elseif ($this->config->get('supermenu_settings_status')) { 
			$this->data['supermenu_settings_status'] = $this->config->get('supermenu_settings_status');
		} else {
		    $this->data['supermenu_settings_status'] = '';
		}
		if (isset($this->request->post['supermenu_more'])) {
			$this->data['supermenu_more'] = $this->request->post['supermenu_more'];
		} elseif ($this->config->get('supermenu_more')) {
			$this->data['supermenu_more'] = $this->config->get('supermenu_more');
		} else {
			$this->data['supermenu_more'] = array();
		}
		
		if (isset($this->request->post['supermenu_more_view'])) {
			$this->data['supermenu_more_view'] = $this->request->post['supermenu_more_view'];
		} elseif ($this->config->get('supermenu_more_view')) {
			$this->data['supermenu_more_view'] = $this->config->get('supermenu_more_view');
		} else {
			$this->data['supermenu_more_view'] = '';
		}
		
		if (isset($this->request->post['supermenu_more_title'])) {
			$this->data['supermenu_more_title'] = $this->request->post['supermenu_more_title'];
		} else {
			$this->data['supermenu_more_title'] = $this->config->get('supermenu_more_title');
		}
		
		if (isset($this->request->post['supermenu_more_status'])) {
			$this->data['supermenu_more_status'] = $this->request->post['supermenu_more_status'];
		} elseif ($this->config->get('supermenu_more_status')) {
			$this->data['supermenu_more_status'] = $this->config->get('supermenu_more_status');
		} else {
		    $this->data['supermenu_more_status'] = '';
		}
		if (isset($this->request->post['supermenu_image_width'])) {
			$this->data['supermenu_image_width'] = $this->request->post['supermenu_image_width'];
		} elseif ($this->config->get('supermenu_image_width')) {
			$this->data['supermenu_image_width'] = $this->config->get('supermenu_image_width');
		} else {
			$this->data['supermenu_image_width'] = 120;
		}
		if (isset($this->request->post['supermenu_image_height'])) {
			$this->data['supermenu_image_height'] = $this->request->post['supermenu_image_height'];
		} elseif ($this->config->get('supermenu_image_height')) {
			$this->data['supermenu_image_height'] = $this->config->get('supermenu_image_height');
		} else {
			$this->data['supermenu_image_height'] = 120;
		}
		if (isset($this->request->post['supermenu_show_description'])) {
			$this->data['supermenu_show_description'] = $this->request->post['supermenu_show_description'];
		} elseif ($this->config->get('supermenu_show_description')) {
			$this->data['supermenu_show_description'] = $this->config->get('supermenu_show_description');
		} else {
			$this->data['supermenu_show_description'] = 'no';
		}
		if (isset($this->request->post['supermenu_htmlarea'])) {
			$this->data['supermenu_htmlarea'] = $this->request->post['supermenu_htmlarea'];
		} elseif ($this->config->get('supermenu_htmlarea')) {
			$this->data['supermenu_htmlarea'] = $this->config->get('supermenu_htmlarea');
		} else {
		    $this->data['supermenu_htmlarea'] = array();
		}
		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/supermenu.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/supermenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>