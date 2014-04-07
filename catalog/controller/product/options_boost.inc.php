<?php
//-----------------------------------------
// Author: Qphoria@gmail.com
// Web: http://www.OpenCartGuru.com/
//-----------------------------------------

// Duplicate of the product price code but don't format the values
$discount_query = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

$xdiscount = false;
if ($discount_query) {
	$xdiscount = $xdiscount[0];
}

if ($xdiscount) {
	$this->data['xprice'] = $this->tax->calculate($xdiscount, $product_info['tax_class_id'], $this->config->get('config_tax'));

	$this->data['xspecial'] = FALSE;
} else {
	$this->data['xprice'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));

	if ($product_info['special']) {
		$this->data['xspecial'] = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
	} else {
		$this->data['xspecial'] = FALSE;
	}
}

$xprice = $this->data['xprice'];

//Q: Options Boost
$this->load->model('catalog/options_boost');
$options = $this->model_catalog_options_boost->getProductOptions($this->request->get['product_id']);

// Remove +0.0000 prices
foreach ($options as $k => $option) {

	// Skip text/textbox/etc
	if (!is_array($option['option_value'])) { continue ; }

	// Loop through each option value
	foreach ($option['option_value'] as $j => $option_value) {
		if ((float)$option_value['price']) {

			if ($option_value['price_prefix'] == '%') {
				$options[$k]['option_value'][$j]['price'] = $this->currency->format($this->tax->calculate(($xprice * ((float)$option_value['price']/100)), $product_info['tax_class_id'], $this->config->get('config_tax')));
				$options[$k]['option_value'][$j]['price_prefix'] = '+';
			} elseif ($option_value['price_prefix'] == '*') { //check for *
				$options[$k]['option_value'][$j]['price'] = $this->currency->format($this->tax->calculate(($xprice * (float)$option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
				$options[$k]['option_value'][$j]['price_prefix'] = '+';
			} elseif ($option_value['price_prefix'] == '=') { //check for =
				$options[$k]['option_value'][$j]['price'] = $this->currency->format($this->tax->calculate((float)$option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				$options[$k]['option_value'][$j]['price_prefix'] = '';
			} elseif ($option_value['price_prefix'] == '&') { //check for &. Don't display a price for this as it will change depending on the order and selected options
				$options[$k]['option_value'][$j]['price'] = '';
				$options[$k]['option_value'][$j]['price_prefix'] = '';
			} else { // assume +
				$options[$k]['option_value'][$j]['price'] = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			}
		} else {
			$options[$k]['option_value'][$j]['price'] = FALSE;
		}

		// Image resize:
		if (!empty($options[$k]['option_value'][$j]['ob_image'])) {
			$options[$k]['option_value'][$j]['swatch'] 	= $this->model_tool_image->resize($options[$k]['option_value'][$j]['ob_image'], 40, 40);
			$options[$k]['option_value'][$j]['thumb'] 	= $this->model_tool_image->resize($options[$k]['option_value'][$j]['ob_image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			$options[$k]['option_value'][$j]['popup'] 	= $this->model_tool_image->resize($options[$k]['option_value'][$j]['ob_image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
		} else {
			$options[$k]['option_value'][$j]['swatch'] 	= '';
			$options[$k]['option_value'][$j]['thumb'] 	= '';
			$options[$k]['option_value'][$j]['popup'] 	= '';
		}

		// Add Stock Qty to name
		$options[$k]['option_value'][$j]['name'] = $options[$k]['option_value'][$j]['name'] ;
	}
}

// Override original options
$this->data['options'] = array();
$this->data['options'] = $options;
//
?>