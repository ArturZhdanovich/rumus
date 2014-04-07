<?php 
class ControllerNewsAllNews extends Controller {  
	public function index() { 
		$this->language->load('news/news_category');
		
		$this->load->model('catalog/news_category');
		
		$this->load->model('catalog/news');
		
		$this->load->model('catalog/news_comments');
		
		$this->load->model('tool/image');  
		
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
		
		$this->document->setTitle($this->language->get('text_heading_title'));
		$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
		
		$this->data['heading_title'] = $this->language->get('text_heading_title');
		$this->data['text_empty'] = $this->language->get('text_empty');			
		$this->data['text_display'] = $this->language->get('text_display');
		$this->data['text_list'] = $this->language->get('text_list');
		$this->data['text_grid'] = $this->language->get('text_grid');
		$this->data['text_sort'] = $this->language->get('text_sort');
		$this->data['text_limit'] = $this->language->get('text_limit');

		$this->data['button_more'] = $this->language->get('button_more');
		$this->data['button_continue'] = $this->language->get('button_continue');
		
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

		$this->data['news'] = array();
			
		$data = array(
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
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
					'href'  => $this->url->link('news/all_news', $url . '&limit=' . $limits)
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
			$pagination->url = $this->url->link('news/all_news', $url . '&page={page}');
		
			$this->data['pagination'] = $pagination->render();
		
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/all_news.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/all_news.tpl';
			} else {
				$this->template = 'default/template/news/all_news.tpl';
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