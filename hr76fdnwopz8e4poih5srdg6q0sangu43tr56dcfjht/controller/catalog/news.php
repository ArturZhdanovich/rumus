<?php 
class ControllerCatalogNews extends Controller {
	private $error = array(); 
     
  	public function index() {
		$this->language->load('catalog/news');
    	
		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('catalog/news');
		
		$this->getList();
  	}
  
  	public function insert() {
    	$this->language->load('catalog/news');

    	$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('catalog/news');
		
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_news->addNews($this->request->post);
	  		
			$this->session->data['success'] = $this->language->get('text_success');
	  
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_news_category'])) {
                $url .= '&filter_news_category=' . $this->request->get['filter_news_category'];
            }
			
			if (isset($this->request->get['filter_news_comments'])) {
				$url .= '&filter_news_comments=' . $this->request->get['filter_news_comments'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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
			
			$this->redirect($this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}
	
    	$this->getForm();
  	}

  	public function update() {
    	$this->language->load('catalog/news');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
	
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_news->editNews($this->request->get['news_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_news_category'])) {
                $url .= '&filter_news_category=' . $this->request->get['filter_news_category'];
            }
			
			if (isset($this->request->get['filter_news_comments'])) {
				$url .= '&filter_news_comments=' . $this->request->get['filter_news_comments'];
			}
		
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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
			
			$this->redirect($this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getForm();
  	}

  	public function delete() {
    	$this->language->load('catalog/news');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$this->model_catalog_news->deleteNews($news_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_news_category'])) {
                $url .= '&filter_news_category=' . $this->request->get['filter_news_category'];
            }
			
			if (isset($this->request->get['filter_news_comments'])) {
				$url .= '&filter_news_comments=' . $this->request->get['filter_news_comments'];
			}
		
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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
			
			$this->redirect($this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}

  	public function copy() {
    	$this->language->load('catalog/news');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$this->model_catalog_news->copyNews($news_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_news_category'])) {
                $url .= '&filter_news_category=' . $this->request->get['filter_news_category'];
            }
			
			if (isset($this->request->get['filter_news_comments'])) {
				$url .= '&filter_news_comments=' . $this->request->get['filter_news_comments'];
			}
		
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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
			
			$this->redirect($this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}
	
	protected function getListing($news_id) {
		$this->language->load('catalog/news');
		
		$this->load->model('catalog/news');
		
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_select_all'] = $this->language->get('text_select_all');
		$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_default'] = $this->language->get('text_default');
		
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_seo_title'] = $this->language->get('entry_seo_title');
		$this->data['entry_seo_h1'] = $this->language->get('entry_seo_h1');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_main_category'] = $this->language->get('entry_main_category');
    	$this->data['entry_news_comments'] = $this->language->get('entry_news_comments');
    	$this->data['entry_image'] = $this->language->get('entry_image');
    	$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_categories'] = $this->language->get('entry_categories');
		$this->data['entry_related'] = $this->language->get('entry_related');
		$this->data['entry_related_news'] = $this->language->get('entry_related_news');
		$this->data['entry_relateds_news'] = $this->language->get('entry_relateds_news');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_date_added'] = $this->language->get('entry_date_added');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_tag'] = $this->language->get('entry_tag');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
				
    	$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_image'] = $this->language->get('button_add_image');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
    	$this->data['tab_general'] = $this->language->get('tab_general');
    	$this->data['tab_data'] = $this->language->get('tab_data');
    	$this->data['tab_image'] = $this->language->get('tab_image');		
		$this->data['tab_links'] = $this->language->get('tab_links');
		$this->data['tab_design'] = $this->language->get('tab_design');
		 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

 		if (isset($this->error['meta_description'])) {
			$this->data['error_meta_description'] = $this->error['meta_description'];
		} else {
			$this->data['error_meta_description'] = array();
		}		
   
   		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = array();
		}
		
		if (isset($this->request->get['news_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$news_info = $this->model_catalog_news->getArticle($this->request->get['news_id']);
    	}

		$this->data['token'] = $this->session->data['token'];
		
		$this->data['news_name'] = $this->model_catalog_news->getNewsName($this->request->get['news_id']);
		
		$this->load->model('tool/image');
			
		$this->data['news_image'] = $this->model_tool_image->resize($this->model_catalog_news->getNewsIMG($this->request->get['news_id']), 40, 40);
		$this->data['news_no_image'] = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['news_description'])) {
			$this->data['news_description'] = $this->request->post['news_description'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_description'] = $this->model_catalog_news->getNewsDescriptions($this->request->get['news_id']);
		} else {
			$this->data['news_description'] = array();
		}
		
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($news_info)) {
			$this->data['keyword'] = $news_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}
		
		if (isset($this->request->post['date_available'])) {
			$this->data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($news_info)) {
			$this->data['date_available'] = date('Y-m-d', strtotime($news_info['date_available']));
		} else {
			$this->data['date_available'] = date('Y-m-d');
		}
		
		if (isset($this->request->post['sort_order'])) {
      		$this->data['sort_order'] = $this->request->post['sort_order'];
    	} elseif (!empty($news_info)) {
      		$this->data['sort_order'] = $news_info['sort_order'];
    	} else {
			$this->data['sort_order'] = 1;
		}
		
		// News Categories
		$this->load->model('catalog/news_category');
		
		$news_categories = $this->model_catalog_news_category->getAllNewsCategories();

		$this->data['news_categories'] = $this->getAllNewsCategories($news_categories);
		
		if (isset($this->request->post['main_category_id'])) {
			$this->data['main_category_id'] = $this->request->post['main_category_id'];
		} elseif (isset($news_info)) {
			$this->data['main_category_id'] = $this->model_catalog_news->getNewsMainCategoryId($this->request->get['news_id']);
		} else {
			$this->data['main_category_id'] = 0;
		}

		if (isset($this->request->post['news_news_category'])) {
			$this->data['news_news_category'] = $this->request->post['news_news_category'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_news_category'] = $this->model_catalog_news->getNewsNewsCategories($this->request->get['news_id']);
		} else {
			$this->data['news_news_category'] = array();
		}
		
		if (isset($this->request->post['news_related'])) {
			$products = $this->request->post['news_related'];
		} elseif (isset($this->request->get['news_id'])) {		
			$products = $this->model_catalog_news->getNewsRelated($this->request->get['news_id']);
		} else {
			$products = array();
		}
	
		$this->data['news_related'] = array();
		
		$this->load->model('catalog/product');
		
		foreach ($products as $product_id) {
			$related_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($related_info) {
				$this->data['news_related'][] = array(
					'product_id' => $related_info['product_id'],
					'name'       => $related_info['name']
				);
			}
		}
	
		$this->load->model('catalog/news');
		
		$this->data['relateds_news'] = $this->model_catalog_news->getNews();
		
		if (isset($this->request->post['news_related_article'])) {
			$this->data['news_related_article'] = $this->request->post['news_related_article'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_related_article'] = $this->model_catalog_news->getNewsRelatedNews($this->request->get['news_id']);
		} else {
			$this->data['news_related_article'] = array();
		}
		
		// Images
		if (isset($this->request->post['news_image'])) {
			$news_images = $this->request->post['news_image'];
		} elseif (isset($this->request->get['news_id'])) {
			$news_images = $this->model_catalog_news->getNewsImages($this->request->get['news_id']);
		} else {
			$news_images = array();
		}
		
		$this->data['news_images'] = array();
		
		foreach ($news_images as $news_image) {
			if ($news_image['image'] && file_exists(DIR_IMAGE . $news_image['image'])) {
				$image = $news_image['image'];
			} else {
				$image = 'no_image.jpg';
			}
			
			$this->data['news_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($image, 100, 100),
				'sort_order' => $news_image['sort_order']
			);
		}

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['news_store'])) {
			$this->data['news_store'] = $this->request->post['news_store'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_store'] = $this->model_catalog_news->getNewsStores($this->request->get['news_id']);
		} else {
			$this->data['news_store'] = array(0);
		}
		
		if (isset($this->request->post['news_layout'])) {
			$this->data['news_layout'] = $this->request->post['news_layout'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_layout'] = $this->model_catalog_news->getNewsLayouts($this->request->get['news_id']);
		} else {
			$this->data['news_layout'] = array();
		}

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		if ($this->user->hasPermission('modify', 'catalog/news')) {
			if(isset($this->request->get['news_description'])){		
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					$this->model_catalog_news->changeDescriptions((int)$news_id, $this->request->post);
				}
			}
			
			if(isset($this->request->get['news_date_sort'])){		
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					$this->model_catalog_news->changeDateSort((int)$news_id, $this->request->post);
				}
			}
			
			if(isset($this->request->get['news_category'])){		
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					$this->model_catalog_news->changeNewsCategory((int)$news_id, $this->request->post);
				}
			}
			
			if(isset($this->request->get['news_related'])){		
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					$this->model_catalog_news->changeNewsRelated((int)$news_id, $this->request->post);
				}
			}
			
			if(isset($this->request->get['news_img'])){		
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					$this->model_catalog_news->changeNewsImages((int)$news_id, $this->request->post);
				}
			}
			
