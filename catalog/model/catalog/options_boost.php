<?php
//-----------------------------------------
// Author: Qphoria@gmail.com
// Web: http://www.OpenCartGuru.com/
//-----------------------------------------
class ModelCatalogOptionsBoost extends Model {
	//Q: Options Plus Redux
    public function getProductOptions($product_id) {

		$this->load->model('tool/image');

        // Get all product options associated with this product id
        $product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");

        // Loop through each product option to get the product option values
        foreach ($product_option_query->rows as $k1 => $product_option) {

            // Get the product option values for this product option
            $product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");

			#
            // Temporarily clone product_option_id to option_id to make it work with opencart (fix this in core product controller!)
            $product_option_query->rows[$k1]['option_id'] = $product_option_query->rows[$k1]['product_option_id'];
			foreach($product_option_value_query->rows as $j1 => $product_option_value) {
				$product_option_value_query->rows[$j1]['option_value_id'] = $product_option_value_query->rows[$j1]['product_option_value_id'];
				if (!empty($product_option_value_query->rows[$j1]['image'])) {
					$product_option_value_query->rows[$j1]['image'] = $this->model_tool_image->resize($product_option_value_query->rows[$j1]['image'], 50, 50);
				}
			}
			#

			// Merge the product_option_values into the main product options
			if (!$product_option_query->rows[$k1]['option_value']) { // Don't overwrite textbox and other string values
				if ($product_option_value_query->num_rows) {
            		$product_option_query->rows[$k1]['option_value'] = $product_option_value_query->rows;
				} elseif ($product_option_query->rows[$k1]['option_value']) {
					$product_option_query->rows[$k1]['option_value'] = array();
				}
			}
        }

        return $product_option_query->rows;
    }//
}