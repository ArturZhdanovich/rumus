<?php
class ControllerCatalogNewsComment extends Controller {
	private $error = array();
 
	public function index() {
		$this->language->load('catalog/news_comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news_comment');
		
		$this->getList();
	} 

	public function insert() {
		$this->language->load('catalog/news_comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news_comment');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_news_comment->addNewsComment($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

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
						
			$this->redirect($this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('catalog/news_comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news_comment');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_news_comment->editNewsComment($this->request->get['news_comment_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

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
						
			$this->redirect($this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() { 
		$this->language->load('catalog/news_comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news_comment');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $news_comment_id) {
				$this->model_catalog_news_comment->deleteNewsComment($news_comment_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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
						
			$this->redirect($this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}
	
	private function getListing($news_comment_id){
		$this->language->load('catalog/news_comment');
		$this->load->model('catalog/news_comment');
		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_select'] = $this->language->get('text_select');

		$this->data['entry_news'] = $this->language->get('entry_news');
		$this->data['entry_author'] = $this->language->get('entry_author');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_text'] = $this->language->get('entry_text');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
 		
		if (isset($this->error['news'])) {
			$this->data['error_news'] = $this->error['news'];
		} else {
			$this->data['error_news'] = '';
		}
		
 		if (isset($this->error['author'])) {
			$this->data['error_author'] = $this->error['author'];
		} else {
			$this->data['error_author'] = '';
		}
		
 		if (isset($this->error['text'])) {
			$this->data['error_text'] = $this->error['text'];
		} else {
			$this->data['error_text'] = '';
		}
		
		if (isset($this->request->get['news_comment_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$news_comment_info = $this->model_catalog_news_comment->getNewsComment($this->request->get['news_comment_id']);
		}
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('catalog/news');
		
		if (isset($this->request->post['news_id'])) {
			$this->data['news_id'] = $this->request->post['news_id'];
		} elseif (!empty($news_comment_info)) {
			$this->data['news_id'] = $news_comment_info['news_id'];
		} else {
			$this->data['news_id'] = '';
		}

		if (isset($this->request->post['news'])) {
			$this->data['news'] = $this->request->post['news'];
		} elseif (!empty($news_comment_info)) {
			$this->data['news'] = $news_comment_info['news'];
		} else {
			$this->data['news'] = '';
		}
				
		if (isset($this->request->post['author'])) {
			$this->data['author'] = $this->request->post['author'];
		} elseif (!empty($news_comment_info)) {
			$this->data['author'] = $news_comment_info['author'];
		} else {
			$this->data['author'] = '';
		}

		if (isset($this->request->post['text'])) {
			$this->data['text'] = $this->request->post['text'];
		} elseif (!empty($news_comment_info)) {
			$this->data['text'] = $news_comment_info['text'];
		} else {
			$this->data['text'] = '';
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($news_comment_info)) {
			$this->data['status'] = $news_comment_info['status'];
		} else {
			$this->data['status'] = '';
		}
		
		if ($this->user->hasPermission('modify', 'catalog/news_comment')) {
			if(isset($this->request->get['news_comment_edit'])){		
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					$this->model_catalog_news_comment->editNewsComment((int)$news_comment_id, $this->request->post);
				}
			}
		}
		
		$this->data['news_comment_id'] = $news_comment_id;
		
		if(isset($this->request->get['news_comment_edit'])){		
			$this->template = 'catalog/quick_edit_news/quick_news_comment_popup.tpl';
		}
		
		$this->response->setOutput($this->render());
	
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'c.date_added';
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
			'href'      => $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['insert'] = $this->url->link('catalog/news_comment/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/news_comment/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['link'] = $this->url->link('catalog/news_comment&token=', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if(isset($this->request->get['news_comment_edit'])){		
			return $this->getListing((int)$this->request->get['news_comment_id']);
		}		

		$this->data['news_comments'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$news_comment_total = $this->model_catalog_news_comment->getTotalNewsComments();
	
		$results = $this->model_catalog_news_comment->getNewsComments($data);
 
    	foreach ($results as $result) {
			$action = array();
			
			if ($this->config->get('config_buttons_apply') == 0) {
				$action[] = array(
					'text' => $this->language->get('text_edit'),
					'href' => $this->url->link('catalog/news_comment/update', 'token=' . $this->session->data['token'] . '&news_comment_id=' . $result['news_comment_id'] . $url, 'SSL')
				);
			} else {
				$action[] = array(
					'text' => $this->language->get('button_edites'),
					'href' => $this->url->link('catalog/news_comment/update', 'token=' . $this->session->data['token'] . '&news_comment_id=' . $result['news_comment_id'] . $url, 'SSL')
				);
			}
						
			$this->data['news_comments'][] = array(
				'news_comment_id'  	=> $result['news_comment_id'],
				'name'       		=> $result['name'],
				'author'     		=> $result['author'],
				'status'     		=> ($result['status'] ? $this->language->get('text_enableds') : $this->language->get('text_disableds')),
				'date_added' 		=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'selected'   		=> isset($this->request->post['selected']) && in_array($result['news_comment_id'], $this->request->post['selected']),
				'action'     		=> $action
			);
		}	
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_news_cooment'] = $this->language->get('text_news_cooment');

		$this->data['column_news'] = $this->language->get('column_news');
		$this->data['column_author'] = $this->language->get('column_author');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_action'] = $this->language->get('column_action');		
		
		$this->data['button_edit'] = $this->language->get('button_edit');
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
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

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_news'] = $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . '&sort=nd.name' . $url, 'SSL');
		$this->data['sort_author'] = $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . '&sort=c.author' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . '&sort=c.status' . $url, 'SSL');
		$this->data['sort_date_added'] = $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . '&sort=c.date_added' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $news_comment_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/news_comment_list.tpl';
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
		$this->data['text_select'] = $this->language->get('text_select');

		$this->data['entry_news'] = $this->language->get('entry_news');
		$this->data['entry_author'] = $this->language->get('entry_author');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_text'] = $this->language->get('entry_text');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
 		
		if (isset($this->error['news'])) {
			$this->data['error_news'] = $this->error['news'];
		} else {
			$this->data['error_news'] = '';
		}
		
 		if (isset($this->error['author'])) {
			$this->data['error_author'] = $this->error['author'];
		} else {
			$this->data['error_author'] = '';
		}
		
 		if (isset($this->error['text'])) {
			$this->data['error_text'] = $this->error['text'];
		} else {
			$this->data['error_text'] = '';
		}

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
				
   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
										
		if (!isset($this->request->get['news_comment_id'])) { 
			$this->data['action'] = $this->url->link('catalog/news_comment/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/news_comment/update', 'token=' . $this->session->data['token'] . '&news_comment_id=' . $this->request->get['news_comment_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['news_comment_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$news_comment_info = $this->model_catalog_news_comment->getNewsComment($this->request->get['news_comment_id']);
		}
		
		$this->data['token'] = $this->session->data['token'];
			
		$this->load->model('catalog/news');
		
		if (isset($this->request->post['news_id'])) {
			$this->data['news_id'] = $this->request->post['news_id'];
		} elseif (!empty($news_comment_info)) {
			$this->data['news_id'] = $news_comment_info['news_id'];
		} else {
			$this->data['news_id'] = '';
		}

		if (isset($this->request->post['news'])) {
			$this->data['news'] = $this->request->post['news'];
		} elseif (!empty($news_comment_info)) {
			$this->data['news'] = $news_comment_info['news'];
		} else {
			$this->data['news'] = '';
		}
				
		if (isset($this->request->post['author'])) {
			$this->data['author'] = $this->request->post['author'];
		} elseif (!empty($news_comment_info)) {
			$this->data['author'] = $news_comment_info['author'];
		} else {
			$this->data['author'] = '';
		}

		if (isset($this->request->post['text'])) {
			$this->data['text'] = $this->request->post['text'];
		} elseif (!empty($news_comment_info)) {
			$this->data['text'] = $news_comment_info['text'];
		} else {
			$this->data['text'] = '';
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($news_comment_info)) {
			$this->data['status'] = $news_comment_info['status'];
		} else {
			$this->data['status'] = '';
		}

		$this->template = 'catalog/news_comment_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/news_comment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['news_id']) {
			$this->error['news'] = $this->language->get('error_news');
		}
		
		if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)) {
			$this->error['author'] = $this->language->get('error_author');
		}

		if (utf8_strlen($this->request->post['text']) < 1) {
			$this->error['text'] = $this->language->get('error_text');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/news_comment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}	
	
	public function changeStatus() {
		if ($this->user->hasPermission('modify', 'catalog/news_comment')) {
			$this->language->load('catalog/news_comment');
		
			$this->load->model('catalog/news_comment');
			$output='';
			if(isset($this->request->get['object_id'])){
				$requestpart = explode('-',$this->request->get['object_id']);
				if(count($requestpart)==2){
					$column_name = $requestpart[0];
					$news_comment_id = $requestpart[1];				
					$result = $this->model_catalog_news_comment->getNewsComment($news_comment_id);
					if($result[$column_name]){
						$this->model_catalog_news_comment->changeStatus($news_comment_id, $column_name, 0);
					} else {
						$this->model_catalog_news_comment->changeStatus($news_comment_id, $column_name, 1);
					}				
					$result = $this->model_catalog_news_comment->getNewsComment($news_comment_id);
					$output = $result[$column_name] ? $this->language->get('text_enableds') : $this->language->get('text_disableds');
				}
			}
			$this->response->setOutput($output);
		}
	}
}
?>