<?php
class ControllerModuleCallback extends Controller {	public function index() {		$this->language->load('module/callback');

		$this->data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {			$this->data['OrderFirstName'] = $this->customer->getFirstname();		} else {			$this->data['OrderFirstName'] = "";		}

		$this->data['header'] = $this->language->get('text_header');
		$this->data['text_main_text'] = $this->language->get('text_main_text');
		$this->data['text_theme'] = $this->language->get('text_theme');
		$this->data['text_name'] = $this->language->get('text_name');
		$this->data['text_phone'] = $this->language->get('text_phone');
		$this->data['text_other'] = $this->language->get('text_other');
		$this->data['text_time'] = $this->language->get('text_time');
		$this->data['text_link'] = $this->config->get('callback_title_'.$this->session->data['language']);
		$this->data['phone_mask'] = $this->config->get('callback_phone_mask');

		$this->data['theme'] = $this->config->get('callback_theme');
		$this->data['message'] = $this->config->get('callback_message');
		$this->data['uri'] = $this->request->server['REQUEST_URI'];
        $this->data['action'] = HTTPS_SERVER . 'index.php?route=module/callback/send';
		$this->id = 'callback';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/callback.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/callback.tpl';
		} else {
			$this->template = 'default/template/module/callback.tpl';
		}

		$this->render();
	}

	public function send() {
		$this->language->load('module/callback');
        if ((iconv_strlen(preg_replace("~[^\d*]~i", "", $this->request->post['OrderPhoneMobile']))) != (iconv_strlen(preg_replace("~[^\d*]~i", "", $this->config->get('callback_phone_mask')))) ) {        	$this->redirect(HTTPS_SERVER . substr($this->request->post['uri'],1));        } else {
        	if ($this->request->server['REQUEST_METHOD'] == 'POST') {
	            $mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
	            $mail->setTo($this->config->get('callback_email'));
	            $mail->setFrom('robot@'.substr(preg_replace("#/$#", "", $this->config->get('config_url')), 7));
	            $mail->setSender($this->language->get('email_callback_robot'));
	            $mail->setSubject($this->language->get('email_subject'));
	            if ($this->request->post['OrderFirstName'] != "") {	            	$bodyofmail = $this->request->post['OrderFirstName'].', ';
	            }else {	            	$bodyofmail = $this->language->get('unknown_visitor').', ';	            }
	            $bodyofmail .= sprintf($this->language->get('email_callback_phone'), $this->request->post['OrderPhoneMobile']).",\n";
	            $bodyofmail .= sprintf($this->language->get('email_callback_time'),$this->request->post['OrderCallTimeStart'],$this->request->post['OrderCallTimeEnd'])."\n";
	            $bodyofmail .= sprintf($this->language->get('email_callback_uri'), HTTPS_SERVER . substr($this->request->post['uri'],1))."\n";
	            if (isset($this->request->post['OrderTheme']) && $this->request->post['OrderTheme'] != "") {
	            	$bodyofmail .= $this->language->get('email_callback_theme') . $this->request->post['OrderTheme'].",\n";
	            }
	             if (isset($this->request->post['OrderMessage']) && $this->request->post['OrderMessage'] != "") {
	            	$bodyofmail .= $this->language->get('email_callback_message') . $this->request->post['OrderMessage'].",\n";
	            }
	            $mail->setText(strip_tags(html_entity_decode($bodyofmail, ENT_QUOTES, 'UTF-8')));
	            $mail->send();
	            $other_emails = $this->config->get('callback_other_emails');
				if ($other_emails) {
					$other_emails = explode(',', $other_emails);
					foreach ($other_emails as $other_email) {
						$mail->setTo($other_email);
						$mail->send();
					}
				}

				if ($this->config->get('config_sms_alert')) {
					$message = str_replace(array('{NAME}', '{TIME}', '{PHONE}'), array($this->request->post['OrderFirstName'], $this->request->post['OrderCallTimeStart'].$this->request->post['OrderCallTimeEnd'], $this->request->post['OrderPhoneMobile']), $this->config->get('callback_sms_message'));
					if (isset($this->request->post['OrderTheme'])){
						$message = str_replace('{THEME}', $this->request->post['OrderTheme'],$message);
					}

					$options = array(
						'to'       => $this->config->get('callback_sms_admin_phone'),
						'copy'     => $this->config->get('callback_alert_smss'),
						'from'     => $this->config->get('config_sms_from'),
						'username' => $this->config->get('config_sms_gate_username'),
						'password' => $this->config->get('config_sms_gate_password'),
						'message'  => $message
					);

					$this->load->library('sms');

					$sms = new Sms($this->config->get('config_sms_gatename'), $options);
					$sms->send();
				}

	            $this->session->data['uri_redirect'] = $this->request->post['uri'];
	            $this->redirect(HTTPS_SERVER . 'index.php?route=module/callback/success');
			}
        }
	}

	public function success() {

		if (@!$this->session->data['uri_redirect']) {
			$this->redirect(HTTPS_SERVER);
		}

		$uri = $this->session->data['uri_redirect'];

		unset($this->session->data['uri_redirect']);

		$this->language->load('module/callback');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['breadcrumbs'] = array();

    	$this->data['text_message'] = $this->language->get('text_message');

    	$this->data['button_continue'] = $this->language->get('button_home');

    	$this->data['continue'] = HTTPS_SERVER . substr($uri,1);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);

		$this->response->setOutput($this->render());	}
}
?>