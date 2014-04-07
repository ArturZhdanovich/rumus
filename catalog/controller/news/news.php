<?php  
class ControllerNewsNews extends Controller {
	private $error = array(); 
	
	public function index() { 
		$this->language->load('news/news');
		
		$this->load->model('catalog/news_comments');
	
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),			
			'separator' => false
		);
		
		$this->load->model('catalog/news_category');	
		
		if (isset($this->request->get['path'])) {
			$path = '';
			
			$parts = explode('_', (string)$this->request->get['path']);
			
			$news_category_id = (int)array_pop($parts);
				
			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}
				
				$news_category_info = $this->model_catalog_news_category->getNewsCategory($path_id);
				
				if ($news_category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $news_category_info['name'],
						'href'      => $this->url->link('news/news_category', 'path=' . $path),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
			
			// Set the last category breadcrumb
			$news_category_info = $this->model_catalog_news_category->getNewsCategory($news_category_id);
				
			if ($news_category_info) {			
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
					'href'      => $this->url->link('news/news_category', 'path=' . $this->request->get['path']),
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		
		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';
			
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
						
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
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
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('news/search', $url),
				'separator' => $this->language->get('text_separator')
			); 	
		}
		
		if (isset($this->request->get['news_id'])) {
			$news_id = (int)$this->request->get['news_id'];
		} else {
			$news_id = 0;
		}
		
		$this->load->model('catalog/news');
		
		$news_info = $this->model_catalog_news->getArticle($news_id);
		
		if ($news_info) {
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
						
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}		

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
						
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
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
				'text'      => $news_info['name'],
				'href'      => $this->url->link('news/news', $url . '&news_id=' . $this->request->get['news_id']),
				'separator' => $this->language->get('text_separator')
			);			
			
			if ($news_info['seo_title']) {
		  		$this->document->setTitle($news_info['seo_title']);
			} else {
		  		$this->document->setTitle($news_info['name']);
			}
			
			$this->document->setDescription($news_info['meta_description']);
			$this->document->setKeywords($news_info['meta_keyword']);
			
			$this->document->addLink($this->url->link('news/news', 'news_id=' . $this->request->get['news_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			
			if ($news_info['seo_h1']) {
				$this->data['heading_title'] = $news_info['seo_h1'];
			} else {
				$this->data['heading_title'] = $news_info['name'];
			}
			
			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_tags'] = $this->language->get('text_tags');
			$this->data['text_login_write'] = sprintf($this->language->get('text_login_write'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_note'] = $this->language->get('text_note');
			
			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_comment'] = $this->language->get('entry_comment');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');
			
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_more'] = $this->language->get('button_more');
			
			$this->load->model('catalog/review');
			
			$this->data['tab_related'] = $this->language->get('tab_related');
			$this->data['tab_related_news'] = $this->language->get('tab_related_news');
			$this->data['tab_images'] = $this->language->get('tab_images');
			$this->data['tab_news_comments'] = sprintf($this->language->get('tab_news_comments'), $news_info['news_comments']);
			
			$this->data['news_id'] = $this->request->get['news_id'];
			
			$this->load->model('tool/image');
			
			if ($this->config->get('config_image_news_popup_width')) {
				$image_news_popup_width = $this->config->get('config_image_news_popup_width');
			} else {
				$image_news_popup_width = 500;
			}
			
			if ($this->config->get('config_image_news_popup_height')) {
				$image_news_popup_height = $this->config->get('config_image_news_popup_height');
			} else {
				$image_news_popup_height = 500;
			}
			
			if ($this->config->get('config_image_news_thumb_width')) {
				$image_news_thumb_width = $this->config->get('config_image_news_thumb_width');
			} else {
				$image_news_thumb_width = 228;
			}
			
			if ($this->config->get('config_image_news_thumb_height')) {
				$image_news_thumb_height = $this->config->get('config_image_news_thumb_height');
			} else {
				$image_news_thumb_height = 228;
			}
			
			if ($this->config->get('config_image_news_related_width')) {
				$image_news_related_width = $this->config->get('config_image_news_related_width');
			} else {
				$image_news_related_width = 198;
			}
			
			if ($this->config->get('config_image_news_related_height')) {
				$image_news_related_height = $this->config->get('config_image_news_related_height');
			} else {
				$image_news_related_height = 198;
			}
			
			if ($this->config->get('config_image_news_additional_width')) {
				$image_news_additional_width = $this->config->get('config_image_news_additional_width');
			} else {
				$image_news_additional_width = 168;
			}
			
			if ($this->config->get('config_image_news_additional_height')) {
				$image_news_additional_height = $this->config->get('config_image_news_additional_height');
			} else {
				$image_news_additional_height = 168;
			}

			if ($news_info['image']) {
				$this->data['popup'] = $this->model_tool_image->resize($news_info['image'], $image_news_popup_width, $image_news_popup_height);
			} else {
				$this->data['popup'] = '';
			}
			
			if ($news_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($news_info['image'], $image_news_thumb_width, $image_news_thumb_height);
			} else {
				$this->data['thumb'] = '';
			}
			
			$this->data['images'] = array();
			
			$results = $this->model_catalog_news->getNewsImages($this->request->get['news_id']);
			
			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $image_news_popup_width, $image_news_popup_height),
					'thumb' => $this->model_tool_image->resize($result['image'], $image_news_additional_width, $image_news_additional_height)
				);
			}	
			
			if ($this->config->get('config_guest_news_comment') || $this->customer->isLogged()) {
				$this->data['guest_news_comment'] = true;
			} else {
				$this->data['guest_news_comment'] = false;
			}
			
			if ($this->customer->isLogged()) {
				$this->data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$this->data['customer_name'] = '';
			}
			
			$this->data['date_available'] = sprintf($this->language->get('text_date_available'), date($this->language->get('date_format_short'), strtotime($news_info['date_available'])));
			$this->data['viewed'] = sprintf($this->language->get('text_viewed'), $news_info['viewed']);
			$this->data['news_comments'] = sprintf($this->language->get('text_news_comments'), (int)$news_info['news_comments']);
			$this->data['description'] = html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8');
			
			if ($this->config->get('config_limit_days_new_product')) {
				$limit_days_new_product = $this->config->get('config_limit_days_new_product');
			} else {
				$limit_days_new_product = 31;
			}
			
			if ($this->config->get('config_limit_viewed_popular_product')) {
				$limit_viewed_popular_product = $this->config->get('config_limit_viewed_popular_product');
			} else {
				$limit_viewed_popular_product = 50;
			}
			
			$this->data['products'] = array();
			
			$results = $this->model_catalog_news->getNewsProductRelated($this->request->get['news_id']);
			
			$timestamp 			= time();
			$date_time_array 	= getdate($timestamp);
			$hours 				= $date_time_array['hours'];
			$minutes 			= $date_time_array['minutes'];
			$seconds 			= $date_time_array['seconds'];
			$month 				= $date_time_array['mon'];
			$day 				= $date_time_array['mday'];
			$year 				= $date_time_array['year'];

			$timestamp = mktime($hours, $minutes, $seconds, $month,$day - $limit_days_new_product, $year);
			
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
				} else {
					$image = false;
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				
				if ($this->config->get('config_sticker_special_news_related_product')) {
					if ((float)$result['special']) {
						if ($result['price'] > 0) {
							$sale = '<div class="stiker-special-module">' . '-' . round((($result['price'] - $result['special'])/$result['price'])*100, 0) . '<span>%</span>' . '</div>';
						} else {
							$sale = false;
						}	
					} else {
						$sale = false;
					}			
				} else {
					$sale = false;
				}
				
				if ($this->config->get('config_sticker_new_news_related_product')) {
					if (($result['date_available']) > strftime('%Y-%m-%d',$timestamp)) {
						$new = '<div class="stiker-new-module"></div>';
					} else {
						$new = false;
					}
				} else {
					$new = false;
				}
				
				if ($this->config->get('config_sticker_popular_news_related_product')) {
					if (($result['viewed']) > ($limit_viewed_popular_product)) {
						$popular = '<div class="stiker-popular-module"></div>';
					} else {
						$popular = false;
					}
				} else {
					$popular = false;
				}
							
				$this->data['products'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'no_image' 	 => $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height')),
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'sale' 	  	 => $sale,
					'new'     	 => $new,
					'popular'    => $popular,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}	
			
			$this->data['related_news'] = array();
			
			$results = $this->model_catalog_news->getNewsRelatedNews($this->request->get['news_id']);
			
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $image_news_related_width, $image_news_related_height);
				} else {
					$image = false;
				}
							
				$this->data['related_news'][] = array(
					'news_id' 	 => $result['news_id'],
					'thumb'   	 => $image,
					'no_image' 	 => $this->model_tool_image->resize('no_image.jpg', $image_news_related_width, $image_news_related_height),
					'name'    	 => $result['name'],
					'href'    	 => $this->url->link('news/news', 'news_id=' . $result['news_id'])
				);
			}	
			
			$this->data['tags'] = array();
			
			if ($news_info['tag']) {		
				$tags = explode(',', $news_info['tag']);
				
				foreach ($tags as $tag) {
					$this->data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('news/search', 'tag=' . trim($tag))
					);
				}
			}
			
			$this->model_catalog_news->updateViewed($this->request->get['news_id']);
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/news.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/news.tpl';
			} else {
				$this->template = 'default/template/news/news.tpl';
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
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
						
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}			

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}	
					
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
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
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('news/news', $url . '&news_id=' . $news_id),
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
	
	public function news_comments() {
    	$this->language->load('news/news');
		
		$this->load->model('catalog/news_comments');

		$this->data['text_on'] = $this->language->get('text_on');
		$this->data['text_no_comments'] = $this->language->get('text_no_comments');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  
		
		$this->data['news_comments'] = array();
		
		$news_comment_total = $this->model_catalog_news_comments->getTotalCommentsByNewsId($this->request->get['news_id']);
			
		$results = $this->model_catalog_news_comments->getCommentsByNewsId($this->request->get['news_id'], ($page - 1) * $this->config->get('config_limit_news_comments'), $this->config->get('config_limit_news_comments'));
      		
		foreach ($results as $result) {
        	$this->data['news_comments'][] = array(
        		'author'     	  => $result['author'],
				'text'       	  => $result['text'],
        		'news_comments'   => sprintf($this->language->get('text_news_comments'), (int)$news_comment_total),
        		'date_added' 	  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
        	);
      	}			
			
		$pagination = new Pagination();
		$pagination->total = $news_comment_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_news_comments'); 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('news/news/news_comments', 'news_id=' . $this->request->get['news_id'] . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/news_comments.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/news/news_comments.tpl';
		} else {
			$this->template = 'default/template/news/news_comments.tpl';
		}
		
		$this->response->setOutput($this->render());
	}
	
	public function write() {
		$this->language->load('news/news');
		
		$this->load->model('catalog/news_comments');
		
		$json = array();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}
			
			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}
	
			if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
				$json['error'] = $this->language->get('error_captcha');
			}
				
			if (!isset($json['error'])) {
				$this->model_catalog_news_comments->addComments($this->request->get['news_id'], $this->request->post);
				
				$json['success'] = $this->language->get('text_success');
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}
}
?>