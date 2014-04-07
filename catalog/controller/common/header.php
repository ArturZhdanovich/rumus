<?php   
class ControllerCommonHeader extends Controller {
	protected function index() {
		$this->data['title'] = $this->document->getTitle();
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$this->data['base'] = $server;
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$this->data['name'] = $this->config->get('config_name');
		$this->data['quick_search'] = $this->config->get('config_quick_search');
		
		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}
		
		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}		
		
		$this->language->load('common/header');
		
		$this->load->model('catalog/news');
		
		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
    	$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_login'] = $this->language->get('text_login');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_welcome_user'] = sprintf($this->language->get('text_welcome_user'), $this->url->link('account/register', '', 'SSL'));
		if (($this->customer->getFirstName()) || ($this->customer->getLastName())) {
			$this->data['text_logged_user'] = sprintf($this->language->get('text_logged_user'), $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName());
		} else {
			$this->data['text_logged_user'] = $this->language->get('text_welcome_no_user');
		}
		$this->data['text_account'] = $this->language->get('text_account');
    	$this->data['text_checkout'] = $this->language->get('text_checkout');
		$this->data['text_all_news'] = sprintf($this->language->get('text_all_news'),  $this->config->get('config_news_count') ? ' (' . $this->model_catalog_news->getTotalNews() . ')' : '');
		$this->data['all_news_top_menu'] = $this->config->get('config_news_top_menu');		
		$this->data['text_email'] = $this->language->get('text_email');
		$this->data['text_password'] = $this->language->get('text_password');
		$this->data['text_forgotten'] = $this->language->get('text_forgotten');
		$this->data['text_register'] = $this->language->get('text_register');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_logout'] = $this->language->get('text_logout');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_download'] = $this->language->get('text_download');
		$this->data['text_edit'] = $this->language->get('text_edit');
		
		$this->data['button_login'] = $this->language->get('button_login');
		
		$this->data['home'] = $this->url->link('common/home');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$this->data['all_news'] = $this->url->link('news/all_news', '', 'SSL');		
		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
		$this->data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['download'] = $this->url->link('account/download', '', 'SSL');
		$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
		
		$this->data['compare'] = $this->url->link('product/compare');

		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
			$this->data['redirect'] = $this->request->post['redirect'];
		} elseif (isset($this->session->data['redirect'])) {
      		$this->data['redirect'] = $this->session->data['redirect'];
			
			unset($this->session->data['redirect']);		  	
    	} else {
			$this->data['redirect'] = '';
		}
		
		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$this->data['password'] = $this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}
		
		// Daniel's robot detector
		$status = true;
		
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", trim($this->config->get('config_robots')));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}
		
		// A dirty hack to try to set a cookie for the multi-store feature
		$this->load->model('setting/store');
		
		$this->data['stores'] = array();
		
		if ($this->config->get('config_shared') && $status) {
			$this->data['stores'][] = $server . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
			
			$stores = $this->model_setting_store->getStores();
					
			foreach ($stores as $store) {
				$this->data['stores'][] = $store['url'] . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
			}
		}
				
		// Search		
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}
		
		// Menu
		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$this->data['categories'] = array();
					
		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();
				
				$children = $this->model_catalog_category->getCategories($category['category_id']);
				
				foreach ($children as $child) {
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
					$product_total = $this->model_catalog_product->getTotalProducts($data);
									
					$children_data[] = array(
						'name'  	  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
						'category_id' => $child['category_id'],
						'href'  	  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);						
				}
				
				// Level 1
				$this->data['categories'][] = array(
					'name'        => $category['name'],
					'children'    => $children_data,
					'category_id' => $category['category_id'],
					'column'      => $category['column'] ? $category['column'] : 1,
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		// Information
		$this->load->model('catalog/information');
		
		$this->data['text_information'] = $this->language->get('text_information');
		
		$this->data['informations'] = array();
		
		$informations = $this->model_catalog_information->getInformations();
		
		foreach ($informations as $information) {	
			if ($information['top']) {
			
				$this->data['informations'][] = array(
					'title' => $information['title'],
					'href' 	=> $this->url->link('information/information', 'information_id=' . $information['information_id'])
				);
			}
		}
		
		// Brands
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		
		$this->data['manufacturer_top_menu'] = $this->config->get('config_manufacturer_top_menu');
		$this->data['manufacturer_image'] = $this->config->get('config_manufacturer_image_top_menu');
		
		$this->data['text_manufacturers'] = $this->language->get('text_manufacturers');
		
		$this->data['manufacturers'] = array();
		
		$manufacturers = $this->model_catalog_manufacturer->getManufacturers();
		
		foreach ($manufacturers as $manufacturer) {	
			if ($manufacturer['image']) {
				$image = $manufacturer['image'];
			} else {
				$image = 'no_image.jpg';
			}
			
			$this->data['manufacturers'][] = array(
				'name' 	=> $manufacturer['name'],
				'image' => $this->model_tool_image->resize($image, 20, 20),
				'href' 	=> $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'])
			);
		}
		
		// Contacts
		$this->data['contacts_display'] = $this->config->get('config_contacts_display');
		$this->data['contacts_address'] = $this->config->get('config_address');
		$this->data['contacts_email'] = $this->config->get('config_email');
		$this->data['contacts_telephone'] = $this->config->get('config_telephone');
		$this->data['contacts_mobile_telephone'] = $this->config->get('config_mobile_telephone');
		$this->data['contacts_fax'] = $this->config->get('config_fax');
		
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_address'] = $this->language->get('text_address');
		$this->data['text_email_address'] = $this->language->get('text_email_address');
		$this->data['text_telephone'] = $this->language->get('text_telephone');
		$this->data['text_mobile_telephone'] = $this->language->get('text_mobile_telephone');
		$this->data['text_fax'] = $this->language->get('text_fax');
		
		$this->children = array(
			'module/language',
			'module/currency',
			'module/menu',
			'module/cart'
		);
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}
		
    	$this->render();
	} 	
}
?>
