<?php  
class ControllerModuleNewsCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/news_category');
		
		$this->document->addScript("catalog/view/javascript/jquery/autocomplete/jquery.autocomplete.js");          
        $this->document->addStyle("catalog/view/javascript/jquery/autocomplete/jquery.autocomplete.css");
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_no_description'] = $this->language->get('text_no_description');
		
		$this->data['search_news'] = $this->config->get('config_search_news');
		
		$this->data['setting'] = $setting;
		
		$this->data['top_bottom'] = $setting['position'] == 'content_top' || $setting['position'] == 'content_bottom';
		$this->data['side_left'] = $setting['position'] == 'column_left';
		$this->data['side_right'] = $setting['position'] == 'column_right';
		$this->data['side'] = $setting['position'] == 'column_left' || $setting['position'] == 'column_right';
				
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}
		
		if (isset($this->request->get['ncat'])) {
			$parts = explode('_', (string)$this->request->get['ncat']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['news_category_id'] = $parts[0];
		} else {
			$this->data['news_category_id'] = 0;
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
							
		$this->load->model('catalog/news_category');

		$this->load->model('catalog/news');
		
		$this->load->model('tool/image');
		
		$this->data['width'] = 245 - $setting['image_width'];
		
		$this->data['all_news_side_menu'] = $this->config->get('config_news_side_menu');
		$this->data['all_news'] = $this->url->link('news/all_news', '', 'SSL');
		
		$this->data['text_all_news'] = sprintf($this->language->get('text_all_news'),  $this->config->get('config_news_count') ? ' (' . $this->model_catalog_news->getTotalNews() . ')' : '');

		$this->data['news_categories'] = array();
		
		$news_categories = $this->model_catalog_news_category->getNewsCategories(0);
		
		if (empty($setting['limit'])) {
			$setting['limit'] = 10;
		}	
		
		if ($setting['name_limit']) {
			$name_symbols_limit = $setting['name_limit'];
		} else {
			$name_symbols_limit = 25;
		}
		
		$news_categories = array_slice($news_categories, 0, (int)$setting['limit']);	

		foreach ($news_categories as $news_category) {
			$children_data = array();

			$children = $this->model_catalog_news_category->getNewsCategories($news_category['news_category_id']);
			
			$trimmed_name = strip_tags(html_entity_decode($news_category['name'], ENT_QUOTES, 'UTF-8'));
			
			if (mb_strlen($trimmed_name, 'UTF-8') > $name_symbols_limit) {
				$trimmed_name = mb_substr($trimmed_name, 0, $name_symbols_limit, 'UTF-8') . '..';
			}
			
			if ($setting['image_on']) {
				$thumb = $this->model_tool_image->resize($news_category['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$thumb = false;
			}
			
			if ($news_category['description']) {
				$description = utf8_substr(strip_tags(html_entity_decode($news_category['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_limit']) . '...';
			} else {
				$description = '';
			}

			foreach ($children as $child) {
				$data = array(
					'filter_news_category_id'  => $child['news_category_id'],
					'filter_sub_news_category' => true
				);
				
				$children2_data = array();
				
                $children2 = $this->model_catalog_news_category->getNewsCategories($child['news_category_id']);
				
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
                        'filter_news_category_id'  => $child2['news_category_id'],
                        'filter_sub_news_category' => true
                    );

                    $news_total2 = $this->model_catalog_news->getTotalNews($data2);

                    $children3_data = array();
					
                    $children3 = $this->model_catalog_news_category->getNewsCategories($child2['news_category_id']);
					
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
                            'filter_news_category_id'  => $child3['news_category_id'],
                            'filter_sub_news_category' => true
                        );

                        $news_total3 = $this->model_catalog_news->getTotalNews($data3);

                        $children3_data[] = array(
                            'news_category_id' 	=> $child3['news_category_id'],
                            'name'        		=> $child3['name'] . ($this->config->get('config_news_count') ? ' (' . $news_total3 . ')' : ''),
                            'href'        		=> $this->url->link('news/news_category', 'ncat=' . $news_category['news_category_id'] . '_' . $child['news_category_id'] . '_' . $child2['news_category_id'] . '_' . $child3['news_category_id'])
                        );
                    }

                    $children2_data[] = array(
                        'news_category_id'   => $child2['news_category_id'],
						'name'        		 => $child2_trimmed_name . ($this->config->get('config_news_count') ? ' (' . $news_total2 . ')' : ''),
                        'child3_id'   		 => $children3_data,
                        'child2_thumb'       => $child2_thumb,
						'child2_description' => $child2_description,
                        'href'        		 => $this->url->link('news/news_category', 'ncat=' . $news_category['news_category_id'] . '_' . $child['news_category_id'] . '_' . $child2['news_category_id'])
                    );
                }

				$children_data[] = array(
					'news_category_id' 	=> $child['news_category_id'],
					'name'        		=> $child_trimmed_name . ($this->config->get('config_news_count') ? ' (' . $this->model_catalog_news->getTotalNews($data) . ')' : ''),
					'child2_id'   		=> $children2_data,
                    'child_thumb' 		=> $child_thumb,
					'child_description' => $child_description,
					'href'        		=> $this->url->link('news/news_category', 'ncat=' . $news_category['news_category_id'] . '_' . $child['news_category_id'])	
				);		
			}

			$data = array(
				'filter_news_category_id'  => $news_category['news_category_id'],
				'filter_sub_news_category' => true
			);

			$this->data['news_categories'][] = array(
				'news_category_id' 	=> $news_category['news_category_id'],
				'name'        		=> $trimmed_name . ($this->config->get('config_news_count') ? ' (' . $this->model_catalog_news->getTotalNews($data) . ')' : ''),
				'children'    		=> $children_data,
				'thumb'       		=> $thumb,
				'no_image'    		=> $this->model_tool_image->resize('no_image.jpg', $setting['image_width'], $setting['image_height']),
				'description' 		=> $description,
				'href'        		=> $this->url->link('news/news_category', 'ncat=' . $news_category['news_category_id'])
			);	
		}
		
		$this->data['width_top'] = $setting['image_width'] + 2;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news_category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/news_category.tpl';
		} else {
			$this->template = 'default/template/module/news_category.tpl';
		}
		
		$this->render();
  	}
	
	public function autocomplete() {
        $this->language->load('module/news_category');
        $this->load->model('catalog/news');
        $results = array();
        
        $results = $this->model_catalog_news->getAutocomplete($_GET['q']);

        header("Content-Type: text/html; charset=UTF-8");

        foreach ($results as $value) {       
            $txt=json_encode($value['name']);
            echo json_decode($txt)."\n"; 
        }
    }
}
?>