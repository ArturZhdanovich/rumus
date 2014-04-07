<?php
class ControllerModuleProductStickers extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/product_stickers');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('product_stickers', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_limit_new'] = $this->language->get('text_limit_new');
		$this->data['text_limit_popular'] = $this->language->get('text_limit_popular');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		
		$this->data['column_select'] = $this->language->get('column_select');
		$this->data['column_special'] = $this->language->get('column_special');
		$this->data['column_new_product'] = $this->language->get('column_new_product');
		$this->data['column_popular'] = $this->language->get('column_popular');
		
		$this->data['entry_sticker_module_bestseller'] = $this->language->get('entry_sticker_module_bestseller');
		$this->data['entry_sticker_module_featured'] = $this->language->get('entry_sticker_module_featured');
		$this->data['entry_sticker_module_latest'] = $this->language->get('entry_sticker_module_latest');
		$this->data['entry_sticker_module_special'] = $this->language->get('entry_sticker_module_special');
		$this->data['entry_sticker_categories'] = $this->language->get('entry_sticker_categories');
		$this->data['entry_sticker_manufacturer'] = $this->language->get('entry_sticker_manufacturer');
		$this->data['entry_sticker_product'] = $this->language->get('entry_sticker_product');
		$this->data['entry_sticker_product_related'] = $this->language->get('entry_sticker_product_related');
		$this->data['entry_sticker_search'] = $this->language->get('entry_sticker_search');
		$this->data['entry_sticker_special'] = $this->language->get('entry_sticker_special');
		$this->data['entry_sticker_quick_view'] = $this->language->get('entry_sticker_quick_view');
		$this->data['entry_sticker_quick_view_related'] = $this->language->get('entry_sticker_quick_view_related');
		$this->data['entry_sticker_news_related_product'] = $this->language->get('entry_sticker_news_related_product');
		
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
			'href'      => $this->url->link('module/product_stickers', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/product_stickers', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['config_limit_days_new_product'])) {
			$this->data['config_limit_days_new_product'] = $this->request->post['config_limit_days_new_product'];
		} else {
			$this->data['config_limit_days_new_product'] = $this->config->get('config_limit_days_new_product');
		}
		
		if (isset($this->request->post['config_limit_viewed_popular_product'])) {
			$this->data['config_limit_viewed_popular_product'] = $this->request->post['config_limit_viewed_popular_product'];
		} else {
			$this->data['config_limit_viewed_popular_product'] = $this->config->get('config_limit_viewed_popular_product');
		}
		
		if (isset($this->request->post['config_sticker_special_module_bestseller'])) {
			$this->data['config_sticker_special_module_bestseller'] = $this->request->post['config_sticker_special_module_bestseller'];
		} else {
			$this->data['config_sticker_special_module_bestseller'] = $this->config->get('config_sticker_special_module_bestseller');
		}
		
		if (isset($this->request->post['config_sticker_new_module_bestseller'])) {
			$this->data['config_sticker_new_module_bestseller'] = $this->request->post['config_sticker_new_module_bestseller'];
		} else {
			$this->data['config_sticker_new_module_bestseller'] = $this->config->get('config_sticker_new_module_bestseller');
		}
		
		if (isset($this->request->post['config_sticker_popular_module_bestseller'])) {
			$this->data['config_sticker_popular_module_bestseller'] = $this->request->post['config_sticker_popular_module_bestseller'];
		} else {
			$this->data['config_sticker_popular_module_bestseller'] = $this->config->get('config_sticker_popular_module_bestseller');
		}
		
		if (isset($this->request->post['config_sticker_special_module_featured'])) {
			$this->data['config_sticker_special_module_featured'] = $this->request->post['config_sticker_special_module_featured'];
		} else {
			$this->data['config_sticker_special_module_featured'] = $this->config->get('config_sticker_special_module_featured');
		}
		
		if (isset($this->request->post['config_sticker_new_module_featured'])) {
			$this->data['config_sticker_new_module_featured'] = $this->request->post['config_sticker_new_module_featured'];
		} else {
			$this->data['config_sticker_new_module_featured'] = $this->config->get('config_sticker_new_module_featured');
		}
		
		if (isset($this->request->post['config_sticker_popular_module_featured'])) {
			$this->data['config_sticker_popular_module_featured'] = $this->request->post['config_sticker_popular_module_featured'];
		} else {
			$this->data['config_sticker_popular_module_featured'] = $this->config->get('config_sticker_popular_module_featured');
		}
		
		if (isset($this->request->post['config_sticker_special_module_latest'])) {
			$this->data['config_sticker_special_module_latest'] = $this->request->post['config_sticker_special_module_latest'];
		} else {
			$this->data['config_sticker_special_module_latest'] = $this->config->get('config_sticker_special_module_latest');
		}
		
		if (isset($this->request->post['config_sticker_new_module_latest'])) {
			$this->data['config_sticker_new_module_latest'] = $this->request->post['config_sticker_new_module_latest'];
		} else {
			$this->data['config_sticker_new_module_latest'] = $this->config->get('config_sticker_new_module_latest');
		}
		
		if (isset($this->request->post['config_sticker_popular_module_latest'])) {
			$this->data['config_sticker_popular_module_latest'] = $this->request->post['config_sticker_popular_module_latest'];
		} else {
			$this->data['config_sticker_popular_module_latest'] = $this->config->get('config_sticker_popular_module_latest');
		}
		
		if (isset($this->request->post['config_sticker_special_module_special'])) {
			$this->data['config_sticker_special_module_special'] = $this->request->post['config_sticker_special_module_special'];
		} else {
			$this->data['config_sticker_special_module_special'] = $this->config->get('config_sticker_special_module_special');
		}
		
		if (isset($this->request->post['config_sticker_new_module_special'])) {
			$this->data['config_sticker_new_module_special'] = $this->request->post['config_sticker_new_module_special'];
		} else {
			$this->data['config_sticker_new_module_special'] = $this->config->get('config_sticker_new_module_special');
		}
		
		if (isset($this->request->post['config_sticker_popular_module_special'])) {
			$this->data['config_sticker_popular_module_special'] = $this->request->post['config_sticker_popular_module_special'];
		} else {
			$this->data['config_sticker_popular_module_special'] = $this->config->get('config_sticker_popular_module_special');
		}
		
		if (isset($this->request->post['config_sticker_special_categories'])) {
			$this->data['config_sticker_special_categories'] = $this->request->post['config_sticker_special_categories'];
		} else {
			$this->data['config_sticker_special_categories'] = $this->config->get('config_sticker_special_categories');
		}
		
		if (isset($this->request->post['config_sticker_new_categories'])) {
			$this->data['config_sticker_new_categories'] = $this->request->post['config_sticker_new_categories'];
		} else {
			$this->data['config_sticker_new_categories'] = $this->config->get('config_sticker_new_categories');
		}
		
		if (isset($this->request->post['config_sticker_popular_categories'])) {
			$this->data['config_sticker_popular_categories'] = $this->request->post['config_sticker_popular_categories'];
		} else {
			$this->data['config_sticker_popular_categories'] = $this->config->get('config_sticker_popular_categories');
		}
		
		if (isset($this->request->post['config_sticker_special_manufacturer'])) {
			$this->data['config_sticker_special_manufacturer'] = $this->request->post['config_sticker_special_manufacturer'];
		} else {
			$this->data['config_sticker_special_manufacturer'] = $this->config->get('config_sticker_special_manufacturer');
		}
		
		if (isset($this->request->post['config_sticker_new_manufacturer'])) {
			$this->data['config_sticker_new_manufacturer'] = $this->request->post['config_sticker_new_manufacturer'];
		} else {
			$this->data['config_sticker_new_manufacturer'] = $this->config->get('config_sticker_new_manufacturer');
		}
		
		if (isset($this->request->post['config_sticker_popular_manufacturer'])) {
			$this->data['config_sticker_popular_manufacturer'] = $this->request->post['config_sticker_popular_manufacturer'];
		} else {
			$this->data['config_sticker_popular_manufacturer'] = $this->config->get('config_sticker_popular_manufacturer');
		}
		
		if (isset($this->request->post['config_sticker_special_product'])) {
			$this->data['config_sticker_special_product'] = $this->request->post['config_sticker_special_product'];
		} else {
			$this->data['config_sticker_special_product'] = $this->config->get('config_sticker_special_product');
		}
		
		if (isset($this->request->post['config_sticker_new_product'])) {
			$this->data['config_sticker_new_product'] = $this->request->post['config_sticker_new_product'];
		} else {
			$this->data['config_sticker_new_product'] = $this->config->get('config_sticker_new_product');
		}
		
		if (isset($this->request->post['config_sticker_popular_product'])) {
			$this->data['config_sticker_popular_product'] = $this->request->post['config_sticker_popular_product'];
		} else {
			$this->data['config_sticker_popular_product'] = $this->config->get('config_sticker_popular_product');
		}
		
		if (isset($this->request->post['config_sticker_special_product_related'])) {
			$this->data['config_sticker_special_product_related'] = $this->request->post['config_sticker_special_product_related'];
		} else {
			$this->data['config_sticker_special_product_related'] = $this->config->get('config_sticker_special_product_related');
		}
		
		if (isset($this->request->post['config_sticker_new_product_related'])) {
			$this->data['config_sticker_new_product_related'] = $this->request->post['config_sticker_new_product_related'];
		} else {
			$this->data['config_sticker_new_product_related'] = $this->config->get('config_sticker_new_product_related');
		}
		
		if (isset($this->request->post['config_sticker_popular_product_related'])) {
			$this->data['config_sticker_popular_product_related'] = $this->request->post['config_sticker_popular_product_related'];
		} else {
			$this->data['config_sticker_popular_product_related'] = $this->config->get('config_sticker_popular_product_related');
		}
		
		if (isset($this->request->post['config_sticker_special_search'])) {
			$this->data['config_sticker_special_search'] = $this->request->post['config_sticker_special_search'];
		} else {
			$this->data['config_sticker_special_search'] = $this->config->get('config_sticker_special_search');
		}
		
		if (isset($this->request->post['config_sticker_new_search'])) {
			$this->data['config_sticker_new_search'] = $this->request->post['config_sticker_new_search'];
		} else {
			$this->data['config_sticker_new_search'] = $this->config->get('config_sticker_new_search');
		}
		
		if (isset($this->request->post['config_sticker_popular_search'])) {
			$this->data['config_sticker_popular_search'] = $this->request->post['config_sticker_popular_search'];
		} else {
			$this->data['config_sticker_popular_search'] = $this->config->get('config_sticker_popular_search');
		}
		
		if (isset($this->request->post['config_sticker_special_special'])) {
			$this->data['config_sticker_special_special'] = $this->request->post['config_sticker_special_special'];
		} else {
			$this->data['config_sticker_special_special'] = $this->config->get('config_sticker_special_special');
		}
		
		if (isset($this->request->post['config_sticker_new_special'])) {
			$this->data['config_sticker_new_special'] = $this->request->post['config_sticker_new_special'];
		} else {
			$this->data['config_sticker_new_special'] = $this->config->get('config_sticker_new_special');
		}
		
		if (isset($this->request->post['config_sticker_popular_special'])) {
			$this->data['config_sticker_popular_special'] = $this->request->post['config_sticker_popular_special'];
		} else {
			$this->data['config_sticker_popular_special'] = $this->config->get('config_sticker_popular_special');
		}
		
		if (isset($this->request->post['config_sticker_special_quick_view'])) {
			$this->data['config_sticker_special_quick_view'] = $this->request->post['config_sticker_special_quick_view'];
		} else {
			$this->data['config_sticker_special_quick_view'] = $this->config->get('config_sticker_special_quick_view');
		}
		
		if (isset($this->request->post['config_sticker_new_quick_view'])) {
			$this->data['config_sticker_new_quick_view'] = $this->request->post['config_sticker_new_quick_view'];
		} else {
			$this->data['config_sticker_new_quick_view'] = $this->config->get('config_sticker_new_quick_view');
		}
		
		if (isset($this->request->post['config_sticker_popular_quick_view'])) {
			$this->data['config_sticker_popular_quick_view'] = $this->request->post['config_sticker_popular_quick_view'];
		} else {
			$this->data['config_sticker_popular_quick_view'] = $this->config->get('config_sticker_popular_quick_view');
		}
		
		if (isset($this->request->post['config_sticker_special_quick_view_related'])) {
			$this->data['config_sticker_special_quick_view_related'] = $this->request->post['config_sticker_special_quick_view_related'];
		} else {
			$this->data['config_sticker_special_quick_view_related'] = $this->config->get('config_sticker_special_quick_view_related');
		}
		
		if (isset($this->request->post['config_sticker_new_quick_view_related'])) {
			$this->data['config_sticker_new_quick_view_related'] = $this->request->post['config_sticker_new_quick_view_related'];
		} else {
			$this->data['config_sticker_new_quick_view_related'] = $this->config->get('config_sticker_new_quick_view_related');
		}
		
		if (isset($this->request->post['config_sticker_popular_quick_view_related'])) {
			$this->data['config_sticker_popular_quick_view_related'] = $this->request->post['config_sticker_popular_quick_view_related'];
		} else {
			$this->data['config_sticker_popular_quick_view_related'] = $this->config->get('config_sticker_popular_quick_view_related');
		}
		
		if (isset($this->request->post['config_sticker_special_news_related_product'])) {
			$this->data['config_sticker_special_news_related_product'] = $this->request->post['config_sticker_special_news_related_product'];
		} else {
			$this->data['config_sticker_special_news_related_product'] = $this->config->get('config_sticker_special_news_related_product');
		}
		
		if (isset($this->request->post['config_sticker_new_news_related_product'])) {
			$this->data['config_sticker_new_news_related_product'] = $this->request->post['config_sticker_new_news_related_product'];
		} else {
			$this->data['config_sticker_new_news_related_product'] = $this->config->get('config_sticker_new_news_related_product');
		}
		
		if (isset($this->request->post['config_sticker_popular_news_related_product'])) {
			$this->data['config_sticker_popular_news_related_product'] = $this->request->post['config_sticker_popular_news_related_product'];
		} else {
			$this->data['config_sticker_popular_news_related_product'] = $this->config->get('config_sticker_popular_news_related_product');
		}

		$this->data['modules'] = array();
		
		if (isset($this->request->post['product_stickers_module'])) {
			$this->data['modules'] = $this->request->post['product_stickers_module'];
		} elseif ($this->config->get('product_stickers_module')) { 
			$this->data['modules'] = $this->config->get('product_stickers_module');
		}				
				
		$this->template = 'module/product_stickers.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/latest')) {
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