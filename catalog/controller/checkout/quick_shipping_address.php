<?php 
class ControllerCheckoutQuickShippingAddress extends Controller {
	public function index() {
		$this->language->load('checkout/quick_checkout');
		
		$this->data['text_address_existing'] = $this->language->get('text_address_existing');
		$this->data['text_checkout_shipping_not'] = $this->language->get('text_checkout_shipping_not');
		$this->data['text_address_new'] = $this->language->get('text_address_new');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');

		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_address_2'] = $this->language->get('entry_address_2');
		$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
	
		$this->data['button_continue'] = $this->language->get('button_continue');
		
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
 
			
		if (isset($this->session->data['shipping_address_id'])) {
			$this->data['address_id'] = $this->session->data['shipping_address_id'];
		} else {
			$this->data['address_id'] = $this->customer->getAddressId();
		}

		$this->load->model('account/address');

		$this->data['addresses'] = $this->model_account_address->getAddresses();

		if (isset($this->session->data['shipping_postcode'])) {
			$this->data['postcode'] = $this->session->data['shipping_postcode'];		
		} else {
			$this->data['postcode'] = '';
		}
				
		if (isset($this->session->data['shipping_country_id'])) {
			$this->data['country_id'] = $this->session->data['shipping_country_id'];		
		} else {
			$this->data['country_id'] = $this->config->get('config_country_id');
		}
				
		if (isset($this->session->data['shipping_zone_id'])) {
			$this->data['zone_id'] = $this->session->data['shipping_zone_id'];		
		} else {
			$this->data['zone_id'] = '';
		}
						
		$this->load->model('localisation/country');
		
		$this->data['countries'] = $this->model_localisation_country->getCountries();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/quick_shipping_address.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/quick_shipping_address.tpl';
		} else {
			$this->template = 'default/template/checkout/quick_shipping_address.tpl';
		}
				
		$this->response->setOutput($this->render());
  	}	
	
	public function validate() {
		$this->language->load('checkout/quick_checkout');
		
		$json = array();
		
		// Validate if customer is logged in.
		if (!$this->customer->isLogged()) {
			$json['redirect'] = $this->url->link('checkout/quick_checkout', '', 'SSL');
		}
		
		// Validate if shipping is required. If not the customer should not have reached this page.
		if (!$this->cart->hasShipping()) {
			$json['redirect'] = $this->url->link('checkout/quick_checkout', '', 'SSL');
		}
		
		// Validate cart has products and has stock.		
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
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
				$json['redirect'] = $this->url->link('checkout/cart');
				
				break;
			}				
		}
								
		if (!$json) {
			if (isset($this->request->post['shipping_address']) && $this->request->post['shipping_address'] == 'existing') {
				$this->load->model('account/address');
				
				if (empty($this->request->post['address_id'])) {
					$json['error']['warning'] = $this->language->get('error_address');
				} elseif (!in_array($this->request->post['address_id'], array_keys($this->model_account_address->getAddresses()))) {
					$json['error']['warning'] = $this->language->get('error_address');
				}
						
				if (!$json) {			
					$this->session->data['shipping_address_id'] = $this->request->post['address_id'];
					
					// Default Shipping Address
					$this->load->model('account/address');

					$address_info = $this->model_account_address->getAddress($this->request->post['address_id']);
					
					if ($address_info) {
						$this->session->data['shipping_country_id'] = $address_info['country_id'];
						$this->session->data['shipping_zone_id'] = $address_info['zone_id'];
						$this->session->data['shipping_postcode'] = $address_info['postcode'];						
					} else {
						unset($this->session->data['shipping_country_id']);	
						unset($this->session->data['shipping_zone_id']);	
						unset($this->session->data['shipping_postcode']);
					}
					
					unset($this->session->data['shipping_method']);							
					unset($this->session->data['shipping_methods']);
				}
			} 
			
			if ($this->request->post['shipping_address'] == 'new') {
			    if ($this->config->get('config_first_quick_registration_checkout')) {
					if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
						$json['error']['firstname'] = $this->language->get('error_firstname');
					}
				}
				
				if ($this->config->get('config_last_quick_registration_checkout')) {
					if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
						$json['error']['lastname'] = $this->language->get('error_lastname');
					}
				}
				
				if ($this->config->get('config_address_1_quick_registration_checkout')) {
					if ((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 128)) {
						$json['error']['address_1'] = $this->language->get('error_address_1');
					}
				}
				
				if ($this->config->get('config_city_quick_registration_checkout')) {
					if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) {
						$json['error']['city'] = $this->language->get('error_city');
					}
				}
				
				$this->load->model('localisation/country');
				
				$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
				
				if ($this->config->get('config_post_code_quick_registration_checkout')) {
					if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
						$json['error']['postcode'] = $this->language->get('error_postcode');
					}
				}
				
				if ($this->config->get('config_country_quick_registration_checkout')) {
					if ($this->request->post['country_id'] == '') {
						$json['error']['country'] = $this->language->get('error_country');
					}
					
					if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
						$json['error']['zone'] = $this->language->get('error_zone');
					}
				}
				
				if (!$json) {						
					// Default Shipping Address
					$this->load->model('account/address');		
					
					$this->session->data['shipping_address_id'] = $this->model_account_address->addAddress($this->request->post);
					$this->session->data['shipping_country_id'] = $this->request->post['country_id'];
					$this->session->data['shipping_zone_id'] = $this->request->post['zone_id'];
					$this->session->data['shipping_postcode'] = $this->request->post['postcode'];
									
					unset($this->session->data['shipping_method']);						
					unset($this->session->data['shipping_methods']);
				}
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>