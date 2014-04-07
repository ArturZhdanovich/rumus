<?php
class ControllerModuleRussianpostBlanks extends Controller {
    private $error = array();

    private $defaults = array(
        'rpb_installed'              => 1,
        'russian_post_blanks_status'   => 1,
        'rpb_from_name'          => '',
        'rpb_from_address_1'            => '',
        'rpb_from_address_2'        => '',
        'rpb_postindex'               => '',
        'rpb_doc_type'				=>'',
        'rpb_doc_serial'				=>'',
        'rpb_doc_num'				=>'',
        'rpb_doc_date'				=>'',
        'rpb_doc_received_by'				=>'',
        'rpb_inn'				=>'',
        'rpb_bik'				=>'',
        'rpb_correspondent_account'				=>'',
        'rpb_current_account'				=>'',
        'rpb_bank_name'				=>'',
        
    );


    public function index() {
        $this->data = array_merge($this->data, $this->language->load('module/russian_post_blanks'));

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            # Loop through all settings for the post/config values
            foreach (array_keys($this->defaults) as $setting) {
                if (!isset($this->request->post[$setting])) {
                    $this->request->post[$setting] = 0;
                }
            }

            $this->model_setting_setting->editSetting('russian_post_blanks', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

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
            'href'      => $this->url->link('module/russian_post_blanks', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/russian_post_blanks', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['ext_name'] = EXTENSION_NAME;
        $this->data['ext_version'] = EXTENSION_VERSION;
        $this->data['ext_type'] = EXTENSION_TYPE;
        $this->data['ext_compatibility'] = EXTENSION_COMPATIBILITY;
        $this->data['ext_url'] = EXTENSION_URL;
        $this->data['ext_support'] = EXTENSION_SUPPORT;
        $this->data['ext_support_forum'] = EXTENSION_SUPPORT_FORUM;
        $this->data['ext_subject'] = sprintf($this->language->get('text_ext_subject'), EXTENSION_NAME);

        # Loop through all settings for the post/config values
        foreach (array_keys($this->defaults) as $setting) {
            if (isset($this->request->post[$setting])) {
                $this->data[$setting] = $this->request->post[$setting];
            } else {
                $this->data[$setting] = $this->config->get($setting);
                if ($this->data[$setting] === null) {
                    $this->data['error_warning'] = $this->language->get('error_unsaved_settings');
                    if (isset($this->defaults[$setting])) {
                        $this->data[$setting] = $this->defaults[$setting];
                    }
                }
            }
        }

        $this->template = 'module/russian_post_blanks.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    public function install() {
        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('russian_post_blanks', $this->defaults);
        
    }

    public function uninstall() {
        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('russian_post_blanks');
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/russian_post_blanks')) {
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