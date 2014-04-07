<?php
//-----------------------------------------------------
// AmazonMenu II for Opencart v1.5.4   
// Created by villagedefrance                          
// contact@villagedefrance.net                                    
//-----------------------------------------------------

class ControllerModuleAmazonMenu extends Controller {
	private $error = array(); 
	private $_name = 'amazonmenu';
	private $_version = '1.5.4 (Amazon Menu II)'; 
	
	public function index() {
	
		$this->load->language('module/' . $this->_name);
		
		$this->data[$this->_name . '_version'] = $this->_version;
		
		$this->load->model('catalog/sprites');

		$this->model_catalog_sprites->checkSprites();

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting($this->_name, $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getModule();
	}
	
	public function insert() {
		$this->load->language('module/' . $this->_name);
		$this->load->model('catalog/sprites');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
			$this->model_catalog_sprites->addSprites($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('module/amazonmenu/listing', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('module/' . $this->_name);
		$this->load->model('catalog/sprites');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
			$this->model_catalog_sprites->editSprites($this->request->get['sprites_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('module/amazonmenu/listing', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('module/' . $this->_name);
		$this->load->model('catalog/sprites');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
		
			foreach ($this->request->post['selected'] as $sprites_id) {
				$this->model_catalog_sprites->deleteSprites($sprites_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('module/amazonmenu/listing', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	public function listing() {
		$this->load->language('module/' . $this->_name);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->getList();
	}

	private function getModule() {
		$this->load->language('module/' . $this->_name);
		$this->load->model('catalog/sprites');
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_true']  = $this->language->get('text_true');
		$this->data['text_false']  = $this->language->get('text_false');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_module_settings'] = $this->language->get('text_module_settings');
		$this->data['text_module_help'] = $this->language->get('text_module_help');

		$this->data['entry_titles'] = $this->language->get('entry_titles');
		$this->data['entry_header'] = $this->language->get('entry_header'); 
		$this->data['entry_icon'] = $this->language->get('entry_icon');
		$this->data['entry_box'] = $this->language->get('entry_box');
		$this->data['entry_yes'] = $this->language->get('entry_yes'); 
		$this->data['entry_no']	= $this->language->get('entry_no');
		
		$this->data['entry_template'] = $this->language->get('entry_template');
		
		$this->data['entry_sprite_thumb'] = $this->language->get('entry_sprite_thumb');
		$this->data['entry_sprite_links'] = $this->language->get('entry_sprite_links');
		$this->data['entry_directory'] = $this->language->get('entry_directory');
		
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_toplimit'] = $this->language->get('entry_toplimit');
		$this->data['entry_botlimit'] = $this->language->get('entry_botlimit');
		$this->data['entry_count'] = $this->language->get('entry_count');
		$this->data['entry_metawords'] = $this->language->get('entry_metawords');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_showhidehelp'] = $this->language->get('button_showhidehelp');
		
		$this->data['button_sprite'] = $this->language->get('button_sprite');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['sprite_thumb'])) {
			$this->data['error_sprite_thumb'] = $this->error['sprite_thumb'];
		} else {
			$this->data['error_sprite_thumb'] = '';
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
			'href'      => $this->url->link('module/amazonmenu', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['sprites'] = $this->url->link('module/amazonmenu/listing', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['action'] = $this->url->link('module/amazonmenu', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['templates'] = array();

		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);
		
		foreach ($directories as $directory) {
			$this->data['templates'][] = basename($directory);
		}	
		
		if (isset($this->request->post['config_template'])) {
			$this->data['config_template'] = $this->request->post['config_template'];
		} else {
			$this->data['config_template'] = $this->config->get('config_template');			
		}	
		
		$this->load->model('localisation/language');
		
		$languages = $this->model_localisation_language->getLanguages();
		
		foreach ($languages as $language) {
			if (isset($this->request->post[$this->_name . '_titles' . $language['language_id']])) {
				$this->data[$this->_name . '_titles' . $language['language_id']] = $this->request->post[$this->_name . '_titles' . $language['language_id']];
			} else {
				$this->data[$this->_name . '_titles' . $language['language_id']] = $this->config->get($this->_name . '_titles' . $language['language_id']);
			}
		}
		
		$this->data['languages'] = $languages;

		if (isset($this->request->post[$this->_name . '_header'])) { 
			$this->data[$this->_name . '_header'] = $this->request->post[$this->_name . '_header']; 
		} else { 
			$this->data[$this->_name . '_header'] = $this->config->get( $this->_name . '_header' ); 
		}
		if (isset( $this->request->post[$this->_name . '_title'])) { 
			$this->data[$this->_name . '_title'] = $this->request->post[$this->_name . '_title']; 
		} else { 
			$this->data[$this->_name . '_title'] = $this->config->get( $this->_name . '_title' ); 
		}
		if (isset($this->request->post[$this->_name . '_icon'])) { 
			$this->data[$this->_name . '_icon'] = $this->request->post[$this->_name . '_icon']; 
		} else { 
			$this->data[$this->_name . '_icon'] = $this->config->get($this->_name . '_icon' ); 
		} 
		if (isset($this->request->post[$this->_name . '_box'])) { 
			$this->data[$this->_name . '_box'] = $this->request->post[$this->_name . '_box']; 
		} else { 
			$this->data[$this->_name . '_box'] = $this->config->get( $this->_name . '_box' ); 
		}
		
		if (isset($this->request->post[$this->_name . '_template'])) {
			$this->data[$this->_name . '_template'] = $this->request->post[$this->_name . '_template'];
		} else {
			$this->data[$this->_name . '_template'] = $this->config->get($this->_name . '_template');
		}
		
		if (isset($this->request->post[$this->_name . '_thumb_width'])) {
			$this->data[$this->_name . '_thumb_width'] = $this->request->post[$this->_name . '_thumb_width'];
		} else {
			$this->data[$this->_name . '_thumb_width'] = $this->config->get($this->_name . '_thumb_width');
		}
		if (isset($this->request->post[$this->_name . '_thumb_height'])) {
			$this->data[$this->_name . '_thumb_height'] = $this->request->post[$this->_name . '_thumb_height'];
		} else {
			$this->data[$this->_name . '_thumb_height'] = $this->config->get($this->_name . '_thumb_height');
		}
		if (isset($this->request->post[$this->_name . '_sprite_links'])) {
			$this->data[$this->_name . '_sprite_links'] = $this->request->post[$this->_name . '_sprite_links'];
		} else {
			$this->data[$this->_name . '_sprite_links'] = $this->config->get($this->_name . '_sprite_links');
		}
		if (isset($this->request->post[$this->_name . '_directory'])) {
			$this->data[$this->_name . '_directory'] = $this->request->post[$this->_name . '_directory'];
		} else {
			$this->data[$this->_name . '_directory'] = $this->config->get($this->_name . '_directory');
		}
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post[$this->_name . '_module'])) {
			$this->data['modules'] = $this->request->post[$this->_name . '_module'];
		} elseif ($this->config->get($this->_name . '_module')) { 
			$this->data['modules'] = $this->config->get($this->_name . '_module');
		}	
	
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/' . $this->_name . '.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
	
		$this->response->setOutput($this->render());
	}
	
	private function getList() {	
		$this->load->language('module/' . $this->_name);
		$this->load->model('catalog/sprites');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_image'] = $this->language->get('column_image');		
		$this->data['column_title'] = $this->language->get('column_title');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_action'] = $this->language->get('column_action');		

		$this->data['button_module'] = $this->language->get('button_module');
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');

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
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('module/amazonmenu/listing', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		$this->data['module'] = $this->url->link('module/amazonmenu', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['insert'] = $this->url->link('module/amazonmenu/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('module/amazonmenu/delete', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['totalsprites'] = $this->model_catalog_sprites->getTotalSprites();
		
		$this->load->model('tool/image');
		
		$this->data['sprites'] = array();

		$results = $this->model_catalog_sprites->getSprites();

    	foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('module/amazonmenu/update', 'token=' . $this->session->data['token'] . '&sprites_id=' . $result['sprites_id'], 'SSL')
			);
			
			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}

			$this->data['sprites'][] = array(
				'sprites_id'     => $result['sprites_id'],
				'title'       	=> $result['title'],
				'sort_order' => $result['sort_order'],
				'image'      => $image,
				'status'      	=> ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'selected'    => isset($this->request->post['selected']) && in_array($result['sprites_id'], $this->request->post['selected']),
				'action'      => $action
			);
		}

		$this->template = 'module/amazonmenu/list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function getForm() {
		$this->load->language('module/' . $this->_name);
		$this->load->model('catalog/sprites');

		$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
    	$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_link'] = $this->language->get('text_link');
    	$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');

		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_language'] = $this->language->get('tab_language');
		$this->data['tab_setting'] = $this->language->get('tab_setting');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = '';
		}

		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('module/amazonmenu/listing', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['sprites_id'])) {
			$this->data['action'] = $this->url->link('module/amazonmenu/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('module/amazonmenu/update', 'token=' . $this->session->data['token'] . '&sprites_id=' . $this->request->get['sprites_id'], 'SSL');
		}

		$this->data['cancel'] = $this->url->link('module/amazonmenu/listing', 'token=' . $this->session->data['token'], 'SSL');

		if ((isset($this->request->get['sprites_id'])) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$sprites_info = $this->model_catalog_sprites->getSpritesStory($this->request->get['sprites_id']);
		}

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['sprites_description'])) {
			$this->data['sprites_description'] = $this->request->post['sprites_description'];
		} elseif (isset($this->request->get['sprites_id'])) {
			$this->data['sprites_description'] = $this->model_catalog_sprites->getSpritesDescriptions($this->request->get['sprites_id']);
		} else {
			$this->data['sprites_description'] = array();
		}

		$this->load->model('setting/store');

		$this->data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['sprites_store'])) {
			$this->data['sprites_store'] = $this->request->post['sprites_store'];
		} elseif (isset($sprites_info)) {
			$this->data['sprites_store'] = $this->model_catalog_sprites->getSpritesStores($this->request->get['sprites_id']);
		} else {
			$this->data['sprites_store'] = array(0);
		}			

		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (isset($sprites_info)) {
			$this->data['keyword'] = $sprites_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (isset($sprites_info)) {
			$this->data['status'] = $sprites_info['status'];
		} else {
			$this->data['status'] = '';
		}
		
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($sprites_info)) {
			$this->data['sort_order'] = $sprites_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}

		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($sprites_info)) {
			$this->data['image'] = $sprites_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($sprites_info) && $sprites_info['image'] && file_exists(DIR_IMAGE . $sprites_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($sprites_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		$this->template = 'module/amazonmenu/form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/amazonmenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['amazonmenu_thumb_width'] || !$this->request->post['amazonmenu_thumb_height']) {
			$this->error['sprite_thumb'] = $this->language->get('error_sprite_thumb');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'module/amazonmenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['sprites_description'] as $language_id => $value) {
			if ((strlen($value['title']) < 3) || (strlen($value['title']) > 32)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			if (strlen($value['description']) < 3) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'module/amazonmenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
?>
