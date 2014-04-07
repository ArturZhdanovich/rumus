<?php  
class ControllerModuleCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/category');
		
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_description'] = $this->language->get('text_no_description');
		
		$this->data['setting'] = $setting;
		
		$this->data['top_bottom'] = $setting['position'] == 'content_top' || $setting['position'] == 'content_bottom';
		$this->data['side_left'] = $setting['position'] == 'column_left';
		$this->data['side_right'] = $setting['position'] == 'column_right';
		$this->data['side'] = $setting['position'] == 'column_left' || $setting['position'] == 'column_right';

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
		
		if (isset($parts[2])) {
            $this->data['child2_id'] = $parts[2];
        } else {
            $this->data['child2_id'] = 0;
        }

        if (isset($parts[3])) {
            $this->data['child3_id'] = $parts[3];
        } else {
            $this->data['child3_id'] = 0;
        }
							
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		$this->data['width'] = 245 - $setting['image_width'];

		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);
		
		if (empty($setting['limit'])) {
			$setting['limit'] = 30;
		}
		
		if ($setting['name_limit']) {
			$name_symbols_limit = $setting['name_limit'];
		} else {
			$name_symbols_limit = 25;
		}

		$categories = array_slice($categories, 0, (int)$setting['limit']);

		foreach ($categories as $category) {
			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);
			
			$trimmed_name = strip_tags(html_entity_decode($category['name'], ENT_QUOTES, 'UTF-8'));
			
			if (mb_strlen($trimmed_name, 'UTF-8') > $name_symbols_limit) {
				$trimmed_name = mb_substr($trimmed_name, 0, $name_symbols_limit, 'UTF-8') . '..';
			}
			
			if ($setting['image_on']) {
				$thumb = $this->model_tool_image->resize($category['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$thumb = false;
			}
			
			if ($category['description']) {
				$description = utf8_substr(strip_tags(html_entity_decode($category['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_limit']) . '...';
			} else {
				$description = '';
			}

			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);
				
				$children2_data = array();
				
                $children2 = $this->model_catalog_category->getCategories($child['category_id']);
				
				$child_trimmed_name = strip_tags(html_entity_decode($child['name'], ENT_QUOTES, 'UTF-8'));
			
				if (mb_strlen($child_trimmed_name, 'UTF-8') > $name_symbols_limit) {
					$child_trimmed_name = mb_substr($child_trimmed_name, 0, $name_symbols_limit, 'UTF-8') . '..';
				}
				
				if ($setting['image_on']) {
					$child_thumb = $this->model_tool_image->resize($child['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$child_thumb = false;
				}
				
				if ($child['description']) {
					$child_description = utf8_substr(strip_tags(html_entity_decode($child['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_limit']) . '...';
				} else {
					$child_description = '';
				}

                foreach ($children2 as $child2) {

                    $data2 = array(
                        'filter_category_id'  => $child2['category_id'],
                        'filter_sub_category' => true
                    );

                    $product_total2 = $this->model_catalog_product->getTotalProducts($data2);

                    $children3_data = array();
					
                    $children3 = $this->model_catalog_category->getCategories($child2['category_id']);
					
					$child2_trimmed_name = strip_tags(html_entity_decode($child2['name'], ENT_QUOTES, 'UTF-8'));
			
					if (mb_strlen($child2_trimmed_name, 'UTF-8') > $name_symbols_limit) {
						$child2_trimmed_name = mb_substr($child2_trimmed_name, 0, $name_symbols_limit, 'UTF-8') . '..';
					}
					
					if ($setting['image_on']) {
						$child2_thumb = $this->model_tool_image->resize($child2['image'], $setting['image_width'], $setting['image_height']);
					} else {
						$child2_thumb = false;
					}
					
					if ($child['description']) {
						$child2_description = utf8_substr(strip_tags(html_entity_decode($child2['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_limit']) . '...';
					} else {
						$child2_description = '';
					}

                    foreach ($children3 as $child3) {

                        $data3 = array(
                            'filter_category_id'  => $child3['category_id'],
                            'filter_sub_category' => true
                        );

                        $product_total3 = $this->model_catalog_product->getTotalProducts($data3);

                        $children3_data[] = array(
                            'category_id' => $child3['category_id'],
                            'name'        => $child3['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total3 . ')' : ''),
                            'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child2['category_id'] . '_' . $child3['category_id'])
                        );
                    }

                    $children2_data[] = array(
                        'category_id' 		 => $child2['category_id'],
						'name'        		 => $child2_trimmed_name . ($this->config->get('config_product_count') ? ' (' . $product_total2 . ')' : ''),
                        'child3_id'   		 => $children3_data,
                        'child2_thumb'       => $child2_thumb,
						'child2_description' => $child2_description,
                        'href'        		 => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child2['category_id'])
                    );
                }

				$children_data[] = array(
					'category_id' 		=> $child['category_id'],
					'name'        		=> $child_trimmed_name . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($data) . ')' : ''),
					'child2_id'   		=> $children2_data,
                    'child_thumb' 		=> $child_thumb,
					'child_description' => $child_description,
					'href'        		=> $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
				);		
			}

			$data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $trimmed_name . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($data) . ')' : ''),
				'children'    => $children_data,
				'thumb'       => $thumb,
				'no_image'    => $this->model_tool_image->resize('no_image.jpg', $setting['image_width'], $setting['image_height']),
				'description' => $description,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);	
		}
		
		$this->data['width_top'] = $setting['image_width'] + 2;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category.tpl';
		} else {
			$this->template = 'default/template/module/category.tpl';
		}
		
		$this->render();
  	}
}
?>