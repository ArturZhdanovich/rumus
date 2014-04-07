<?php 
class ControllerToolControlUnit extends Controller {
	private $error = array();
 
	public function index() {
		$this->language->load('tool/control_unit');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/control_unit');
		
		$this->getList();
	}

	public function insert() {
		$this->language->load('tool/control_unit');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/control_unit');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_tool_control_unit->addItem($this->request->post);
			
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
			
			$this->redirect($this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('tool/control_unit');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/control_unit');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_tool_control_unit->editItem($this->request->get['control_unit_id'], $this->request->post);

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
					
			$this->redirect($this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
 
	public function delete() {
		$this->language->load('tool/control_unit');
 
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/control_unit');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $control_unit_id) {
				$this->model_tool_control_unit->deleteItem($control_unit_id);
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

			$this->redirect($this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'sort_order';
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
			'href'      => $this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('tool/control_unit/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('tool/control_unit/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['link'] = $this->url->link('tool/control_unit&token=', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if(isset($this->request->get['edit_image'])){
			$this->model_tool_control_unit->editImage((int)$this->request->get['control_unit_id'], $this->request->get['image']);
		}
		
		$this->data['control_units'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$this->load->model('tool/image');
		
		$control_unit_total = $this->model_tool_control_unit->getTotalControlUnits();
		
		$results = $this->model_tool_control_unit->getControlUnits($data);
		
		foreach ($results as $result) {
			$action = array();
			
			if ($this->config->get('config_buttons_apply') == 0) {
				$action[] = array(
					'text' => $this->language->get('text_edit'),
					'href' => $this->url->link('tool/control_unit/update', 'token=' . $this->session->data['token'] . '&control_unit_id=' . $result['control_unit_id'] . $url, 'SSL')
				);
			} else {
				$action[] = array(
					'text' => $this->language->get('button_edites'),
					'href' => $this->url->link('tool/control_unit/update', 'token=' . $this->session->data['token'] . '&control_unit_id=' . $result['control_unit_id'] . $url, 'SSL')
				);
			}
			
			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}

			$this->data['control_units'][] = array(
				'control_unit_id' => $result['control_unit_id'],
				'name'      	  => $result['name'],
				'image'      	  => $image,
				'link'      	  => $result['link'],
				'sort_order' 	  => $result['sort_order'],
				'selected'        => isset($this->request->post['selected']) && in_array($result['control_unit_id'], $this->request->post['selected']),
				'status'		  => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'action'    	  => $action
			);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		
		$this->data['column_image'] = $this->language->get('column_image');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_link'] = $this->language->get('column_link');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_action'] = $this->language->get('column_action');	

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		
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
		
		$this->data['sort_name'] = $this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $control_unit_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();
		
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'tool/control_unit_list.tpl';
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
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
 		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');			
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_link'] = $this->language->get('entry_link');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');		
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
		
		if (isset($this->error['link'])) {
			$this->data['error_link'] = $this->error['link'];
		} else {
			$this->data['error_link'] = '';
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
			'href'      => $this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		if (!isset($this->request->get['control_unit_id'])) { 
			$this->data['action'] = $this->url->link('tool/control_unit/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('tool/control_unit/update', 'token=' . $this->session->data['token'] . '&control_unit_id=' . $this->request->get['control_unit_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('tool/control_unit', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if (isset($this->request->get['control_unit_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$control_unit_info = $this->model_tool_control_unit->getControlUnit($this->request->get['control_unit_id']);
		}

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($control_unit_info)) {
			$this->data['name'] = $control_unit_info['name'];
		} else {
			$this->data['name'] = '';
		}
		
		if (isset($this->request->post['link'])) {
			$this->data['link'] = $this->request->post['link'];
		} elseif (!empty($control_unit_info)) {
			$this->data['link'] = $control_unit_info['link'];
		} else {
			$this->data['link'] = '';
		}
		
		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($control_unit_info)) {
			$this->data['image'] = $control_unit_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($control_unit_info) && $control_unit_info['image'] && file_exists(DIR_IMAGE . $control_unit_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($control_unit_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($control_unit_info)) {
			$this->data['sort_order'] = $control_unit_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($control_unit_info)) {
			$this->data['status'] = $control_unit_info['status'];
		} else {
			$this->data['status'] = true;
		}	

		$this->template = 'tool/control_unit_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'tool/control_unit')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if ((utf8_strlen($this->request->post['link']) < 3) || (utf8_strlen($this->request->post['link']) > 64)) {
			$this->error['link'] = $this->language->get('error_link');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'tool/control_unit')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	public function changeName() {
        $id  = $this->request->get['control_unit_id'];
        $name = $this->request->get['name'];

        $this->load->model('tool/control_unit');

        $this->response->setOutput($this->model_tool_control_unit->changeName($id, $name));
    }
	
	public function changeRoute() {
        $id  = $this->request->get['control_unit_id'];
        $link = $this->request->get['link'];

        $this->load->model('tool/control_unit');

        $this->response->setOutput($this->model_tool_control_unit->changeRoute($id, $link));
    }
	
	public function changeSortOrder() {
        $id  = $this->request->get['control_unit_id'];
        $sort_order = $this->request->get['sort_order'];

        $this->load->model('tool/control_unit');

        $this->response->setOutput($this->model_tool_control_unit->changeSortOrder($id, $sort_order));
    }
	
	public function changeStatus() {
		if ($this->user->hasPermission('modify', 'tool/control_unit')) {
			$this->language->load('tool/control_unit');
			
			$this->load->model('tool/control_unit');
			$output='';
			if(isset($this->request->get['object_id'])){
				$requestpart = explode('-',$this->request->get['object_id']);
				if(count($requestpart)==2){
					$column_name = $requestpart[0];
					$control_unit_id = $requestpart[1];				
					$result = $this->model_tool_control_unit->getControlUnit($control_unit_id);
					if($result[$column_name]){
						$this->model_tool_control_unit->changeStatus($control_unit_id, $column_name, 0);
					} else {
						$this->model_tool_control_unit->changeStatus($control_unit_id, $column_name, 1);
					}				
					$result = $this->model_tool_control_unit->getControlUnit($control_unit_id);
					$output = $result[$column_name] ? $this->language->get('text_enabled') : $this->language->get('text_disabled');
				}
			}
			$this->response->setOutput($output);
		}
	}
}
?>