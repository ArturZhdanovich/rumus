<?php
class ControllerModuleLastview extends Controller {
	protected function index($setting) {
	
		$this->language->load('module/lastview');
    
      	$this->data['heading_title'] = $this->language->get('heading_title');
  	
  		$this->load->model('catalog/product');
	
		$this->load->model('tool/image');
	
		$this->data['button_cart'] = $this->language->get('button_cart');
    
        if (isset($this->request->get['product_id'])) {
            $result = $this->model_catalog_product->getProduct($this->request->get['product_id']);
            if (isset($result)){
            
    			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
    				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
    			}
    						
    			if ((float)$result['special']) {
    				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
    			}else {
    			 $special  = false;
    			}


    			if ($result['image']) {
    				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
    			} else {
    				$image = '';
    			}    			             
                $this->session->data['lastview'][$this->request->get['product_id']] = array (
                    'product_id'    => $result['product_id'],
                    'image' => $image, 
                    'price' => $price,
                    'special' => $special,
                    'href'  => $this->url->link('product/product', 'product_id=' . $result['product_id']), 
                    'name'  => $result['name']
                );
            } 
        }
        
		$this->data['products'] = array();
        if (isset($this->session->data['lastview'])){
    		$results = $this->session->data['lastview'];
    		foreach ($results as $result) {
    			$special = FALSE;
    			$this->data['products'][] = array(
    				'product_id'    => $result['product_id'],
    				'name'    		=> $result['name'],
    				'image'   		=> $result['image'],
    				'href'    		=> $result['href'], 
    				'price'			=> $result['price'],
    				'special'       => $result['special']
    			);
    		}
    		$this->data['limit'] = $setting['limit'];
    		$this->id = 'lastview';
    
    			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/lastview.tpl')) {
    				$this->template = $this->config->get('config_template') . '/template/module/lastview.tpl';
    			} else {
    				$this->template = 'default/template/module/lastview.tpl';
    			}
    		$this->render();
        }
	}
}
?>