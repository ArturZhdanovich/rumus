<?php 
//-----------------------------------------------------
// AmazonMenu II for Opencart v1.5.4   
// Created by villagedefrance                          
// contact@villagedefrance.net                                    
//-----------------------------------------------------

class ControllerModuleAmazonMenu extends Controller {

	private $_name = 'amazonmenu';
	
	protected function index($setting) {
		static $module = 0;
	
		$this->language->load('module/' . $this->_name);
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();
		
		foreach ($languages as $language) {
			if (isset($this->request->post[$this->_name . '_titles' . $language['language_id']])) {
				$this->data[$this->_name . '_titles' . $language['language_id']] = $this->request->post[$this->_name . '_titles' . $language['language_id']];
			} else {
				$this->data[$this->_name . '_titles' . $language['language_id']] = $this->config->get($this->_name . '_titles' . $language['language_id']);
			}
		}
		
		$this->data['titles'] = $this->config->get($this->_name . '_titles' . $this->config->get('config_language_id'));
		$this->data['header'] = $this->config->get($this->_name . '_header');
		
		if (!$this->data['titles']) { $this->data['titles'] = $this->data['heading_title']; } 
		if (!$this->data['header']) { $this->data['titles'] = ''; }
		
		$this->data['icon'] = $this->config->get($this->_name . '_icon');
		$this->data['box'] = $this->config->get($this->_name . '_box');

		// Direction
		$this->data['position'] = $setting['position'];
		$this->data['orientation'] = $this->language->get('direction');
		
		if ($this->data['position'] == 'column_left') {
			if ($this->data['orientation'] == 'ltr') {
				$this->data['direction'] = true;
			} else {
				$this->data['direction'] = false;
			}
		} else {
			$this->data['direction'] = false;
		}
		
		// Style and Script
		$this->document->addStyle('catalog/view/javascript/jquery/amazonmenu/css/amzmenu.css');
		$this->document->addScript('catalog/view/javascript/jquery/amazonmenu/js/amzmenu.js');
		
		// Multi Store
		$this->data['directory'] = $this->config->get($this->_name . '_directory');
		$this->data['fullstore'] = $this->language->get('text_directory');
		
		$this->data['store_id'] = $this->config->get('config_store_id');
	
		$this->data['stores'] = array();
	
		$this->data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->language->get('text_default'),
			'url'      => HTTP_SERVER . 'index.php?route=product/category_list'
		);
	
		$this->load->model('setting/store');
		
		$storeresults = $this->model_setting_store->getStores();
	
		foreach ($storeresults as $storeresult) {
			$this->data['stores'][] = array(
				'store_id' => $storeresult['store_id'],
				'name'   => $storeresult['name'],
				'url'      => $storeresult['url'] . 'index.php?route=product/category_list'
			);
		}
		
		// Keywords
		if (isset($setting['metawords'])) {
			$this->data['metawords'] = true;
		} else {
			$this->data['metawords'] = false;
		}
		
		// Categories
		$this->data['toplimit'] = $setting['toplimit'];
		$this->data['botlimit'] = $setting['botlimit'];
		$this->data['maxlimit'] = $this->data['toplimit'] + $this->data['botlimit'];
		
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		
		$this->data['categories'] = array();
	
