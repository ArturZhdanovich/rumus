<?php
class ControllerModuleQuickView extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/quick_view');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->model_setting_setting->editSetting('quick_view', $this->request->post);		
			
			$this->cache->delete('product');
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		
		$this->data['entry_quick_view_bestseller'] = $this->language->get('entry_quick_view_bestseller');
		$this->data['entry_quick_view_featured'] = $this->language->get('entry_quick_view_featured');
		$this->data['entry_quick_view_latest'] = $this->language->get('entry_quick_view_latest');
		$this->data['entry_quick_view_special'] = $this->language->get('entry_quick_view_special');
		$this->data['entry_quick_view_categories'] = $this->language->get('entry_quick_view_categories');
		$this->data['entry_quick_view_manufacturers'] = $this->language->get('entry_quick_view_manufacturers');
		$this->data['entry_quick_view_search'] = $this->language->get('entry_quick_view_search');
		$this->data['entry_quick_view_list_special'] = $this->language->get('entry_quick_view_list_special');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
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
			'href'      => $this->url->link('module/quick_view', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/quick_view', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();
		
		if (isset($this->request->post['quick_view_module'])) {
			$this->data['modules'] = $this->request->post['quick_view_module'];
		} elseif ($this->config->get('quick_view_module')) { 
			$this->data['modules'] = $this->config->get('quick_view_module');
		}			
			
		if (isset($this->request->post['config_quick_view_bestseller'])) {
			$this->data['config_quick_view_bestseller'] = $this->request->post['config_quick_view_bestseller'];
		} else {
			$this->data['config_quick_view_bestseller'] = $this->config->get('config_quick_view_bestseller');
		}
		
		if (isset($this->request->post['config_quick_view_featured'])) {
			$this->data['config_quick_view_featured'] = $this->request->post['config_quick_view_featured'];
		} else {
			$this->data['config_quick_view_featured'] = $this->config->get('config_quick_view_featured');
		}
		
		if (isset($this->request->post['config_quick_view_latest'])) {
			$this->data['config_quick_view_latest'] = $this->request->post['config_quick_view_latest'];
		} else {
			$this->data['config_quick_view_latest'] = $this->config->get('config_quick_view_latest');
		}
		
		if (isset($this->request->post['config_quick_view_special'])) {
			$this->data['config_quick_view_special'] = $this->request->post['config_quick_view_special'];
		} else {
			$this->data['config_quick_view_special'] = $this->config->get('config_quick_view_special');
		}
		
		if (isset($this->request->post['config_quick_view_categories'])) {
			$this->data['config_quick_view_categories'] = $this->request->post['config_quick_view_categories'];
		} else {
			$this->data['config_quick_view_categories'] = $this->config->get('config_quick_view_categories');
		}
		
		if (isset($this->request->post['config_quick_view_manufacturers'])) {
			$this->data['config_quick_view_manufacturers'] = $this->request->post['config_quick_view_manufacturers'];
		} else {
			$this->data['config_quick_view_manufacturers'] = $this->config->get('config_quick_view_manufacturers');
		}
		
		if (isset($this->request->post['config_quick_view_search'])) {
			$this->data['config_quick_view_search'] = $this->request->post['config_quick_view_search'];
		} else {
			$this->data['config_quick_view_search'] = $this->config->get('config_quick_view_search');
		}
		
		if (isset($this->request->post['config_quick_view_list_special'])) {
			$this->data['config_quick_view_list_special'] = $this->request->post['config_quick_view_list_special'];
		} else {
			$this->data['config_quick_view_list_special'] = $this->config->get('config_quick_view_list_special');
		}

		$this->template = 'module/quick_view.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
}
?>