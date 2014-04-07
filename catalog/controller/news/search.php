<?php 
class ControllerNewsSearch extends Controller { 	
	public function index() { 
    	$this->language->load('news/search');
		
		$this->load->model('catalog/news_category');
		
		$this->load->model('catalog/news');
		
		$this->load->model('catalog/news_comments');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		} 
		
		if (isset($this->request->get['tag'])) {
			$tag = $this->request->get['tag'];
		} elseif (isset($this->request->get['search'])) {
			$tag = $this->request->get['search'];
		} else {
			$tag = '';
		} 
			
		if (isset($this->request->get['description'])) {
			$description = $this->request->get['description'];
		} else {
			$description = '';
		} 
				
		if (isset($this->request->get['news_category_id'])) {
			$news_category_id = $this->request->get['news_category_id'];
		} else {
			$news_category_id = 0;
		} 
		
		if (isset($this->request->get['sub_news_category'])) {
			$sub_news_category = $this->request->get['sub_news_category'];
		} else {
			$sub_news_category = '';
		} 
								
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'n.sort_order';
		} 

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
  		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
				
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
		
		if (isset($this->request->get['search'])) {
			$this->document->setTitle($this->language->get('heading_title') .  ' - ' . $this->request->get['search']);
		} else {
			$this->document->setTitle($this->language->get('heading_title'));
		}
		
		$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array( 
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
      		'separator' => false
   		);
		
		$url = '';
		
		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['tag'])) {
			$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
		}
				
		if (isset($this->request->get['description'])) {
			$url .= '&description=' . $this->request->get['description'];
		}
				
		if (isset($this->request->get['news_category_id'])) {
			$url .= '&news_category_id=' . $this->request->get['news_category_id'];
		}
		
		if (isset($this->request->get['sub_news_category'])) {
			$url .= '&sub_news_category=' . $this->request->get['sub_news_category'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
				
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}	
		
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
						
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('news/search', $url),
      		'separator' => $this->language->get('text_separator')
   		);
		
		if (isset($this->request->get['search'])) {
    		$this->data['heading_title'] = $this->language->get('heading_title') .  ' - ' . $this->request->get['search'];
		} else {
			$this->data['heading_title'] = $this->language->get('heading_title');
		}
		
		$this->data['text_empty'] = $this->language->get('text_empty');
    	$this->data['text_critea'] = $this->language->get('text_critea');
    	$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_keyword'] = $this->language->get('text_keyword');
		$this->data['text_news_category'] = $this->language->get('text_news_category');
		$this->data['text_sub_news_category'] = $this->language->get('text_sub_news_category');
		$this->data['text_display'] = $this->language->get('text_display');
		$this->data['text_list'] = $this->language->get('text_list');
		$this->data['text_grid'] = $this->language->get('text_grid');		
		$this->data['text_limit'] = $this->language->get('text_limit');
		
		$this->data['entry_search'] = $this->language->get('entry_search');
    	$this->data['entry_description'] = $this->language->get('entry_description');
		  
    	$this->data['button_search'] = $this->language->get('button_search');
		$this->data['button_more'] = $this->language->get('button_more');
		
		$this->load->model('catalog/news_category');
		
		// 3 Level Category Search
		$this->data['news_categories'] = array();
					
		$news_categories_1 = $this->model_catalog_news_category->getNewsCategories(0);
		
		foreach ($news_categories_1 as $news_category_1) {
			$level_2_data = array();
			
			$news_categories_2 = $this->model_catalog_news_category->getNewsCategories($news_category_1['news_category_id']);
			
			foreach ($news_categories_2 as $news_category_2) {
				$level_3_data = array();
				
				$news_categories_3 = $this->model_catalog_news_category->getNewsCategories($news_category_2['news_category_id']);
				
				foreach ($news_categories_3 as $news_category_3) {
					$level_3_data[] = array(
						'news_category_id' 	=> $news_category_3['news_category_id'],
						'name'        		=> $news_category_3['name'],
					);
				}
				
				$level_2_data[] = array(
					'news_category_id' 	=> $news_category_2['news_category_id'],	
					'name'        		=> $news_category_2['name'],
					'children'    		=> $level_3_data
				);					
			}
			
			$this->data['news_categories'][] = array(
				'news_category_id' 	=> $news_category_1['news_category_id'],
				'name'        		=> $news_category_1['name'],
				'children'    		=> $level_2_data
			);
		}
		
		$this->data['news'] = array();
		
		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$data = array(
				'filter_name'         		=> $search, 
				'filter_tag'          		=> $tag, 
				'filter_description'  		=> $description,
				'filter_news_category_id'  	=> $news_category_id, 
				'filter_sub_news_category' 	=> $sub_news_category, 
				'sort'                		=> $sort,
				'order'               		=> $order,
				'start'               		=> ($page - 1) * $limit,
				'limit'               		=> $limit
			);
					
			$news_total = $this->model_catalog_news->getTotalNews($data);
								
			$results = $this->model_catalog_news->getNews($data);
					
			foreach ($results as $result) {
				if ($this->config->get('config_image_news_width')) {
					$image_news_width = $this->config->get('config_image_news_width');
				} else {
					$image_news_width = 220;
				}
				
				if ($this->config->get('config_image_news_height')) {
					$image_news_height = $this->config->get('config_image_news_height');
				} else {
					$image_news_height = 220;
				}
				
				if ($this->config->get('config_news_description_limit')) {
					$description_list_limit = $this->config->get('config_news_description_limit');
				} else {
					$description_list_limit = 500;
				}
				
				if ($this->config->get('config_news_grid_description_limit')) {
					$description_grid_limit = $this->config->get('config_news_grid_description_limit');
				} else {
					$description_grid_limit = 200;
				}
			
				$this->data['news'][] = array(
					'news_id'  	     	=> $result['news_id'],
					'name'           	=> $result['name'],
					'thumb'          	=> $this->model_tool_image->resize($result['image'], $image_news_width, $image_news_height),
					'no_image' 	  		=> $this->model_tool_image->resize('no_image.jpg', $image_news_width, $image_news_height),
					'date_available' 	=> sprintf($this->language->get('text_date_available'), date($this->language->get('date_format_short'), strtotime($result['date_available']))),
					'viewed' 		 	=> sprintf($this->language->get('text_viewed'), $result['viewed']),
					'news_comments'  	=> sprintf($this->language->get('text_news_comments'), $this->model_catalog_news_comments->getTotalCommentsByNewsId($result['news_id'])),
					'description_list' 	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $description_list_limit) . '...',
					'description_grid' 	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $description_grid_limit) . '...',
					'href'           	=> $this->url->link('news/news', '&news_id=' . $result['news_id'] . $url)
				);
			}
			
			$this->data['width'] = $this->config->get('config_image_news_width') + 16;
					
			$url = '';
			
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}
					
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			
			if (isset($this->request->get['news_category_id'])) {
				$url .= '&news_category_id=' . $this->request->get['news_category_id'];
			}
			
			if (isset($this->request->get['sub_news_category'])) {
				$url .= '&sub_news_category=' . $this->request->get['sub_news_category'];
			}
					
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$url = '';
			
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}
					
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			
			if (isset($this->request->get['news_category_id'])) {
				$url .= '&news_category_id=' . $this->request->get['news_category_id'];
			}
			
			if (isset($this->request->get['sub_news_category'])) {
				$url .= '&sub_news_category=' . $this->request->get['sub_news_category'];
			}
						
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->data['limits'] = array();
	
			$limits = array_unique(array($this->config->get('config_catalog_limit'), 5, 15, 25, 50, 75, 100));
			
			sort($limits);
	
			foreach($limits as $limits){
				$this->data['limits'][] = array(
					'text'  => $limits,
					'value' => $limits,
					'href'  => $this->url->link('news/search', $url . '&limit=' . $limits)
				);
			}
					
			$url = '';
	
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
			}
					
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			
			if (isset($this->request->get['news_category_id'])) {
				$url .= '&news_category_id=' . $this->request->get['news_category_id'];
			}
			
			if (isset($this->request->get['sub_news_category'])) {
				$url .= '&sub_news_category=' . $this->request->get['sub_news_category'];
			}
										
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
					
			$pagination = new Pagination();
			$pagination->total = $news_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('news/search', $url . '&page={page}');
			
			$this->data['pagination'] = $pagination->render();
		}	
		
		$this->data['search'] = $search;
		$this->data['description'] = $description;
		$this->data['news_category_id'] = $news_category_id;
		$this->data['sub_news_category'] = $sub_news_category;
				
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->data['limit'] = $limit;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/search.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/news/search.tpl';
		} else {
			$this->template = 'default/template/news/search.tpl';
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
}
?>