			if(isset($this->request->get['news_stores'])){		
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					$this->model_catalog_news->changeNewsStores((int)$news_id, $this->request->post);
				}
			}
			
			if(isset($this->request->get['news_design'])){		
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					$this->model_catalog_news->changeNewsLayouts((int)$news_id, $this->request->post);
				}
			}
		}
		
		$this->data['news_id'] = $news_id;
		
		if(isset($this->request->get['news_description'])){		
			$this->template = 'catalog/quick_edit_news/quick_news_description.tpl';
		}
		
		if(isset($this->request->get['news_date_sort'])){		
			$this->template = 'catalog/quick_edit_news/quick_news_date_sort.tpl';
		}
		
		if(isset($this->request->get['news_category'])){		
			$this->template = 'catalog/quick_edit_news/quick_news_category.tpl';
		}
		
		if(isset($this->request->get['news_related'])){		
			$this->template = 'catalog/quick_edit_news/quick_news_related.tpl';
		}
		
		if(isset($this->request->get['news_img'])){		
			$this->template = 'catalog/quick_edit_news/quick_news_images.tpl';
		}
		
		if(isset($this->request->get['news_stores'])){		
			$this->template = 'catalog/quick_edit_news/quick_news_stores.tpl';
		}
		
		if(isset($this->request->get['news_design'])){		
			$this->template = 'catalog/quick_edit_news/quick_news_design.tpl';
		}
		
		$this->response->setOutput($this->render());
		
	}
	
  	protected function getList() {				
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}
		
		if (isset($this->request->get['filter_news_category'])) {
			$filter_news_category = $this->request->get['filter_news_category'];
		} else {
			$filter_news_category = null;
		}

		if (isset($this->request->get['filter_news_comments'])) {
			$filter_news_comments = $this->request->get['filter_news_comments'];
		} else {
			$filter_news_comments = null;
		}
		
		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'n.date_available';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
						
		$url = '';
						
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}	
		
		if (isset($this->request->get['filter_news_category'])) {
            $url .= '&filter_news_category=' . $this->request->get['filter_news_category'];
        }
		
		if (isset($this->request->get['filter_news_comments'])) {
			$url .= '&filter_news_comments=' . $this->request->get['filter_news_comments'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
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

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL'),       		
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('catalog/news/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['copy'] = $this->url->link('catalog/news/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');	
		$this->data['delete'] = $this->url->link('catalog/news/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['link'] = $this->url->link('catalog/news&token=', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if(isset($this->request->get['edit_image'])){
			$this->model_catalog_news->editImage((int)$this->request->get['news_id'], $this->request->get['image']);
		}
		
		if(isset($this->request->get['news_description'])){		
			return $this->getListing((int)$this->request->get['news_id']);
		}
		
		if(isset($this->request->get['news_date_sort'])){		
			return $this->getListing((int)$this->request->get['news_id']);
		}
		
		if(isset($this->request->get['news_category'])){		
			return $this->getListing((int)$this->request->get['news_id']);
		}
		
		if(isset($this->request->get['news_related'])){		
			return $this->getListing((int)$this->request->get['news_id']);
		}
		
		if(isset($this->request->get['news_img'])){		
			return $this->getListing((int)$this->request->get['news_id']);
		}
		
		if(isset($this->request->get['news_stores'])){		
			return $this->getListing((int)$this->request->get['news_id']);
		}
		
		if(isset($this->request->get['news_design'])){		
			return $this->getListing((int)$this->request->get['news_id']);
		}
    	
		$this->data['news'] = array();

		$data = array(
			'filter_name'	  	   	=> $filter_name,
			'filter_news_category'  => $filter_news_category,
			'filter_news_comments'  => $filter_news_comments,
			'filter_status'   	  	=> $filter_status,
			'sort'            	  	=> $sort,
			'order'           	  	=> $order,
			'start'           	  	=> ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'           	  	=> $this->config->get('config_admin_limit')
		);
		
		$this->load->model('tool/image');
		
		$this->data['selected_language'] = $this->config->get('config_language_id');
		
		$news_total = $this->model_catalog_news->getTotalNews($data);
			
		$results = $this->model_catalog_news->getNews($data);
		
		$this->load->model('catalog/news_category');
		
		$this->data['news_categories'] = $this->model_catalog_news_category->getNewsCategories(0);
				    	
		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/news/update', 'token=' . $this->session->data['token'] . '&news_id=' . $result['news_id'] . $url, 'SSL')
			);
			
			$news_category =  $this->model_catalog_news->getNewsNewsCategories($result['news_id']);
			
			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}
	
      		$this->data['news'][] = array(
				'news_id' 	 	 => $result['news_id'],
				'name'       	 => $result['name'],
				'news_category'  => $news_category,
				'image'      	 => $image,
				'date_available' => date($this->language->get('date_format_short'), strtotime($result['date_available'])),
				'news_comments'  => ($result['news_comments'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'status'     	 => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'selected'   	 => isset($this->request->post['selected']) && in_array($result['news_id'], $this->request->post['selected']),
				'action'     	 => $action
			);
    	}
		
		$this->data['heading_title'] = $this->language->get('heading_title');		
				
		$this->data['text_enabled'] = $this->language->get('text_enabled');		
		$this->data['text_disabled'] = $this->language->get('text_disabled');		
		$this->data['text_no_results'] = $this->language->get('text_no_results');		
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');	
		$this->data['text_view'] = $this->language->get('text_view');
		$this->data['text_description'] = $this->language->get('text_description');
		$this->data['text_categories'] = $this->language->get('text_categories');
		$this->data['text_date_sort'] = $this->language->get('text_date_sort');
		$this->data['text_related'] = $this->language->get('text_related');
		$this->data['text_images_news'] = $this->language->get('text_images_news');
		$this->data['text_stores'] = $this->language->get('text_stores');
		$this->data['text_design'] = $this->language->get('text_design');
		$this->data['text_info_name'] = $this->language->get('text_info_name');
			
		$this->data['column_image'] = $this->language->get('column_image');		
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_news_category'] = $this->language->get('column_news_category');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_news_comments'] = $this->language->get('column_news_comments');
		$this->data['column_status'] = $this->language->get('column_status');		
		$this->data['column_action'] = $this->language->get('column_action');		
				
		$this->data['button_copy'] = $this->language->get('button_copy');		
		$this->data['button_insert'] = $this->language->get('button_insert');		
		$this->data['button_delete'] = $this->language->get('button_delete');		
		$this->data['button_filter'] = $this->language->get('button_filter');
		$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');
		 
 		$this->data['token'] = $this->session->data['token'];
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_news_category'])) {
            $url .= '&filter_news_category=' . $this->request->get['filter_news_category'];
        }
		
		if (isset($this->request->get['filter_news_comments'])) {
			$url .= '&filter_news_comments=' . $this->request->get['filter_news_comments'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
								
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
					
		$this->data['sort_name'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . '&sort=nd.name' . $url, 'SSL');
		$this->data['sort_news_category'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . '&sort=n2c.news_category' . $url, 'SSL');
		$this->data['sort_date_available'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . '&sort=n.date_available' . $url, 'SSL');
		$this->data['sort_news_comments'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . '&sort=n.news_comments' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . '&sort=n.status' . $url, 'SSL');
		$this->data['sort_order'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . '&sort=n.sort_order' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_news_category'])) {
            $url .= '&filter_news_category=' . $this->request->get['filter_news_category'];
        }
		
		if (isset($this->request->get['filter_news_comments'])) {
			$url .= '&filter_news_comments=' . $this->request->get['filter_news_comments'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
				
		$pagination = new Pagination();
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();
	
		$this->data['filter_name'] = $filter_name;
		$this->data['filter_news_category'] = $filter_news_category;
		$this->data['filter_news_comments'] = $filter_news_comments;
		$this->data['filter_status'] = $filter_status;
		
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/news_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	}

  	protected function getForm() {
    	$this->data['heading_title'] = $this->language->get('heading_title');
 
    	$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
    	$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_select_all'] = $this->language->get('text_select_all');
		$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');

		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_seo_title'] = $this->language->get('entry_seo_title');
		$this->data['entry_seo_h1'] = $this->language->get('entry_seo_h1');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_main_category'] = $this->language->get('entry_main_category');
    	$this->data['entry_news_comments'] = $this->language->get('entry_news_comments');
    	$this->data['entry_image'] = $this->language->get('entry_image');
    	$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_categories'] = $this->language->get('entry_categories');
		$this->data['entry_related'] = $this->language->get('entry_related');
		$this->data['entry_related_news'] = $this->language->get('entry_related_news');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_date_added'] = $this->language->get('entry_date_added');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_tag'] = $this->language->get('entry_tag');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
				
    	$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_image'] = $this->language->get('button_add_image');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
    	$this->data['tab_general'] = $this->language->get('tab_general');
    	$this->data['tab_data'] = $this->language->get('tab_data');
    	$this->data['tab_image'] = $this->language->get('tab_image');		
		$this->data['tab_links'] = $this->language->get('tab_links');
		$this->data['tab_design'] = $this->language->get('tab_design');
		 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

 		if (isset($this->error['meta_description'])) {
			$this->data['error_meta_description'] = $this->error['meta_description'];
		} else {
			$this->data['error_meta_description'] = array();
		}		
   
   		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = array();
		}		

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}	
		
		if (isset($this->request->get['filter_news_category'])) {
            $url .= '&filter_news_category=' . $this->request->get['filter_news_category'];
        }
		
		if (isset($this->request->get['filter_news_comments'])) {
			$url .= '&filter_news_comments=' . $this->request->get['filter_news_comments'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
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

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
									
		if (!isset($this->request->get['news_id'])) {
			$this->data['action'] = $this->url->link('catalog/news/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/news/update', 'token=' . $this->session->data['token'] . '&news_id=' . $this->request->get['news_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['news_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$news_info = $this->model_catalog_news->getArticle($this->request->get['news_id']);
    	}

		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['news_description'])) {
			$this->data['news_description'] = $this->request->post['news_description'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_description'] = $this->model_catalog_news->getNewsDescriptions($this->request->get['news_id']);
		} else {
			$this->data['news_description'] = array();
		}

		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['news_store'])) {
			$this->data['news_store'] = $this->request->post['news_store'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_store'] = $this->model_catalog_news->getNewsStores($this->request->get['news_id']);
		} else {
			$this->data['news_store'] = array(0);
		}
		
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($news_info)) {
			$this->data['keyword'] = $news_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}
		
		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($news_info)) {
			$this->data['image'] = $news_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($news_info) && $news_info['image'] && file_exists(DIR_IMAGE . $news_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($news_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		if (isset($this->request->post['date_available'])) {
			$this->data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($news_info)) {
			$this->data['date_available'] = date('Y-m-d', strtotime($news_info['date_available']));
		} else {
			$this->data['date_available'] = date('Y-m-d');
		}
		      	
		if (isset($this->request->post['news_comments'])) {
			$this->data['news_comments'] = $this->request->post['news_comments'];
		} elseif (!empty($news_info)) {
			$this->data['news_comments'] = $news_info['news_comments'];
		} else {
			$this->data['news_comments'] = 1;
		}
		
		if (isset($this->request->post['sort_order'])) {
      		$this->data['sort_order'] = $this->request->post['sort_order'];
    	} elseif (!empty($news_info)) {
      		$this->data['sort_order'] = $news_info['sort_order'];
    	} else {
			$this->data['sort_order'] = 1;
		}
				
    	if (isset($this->request->post['status'])) {
      		$this->data['status'] = $this->request->post['status'];
    	} elseif (!empty($news_info)) {
			$this->data['status'] = $news_info['status'];
		} else {
      		$this->data['status'] = 1;
    	}
		
		// News Categories
		$this->load->model('catalog/news_category');
		
		$news_categories = $this->model_catalog_news_category->getAllNewsCategories();

		$this->data['news_categories'] = $this->getAllNewsCategories($news_categories);
		
		if (isset($this->request->post['main_category_id'])) {
			$this->data['main_category_id'] = $this->request->post['main_category_id'];
		} elseif (isset($news_info)) {
			$this->data['main_category_id'] = $this->model_catalog_news->getNewsMainCategoryId($this->request->get['news_id']);
		} else {
			$this->data['main_category_id'] = 0;
		}

		if (isset($this->request->post['news_news_category'])) {
			$this->data['news_news_category'] = $this->request->post['news_news_category'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_news_category'] = $this->model_catalog_news->getNewsNewsCategories($this->request->get['news_id']);
		} else {
			$this->data['news_news_category'] = array();
		}
		
		// Images
		if (isset($this->request->post['news_image'])) {
			$news_images = $this->request->post['news_image'];
		} elseif (isset($this->request->get['news_id'])) {
			$news_images = $this->model_catalog_news->getNewsImages($this->request->get['news_id']);
		} else {
			$news_images = array();
		}
		
		$this->data['news_images'] = array();
		
		foreach ($news_images as $news_image) {
			if ($news_image['image'] && file_exists(DIR_IMAGE . $news_image['image'])) {
				$image = $news_image['image'];
			} else {
				$image = 'no_image.jpg';
			}
			
			$this->data['news_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($image, 100, 100),
				'sort_order' => $news_image['sort_order']
			);
		}

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		if (isset($this->request->post['news_related'])) {
			$products = $this->request->post['news_related'];
		} elseif (isset($this->request->get['news_id'])) {		
			$products = $this->model_catalog_news->getNewsRelated($this->request->get['news_id']);
		} else {
			$products = array();
		}
	
		$this->data['news_relateds'] = array();
		
		$this->load->model('catalog/product');
		
		foreach ($products as $product_id) {
			$related_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($related_info) {
				$this->data['news_relateds'][] = array(
					'product_id' => $related_info['product_id'],
					'name'       => $related_info['name']
				);
			}
		}
		
		if (isset($this->request->post['news_related_article'])) {
			$news = $this->request->post['news_related_article'];
		} elseif (isset($this->request->get['news_id'])) {		
			$news = $this->model_catalog_news->getNewsRelatedNews($this->request->get['news_id']);
		} else {
			$news = array();
		}
	
		$this->data['news_related_articles'] = array();
		
		$this->load->model('catalog/news');
		
		foreach ($news as $news_id) {
			$related_news_info = $this->model_catalog_news->getArticle($news_id);
			
			if ($related_news_info) {
				$this->data['news_related_articles'][] = array(
					'news_id'    => $related_news_info['news_id'],
					'name'       => $related_news_info['name']
				);
			}
		}
		
		if (isset($this->request->post['news_layout'])) {
			$this->data['news_layout'] = $this->request->post['news_layout'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_layout'] = $this->model_catalog_news->getNewsLayouts($this->request->get['news_id']);
		} else {
			$this->data['news_layout'] = array();
		}

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
										
		$this->template = 'catalog/news_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	} 
	
  	protected function validateForm() { 
    	if (!$this->user->hasPermission('modify', 'catalog/news')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	foreach ($this->request->post['news_description'] as $language_id => $value) {
      		if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
        		$this->error['name'][$language_id] = $this->language->get('error_name');
      		}
    	}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
					
    	if (!$this->error) {
			return true;
    	} else {
      		return false;
    	}
  	}
	
  	protected function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'catalog/news')) {
      		$this->error['warning'] = $this->language->get('error_permission');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
  	
  	protected function validateCopy() {
    	if (!$this->user->hasPermission('modify', 'catalog/news')) {
      		$this->error['warning'] = $this->language->get('error_permission');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
	
	private function getAllNewsCategories($news_categories, $parent_id = 0, $parent_name = '') {
		$output = array();

		if (array_key_exists($parent_id, $news_categories)) {
			if ($parent_name != '') {
				$parent_name .= $this->language->get('text_separator');
			}

			foreach ($news_categories[$parent_id] as $news_category) {
				$output[$news_category['news_category_id']] = array(
					'news_category_id' => $news_category['news_category_id'],
					'name'             => $parent_name . $news_category['name']
				);

				$output += $this->getAllNewsCategories($news_categories, $news_category['news_category_id'], $parent_name . $news_category['name']);
			}
		}

		return $output;
	}
	
	public function changeName() {
        $id = $this->request->get['news_id'];
        $name = $this->request->get['name'];
		$language = $this->config->get('config_language_id');

        $this->load->model('catalog/news');

        $this->response->setOutput($this->model_catalog_news->changeName($id, $name, $language));
    }
	
	public function changeStatus() {
		$this->language->load('catalog/news');
		$this->load->model('catalog/news');
		$output='';
		if(isset($this->request->get['object_id'])){
			$requestpart = explode('-',$this->request->get['object_id']);
			if(count($requestpart)==2){
				$column_name = $requestpart[0];
				$news_id = $requestpart[1];				
				$result = $this->model_catalog_news->getArticle($news_id);
				if($result[$column_name]){
					$this->model_catalog_news->changeStatus($news_id, $column_name, 0);
				} else {
					$this->model_catalog_news->changeStatus($news_id, $column_name, 1);
				}				
				$result = $this->model_catalog_news->getArticle($news_id);
				$output = $result[$column_name] ? $this->language->get('text_enabled') : $this->language->get('text_disabled');
			}
		}
		$this->response->setOutput($output);
	}
	
	public function changeAllowComments() {
		$this->language->load('catalog/news');
		$this->load->model('catalog/news');
		$output='';
		if(isset($this->request->get['object_id'])){
			$requestpart = explode('-',$this->request->get['object_id']);
			if(count($requestpart)==2){
				$column_name = $requestpart[0];
				$news_id = $requestpart[1];				
				$result = $this->model_catalog_news->getArticle($news_id);
				if($result[$column_name]){
					$this->model_catalog_news->changeAllowComments($news_id, $column_name, 0);
				} else {
					$this->model_catalog_news->changeAllowComments($news_id, $column_name, 1);
				}				
				$result = $this->model_catalog_news->getArticle($news_id);
				$output = $result[$column_name] ? $this->language->get('text_enabled') : $this->language->get('text_disabled');
			}
		}
		$this->response->setOutput($output);
	}
		
	public function autocomplete() {
		$json = array();
		
		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/news');
			
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}
			
			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];	
			} else {
				$limit = 20;	
			}			
						
			$data = array(
				'filter_name'  => $filter_name,
				'start'        => 0,
				'limit'        => $limit
			);
			
			$results = $this->model_catalog_news->getNews($data);
			
			foreach ($results as $result) {
					
				$json[] = array(
					'news_id' 	 => $result['news_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);	
			}
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>