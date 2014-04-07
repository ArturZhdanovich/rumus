<?php
class ControllerModuleCallback extends Controller {
	const EMAIL_PATTERN = '/^[^\@]+@.*\.[a-z]{2,6}$/i';	private $error = array();
	private $_version = '1.2';

	public function index () {		$this->load->language('module/callback');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		$this->data['callback_version'] = $this->_version;

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('callback', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');

		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_phone_mask'] = $this->language->get('entry_phone_mask');
		$this->data['entry_other_emails'] = $this->language->get('entry_other_emails');
		$this->data['entry_sms_admin_phone'] = $this->language->get('entry_sms_admin_phone');
		$this->data['entry_sms_message'] = $this->language->get('entry_sms_message');
		$this->data['entry_alert_smss'] = $this->language->get('entry_alert_smss');
		$this->data['entry_theme'] = $this->language->get('entry_theme');
		$this->data['entry_message'] = $this->language->get('entry_message');

		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['entry_yes'] = $this->language->get( 'entry_yes' );
		$this->data['entry_no']	= $this->language->get( 'entry_no' );

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

		$this->data['entry_header'] = $this->language->get( 'entry_header' );
		$this->data['entry_title'] = $this->language->get( 'entry_title' );

		if($this->config->get('config_sms_alert')) {
			$this->data['entry_sms_config'] = 'True';
		} else {
			$this->data['entry_sms_config'] = 'False';
		}
		$this->data['error_sms_config'] = $this->language->get( 'error_sms_config' );

		$this->data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();

		foreach ($languages as $language) {
			if (isset($this->error['code' . $language['language_id']])) {
				$this->data['error_code' . $language['language_id']] = $this->error['code' . $language['language_id']];
			} else {
				$this->data['error_code' . $language['language_id']] = '';
			}
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['email'])) {
			$this->data['error_warning'] = $this->error['email'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['phone_mask'])) {
			$this->data['error_warning'] = $this->error['phone_mask'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('module/callback', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);

   		$this->data['action'] = $this->url->link('module/callback', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];

		foreach ($languages as $language) {
			if (isset($this->request->post['callback_title_' . $language['code']])) {
				$this->data['callback_title_' . $language['code']] = $this->request->post['callback_title_' . $language['code']];
			} else {
				$this->data['callback_title_' . $language['code']] = $this->config->get('callback_title_' . $language['code']);
			}
		}

		$this->data['languages'] = $languages;

		if (isset($this->request->post['callback_email'])) {
			$this->data['callback_email'] = $this->request->post['callback_email'];
		} else {
			$this->data['callback_email'] = $this->config->get('callback_email');
		}

		if (isset($this->request->post['callback_phone_mask'])) {
			$this->data['callback_phone_mask'] = $this->request->post['callback_phone_mask'];
		} else {
			$this->data['callback_phone_mask'] = $this->config->get('callback_phone_mask');
		}

		if (isset($this->request->post['callback_other_emails'])) {
			$this->data['callback_other_emails'] = $this->request->post['callback_other_emails'];
		} else {
			$this->data['callback_other_emails'] = $this->config->get('callback_other_emails');
		}

		if (isset($this->request->post['callback_sms_admin_phone'])) {
			$this->data['callback_sms_admin_phone'] = $this->request->post['callback_sms_admin_phone'];
		} else {
			$this->data['callback_sms_admin_phone'] = $this->config->get('callback_sms_admin_phone');
		}

		if (isset($this->request->post['callback_sms_message'])) {
			$this->data['callback_sms_message'] = $this->request->post['callback_sms_message'];
		} else {
			$this->data['callback_sms_message'] = $this->config->get('callback_sms_message');
		}

		if (isset($this->request->post['callback_alert_smss'])) {
			$this->data['callback_alert_smss'] = $this->request->post['callback_alert_smss'];
		} else {
			$this->data['callback_alert_smss'] = $this->config->get('callback_alert_smss');
		}

		if (isset($this->request->post['callback_theme'])) {
			$this->data['callback_theme'] = $this->request->post['callback_theme'];
		} else {
			$this->data['callback_theme'] = $this->config->get('callback_theme');
		}

		if (isset($this->request->post['callback_message'])) {
			$this->data['callback_message'] = $this->request->post['callback_message'];
		} else {
			$this->data['callback_message'] = $this->config->get('callback_message');
		}

		$this->data['positions'] = array();

		$this->data['positions'][] = array(
			'position' => 'left',
			'title'    => $this->language->get('text_left'),
		);

		$this->data['positions'][] = array(
			'position' => 'right',
			'title'    => $this->language->get('text_right'),
		);

		if (isset($this->request->post['callback_position'])) {
			$this->data['callback_position'] = $this->request->post['callback_position'];
		} else {
			$this->data['callback_position'] = $this->config->get('callback_position');
		}

		if (isset($this->request->post['callback_status'])) {
			$this->data['callback_status'] = $this->request->post['callback_status'];
		} else {
			$this->data['callback_status'] = $this->config->get('callback_status');
		}

		if (isset($this->request->post['callback_sort_order'])) {
			$this->data['callback_sort_order'] = $this->request->post['callback_sort_order'];
		} else {
			$this->data['callback_sort_order'] = $this->config->get('callback_sort_order');
		}

		$this->data['modules'] = array();

		if (isset($this->request->post['callback_module'])) {
			$this->data['modules'] = $this->request->post['callback_module'];
		} elseif ($this->config->get('callback_module')) {
			$this->data['modules'] = $this->config->get('callback_module');
		}

		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/callback.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

    private function validate() {
		if (!$this->user->hasPermission('modify', 'module/callback')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((strlen(utf8_decode($this->request->post['callback_email'])) > 96) || (!preg_match(self::EMAIL_PATTERN, $this->request->post['callback_email']))) {
      		$this->error['email'] = $this->language->get('error_email');
    	}

    	if ((strlen(utf8_decode($this->request->post['callback_phone_mask']))) != (strlen(utf8_decode(preg_replace("~[^-+() 9]~","",$this->request->post['callback_phone_mask']))))) {    		$this->error['phone_mask'] = $this->language->get('error_phone_mask');    	}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}}
?>