<?php 
class ControllerToolSeoManager extends Controller {
	private $error = array();
 
	public function index() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/seo_manager');
		
		$this->getList();
	}

	public function insert() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/seo_manager');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_tool_seo_manager->addUrlAlias($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			
			$this->redirect($this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/seo_manager');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_tool_seo_manager->editUrlAlias($this->request->get['url_alias_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
					
			$this->redirect($this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
 
	public function delete() {
		$this->language->load('tool/seo_manager');
 
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/seo_manager');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $url_alias_id) {
				$this->model_tool_seo_manager->deleteUrlAlias($url_alias_id);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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

			$this->redirect($this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_query'])) {
			$filter_query = $this->request->get['filter_query'];
		} else {
			$filter_query = null;
		}

		if (isset($this->request->get['filter_keyword'])) {
			$filter_keyword = $this->request->get['filter_keyword'];
		} else {
			$filter_keyword = null;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'keyword';
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
			
		$url = '';
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			'href'      => $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('tool/seo_manager/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('tool/seo_manager/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_categories'] = $this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_products'] = $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_manufacturers'] = $this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_information'] = $this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news_categories'] = $this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news'] = $this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['url_aliases'] = array();

		$data = array(
			'filter_query'	 => $filter_query, 
			'filter_keyword' => $filter_keyword,
			'sort'  		 => $sort,
			'order' 		 => $order,
			'start' 		 => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' 		 => $this->config->get('config_admin_limit')
		);
		
		$url_alias_total = $this->model_tool_seo_manager->getTotalUrlAlias();
		
		$results = $this->model_tool_seo_manager->getUrlAliases($data);
		
		foreach ($results as $result) {
			$action = array();
			
			if ($this->config->get('config_buttons_apply') == 0) {
				$action[] = array(
					'text' => $this->language->get('text_edit'),
					'href' => $this->url->link('tool/seo_manager/update', 'token=' . $this->session->data['token'] . '&url_alias_id=' . $result['url_alias_id'] . $url, 'SSL')
				);
			} else {
				$action[] = array(
					'text' => $this->language->get('button_edites'),
					'href' => $this->url->link('tool/seo_manager/update', 'token=' . $this->session->data['token'] . '&url_alias_id=' . $result['url_alias_id'] . $url, 'SSL')
				);
			}

			$this->data['url_aliases'][] = array(
				'url_alias_id' 	=> $result['url_alias_id'],
				'query' 		=> $result['query'],
                'keyword' 		=> $result['keyword'],
				'selected'      => isset($this->request->post['selected']) && in_array($result['url_alias_id'], $this->request->post['selected']),
				'action'    	=> $action
			);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		
		$this->data['column_query'] = $this->language->get('column_query');
		$this->data['column_keyword'] = $this->language->get('column_keyword');
		$this->data['column_action'] = $this->language->get('column_action');	

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_filter'] = $this->language->get('button_filter');
		$this->data['button_generator_categories'] = $this->language->get('button_generator_categories');
		$this->data['button_generator_products'] = $this->language->get('button_generator_products');
		$this->data['button_generator_manufacturers'] = $this->language->get('button_generator_manufacturers');
		$this->data['button_generator_information'] = $this->language->get('button_generator_information');
		$this->data['button_generator_news_categories'] = $this->language->get('button_generator_news_categories');
		$this->data['button_generator_news'] = $this->language->get('button_generator_news');
		
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
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_query'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . '&sort=query' . $url, 'SSL');
		$this->data['sort_keyword'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . '&sort=keyword' . $url, 'SSL');
		
		$url = '';
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $url_alias_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();
		
		$this->data['filter_query'] = $filter_query;
		$this->data['filter_keyword'] = $filter_keyword;
		
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'tool/seo_manager_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');
				
		$this->data['entry_query'] = $this->language->get('entry_query');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');	
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['query'])) {
			$this->data['error_query'] = $this->error['query'];
		} else {
			$this->data['error_query'] = '';
		}
						
		$url = '';
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			'href'      => $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		if (!isset($this->request->get['url_alias_id'])) { 
			$this->data['action'] = $this->url->link('tool/seo_manager/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('tool/seo_manager/update', 'token=' . $this->session->data['token'] . '&url_alias_id=' . $this->request->get['url_alias_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if (isset($this->request->get['url_alias_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$url_alias_info = $this->model_tool_seo_manager->getUrlAlias($this->request->get['url_alias_id']);
		}

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->post['query'])) {
			$this->data['query'] = $this->request->post['query'];
		} elseif (!empty($url_alias_info)) {
			$this->data['query'] = $url_alias_info['query'];
		} else {
			$this->data['query'] = '';
		}
		
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($url_alias_info)) {
			$this->data['keyword'] = $url_alias_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		$this->template = 'tool/seo_manager_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	// Categories
	public function generator_categories() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_generator_categories'));
		
		$this->load->model('tool/seo_manager');
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateDelete()) {
			if (isset($this->request->post['categories'])) {
				$this->model_setting_setting->editSetting('generator_categories', array(
					'config_categories_template' 					=> $this->request->post['categories_template'],
					'config_template_meta_h1_categories' 			=> $this->request->post['template_meta_h1_categories'],
					'config_template_meta_title_categories' 		=> $this->request->post['template_meta_title_categories'],
					'config_template_meta_keywords_categories' 		=> $this->request->post['template_meta_keywords_categories'],
					'config_template_meta_description_categories' 	=> $this->request->post['template_meta_description_categories']
				));
				
				$this->model_tool_seo_manager->generateCategories($this->request->post['categories_template'], $this->request->post['source_language_code'], $this->request->post['overwrite_categories'] == 'overwrite');
				
				$this->session->data['success'] = $this->language->get('text_success_categories');
			}
			
			if (isset($this->request->post['meta_h1_categories'])) {
				$this->model_setting_setting->editSetting('generator_categories', array(
					'config_categories_template' 					=> $this->request->post['categories_template'],
					'config_template_meta_h1_categories' 			=> $this->request->post['template_meta_h1_categories'],
					'config_template_meta_title_categories' 		=> $this->request->post['template_meta_title_categories'],
					'config_template_meta_keywords_categories' 		=> $this->request->post['template_meta_keywords_categories'],
					'config_template_meta_description_categories' 	=> $this->request->post['template_meta_description_categories']
				));

				$this->model_tool_seo_manager->generateMetaH1Categories($this->request->post['template_meta_h1_categories'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_h1_categories');
			}
			
			if (isset($this->request->post['meta_h1_categories_delete'])) {
				$this->model_tool_seo_manager->deleteMetaH1Categories();
				
				$this->session->data['success'] = $this->language->get('text_success_h1_categories_delete');
			}
			
			if (isset($this->request->post['meta_title_categories'])) {
				$this->model_setting_setting->editSetting('generator_categories', array(
					'config_categories_template' 					=> $this->request->post['categories_template'],
					'config_template_meta_h1_categories' 			=> $this->request->post['template_meta_h1_categories'],
					'config_template_meta_title_categories' 		=> $this->request->post['template_meta_title_categories'],
					'config_template_meta_keywords_categories' 		=> $this->request->post['template_meta_keywords_categories'],
					'config_template_meta_description_categories' 	=> $this->request->post['template_meta_description_categories']
				));

				$this->model_tool_seo_manager->generateMetaTitleCategories($this->request->post['template_meta_title_categories'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_title_categories');
			}
			
			if (isset($this->request->post['meta_title_categories_delete'])) {
				$this->model_tool_seo_manager->deleteMetaTitleCategories();
				
				$this->session->data['success'] = $this->language->get('text_success_title_categories_del');
			}
			
			if (isset($this->request->post['meta_keywords_categories'])) {
				$this->model_setting_setting->editSetting('generator_categories', array(
					'config_categories_template' 					=> $this->request->post['categories_template'],
					'config_template_meta_h1_categories' 			=> $this->request->post['template_meta_h1_categories'],
					'config_template_meta_title_categories' 		=> $this->request->post['template_meta_title_categories'],
					'config_template_meta_keywords_categories' 		=> $this->request->post['template_meta_keywords_categories'],
					'config_template_meta_description_categories' 	=> $this->request->post['template_meta_description_categories']
				));

				$this->model_tool_seo_manager->generateMetaKeywordsCategories($this->request->post['template_meta_keywords_categories'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_keywords_categories');
			}
			
			if (isset($this->request->post['meta_keywords_categories_delete'])) {
				$this->model_tool_seo_manager->deleteMetaKeywordsCategories();
				
				$this->session->data['success'] = $this->language->get('text_success_keywords_delete_cat');
			}
			
			if (isset($this->request->post['meta_description_categories'])) {
				$this->model_setting_setting->editSetting('generator_categories', array(
					'config_categories_template' 					=> $this->request->post['categories_template'],
					'config_template_meta_h1_categories' 			=> $this->request->post['template_meta_h1_categories'],
					'config_template_meta_title_categories' 		=> $this->request->post['template_meta_title_categories'],
					'config_template_meta_keywords_categories' 		=> $this->request->post['template_meta_keywords_categories'],
					'config_template_meta_description_categories' 	=> $this->request->post['template_meta_description_categories']
				));

				$this->model_tool_seo_manager->generateMetaDescriptionCategories($this->request->post['template_meta_description_categories'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_descr_categories');
			}
			
			if (isset($this->request->post['meta_description_categories_delete'])) {
				$this->model_tool_seo_manager->deleteMetaDescriptionCategories();
				
				$this->session->data['success'] = $this->language->get('text_success_descr_delete_cat');
			}
			
			if (isset($this->request->post['save_templates_categories'])) {
				$this->model_setting_setting->editSetting('generator_categories', array(
					'config_categories_template' 					=> $this->request->post['categories_template'],
					'config_template_meta_h1_categories' 			=> $this->request->post['template_meta_h1_categories'],
					'config_template_meta_title_categories' 		=> $this->request->post['template_meta_title_categories'],
					'config_template_meta_keywords_categories' 		=> $this->request->post['template_meta_keywords_categories'],
					'config_template_meta_description_categories' 	=> $this->request->post['template_meta_description_categories']
				));
				
				$this->session->data['success'] = $this->language->get('text_success_templates');
			}

			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			
			$this->redirect($this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getGeneratorCategoriesForm();
	}
	
	protected function getGeneratorCategoriesForm() {
		$this->data['heading_title'] = $this->language->get('heading_generator_categories');
		$this->data['heading_seo_url'] = $this->language->get('heading_seo_url');
		$this->data['heading_meta_h1'] = $this->language->get('heading_meta_h1');
		$this->data['heading_meta_title'] = $this->language->get('heading_meta_title');
		$this->data['heading_meta_keywords'] = $this->language->get('heading_meta_keywords');
		$this->data['heading_tags'] = $this->language->get('heading_tags');
		$this->data['heading_meta_description'] = $this->language->get('heading_meta_description');
		
		$this->data['text_category_tags'] = $this->language->get('text_category_tags');	
		$this->data['text_overwrite'] = $this->language->get('text_overwrite');
        $this->data['text_no_overwrite'] = $this->language->get('text_no_overwrite');
		$this->data['text_warning_overwrite'] = $this->language->get('text_warning_overwrite');
		$this->data['text_meta_h1_categories_tags'] = $this->language->get('text_meta_h1_categories_tags');
		$this->data['text_warning_h1'] = $this->language->get('text_warning_h1');
		$this->data['text_meta_title_categories_tags'] = $this->language->get('text_meta_title_categories_tags');
		$this->data['text_warning_title'] = $this->language->get('text_warning_title');
		$this->data['text_meta_keywords_categories_tag'] = $this->language->get('text_meta_keywords_categories_tag');
		$this->data['text_warning_keywords'] = $this->language->get('text_warning_keywords');
		$this->data['text_categories_meta_description'] = $this->language->get('text_categories_meta_description');
		$this->data['text_warning_description'] = $this->language->get('text_warning_description');

		$this->data['entry_source_language'] = $this->language->get('entry_source_language');
		
		$this->data['column_template'] = $this->language->get('column_template');	
		$this->data['column_overwrite'] = $this->language->get('column_overwrite');
		$this->data['column_action'] = $this->language->get('column_action');
		
		$this->data['button_generate'] = $this->language->get('button_generate');
		$this->data['button_save_templates'] = $this->language->get('button_save_templates');
		$this->data['button_generator_products'] = $this->language->get('button_generator_products');
		$this->data['button_generator_manufacturers'] = $this->language->get('button_generator_manufacturers');
		$this->data['button_generator_information'] = $this->language->get('button_generator_information');
		$this->data['button_generator_news_categories'] = $this->language->get('button_generator_news_categories');
		$this->data['button_generator_news'] = $this->language->get('button_generator_news');
		$this->data['button_seo_manager'] = $this->language->get('button_seo_manager');
		$this->data['button_delete'] = $this->language->get('button_delete');

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
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			'href'      => $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_generator_categories'),
			'href'      => $this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['action'] = $this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['generator_products'] = $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_manufacturers'] = $this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_information'] = $this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news_categories'] = $this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news'] = $this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['cancel'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->load->model('tool/seo_manager');
		
		if (isset($this->request->post['source_language_code'])) {
            $this->data['source_language_code'] = $this->request->post['source_language_code'];
        } else {
            $this->data['source_language_code'] = '';
        }
        $this->data['languages'] = $this->model_tool_seo_manager->getLanguages();
		
		if (isset($this->request->post['categories_template'])) {
            $this->data['categories_template'] = $this->request->post['categories_template'];
        } else {
            $this->data['categories_template'] = $this->config->get('config_categories_template');
        }
		
		if (isset($this->request->post['template_meta_h1_categories'])) {
            $this->data['template_meta_h1_categories'] = $this->request->post['template_meta_h1_categories'];
        } else {
            $this->data['template_meta_h1_categories'] = $this->config->get('config_template_meta_h1_categories');
        }
		
		if (isset($this->request->post['template_meta_title_categories'])) {
            $this->data['template_meta_title_categories'] = $this->request->post['template_meta_title_categories'];
        } else {
            $this->data['template_meta_title_categories'] = $this->config->get('config_template_meta_title_categories');
        }
		
		if (isset($this->request->post['template_meta_keywords_categories'])) {
            $this->data['template_meta_keywords_categories'] = $this->request->post['template_meta_keywords_categories'];
        } else {
            $this->data['template_meta_keywords_categories'] = $this->config->get('config_template_meta_keywords_categories');
        }
		
		if (isset($this->request->post['template_meta_description_categories'])) {
            $this->data['template_meta_description_categories'] = $this->request->post['template_meta_description_categories'];
        } else {
            $this->data['template_meta_description_categories'] = $this->config->get('config_template_meta_description_categories');
        }

		$this->template = 'tool/seo_generator/generator_categories.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	// Products
	public function generator_products() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_generator_products'));
		
		$this->load->model('tool/seo_manager');
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateDelete()) {
			if (isset($this->request->post['products'])) {
				$this->model_setting_setting->editSetting('generator_products', array(
					'config_template_seo_url_products' 			=> $this->request->post['template_seo_url_products'],
					'config_meta_keywords_products' 			=> $this->request->post['template_meta_keywords_products'],
					'config_template_tags_products' 			=> $this->request->post['template_tags_products'],
					'config_template_meta_h1_products' 			=> $this->request->post['template_meta_h1_products'],
					'config_template_meta_title_products' 		=> $this->request->post['template_meta_title_products'],
					'config_template_meta_description_products' => $this->request->post['template_meta_description_products']
				));
				
				$this->model_tool_seo_manager->generateProducts($this->request->post['template_seo_url_products'], $this->request->post['products_suffix'], $this->request->post['source_language_code'], $this->request->post['overwrite_products'] == 'overwrite');
				
				$this->session->data['success'] = $this->language->get('text_success_products');
			}
			
			if (isset($this->request->post['meta_h1_products'])) {
				$this->model_setting_setting->editSetting('generator_products', array(
					'config_template_seo_url_products' 			=> $this->request->post['template_seo_url_products'],
					'config_meta_keywords_products' 			=> $this->request->post['template_meta_keywords_products'],
					'config_template_tags_products' 			=> $this->request->post['template_tags_products'],
					'config_template_meta_h1_products' 			=> $this->request->post['template_meta_h1_products'],
					'config_template_meta_title_products' 		=> $this->request->post['template_meta_title_products'],
					'config_template_meta_description_products' => $this->request->post['template_meta_description_products']
				));

				$this->model_tool_seo_manager->generateMetaH1Products($this->request->post['template_meta_h1_products'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_h1_products');
			}
			
			if (isset($this->request->post['meta_h1_products_delete'])) {
				$this->model_tool_seo_manager->deleteMetaH1Products();
				
				$this->session->data['success'] = $this->language->get('text_success_h1_products_delete');
			}
			
			if (isset($this->request->post['meta_title_products'])) {
				$this->model_setting_setting->editSetting('generator_products', array(
					'config_template_seo_url_products' 			=> $this->request->post['template_seo_url_products'],
					'config_meta_keywords_products' 			=> $this->request->post['template_meta_keywords_products'],
					'config_template_tags_products' 			=> $this->request->post['template_tags_products'],
					'config_template_meta_h1_products' 			=> $this->request->post['template_meta_h1_products'],
					'config_template_meta_title_products' 		=> $this->request->post['template_meta_title_products'],
					'config_template_meta_description_products' => $this->request->post['template_meta_description_products']
				));

				$this->model_tool_seo_manager->generateMetaTitleProducts($this->request->post['template_meta_title_products'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_title_products');
			}
			
			if (isset($this->request->post['meta_title_products_delete'])) {
				$this->model_tool_seo_manager->deleteMetaTitleProducts();
				
				$this->session->data['success'] = $this->language->get('text_success_title_product_delete');
			}
			
			if (isset($this->request->post['meta_keywords_products'])) {
				$this->model_setting_setting->editSetting('generator_products', array(
					'config_template_seo_url_products' 			=> $this->request->post['template_seo_url_products'],
					'config_meta_keywords_products' 			=> $this->request->post['template_meta_keywords_products'],
					'config_template_tags_products' 			=> $this->request->post['template_tags_products'],
					'config_template_meta_h1_products' 			=> $this->request->post['template_meta_h1_products'],
					'config_template_meta_title_products' 		=> $this->request->post['template_meta_title_products'],
					'config_template_meta_description_products' => $this->request->post['template_meta_description_products']
				));
				
				$this->model_tool_seo_manager->generateProductsMetaKeywords($this->request->post['template_meta_keywords_products'], null, $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_keywords_products');
			}
			
			if (isset($this->request->post['meta_keywords_products_delete'])) {
				$this->model_tool_seo_manager->deleteKeywordsProducts();
				
				$this->session->data['success'] = $this->language->get('text_success_keywords_delete');
			}
			
			if (isset($this->request->post['tags_products'])) {
				$this->model_setting_setting->editSetting('generator_products', array(
					'config_template_seo_url_products' 			=> $this->request->post['template_seo_url_products'],
					'config_meta_keywords_products' 			=> $this->request->post['template_meta_keywords_products'],
					'config_template_tags_products' 			=> $this->request->post['template_tags_products'],
					'config_template_meta_h1_products' 			=> $this->request->post['template_meta_h1_products'],
					'config_template_meta_title_products' 		=> $this->request->post['template_meta_title_products'],
					'config_template_meta_description_products' => $this->request->post['template_meta_description_products']
				));

				$this->model_tool_seo_manager->generateTagsProducts($this->request->post['template_tags_products'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_tags_products');
			}
			
			if (isset($this->request->post['tags_products_delete'])) {
				$this->model_tool_seo_manager->deleteTagsProducts();
				
				$this->session->data['success'] = $this->language->get('text_success_tags_delete');
			}
			
			if (isset($this->request->post['meta_description_products'])) {
				$this->model_setting_setting->editSetting('generator_products', array(
					'config_template_seo_url_products' 			=> $this->request->post['template_seo_url_products'],
					'config_meta_keywords_products' 			=> $this->request->post['template_meta_keywords_products'],
					'config_template_tags_products' 			=> $this->request->post['template_tags_products'],
					'config_template_meta_h1_products' 			=> $this->request->post['template_meta_h1_products'],
					'config_template_meta_title_products' 		=> $this->request->post['template_meta_title_products'],
					'config_template_meta_description_products' => $this->request->post['template_meta_description_products']
				));

				$this->model_tool_seo_manager->generateMetaDescriptionProducts($this->request->post['template_meta_description_products'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_description_products');
			}
			
			if (isset($this->request->post['meta_description_products_delete'])) {
				$this->model_tool_seo_manager->deleteMetaDescriptionProducts();
				
				$this->session->data['success'] = $this->language->get('text_success_description_delete');
			}
			
			if (isset($this->request->post['save_templates'])) {
				$this->model_setting_setting->editSetting('generator_products', array(
					'config_template_seo_url_products' 			=> $this->request->post['template_seo_url_products'],
					'config_meta_keywords_products' 			=> $this->request->post['template_meta_keywords_products'],
					'config_template_tags_products' 			=> $this->request->post['template_tags_products'],
					'config_template_meta_h1_products' 			=> $this->request->post['template_meta_h1_products'],
					'config_template_meta_title_products' 		=> $this->request->post['template_meta_title_products'],
					'config_template_meta_description_products' => $this->request->post['template_meta_description_products']
				));
				
				$this->session->data['success'] = $this->language->get('text_success_templates');
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			
			$this->redirect($this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getGeneratorProductsForm();
	}
	
	protected function getGeneratorProductsForm() {
		$this->data['heading_title'] = $this->language->get('heading_generator_products');
		$this->data['heading_seo_url'] = $this->language->get('heading_seo_url');	
		$this->data['heading_meta_h1'] = $this->language->get('heading_meta_h1');
		$this->data['heading_meta_title'] = $this->language->get('heading_meta_title');
		$this->data['heading_meta_keywords'] = $this->language->get('heading_meta_keywords');
		$this->data['heading_tags'] = $this->language->get('heading_tags');
		$this->data['heading_meta_description'] = $this->language->get('heading_meta_description');
		
		$this->data['text_products_tags'] = $this->language->get('text_products_tags');	
		$this->data['text_overwrite'] = $this->language->get('text_overwrite');
        $this->data['text_no_overwrite'] = $this->language->get('text_no_overwrite');
		$this->data['text_warning_overwrite'] = $this->language->get('text_warning_overwrite');
		$this->data['text_products_suffix'] = $this->language->get('text_products_suffix');
		$this->data['text_meta_h1_products_tags'] = $this->language->get('text_meta_h1_products_tags');
		$this->data['text_warning_h1'] = $this->language->get('text_warning_h1');
		$this->data['text_meta_title_products_tags'] = $this->language->get('text_meta_title_products_tags');
		$this->data['text_warning_title'] = $this->language->get('text_warning_title');
		$this->data['text_meta_keywords_products_tags'] = $this->language->get('text_meta_keywords_products_tags');
		$this->data['text_warning_keywords'] = $this->language->get('text_warning_keywords');
		$this->data['text_tags_products'] = $this->language->get('text_tags_products');
		$this->data['text_warning_tags'] = $this->language->get('text_warning_tags');
		$this->data['text_products_meta_description'] = $this->language->get('text_products_meta_description');
		$this->data['text_warning_description'] = $this->language->get('text_warning_description');

		$this->data['entry_source_language'] = $this->language->get('entry_source_language');
		
		$this->data['column_template'] = $this->language->get('column_template');	
		$this->data['column_overwrite'] = $this->language->get('column_overwrite');
		$this->data['column_suffix'] = $this->language->get('column_suffix');
		$this->data['column_warning'] = $this->language->get('column_warning');
		
		$this->data['button_generate'] = $this->language->get('button_generate');
		$this->data['button_save_templates'] = $this->language->get('button_save_templates');
		$this->data['button_generator_categories'] = $this->language->get('button_generator_categories');
		$this->data['button_generator_manufacturers'] = $this->language->get('button_generator_manufacturers');
		$this->data['button_generator_information'] = $this->language->get('button_generator_information');
		$this->data['button_generator_news_categories'] = $this->language->get('button_generator_news_categories');
		$this->data['button_generator_news'] = $this->language->get('button_generator_news');
		$this->data['button_seo_manager'] = $this->language->get('button_seo_manager');
		$this->data['button_delete'] = $this->language->get('button_delete');

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
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			'href'      => $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_generator_products'),
			'href'      => $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['action'] = $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if (!isset($this->request->get['save_templates'])) { 
			$this->data['action'] = $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL');
		}
		
		$this->data['generator_categories'] = $this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_manufacturers'] = $this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_information'] = $this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news_categories'] = $this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news'] = $this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['cancel'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL');

		
		$this->load->model('tool/seo_manager');
		
		if (isset($this->request->post['source_language_code'])) {
            $this->data['source_language_code'] = $this->request->post['source_language_code'];
        } else {
            $this->data['source_language_code'] = '';
        }
		
        $this->data['languages'] = $this->model_tool_seo_manager->getLanguages();
		
		if (isset($this->request->post['template_seo_url_products'])) {
            $this->data['template_seo_url_products'] = $this->request->post['template_seo_url_products'];
        } else {
            $this->data['template_seo_url_products'] = $this->config->get('config_template_seo_url_products');
        }
		
		if (isset($this->request->post['products_suffix'])) {
            $this->data['products_suffix'] = $this->request->post['products_suffix'];
        } else {
            $this->data['products_suffix'] = $this->config->get('config_products_suffix');
        }
		
		if (isset($this->request->post['template_meta_h1_products'])) {
            $this->data['template_meta_h1_products'] = $this->request->post['template_meta_h1_products'];
        } else {
            $this->data['template_meta_h1_products'] = $this->config->get('config_template_meta_h1_products');
        }
		
		if (isset($this->request->post['template_meta_title_products'])) {
            $this->data['template_meta_title_products'] = $this->request->post['template_meta_title_products'];
        } else {
            $this->data['template_meta_title_products'] = $this->config->get('config_template_meta_title_products');
        }
		
		if (isset($this->request->post['template_meta_keywords_products'])) {
            $this->data['template_meta_keywords_products'] = $this->request->post['template_meta_keywords_products'];
        } else {
            $this->data['template_meta_keywords_products'] = $this->config->get('config_meta_keywords_products');
        }
		
		if (isset($this->request->post['template_tags_products'])) {
            $this->data['template_tags_products'] = $this->request->post['template_tags_products'];
        } else {
            $this->data['template_tags_products'] = $this->config->get('config_template_tags_products');
        }
		
		if (isset($this->request->post['template_meta_description_products'])) {
            $this->data['template_meta_description_products'] = $this->request->post['template_meta_description_products'];
        } else {
            $this->data['template_meta_description_products'] = $this->config->get('config_template_meta_description_products');
        }

		$this->template = 'tool/seo_generator/generator_products.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	// Manufacturers
	public function generator_manufacturers() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_generator_manufacturers'));
		
		$this->load->model('tool/seo_manager');
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateDelete()) {
			if (isset($this->request->post['manufacturers'])) {
				$this->model_setting_setting->editSetting('generator_manufacturers', array(
					'config_template_seo_url_manufacturers' 			=> $this->request->post['template_seo_url_manufacturers'],
					'config_template_meta_h1_manufacturers' 			=> $this->request->post['template_meta_h1_manufacturers'],
					'config_template_meta_title_manufacturers' 			=> $this->request->post['template_meta_title_manufacturers'],
					'config_template_meta_keywords_manufacturers' 		=> $this->request->post['template_meta_keywords_manufacturers'],
					'config_template_meta_description_manufacturers' 	=> $this->request->post['template_meta_description_manufacturers']
				));
				
				$this->model_tool_seo_manager->generateManufacturers($this->request->post['template_seo_url_manufacturers'], $this->request->post['manufacturers_suffix'], $this->request->post['source_language_code'], $this->request->post['overwrite_manufacturers'] == 'overwrite');
				
				$this->session->data['success'] = $this->language->get('text_success_manufacturers');
			}
			
			if (isset($this->request->post['meta_h1_manufacturers'])) {
				$this->model_setting_setting->editSetting('generator_manufacturers', array(
					'config_template_seo_url_manufacturers' 			=> $this->request->post['template_seo_url_manufacturers'],
					'config_template_meta_h1_manufacturers' 			=> $this->request->post['template_meta_h1_manufacturers'],
					'config_template_meta_title_manufacturers' 			=> $this->request->post['template_meta_title_manufacturers'],
					'config_template_meta_keywords_manufacturers' 		=> $this->request->post['template_meta_keywords_manufacturers'],
					'config_template_meta_description_manufacturers' 	=> $this->request->post['template_meta_description_manufacturers']
				));

				$this->model_tool_seo_manager->generateMetaH1Manufacturers($this->request->post['template_meta_h1_manufacturers'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_h1_manufacturers');
			}
			
			if (isset($this->request->post['meta_h1_manufacturers_delete'])) {
				$this->model_tool_seo_manager->deleteMetaH1Manufacturers();
				
				$this->session->data['success'] = $this->language->get('text_success_h1_manufacturers_del');
			}
			
			if (isset($this->request->post['meta_title_manufacturers'])) {
				$this->model_setting_setting->editSetting('generator_manufacturers', array(
					'config_template_seo_url_manufacturers' 			=> $this->request->post['template_seo_url_manufacturers'],
					'config_template_meta_h1_manufacturers' 			=> $this->request->post['template_meta_h1_manufacturers'],
					'config_template_meta_title_manufacturers' 			=> $this->request->post['template_meta_title_manufacturers'],
					'config_template_meta_keywords_manufacturers' 		=> $this->request->post['template_meta_keywords_manufacturers'],
					'config_template_meta_description_manufacturers' 	=> $this->request->post['template_meta_description_manufacturers']
				));

				$this->model_tool_seo_manager->generateMetaTitleManufacturers($this->request->post['template_meta_title_manufacturers'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_title_manufacturers');
			}
			
			if (isset($this->request->post['meta_title_manufacturers_delete'])) {
				$this->model_tool_seo_manager->deleteMetaTitleManufacturers();
				
				$this->session->data['success'] = $this->language->get('text_success_title_manufact_del');
			}
			
			if (isset($this->request->post['meta_keywords_manufacturers'])) {
				$this->model_setting_setting->editSetting('generator_manufacturers', array(
					'config_template_seo_url_manufacturers' 			=> $this->request->post['template_seo_url_manufacturers'],
					'config_template_meta_h1_manufacturers' 			=> $this->request->post['template_meta_h1_manufacturers'],
					'config_template_meta_title_manufacturers' 			=> $this->request->post['template_meta_title_manufacturers'],
					'config_template_meta_keywords_manufacturers' 		=> $this->request->post['template_meta_keywords_manufacturers'],
					'config_template_meta_description_manufacturers' 	=> $this->request->post['template_meta_description_manufacturers']
				));
				
				$this->model_tool_seo_manager->generateMetaKeywordsManufacturers($this->request->post['template_meta_keywords_manufacturers'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_key_manufacturers');
			}
			
			if (isset($this->request->post['meta_keywords_manufacturers_delete'])) {
				$this->model_tool_seo_manager->deleteKeywordsManufacturers();
				
				$this->session->data['success'] = $this->language->get('text_success_key_manufacturer_del');
			}
			
			if (isset($this->request->post['meta_description_manufacturers'])) {
				$this->model_setting_setting->editSetting('generator_manufacturers', array(
					'config_template_seo_url_manufacturers' 			=> $this->request->post['template_seo_url_manufacturers'],
					'config_template_meta_h1_manufacturers' 			=> $this->request->post['template_meta_h1_manufacturers'],
					'config_template_meta_title_manufacturers' 			=> $this->request->post['template_meta_title_manufacturers'],
					'config_template_meta_keywords_manufacturers' 		=> $this->request->post['template_meta_keywords_manufacturers'],
					'config_template_meta_description_manufacturers' 	=> $this->request->post['template_meta_description_manufacturers']
				));

				$this->model_tool_seo_manager->generateMetaDescriptionManufacturers($this->request->post['template_meta_description_manufacturers'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_descr_manufacturers');
			}
			
			if (isset($this->request->post['meta_description_manufacturers_delete'])) {
				$this->model_tool_seo_manager->deleteMetaDescriptionManufacturers();
				
				$this->session->data['success'] = $this->language->get('text_success_descr_manufact_del');
			}
			
			if (isset($this->request->post['save_templates_manufacturers'])) {
				$this->model_setting_setting->editSetting('generator_manufacturers', array(
					'config_template_seo_url_manufacturers' 			=> $this->request->post['template_seo_url_manufacturers'],
					'config_template_meta_h1_manufacturers' 			=> $this->request->post['template_meta_h1_manufacturers'],
					'config_template_meta_title_manufacturers' 			=> $this->request->post['template_meta_title_manufacturers'],
					'config_template_meta_keywords_manufacturers' 		=> $this->request->post['template_meta_keywords_manufacturers'],
					'config_template_meta_description_manufacturers' 	=> $this->request->post['template_meta_description_manufacturers']
				));
				
				$this->session->data['success'] = $this->language->get('text_success_templates');
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			
			$this->redirect($this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getGeneratorManufacturersForm();
	}
	
	protected function getGeneratorManufacturersForm() {
		$this->data['heading_title'] = $this->language->get('heading_generator_manufacturers');
		$this->data['heading_seo_url'] = $this->language->get('heading_seo_url');	
		$this->data['heading_meta_h1'] = $this->language->get('heading_meta_h1');
		$this->data['heading_meta_title'] = $this->language->get('heading_meta_title');
		$this->data['heading_meta_keywords'] = $this->language->get('heading_meta_keywords');
		$this->data['heading_tags'] = $this->language->get('heading_tags');
		$this->data['heading_meta_description'] = $this->language->get('heading_meta_description');
		
		$this->data['text_overwrite'] = $this->language->get('text_overwrite');
        $this->data['text_no_overwrite'] = $this->language->get('text_no_overwrite');
		$this->data['text_warning_overwrite'] = $this->language->get('text_warning_overwrite');
		$this->data['text_products_suffix'] = $this->language->get('text_products_suffix');
		$this->data['text_manufacturers_tags'] = $this->language->get('text_manufacturers_tags');	
		$this->data['text_meta_h1_manufacturers_tags'] = $this->language->get('text_meta_h1_manufacturers_tags');		
		$this->data['text_warning_h1'] = $this->language->get('text_warning_h1');		
		$this->data['text_meta_title_manufacturers_tag'] = $this->language->get('text_meta_title_manufacturers_tag');
		$this->data['text_warning_title'] = $this->language->get('text_warning_title');		
		$this->data['text_meta_key_manufacturers_tags'] = $this->language->get('text_meta_key_manufacturers_tags');
		$this->data['text_warning_keywords'] = $this->language->get('text_warning_keywords');
		$this->data['text_manufacturers_meta_descr'] = $this->language->get('text_manufacturers_meta_descr');
		$this->data['text_warning_description'] = $this->language->get('text_warning_description');

		$this->data['entry_source_language'] = $this->language->get('entry_source_language');
		
		$this->data['column_template'] = $this->language->get('column_template');	
		$this->data['column_overwrite'] = $this->language->get('column_overwrite');
		$this->data['column_suffix'] = $this->language->get('column_suffix');
		$this->data['column_warning'] = $this->language->get('column_warning');
		
		$this->data['button_generate'] = $this->language->get('button_generate');
		$this->data['button_save_templates'] = $this->language->get('button_save_templates');
		$this->data['button_generator_categories'] = $this->language->get('button_generator_categories');
		$this->data['button_generator_products'] = $this->language->get('button_generator_products');
		$this->data['button_generator_information'] = $this->language->get('button_generator_information');
		$this->data['button_generator_news_categories'] = $this->language->get('button_generator_news_categories');
		$this->data['button_generator_news'] = $this->language->get('button_generator_news');
		$this->data['button_seo_manager'] = $this->language->get('button_seo_manager');
		$this->data['button_delete'] = $this->language->get('button_delete');

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
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			'href'      => $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_generator_manufacturers'),
			'href'      => $this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['action'] = $this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['generator_categories'] = $this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_products'] = $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_information'] = $this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news_categories'] = $this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news'] = $this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['cancel'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL');

		
		$this->load->model('tool/seo_manager');
		
		if (isset($this->request->post['source_language_code'])) {
            $this->data['source_language_code'] = $this->request->post['source_language_code'];
        } else {
            $this->data['source_language_code'] = '';
        }
		
        $this->data['languages'] = $this->model_tool_seo_manager->getLanguages();
		
		if (isset($this->request->post['template_seo_url_manufacturers'])) {
            $this->data['template_seo_url_manufacturers'] = $this->request->post['template_seo_url_manufacturers'];
        } else {
            $this->data['template_seo_url_manufacturers'] = $this->config->get('config_template_seo_url_manufacturers');
        }
		
		if (isset($this->request->post['manufacturers_suffix'])) {
            $this->data['manufacturers_suffix'] = $this->request->post['manufacturers_suffix'];
        } else {
            $this->data['manufacturers_suffix'] = $this->config->get('config_manufacturers_suffix');
        }
		
		if (isset($this->request->post['template_meta_h1_manufacturers'])) {
            $this->data['template_meta_h1_manufacturers'] = $this->request->post['template_meta_h1_manufacturers'];
        } else {
            $this->data['template_meta_h1_manufacturers'] = $this->config->get('config_template_meta_h1_manufacturers');
        }
		
		if (isset($this->request->post['template_meta_title_manufacturers'])) {
            $this->data['template_meta_title_manufacturers'] = $this->request->post['template_meta_title_manufacturers'];
        } else {
            $this->data['template_meta_title_manufacturers'] = $this->config->get('config_template_meta_title_manufacturers');
        }
		
		if (isset($this->request->post['template_meta_keywords_manufacturers'])) {
            $this->data['template_meta_keywords_manufacturers'] = $this->request->post['template_meta_keywords_manufacturers'];
        } else {
            $this->data['template_meta_keywords_manufacturers'] = $this->config->get('config_template_meta_keywords_manufacturers');
        }
		
		if (isset($this->request->post['template_meta_description_manufacturers'])) {
            $this->data['template_meta_description_manufacturers'] = $this->request->post['template_meta_description_manufacturers'];
        } else {
            $this->data['template_meta_description_manufacturers'] = $this->config->get('config_template_meta_description_manufacturers');
        }

		$this->template = 'tool/seo_generator/generator_manufacturers.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	// Informations
	public function generator_information() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_generator_informations'));
		
		$this->load->model('tool/seo_manager');
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateDelete()) {
			if (isset($this->request->post['informations'])) {
				$this->model_setting_setting->editSetting('generator_information', array(
					'config_template_seo_url_informations' 			=> $this->request->post['template_seo_url_informations'],
					'config_template_meta_h1_informations' 			=> $this->request->post['template_meta_h1_informations'],
					'config_template_meta_title_informations' 		=> $this->request->post['template_meta_title_informations'],
					'config_template_meta_keywords_informations' 	=> $this->request->post['template_meta_keywords_informations'],
					'config_template_meta_description_informations' => $this->request->post['template_meta_description_informations']
				));
				
				$this->model_tool_seo_manager->generateInformations($this->request->post['template_seo_url_informations'], $this->request->post['informations_suffix'], $this->request->post['source_language_code'], $this->request->post['overwrite_informations'] == 'overwrite');
				
				$this->session->data['success'] = $this->language->get('text_success_informations');
			}
			
			if (isset($this->request->post['meta_h1_informations'])) {
				$this->model_setting_setting->editSetting('generator_information', array(
					'config_template_seo_url_informations' 			=> $this->request->post['template_seo_url_informations'],
					'config_template_meta_h1_informations' 			=> $this->request->post['template_meta_h1_informations'],
					'config_template_meta_title_informations' 		=> $this->request->post['template_meta_title_informations'],
					'config_template_meta_keywords_informations' 	=> $this->request->post['template_meta_keywords_informations'],
					'config_template_meta_description_informations' => $this->request->post['template_meta_description_informations']
				));

				$this->model_tool_seo_manager->generateMetaH1Informations($this->request->post['template_meta_h1_informations'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_h1_informations');
			}
			
			if (isset($this->request->post['meta_h1_informations_delete'])) {
				$this->model_tool_seo_manager->deleteMetaH1Informations();
				
				$this->session->data['success'] = $this->language->get('text_success_h1_informations_del');
			}
			
			if (isset($this->request->post['meta_title_informations'])) {
				$this->model_setting_setting->editSetting('generator_information', array(
					'config_template_seo_url_informations' 			=> $this->request->post['template_seo_url_informations'],
					'config_template_meta_h1_informations' 			=> $this->request->post['template_meta_h1_informations'],
					'config_template_meta_title_informations' 		=> $this->request->post['template_meta_title_informations'],
					'config_template_meta_keywords_informations' 	=> $this->request->post['template_meta_keywords_informations'],
					'config_template_meta_description_informations' => $this->request->post['template_meta_description_informations']
				));

				$this->model_tool_seo_manager->generateMetaTitleInformations($this->request->post['template_meta_title_informations'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_title_informations');
			}
			
			if (isset($this->request->post['meta_title_informations_delete'])) {
				$this->model_tool_seo_manager->deleteMetaTitleInformations();
				
				$this->session->data['success'] = $this->language->get('text_success_title_info_delete');
			}
			
			if (isset($this->request->post['meta_keywords_informations'])) {
				$this->model_setting_setting->editSetting('generator_information', array(
					'config_template_seo_url_informations' 			=> $this->request->post['template_seo_url_informations'],
					'config_template_meta_h1_informations' 			=> $this->request->post['template_meta_h1_informations'],
					'config_template_meta_title_informations' 		=> $this->request->post['template_meta_title_informations'],
					'config_template_meta_keywords_informations' 	=> $this->request->post['template_meta_keywords_informations'],
					'config_template_meta_description_informations' => $this->request->post['template_meta_description_informations']
				));
				
				$this->model_tool_seo_manager->generateMetaKeywordsInformations($this->request->post['template_meta_keywords_informations'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_key_informations');
			}
			
			if (isset($this->request->post['meta_keywords_informations_delete'])) {
				$this->model_tool_seo_manager->deleteKeywordsInformations();
				
				$this->session->data['success'] = $this->language->get('text_success_key_informations_del');
			}
			
			if (isset($this->request->post['meta_description_informations'])) {
				$this->model_setting_setting->editSetting('generator_information', array(
					'config_template_seo_url_informations' 			=> $this->request->post['template_seo_url_informations'],
					'config_template_meta_h1_informations' 			=> $this->request->post['template_meta_h1_informations'],
					'config_template_meta_title_informations' 		=> $this->request->post['template_meta_title_informations'],
					'config_template_meta_keywords_informations' 	=> $this->request->post['template_meta_keywords_informations'],
					'config_template_meta_description_informations' => $this->request->post['template_meta_description_informations']
				));

				$this->model_tool_seo_manager->generateMetaDescriptionInformations($this->request->post['template_meta_description_informations'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_descr_informations');
			}
			
			if (isset($this->request->post['meta_description_informations_delete'])) {
				$this->model_tool_seo_manager->deleteMetaDescriptionInformations();
				
				$this->session->data['success'] = $this->language->get('text_success_descr_info_delete');
			}
			
			if (isset($this->request->post['save_templates_informations'])) {
				$this->model_setting_setting->editSetting('generator_information', array(
					'config_template_seo_url_informations' 			=> $this->request->post['template_seo_url_informations'],
					'config_template_meta_h1_informations' 			=> $this->request->post['template_meta_h1_informations'],
					'config_template_meta_title_informations' 		=> $this->request->post['template_meta_title_informations'],
					'config_template_meta_keywords_informations' 	=> $this->request->post['template_meta_keywords_informations'],
					'config_template_meta_description_informations' => $this->request->post['template_meta_description_informations']
				));
				
				$this->session->data['success'] = $this->language->get('text_success_templates');
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			
			$this->redirect($this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getGeneratorInformationsForm();
	}
	
	protected function getGeneratorInformationsForm() {
		$this->data['heading_title'] = $this->language->get('heading_generator_informations');
		$this->data['heading_seo_url'] = $this->language->get('heading_seo_url');	
		$this->data['heading_meta_h1'] = $this->language->get('heading_meta_h1');
		$this->data['heading_meta_title'] = $this->language->get('heading_meta_title');
		$this->data['heading_meta_keywords'] = $this->language->get('heading_meta_keywords');
		$this->data['heading_tags'] = $this->language->get('heading_tags');
		$this->data['heading_meta_description'] = $this->language->get('heading_meta_description');
		
		$this->data['text_overwrite'] = $this->language->get('text_overwrite');
        $this->data['text_no_overwrite'] = $this->language->get('text_no_overwrite');
		$this->data['text_warning_overwrite'] = $this->language->get('text_warning_overwrite');
		$this->data['text_products_suffix'] = $this->language->get('text_products_suffix');
		$this->data['text_informations_tags'] = $this->language->get('text_informations_tags');		
		$this->data['text_meta_h1_informations_tags'] = $this->language->get('text_meta_h1_informations_tags');			
		$this->data['text_warning_h1'] = $this->language->get('text_warning_h1');		
		$this->data['text_meta_title_informations_tags'] = $this->language->get('text_meta_title_informations_tags');
		$this->data['text_warning_title'] = $this->language->get('text_warning_title');			
		$this->data['text_meta_key_informations_tags'] = $this->language->get('text_meta_key_informations_tags');
		$this->data['text_warning_keywords'] = $this->language->get('text_warning_keywords');		
		$this->data['text_informations_meta_descr'] = $this->language->get('text_informations_meta_descr');
		$this->data['text_warning_description'] = $this->language->get('text_warning_description');

		$this->data['entry_source_language'] = $this->language->get('entry_source_language');
		
		$this->data['column_template'] = $this->language->get('column_template');	
		$this->data['column_overwrite'] = $this->language->get('column_overwrite');
		$this->data['column_suffix'] = $this->language->get('column_suffix');
		$this->data['column_warning'] = $this->language->get('column_warning');
		
		$this->data['button_generate'] = $this->language->get('button_generate');
		$this->data['button_save_templates'] = $this->language->get('button_save_templates');
		$this->data['button_generator_categories'] = $this->language->get('button_generator_categories');
		$this->data['button_generator_products'] = $this->language->get('button_generator_products');
		$this->data['button_generator_manufacturers'] = $this->language->get('button_generator_manufacturers');
		$this->data['button_generator_news_categories'] = $this->language->get('button_generator_news_categories');
		$this->data['button_generator_news'] = $this->language->get('button_generator_news');
		$this->data['button_seo_manager'] = $this->language->get('button_seo_manager');
		$this->data['button_delete'] = $this->language->get('button_delete');

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
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			'href'      => $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_generator_informations'),
			'href'      => $this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['action'] = $this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['generator_categories'] = $this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_products'] = $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_manufacturers'] = $this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news_categories'] = $this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news'] = $this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['cancel'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL');

		
		$this->load->model('tool/seo_manager');
		
		if (isset($this->request->post['source_language_code'])) {
            $this->data['source_language_code'] = $this->request->post['source_language_code'];
        } else {
            $this->data['source_language_code'] = '';
        }
		
        $this->data['languages'] = $this->model_tool_seo_manager->getLanguages();
		
		if (isset($this->request->post['template_seo_url_informations'])) {
            $this->data['template_seo_url_informations'] = $this->request->post['template_seo_url_informations'];
        } else {
            $this->data['template_seo_url_informations'] = $this->config->get('config_template_seo_url_informations');
        }
		
		if (isset($this->request->post['informations_suffix'])) {
            $this->data['informations_suffix'] = $this->request->post['informations_suffix'];
        } else {
            $this->data['informations_suffix'] = $this->config->get('config_informations_suffix');
        }
		
		if (isset($this->request->post['template_meta_h1_informations'])) {
            $this->data['template_meta_h1_informations'] = $this->request->post['template_meta_h1_informations'];
        } else {
            $this->data['template_meta_h1_informations'] = $this->config->get('config_template_meta_h1_informations');
        }
		
		if (isset($this->request->post['template_meta_title_informations'])) {
            $this->data['template_meta_title_informations'] = $this->request->post['template_meta_title_informations'];
        } else {
            $this->data['template_meta_title_informations'] = $this->config->get('config_template_meta_title_informations');
        }
		
		if (isset($this->request->post['template_meta_keywords_informations'])) {
            $this->data['template_meta_keywords_informations'] = $this->request->post['template_meta_keywords_informations'];
        } else {
            $this->data['template_meta_keywords_informations'] = $this->config->get('config_template_meta_keywords_informations');
        }
		
		if (isset($this->request->post['template_meta_description_informations'])) {
            $this->data['template_meta_description_informations'] = $this->request->post['template_meta_description_informations'];
        } else {
            $this->data['template_meta_description_informations'] = $this->config->get('config_template_meta_description_informations');
        }

		$this->template = 'tool/seo_generator/generator_informations.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	// News Categories
	public function generator_news_categories() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_generator_news_categories'));
		
		$this->load->model('tool/seo_manager');
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateDelete()) {
			if (isset($this->request->post['news_categories'])) {
				$this->model_setting_setting->editSetting('generator_news_categories', array(
					'config_news_categories_template' 					=> $this->request->post['news_categories_template'],
					'config_template_meta_h1_news_categories' 			=> $this->request->post['template_meta_h1_news_categories'],
					'config_template_meta_title_news_categories' 		=> $this->request->post['template_meta_title_news_categories'],
					'config_template_meta_keywords_news_categories' 	=> $this->request->post['template_meta_keywords_news_categories'],
					'config_template_meta_description_news_categories' 	=> $this->request->post['template_meta_description_news_categories']
				));
				
				$this->model_tool_seo_manager->generateNewsCategories($this->request->post['news_categories_template'], $this->request->post['source_language_code'], $this->request->post['overwrite_news_categories'] == 'overwrite');
				
				$this->session->data['success'] = $this->language->get('text_success_news_categories');
			}
			
			if (isset($this->request->post['meta_h1_news_categories'])) {
				$this->model_setting_setting->editSetting('generator_news_categories', array(
					'config_news_categories_template' 					=> $this->request->post['news_categories_template'],
					'config_template_meta_h1_news_categories' 			=> $this->request->post['template_meta_h1_news_categories'],
					'config_template_meta_title_news_categories' 		=> $this->request->post['template_meta_title_news_categories'],
					'config_template_meta_keywords_news_categories' 	=> $this->request->post['template_meta_keywords_news_categories'],
					'config_template_meta_description_news_categories' 	=> $this->request->post['template_meta_description_news_categories']
				));

				$this->model_tool_seo_manager->generateMetaH1NewsCategories($this->request->post['template_meta_h1_news_categories'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_h1_news_categories');
			}
			
			if (isset($this->request->post['meta_h1_news_categories_delete'])) {
				$this->model_tool_seo_manager->deleteMetaH1NewsCategories();
				
				$this->session->data['success'] = $this->language->get('text_success_h1_news_categories_delete');
			}
			
			if (isset($this->request->post['meta_title_news_categories'])) {
				$this->model_setting_setting->editSetting('generator_news_categories', array(
					'config_news_categories_template' 					=> $this->request->post['news_categories_template'],
					'config_template_meta_h1_news_categories' 			=> $this->request->post['template_meta_h1_news_categories'],
					'config_template_meta_title_news_categories' 		=> $this->request->post['template_meta_title_news_categories'],
					'config_template_meta_keywords_news_categories' 	=> $this->request->post['template_meta_keywords_news_categories'],
					'config_template_meta_description_news_categories' 	=> $this->request->post['template_meta_description_news_categories']
				));

				$this->model_tool_seo_manager->generateMetaTitleNewsCategories($this->request->post['template_meta_title_news_categories'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_title_news_categories');
			}
			
			if (isset($this->request->post['meta_title_news_categories_delete'])) {
				$this->model_tool_seo_manager->deleteMetaTitleNewsCategories();
				
				$this->session->data['success'] = $this->language->get('text_success_title_news_categories_del');
			}
			
			if (isset($this->request->post['meta_keywords_news_categories'])) {
				$this->model_setting_setting->editSetting('generator_news_categories', array(
					'config_news_categories_template' 					=> $this->request->post['news_categories_template'],
					'config_template_meta_h1_news_categories' 			=> $this->request->post['template_meta_h1_news_categories'],
					'config_template_meta_title_news_categories' 		=> $this->request->post['template_meta_title_news_categories'],
					'config_template_meta_keywords_news_categories' 	=> $this->request->post['template_meta_keywords_news_categories'],
					'config_template_meta_description_news_categories' 	=> $this->request->post['template_meta_description_news_categories']
				));

				$this->model_tool_seo_manager->generateMetaKeywordsNewsCategories($this->request->post['template_meta_keywords_news_categories'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_keywords_news_categories');
			}
			
			if (isset($this->request->post['meta_keywords_news_categories_delete'])) {
				$this->model_tool_seo_manager->deleteMetaKeywordsNewsCategories();
				
				$this->session->data['success'] = $this->language->get('text_success_keywords_delete_news_cat');
			}
			
			if (isset($this->request->post['meta_description_news_categories'])) {
				$this->model_setting_setting->editSetting('generator_news_categories', array(
					'config_news_categories_template' 					=> $this->request->post['news_categories_template'],
					'config_template_meta_h1_news_categories' 			=> $this->request->post['template_meta_h1_news_categories'],
					'config_template_meta_title_news_categories' 		=> $this->request->post['template_meta_title_news_categories'],
					'config_template_meta_keywords_news_categories' 	=> $this->request->post['template_meta_keywords_news_categories'],
					'config_template_meta_description_news_categories' 	=> $this->request->post['template_meta_description_news_categories']
				));

				$this->model_tool_seo_manager->generateMetaDescriptionNewsCategories($this->request->post['template_meta_description_news_categories'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_descr_news_categories');
			}
			
			if (isset($this->request->post['meta_description_news_categories_delete'])) {
				$this->model_tool_seo_manager->deleteMetaDescriptionNewsCategories();
				
				$this->session->data['success'] = $this->language->get('text_success_descr_delete_news_cat');
			}
			
			if (isset($this->request->post['save_templates_news_categories'])) {
				$this->model_setting_setting->editSetting('generator_news_categories', array(
					'config_news_categories_template' 					=> $this->request->post['news_categories_template'],
					'config_template_meta_h1_news_categories' 			=> $this->request->post['template_meta_h1_news_categories'],
					'config_template_meta_title_news_categories' 		=> $this->request->post['template_meta_title_news_categories'],
					'config_template_meta_keywords_news_categories' 	=> $this->request->post['template_meta_keywords_news_categories'],
					'config_template_meta_description_news_categories' 	=> $this->request->post['template_meta_description_news_categories']
				));
				
				$this->session->data['success'] = $this->language->get('text_success_templates');
			}

			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			
			$this->redirect($this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getGeneratorNewsCategoriesForm();
	}
	
	protected function getGeneratorNewsCategoriesForm() {
		$this->data['heading_title'] = $this->language->get('heading_generator_news_categories');
		$this->data['heading_seo_url'] = $this->language->get('heading_seo_url');
		$this->data['heading_meta_h1'] = $this->language->get('heading_meta_h1');
		$this->data['heading_meta_title'] = $this->language->get('heading_meta_title');
		$this->data['heading_meta_keywords'] = $this->language->get('heading_meta_keywords');
		$this->data['heading_tags'] = $this->language->get('heading_tags');
		$this->data['heading_meta_description'] = $this->language->get('heading_meta_description');
		
		$this->data['text_news_category_tags'] = $this->language->get('text_news_category_tags');	
		$this->data['text_overwrite'] = $this->language->get('text_overwrite');
        $this->data['text_no_overwrite'] = $this->language->get('text_no_overwrite');
		$this->data['text_warning_overwrite'] = $this->language->get('text_warning_overwrite');
		$this->data['text_meta_h1_news_categories_tags'] = $this->language->get('text_meta_h1_news_categories_tags');
		$this->data['text_warning_h1'] = $this->language->get('text_warning_h1');
		$this->data['text_meta_title_news_categories_tags'] = $this->language->get('text_meta_title_news_categories_tags');
		$this->data['text_warning_title'] = $this->language->get('text_warning_title');
		$this->data['text_meta_keywords_news_categories_tag'] = $this->language->get('text_meta_keywords_news_categories_tag');
		$this->data['text_warning_keywords'] = $this->language->get('text_warning_keywords');
		$this->data['text_news_categories_meta_description'] = $this->language->get('text_news_categories_meta_description');
		$this->data['text_warning_description'] = $this->language->get('text_warning_description');

		$this->data['entry_source_language'] = $this->language->get('entry_source_language');
		
		$this->data['column_template'] = $this->language->get('column_template');	
		$this->data['column_overwrite'] = $this->language->get('column_overwrite');
		$this->data['column_action'] = $this->language->get('column_action');
		
		$this->data['button_generate'] = $this->language->get('button_generate');
		$this->data['button_save_templates'] = $this->language->get('button_save_templates');
		$this->data['button_generator_products'] = $this->language->get('button_generator_products');
		$this->data['button_generator_manufacturers'] = $this->language->get('button_generator_manufacturers');
		$this->data['button_generator_information'] = $this->language->get('button_generator_information');
		$this->data['button_generator_categories'] = $this->language->get('button_generator_categories');
		$this->data['button_generator_news'] = $this->language->get('button_generator_news');
		$this->data['button_seo_manager'] = $this->language->get('button_seo_manager');
		$this->data['button_delete'] = $this->language->get('button_delete');

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
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			'href'      => $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_generator_news_categories'),
			'href'      => $this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['action'] = $this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['generator_products'] = $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_manufacturers'] = $this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_information'] = $this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_categories'] = $this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news'] = $this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['cancel'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->load->model('tool/seo_manager');
		
		if (isset($this->request->post['source_language_code'])) {
            $this->data['source_language_code'] = $this->request->post['source_language_code'];
        } else {
            $this->data['source_language_code'] = '';
        }
        $this->data['languages'] = $this->model_tool_seo_manager->getLanguages();
		
		if (isset($this->request->post['news_categories_template'])) {
            $this->data['news_categories_template'] = $this->request->post['news_categories_template'];
        } else {
            $this->data['news_categories_template'] = $this->config->get('config_news_categories_template');
        }
		
		if (isset($this->request->post['template_meta_h1_news_categories'])) {
            $this->data['template_meta_h1_news_categories'] = $this->request->post['template_meta_h1_news_categories'];
        } else {
            $this->data['template_meta_h1_news_categories'] = $this->config->get('config_template_meta_h1_news_categories');
        }
		
		if (isset($this->request->post['template_meta_title_news_categories'])) {
            $this->data['template_meta_title_news_categories'] = $this->request->post['template_meta_title_news_categories'];
        } else {
            $this->data['template_meta_title_news_categories'] = $this->config->get('config_template_meta_title_news_categories');
        }
		
		if (isset($this->request->post['template_meta_keywords_news_categories'])) {
            $this->data['template_meta_keywords_news_categories'] = $this->request->post['template_meta_keywords_news_categories'];
        } else {
            $this->data['template_meta_keywords_news_categories'] = $this->config->get('config_template_meta_keywords_news_categories');
        }
		
		if (isset($this->request->post['template_meta_description_news_categories'])) {
            $this->data['template_meta_description_news_categories'] = $this->request->post['template_meta_description_news_categories'];
        } else {
            $this->data['template_meta_description_news_categories'] = $this->config->get('config_template_meta_description_news_categories');
        }

		$this->template = 'tool/seo_generator/generator_news_categories.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	// News
	public function generator_news() {
		$this->language->load('tool/seo_manager');

		$this->document->setTitle($this->language->get('heading_generator_news'));
		
		$this->load->model('tool/seo_manager');
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateDelete()) {
			if (isset($this->request->post['news'])) {
				$this->model_setting_setting->editSetting('generator_news', array(
					'config_template_seo_url_news' 			=> $this->request->post['template_seo_url_news'],
					'config_template_meta_h1_news' 			=> $this->request->post['template_meta_h1_news'],
					'config_template_meta_title_news' 		=> $this->request->post['template_meta_title_news'],
					'config_template_meta_keywords_news' 	=> $this->request->post['template_meta_keywords_news'],
					'config_template_tags_news' 			=> $this->request->post['template_tags_news'],
					'config_template_meta_description_news' => $this->request->post['template_meta_description_news']
				));
				
				$this->model_tool_seo_manager->generateNews($this->request->post['template_seo_url_news'], $this->request->post['news_suffix'], $this->request->post['source_language_code'], $this->request->post['overwrite_news'] == 'overwrite');
				
				$this->session->data['success'] = $this->language->get('text_success_news');
			}
			
			if (isset($this->request->post['meta_h1_news'])) {
				$this->model_setting_setting->editSetting('generator_news', array(
					'config_template_seo_url_news' 			=> $this->request->post['template_seo_url_news'],
					'config_template_meta_h1_news' 			=> $this->request->post['template_meta_h1_news'],
					'config_template_meta_title_news' 		=> $this->request->post['template_meta_title_news'],
					'config_template_meta_keywords_news' 	=> $this->request->post['template_meta_keywords_news'],
					'config_template_tags_news' 			=> $this->request->post['template_tags_news'],
					'config_template_meta_description_news' => $this->request->post['template_meta_description_news']
				));

				$this->model_tool_seo_manager->generateMetaH1News($this->request->post['template_meta_h1_news'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_h1_news');
			}
			
			if (isset($this->request->post['meta_h1_news_delete'])) {
				$this->model_tool_seo_manager->deleteMetaH1News();
				
				$this->session->data['success'] = $this->language->get('text_success_h1_news_delete');
			}
			
			if (isset($this->request->post['meta_title_news'])) {
				$this->model_setting_setting->editSetting('generator_news', array(
					'config_template_seo_url_news' 			=> $this->request->post['template_seo_url_news'],
					'config_template_meta_h1_news' 			=> $this->request->post['template_meta_h1_news'],
					'config_template_meta_title_news' 		=> $this->request->post['template_meta_title_news'],
					'config_template_meta_keywords_news' 	=> $this->request->post['template_meta_keywords_news'],
					'config_template_tags_news' 			=> $this->request->post['template_tags_news'],
					'config_template_meta_description_news' => $this->request->post['template_meta_description_news']
				));

				$this->model_tool_seo_manager->generateMetaTitleNews($this->request->post['template_meta_title_news'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_title_news');
			}
			
			if (isset($this->request->post['meta_title_news_delete'])) {
				$this->model_tool_seo_manager->deleteMetaTitleNews();
				
				$this->session->data['success'] = $this->language->get('text_success_title_news_delete');
			}
			
			if (isset($this->request->post['meta_keywords_news'])) {
				$this->model_setting_setting->editSetting('generator_news', array(
					'config_template_seo_url_news' 			=> $this->request->post['template_seo_url_news'],
					'config_template_meta_h1_news' 			=> $this->request->post['template_meta_h1_news'],
					'config_template_meta_title_news' 		=> $this->request->post['template_meta_title_news'],
					'config_template_meta_keywords_news' 	=> $this->request->post['template_meta_keywords_news'],
					'config_template_tags_news' 			=> $this->request->post['template_tags_news'],
					'config_template_meta_description_news' => $this->request->post['template_meta_description_news']
				));
				
				$this->model_tool_seo_manager->generateNewsMetaKeywords($this->request->post['template_meta_keywords_news'], null, $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_keywords_news');
			}
			
			if (isset($this->request->post['meta_keywords_news_delete'])) {
				$this->model_tool_seo_manager->deleteKeywordsNews();
				
				$this->session->data['success'] = $this->language->get('text_success_keywords_news_delete');
			}
			
			if (isset($this->request->post['tags_news'])) {
				$this->model_setting_setting->editSetting('generator_news', array(
					'config_template_seo_url_news' 			=> $this->request->post['template_seo_url_news'],
					'config_template_meta_h1_news' 			=> $this->request->post['template_meta_h1_news'],
					'config_template_meta_title_news' 		=> $this->request->post['template_meta_title_news'],
					'config_template_meta_keywords_news' 	=> $this->request->post['template_meta_keywords_news'],
					'config_template_tags_news' 			=> $this->request->post['template_tags_news'],
					'config_template_meta_description_news' => $this->request->post['template_meta_description_news']
				));

				$this->model_tool_seo_manager->generateTagsNews($this->request->post['template_tags_news'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_tags_news');
			}
			
			if (isset($this->request->post['tags_news_delete'])) {
				$this->model_tool_seo_manager->deleteTagsNews();
				
				$this->session->data['success'] = $this->language->get('text_success_tags_news_delete');
			}
			
			if (isset($this->request->post['meta_description_news'])) {
				$this->model_setting_setting->editSetting('generator_news', array(
					'config_template_seo_url_news' 			=> $this->request->post['template_seo_url_news'],
					'config_template_meta_h1_news' 			=> $this->request->post['template_meta_h1_news'],
					'config_template_meta_title_news' 		=> $this->request->post['template_meta_title_news'],
					'config_template_meta_keywords_news' 	=> $this->request->post['template_meta_keywords_news'],
					'config_template_tags_news' 			=> $this->request->post['template_tags_news'],
					'config_template_meta_description_news' => $this->request->post['template_meta_description_news']
				));

				$this->model_tool_seo_manager->generateMetaDescriptionNews($this->request->post['template_meta_description_news'], $this->request->post['source_language_code']);
				
				$this->session->data['success'] = $this->language->get('text_success_description_news');
			}
			
			if (isset($this->request->post['meta_description_news_delete'])) {
				$this->model_tool_seo_manager->deleteMetaDescriptionNews();
				
				$this->session->data['success'] = $this->language->get('text_success_description_news_delete');
			}
			
			if (isset($this->request->post['save_templates_news'])) {
				$this->model_setting_setting->editSetting('generator_news', array(
					'config_template_seo_url_news' 			=> $this->request->post['template_seo_url_news'],
					'config_template_meta_h1_news' 			=> $this->request->post['template_meta_h1_news'],
					'config_template_meta_title_news' 		=> $this->request->post['template_meta_title_news'],
					'config_template_meta_keywords_news' 	=> $this->request->post['template_meta_keywords_news'],
					'config_template_tags_news' 			=> $this->request->post['template_tags_news'],
					'config_template_meta_description_news' => $this->request->post['template_meta_description_news']
				));
				
				$this->session->data['success'] = $this->language->get('text_success_templates');
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_query'])) {
				$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
			}
		
			if (isset($this->request->get['filter_keyword'])) {
				$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			
			$this->redirect($this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getGeneratorNewsForm();
	}
	
	protected function getGeneratorNewsForm() {
		$this->data['heading_title'] = $this->language->get('heading_generator_news');
		$this->data['heading_seo_url'] = $this->language->get('heading_seo_url');	
		$this->data['heading_meta_h1'] = $this->language->get('heading_meta_h1');
		$this->data['heading_meta_title'] = $this->language->get('heading_meta_title');
		$this->data['heading_meta_keywords'] = $this->language->get('heading_meta_keywords');
		$this->data['heading_tags'] = $this->language->get('heading_tags');
		$this->data['heading_meta_description'] = $this->language->get('heading_meta_description');
		
		$this->data['text_news_tags'] = $this->language->get('text_news_tags');	
		$this->data['text_overwrite'] = $this->language->get('text_overwrite');
        $this->data['text_no_overwrite'] = $this->language->get('text_no_overwrite');
		$this->data['text_warning_overwrite'] = $this->language->get('text_warning_overwrite');
		$this->data['text_products_suffix'] = $this->language->get('text_products_suffix');
		$this->data['text_meta_h1_news_tags'] = $this->language->get('text_meta_h1_news_tags');
		$this->data['text_warning_h1'] = $this->language->get('text_warning_h1');
		$this->data['text_meta_title_news_tags'] = $this->language->get('text_meta_title_news_tags');
		$this->data['text_warning_title'] = $this->language->get('text_warning_title');
		$this->data['text_meta_keywords_news_tags'] = $this->language->get('text_meta_keywords_news_tags');
		$this->data['text_warning_keywords'] = $this->language->get('text_warning_keywords');
		$this->data['text_tags_news'] = $this->language->get('text_tags_news');
		$this->data['text_warning_tags'] = $this->language->get('text_warning_tags');
		$this->data['text_news_meta_description'] = $this->language->get('text_news_meta_description');
		$this->data['text_warning_description'] = $this->language->get('text_warning_description');

		$this->data['entry_source_language'] = $this->language->get('entry_source_language');
		
		$this->data['column_template'] = $this->language->get('column_template');	
		$this->data['column_overwrite'] = $this->language->get('column_overwrite');
		$this->data['column_suffix'] = $this->language->get('column_suffix');
		$this->data['column_warning'] = $this->language->get('column_warning');
		
		$this->data['button_generate'] = $this->language->get('button_generate');
		$this->data['button_save_templates'] = $this->language->get('button_save_templates');
		$this->data['button_generator_categories'] = $this->language->get('button_generator_categories');
		$this->data['button_generator_manufacturers'] = $this->language->get('button_generator_manufacturers');
		$this->data['button_generator_information'] = $this->language->get('button_generator_information');
		$this->data['button_generator_news_categories'] = $this->language->get('button_generator_news_categories');
		$this->data['button_generator_products'] = $this->language->get('button_generator_products');
		$this->data['button_seo_manager'] = $this->language->get('button_seo_manager');
		$this->data['button_delete'] = $this->language->get('button_delete');

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
		
		if (isset($this->request->get['filter_query'])) {
			$url .= '&filter_query=' . urlencode(html_entity_decode($this->request->get['filter_query'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_keyword'])) {
			$url .= '&filter_keyword=' . urlencode(html_entity_decode($this->request->get['filter_keyword'], ENT_QUOTES, 'UTF-8'));
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
			'href'      => $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_generator_news'),
			'href'      => $this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('tool/seo_manager/generator_news', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['generator_categories'] = $this->url->link('tool/seo_manager/generator_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_manufacturers'] = $this->url->link('tool/seo_manager/generator_manufacturers', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_information'] = $this->url->link('tool/seo_manager/generator_information', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_news_categories'] = $this->url->link('tool/seo_manager/generator_news_categories', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['generator_products'] = $this->url->link('tool/seo_manager/generator_products', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['cancel'] = $this->url->link('tool/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL');

		
		$this->load->model('tool/seo_manager');
		
		if (isset($this->request->post['source_language_code'])) {
            $this->data['source_language_code'] = $this->request->post['source_language_code'];
        } else {
            $this->data['source_language_code'] = '';
        }
		
        $this->data['languages'] = $this->model_tool_seo_manager->getLanguages();
		
		if (isset($this->request->post['template_seo_url_news'])) {
            $this->data['template_seo_url_news'] = $this->request->post['template_seo_url_news'];
        } else {
            $this->data['template_seo_url_news'] = $this->config->get('config_template_seo_url_news');
        }
		
		if (isset($this->request->post['news_suffix'])) {
            $this->data['news_suffix'] = $this->request->post['news_suffix'];
        } else {
            $this->data['news_suffix'] = $this->config->get('config_news_suffix');
        }
		
		if (isset($this->request->post['template_meta_h1_news'])) {
            $this->data['template_meta_h1_news'] = $this->request->post['template_meta_h1_news'];
        } else {
            $this->data['template_meta_h1_news'] = $this->config->get('config_template_meta_h1_news');
        }
		
		if (isset($this->request->post['template_meta_title_news'])) {
            $this->data['template_meta_title_news'] = $this->request->post['template_meta_title_news'];
        } else {
            $this->data['template_meta_title_news'] = $this->config->get('config_template_meta_title_news');
        }
		
		if (isset($this->request->post['template_meta_keywords_news'])) {
            $this->data['template_meta_keywords_news'] = $this->request->post['template_meta_keywords_news'];
        } else {
            $this->data['template_meta_keywords_news'] = $this->config->get('config_template_meta_keywords_news');
        }
		
		if (isset($this->request->post['template_tags_news'])) {
            $this->data['template_tags_news'] = $this->request->post['template_tags_news'];
        } else {
            $this->data['template_tags_news'] = $this->config->get('config_template_tags_news');
        }
		
		if (isset($this->request->post['template_meta_description_news'])) {
            $this->data['template_meta_description_news'] = $this->request->post['template_meta_description_news'];
        } else {
            $this->data['template_meta_description_news'] = $this->config->get('config_template_meta_description_news');
        }

		$this->template = 'tool/seo_generator/generator_news.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'tool/seo_manager')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['query']) < 1) || (utf8_strlen($this->request->post['query']) > 64)) {
			$this->error['query'] = $this->language->get('error_query');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'tool/seo_manager')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	public function autocomplete() {
		$json = array();
		
		if (isset($this->request->get['filter_query']) || isset($this->request->get['filter_keyword'])) {
			$this->load->model('tool/seo_manager');
			
			if (isset($this->request->get['filter_query'])) {
				$filter_query = $this->request->get['filter_query'];
			} else {
				$filter_query = '';
			}
			
			if (isset($this->request->get['filter_keyword'])) {
				$filter_keyword = $this->request->get['filter_keyword'];
			} else {
				$filter_keyword = '';
			}			
			
			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];	
			} else {
				$limit = 20;	
			}			
						
			$data = array(
				'filter_query'   => $filter_query,
				'filter_keyword' => $filter_keyword,
				'start'          => 0,
				'limit'          => $limit
			);
			
			$results = $this->model_tool_seo_manager->getUrlAliases($data);
			
			foreach ($results as $result) {
					
				$json[] = array(
					'url_alias_id' => $result['url_alias_id'],
					'query'        => strip_tags(html_entity_decode($result['query'], ENT_QUOTES, 'UTF-8')),	
					'keyword'      => $result['keyword']
				);	
			}
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>