<?php 
class ControllerNewsNewsCategory extends Controller {  
	public function index() { 
		$this->language->load('news/news_category');
		
		$this->load->model('catalog/news_category');
		
		$this->load->model('catalog/news');
		
		$this->load->model('catalog/news_comments');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}
				
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
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
							
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);	
			
		if (isset($this->request->get['ncat'])) {
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
									
			$ncat = '';
		
			$parts = explode('_', (string)$this->request->get['ncat']);
			
			$news_category_id = (int)array_pop($parts);
		
			foreach ($parts as $ncat_id) {
				if (!$ncat) {
					$ncat = (int)$ncat_id;
				} else {
					$ncat .= '_' . (int)$ncat_id;
				}
									
				$news_category_info = $this->model_catalog_news_category->getNewsCategory($ncat_id);
				
				if ($news_category_info) {
	       			$this->data['breadcrumbs'][] = array(
   	    				'text'      => $news_category_info['name'],
						'href'      => $this->url->link('news/news_category', 'ncat=' . $ncat . $url),
        				'separator' => $this->language->get('text_separator')
        			);
				}
			}	
		} else {
			$news_category_id = 0;
		}
				
		$news_category_info = $this->model_catalog_news_category->getNewsCategory($news_category_id);
	
		if ($news_category_info) {
	  		if ($news_category_info['seo_title']) {
		  		$this->document->setTitle($news_category_info['seo_title']);
			} else {
		  		$this->document->setTitle($news_category_info['name']);
			}
			
			$this->document->setDescription($news_category_info['meta_description']);
			$this->document->setKeywords($news_category_info['meta_keyword']);
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
			
			if ($news_category_info['seo_h1']) {
				$this->data['heading_title'] = $news_category_info['seo_h1'];
			} else {
				$this->data['heading_title'] = $news_category_info['name'];
			}
			
			$this->data['text_refine'] = $this->language->get('text_refine');	
			$this->data['text_empty'] = $this->language->get('text_empty');			
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_list'] = $this->language->get('text_list');
			$this->data['text_grid'] = $this->language->get('text_grid');
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');

			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->data['button_more'] = $this->language->get('button_more');
			
			$this->data['view_subcategory'] = $this->config->get('config_view_news_subcategory');
			
			// Set the last category breadcrumb		
			$url = '';
			
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
				'text'      => $news_category_info['name'],
				'href'      => $this->url->link('news/news_category', 'ncat=' . $this->request->get['ncat']),
				'separator' => $this->language->get('text_separator')
			);
			
			if ($this->config->get('config_image_news_category_width')) {
				$image_news_category_width = $this->config->get('config_image_news_category_width');
			} else {
				$image_news_category_width = 220;
			}
			
			if ($this->config->get('config_image_news_category_height')) {
				$image_news_category_height = $this->config->get('config_image_news_category_height');
			} else {
				$image_news_category_height = 220;
			}
			
			if ($this->config->get('config_image_news_sub_category_width')) {
				$image_news_sub_category_width = $this->config->get('config_image_news_sub_category_width');
			} else {
				$image_news_sub_category_width = 160;
			}
			
			if ($this->config->get('config_image_news_sub_category_height')) {
				$image_news_sub_category_height = $this->config->get('config_image_news_sub_category_height');
			} else {
				$image_news_sub_category_height = 160;
			}
			
			if ($this->config->get('config_sub_news_category_description_limit')) {
				$sub_news_category_description_limit = $this->config->get('config_sub_news_category_description_limit');
			} else {
				$sub_news_category_description_limit = 100;
			}
								
			if ($news_category_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($news_category_info['image'], $image_news_category_width, $image_news_category_height);
			} else {
				$this->data['thumb'] = '';
			}
									
			$this->data['description'] = html_entity_decode($news_category_info['description'], ENT_QUOTES, 'UTF-8');
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
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
								
			$this->data['news_categories'] = array();
			
			$results = $this->model_catalog_news_category->getNewsCategories($news_category_id);
			
			foreach ($results as $result) {
				$data = array(
					'filter_news_category_id'  => $result['news_category_id'],
					'filter_sub_news_category' => true
				);
				
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $image_news_sub_category_width, $image_news_sub_category_height);
				} else {
					$image = false;
				}
				
				if ($result['description']) {
					$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $sub_news_category_description_limit) . '...';
				} else {
					$description = $this->language->get('text_no_description');
				}
				
				$this->data['news_categories'][] = array(
					'name'  	  => $result['name'] . ($this->config->get('config_news_count') ? ' (' . $this->model_catalog_news->getTotalNews($data) . ')' : ''),
					'description' => $description,
					'thumb' 	  => $image,
					'no_image' 	  => $this->model_tool_image->resize('no_image.jpg', $image_news_sub_category_width, $image_news_sub_category_height),
					'href'  	  => $this->url->link('news/news_category', 'ncat=' . $this->request->get['ncat'] . '_' . $result['news_category_id'] . $url)
				);
				
			}
			
			$this->data['sub_width'] = $this->config->get('config_image_news_sub_category_width') + 2;
			
			$this->data['news'] = array();
			
			$data = array(
				'filter_news_category_id' => $news_category_id,
				'filter_filter'      	  => $filter, 
				'sort'               	  => $sort,
				'order'              	  => $order,
				'start'              	  => ($page - 1) * $limit,
				'limit'              	  => $limit
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
					'no_image' 	  	 	=> $this->model_tool_image->resize('no_image.jpg', $image_news_width, $image_news_height),
					'date_available' 	=> sprintf($this->language->get('text_date_available'), date($this->language->get('date_format_short'), strtotime($result['date_available']))),
					'viewed' 		 	=> sprintf($this->language->get('text_viewed'), $result['viewed']),
					'news_comments'  	=> sprintf($this->language->get('text_news_comments'), $this->model_catalog_news_comments->getTotalCommentsByNewsId($result['news_id'])),
					'description_list' 	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $description_list_limit) . '...',
					'description_grid' 	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $description_grid_limit) . '...',
					'href'           	=> $this->url->link('news/news', 'ncat=' . $this->request->get['ncat'] . '&news_id=' . $result['news_id'] . $url)
				);
			}
			
			$this->data['width'] = $this->config->get('config_image_news_width') + 16;
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
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
					'href'  => $this->url->link('news/news_category', 'ncat=' . $this->request->get['ncat'] . $url . '&limit=' . $limits)
				);
			}
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
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
			$pagination->url = $this->url->link('news/news_category', 'ncat=' . $this->request->get['ncat'] . $url . '&page={page}');
		
			$this->data['pagination'] = $pagination->render();
		
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/news_category.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/news_category.tpl';
			} else {
				$this->template = 'default/template/news/news_category.tpl';
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
    	} else {
			$url = '';
			
			if (isset($this->request->get['ncat'])) {
				$url .= '&ncat=' . $this->request->get['ncat'];
			}
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
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
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('news/news_category', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
}
?>