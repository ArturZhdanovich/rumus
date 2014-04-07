<?php
class ControllerModuleQuickRegistration extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/quick_registration');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('quick_registration', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_required'] = $this->language->get('text_required');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');

		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_last_name'] = $this->language->get('entry_last_name');
		$this->data['entry_first_name'] = $this->language->get('entry_first_name');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_fax'] = $this->language->get('entry_fax');
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_address_2'] = $this->language->get('entry_address_2');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_post_code'] = $this->language->get('entry_post_code');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_subscribe'] = $this->language->get('entry_subscribe');
		$this->data['entry_customer_groups'] = $this->language->get('entry_customer_groups');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
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
			'href'      => $this->url->link('module/quick_registration', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/quick_registration', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');			
				
		if (isset($this->request->post['config_quick_registration_checkout'])) {
			$this->data['config_quick_registration_checkout'] = $this->request->post['config_quick_registration_checkout'];
		} else {
			$this->data['config_quick_registration_checkout'] = $this->config->get('config_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_customer_groups_quick_registration_checkout'])) {
			$this->data['config_customer_groups_quick_registration_checkout'] = $this->request->post['config_customer_groups_quick_registration_checkout'];
		} else {
			$this->data['config_customer_groups_quick_registration_checkout'] = $this->config->get('config_customer_groups_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_first_quick_registration_checkout'])) {
			$this->data['config_first_quick_registration_checkout'] = $this->request->post['config_first_quick_registration_checkout'];
		} else {
			$this->data['config_first_quick_registration_checkout'] = $this->config->get('config_first_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_last_quick_registration_checkout'])) {
			$this->data['config_last_quick_registration_checkout'] = $this->request->post['config_last_quick_registration_checkout'];
		} else {
			$this->data['config_last_quick_registration_checkout'] = $this->config->get('config_last_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_telephone_quick_registration_checkout'])) {
			$this->data['config_telephone_quick_registration_checkout'] = $this->request->post['config_telephone_quick_registration_checkout'];
		} else {
			$this->data['config_telephone_quick_registration_checkout'] = $this->config->get('config_telephone_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_fax_quick_registration_checkout'])) {
			$this->data['config_fax_quick_registration_checkout'] = $this->request->post['config_fax_quick_registration_checkout'];
		} else {
			$this->data['config_fax_quick_registration_checkout'] = $this->config->get('config_fax_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_company_quick_registration_checkout'])) {
			$this->data['config_company_quick_registration_checkout'] = $this->request->post['config_company_quick_registration_checkout'];
		} else {
			$this->data['config_company_quick_registration_checkout'] = $this->config->get('config_company_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_address_1_quick_registration_checkout'])) {
			$this->data['config_address_1_quick_registration_checkout'] = $this->request->post['config_address_1_quick_registration_checkout'];
		} else {
			$this->data['config_address_1_quick_registration_checkout'] = $this->config->get('config_address_1_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_address_2_quick_registration_checkout'])) {
			$this->data['config_address_2_quick_registration_checkout'] = $this->request->post['config_address_2_quick_registration_checkout'];
		} else {
			$this->data['config_address_2_quick_registration_checkout'] = $this->config->get('config_address_2_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_city_quick_registration_checkout'])) {
			$this->data['config_city_quick_registration_checkout'] = $this->request->post['config_city_quick_registration_checkout'];
		} else {
			$this->data['config_city_quick_registration_checkout'] = $this->config->get('config_city_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_post_code_quick_registration_checkout'])) {
			$this->data['config_post_code_quick_registration_checkout'] = $this->request->post['config_post_code_quick_registration_checkout'];
		} else {
			$this->data['config_post_code_quick_registration_checkout'] = $this->config->get('config_post_code_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_country_quick_registration_checkout'])) {
			$this->data['config_country_quick_registration_checkout'] = $this->request->post['config_country_quick_registration_checkout'];
		} else {
			$this->data['config_country_quick_registration_checkout'] = $this->config->get('config_country_quick_registration_checkout');
		}
		
		if (isset($this->request->post['config_subscribe_quick_registration_checkout'])) {
			$this->data['config_subscribe_quick_registration_checkout'] = $this->request->post['config_subscribe_quick_registration_checkout'];
		} else {
			$this->data['config_subscribe_quick_registration_checkout'] = $this->config->get('config_subscribe_quick_registration_checkout');
		}

		$this->template = 'module/quick_registration.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/quick_registration')) {
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