		$categories_c1 = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories_c1 as $category_c1) {
			$level_c2_data = array();
			
			$categories_c2 = $this->model_catalog_category->getCategories($category_c1['category_id']);
			
			foreach ($categories_c2 as $category_c2) {
				$level_c3_data = array();
				
				$categories_c3 = $this->model_catalog_category->getCategories($category_c2['category_id']);
				
				foreach ($categories_c3 as $category_c3) {
					$level_c4_data = array();
				
					$categories_c4 = $this->model_catalog_category->getCategories($category_c3['category_id']);
				
					foreach ($categories_c4 as $category_c4) {
					
						$data = array(
							'filter_category_id'  => $category_c4['category_id'],
							'filter_sub_category' => true
						);
						
						if (isset($setting['count'])) {
							$product_total = $this->model_catalog_product->getTotalProducts($data);
							$category_c4['name'] = $category_c4['name'] . ' (' . $product_total . ')';
						}
						
						$level_4_data[] = array(
							'category_id' => $category_c4['category_id'],
							'name' => $category_c4['name'],
							'href' => $this->url->link('product/category', 'path=' . $category_c1['category_id'] . '_' . $category_c2['category_id'] . '_' . $category_c3['category_id'] . '_' . $category_c4['category_id'])
						);
					}
				
					$data = array(
						'filter_category_id'  => $category_c3['category_id'],
						'filter_sub_category' => true
					);
					
					if (isset($setting['count'])) {
						$product_total = $this->model_catalog_product->getTotalProducts($data);
						$category_c3['name'] = $category_c3['name'] . ' (' . $product_total . ')';
					}
					
					$level_c3_data[] = array(
						'category_id' => $category_c3['category_id'],
						'name' => $category_c3['name'],
						'children' => $level_c4_data,
						'href' => $this->url->link('product/category', 'path=' . $category_c1['category_id'] . '_' . $category_c2['category_id'] . '_' . $category_c3['category_id'])
					);
				}
				
				$data = array(
					'filter_category_id'  => $category_c2['category_id'],
					'filter_sub_category' => true
				);
				
				if (isset($setting['count'])) {
					$product_total = $this->model_catalog_product->getTotalProducts($data);
					$category_c2['name'] = $category_c2['name'] . ' (' . $product_total . ')';
				}
				
				$category_c2_keyword = $this->language->get($category_c2['meta_keyword']);
				
				if (isset($category_c2_keyword) && $this->data['metawords']) {
					$keyword = $category_c2_keyword;
				} else {
					$keyword = false;
				}
				
				$level_c2_data[] = array(
					'category_id' => $category_c2['category_id'],
					'name'     => $category_c2['name'],
					'keyword' => strip_tags(substr(html_entity_decode($keyword), 0, 70)),
					'children' => $level_c3_data,
					'href'     => $this->url->link('product/category', 'path=' . $category_c1['category_id'] . '_' . $category_c2['category_id'])	
				);	
			}
			
			$data = array(
				'filter_category_id'  => $category_c1['category_id'],
				'filter_sub_category' => true
			);	
			
			if (isset($setting['count'])) {
				$product_total = $this->model_catalog_product->getTotalProducts($data);
				$category_c1['name'] = $category_c1['name'] . ' (' . $product_total . ')';
			}
			
			$category_c1_keyword = $this->language->get($category_c1['meta_keyword']);
		
			if (isset($category_c1_keyword) && $this->data['metawords']) {
				$keyword = $category_c1_keyword;
			} else {
				$keyword = false;
			}

			$this->data['categories'][] = array(
				'category_id' => $category_c1['category_id'],
				'name'     => $category_c1['name'],
				'keyword' => strip_tags(substr(html_entity_decode($keyword), 0, 70)),
				'children' => $level_c2_data,
				'href'     => $this->url->link('product/category', 'path=' . $category_c1['category_id']),
				'sort'     => $category_c1['sort_order']
			);
		}
		
		// Sprites
		$this->data['sprite_links'] = $this->config->get($this->_name . '_sprite_links');
		
		$this->load->model('catalog/sprites');
		$this->load->model('tool/image');

		$this->data['sprites'] = array();
		
		$results = $this->model_catalog_sprites->getSprites();

	  	if ($results) {
			
			foreach ($results as $result) {
			
				if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
					$thumb = $this->model_tool_image->resize($result['image'], $this->config->get($this->_name . '_thumb_width'), $this->config->get($this->_name . '_thumb_height'));
				} else {
					$thumb = false;
				}
				
				if ($result['description']) {
					if (!preg_match("#^http(s)?://[a-z0-9-_.]+\.[a-z]{2,4}#i", $result['description'])) {
						$sprite_href = 'index.php?route=common/home';
					} else {
						$sprite_href = html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8');
					}
				}
			
				$this->data['sprites'][] = array(
					'id'  	=> $result['sprites_id'],
					'title'        => $result['title'],
					'thumb' 	=> $thumb,
					'link'			=> $sprite_href,
					'sort_order'   => $result['sort_order']
				);
			}
		}
		
		$this->data['module'] = $module++; 

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl';
		} else {
			$this->template = 'default/template/module/' . $this->_name . '.tpl';
		}
		
		$this->render();
  	}
}
?>