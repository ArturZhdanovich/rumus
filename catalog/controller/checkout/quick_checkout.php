<?php  
class ControllerCheckoutQuickCheckout extends Controller { 
	public function index() {
		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
	  		$this->redirect($this->url->link('checkout/cart'));
    	}	
		
		// Validate minimum quantity requirments.			
		$products = $this->cart->getProducts();
				
		foreach ($products as $product) {
			$product_total = 0;
				
			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}		
			
			if ($product['minimum'] > $product_total) {
				$this->redirect($this->url->link('checkout/cart'));
			}				
		}
				
		$this->language->load('checkout/quick_checkout');
		
		$this->document->setTitle($this->language->get('heading_title')); 
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
					
		$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	); 

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_cart'),
			'href'      => $this->url->link('checkout/cart'),
        	'separator' => $this->language->get('text_separator')
      	);
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('checkout/quick_checkout', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
					
	    $this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_checkout_option'] = $this->language->get('text_checkout_option');
		$this->data['text_checkout_account'] = $this->language->get('text_checkout_account');
		$this->data['text_checkout_payment_address'] = $this->language->get('text_checkout_payment_address');
		$this->data['text_checkout_shipping_address'] = $this->language->get('text_checkout_shipping_address');
		$this->data['text_checkout_shipping_method'] = $this->language->get('text_checkout_shipping_method');
		$this->data['text_checkout_payment_method'] = $this->language->get('text_checkout_payment_method');		
		$this->data['text_checkout_confirm'] = $this->language->get('text_checkout_confirm');
		$this->data['text_modify'] = $this->language->get('text_modify');
		
		$this->data['first_quick_registration_checkout'] = $this->config->get('config_first_quick_registration_checkout');
		$this->data['last_quick_registration_checkout'] = $this->config->get('config_last_quick_registration_checkout');
		$this->data['telephone_quick_registration_checkout'] = $this->config->get('config_telephone_quick_registration_checkout');
		$this->data['fax_quick_registration_checkout'] = $this->config->get('config_fax_quick_registration_checkout');
		$this->data['company_quick_registration_checkout'] = $this->config->get('config_company_quick_registration_checkout');
		$this->data['customer_groups_quick_registration_checkout'] = $this->config->get('config_customer_groups_quick_registration_checkout');
		$this->data['address_1_quick_registration_checkout'] = $this->config->get('config_address_1_quick_registration_checkout');
		$this->data['address_2_quick_registration_checkout'] = $this->config->get('config_address_2_quick_registration_checkout');
		$this->data['city_quick_registration_checkout'] = $this->config->get('config_city_quick_registration_checkout');
		$this->data['post_code_quick_registration_checkout'] = $this->config->get('config_post_code_quick_registration_checkout');
		$this->data['country_quick_registration_checkout'] = $this->config->get('config_country_quick_registration_checkout');
		$this->data['subscribe_quick_registration_checkout'] = $this->config->get('config_subscribe_quick_registration_checkout');
		
		$this->data['not_address_quick_registration_checkout'] = ($this->data['company_quick_registration_checkout']) || ($this->data['customer_groups_quick_registration_checkout']) || ($this->data['address_1_quick_registration_checkout']) || ($this->data['address_2_quick_registration_checkout']) || ($this->data['city_quick_registration_checkout']) || ($this->data['post_code_quick_registration_checkout']) || ($this->data['country_quick_registration_checkout']); 
 		
		$this->data['logged'] = $this->customer->isLogged();
		
		if ($this->data['not_address_quick_registration_checkout']) {
			$this->data['shipping_required'] = $this->cart->hasShipping();	
		} else {
			$this->data['shipping_required'] = false;
		}
		
		if (!$this->config->get('config_quick_registration_checkout')) {
			$this->redirect($this->url->link('checkout/checkout', '', 'SSL'));
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/quick_checkout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/quick_checkout.tpl';
		} else {
			$this->template = 'default/template/checkout/quick_checkout.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);
				
		$this->response->setOutput($this->render());
  	}
	
	public function country() {
		$json = array();
		
		$this->load->model('localisation/country');

    	$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);
		
		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>