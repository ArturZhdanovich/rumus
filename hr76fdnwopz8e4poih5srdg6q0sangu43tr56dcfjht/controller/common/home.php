<?php   
class ControllerCommonHome extends Controller {   
	public function index() {
    	$this->language->load('common/home');
	 
		$this->document->setTitle($this->language->get('heading_title'));
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_overview'] = $this->language->get('text_overview');
		$this->data['text_customers'] = $this->language->get('text_customers');
		$this->data['text_other'] = $this->language->get('text_other');
		$this->data['text_statistics'] = $this->language->get('text_statistics');
		$this->data['text_latest_10_orders'] = $this->language->get('text_latest_10_orders');
		$this->data['text_total_product'] = $this->language->get('text_total_product');
		$this->data['text_total_sale'] = $this->language->get('text_total_sale');
		$this->data['text_total_sale_year'] = $this->language->get('text_total_sale_year');
		$this->data['text_total_sale_month'] = $this->language->get('text_total_sale_month');
		$this->data['text_total_sale_day'] = $this->language->get('text_total_sale_day');
		$this->data['text_total_order'] = $this->language->get('text_total_order');
		$this->data['text_abandoned_orders'] = $this->language->get('text_abandoned_orders');
		$this->data['text_total_administrators'] = $this->language->get('text_total_administrators');
		$this->data['text_total_users'] = $this->language->get('text_total_users');
		$this->data['text_total_customer'] = $this->language->get('text_total_customer');
		$this->data['text_total_customer_approval'] = $this->language->get('text_total_customer_approval');
		$this->data['text_total_banned_ip'] = $this->language->get('text_total_banned_ip');
		$this->data['text_total_review_approval'] = $this->language->get('text_total_review_approval');
		$this->data['text_total_affiliate'] = $this->language->get('text_total_affiliate');
		$this->data['text_total_affiliate_approval'] = $this->language->get('text_total_affiliate_approval');
		$this->data['text_total_news'] = $this->language->get('text_total_news');
		$this->data['text_total_news_comments'] = $this->language->get('text_total_news_comments');
		$this->data['text_news_comments_approval'] = $this->language->get('text_news_comments_approval');
		$this->data['text_total_informations'] = $this->language->get('text_total_informations');
		$this->data['text_total_manufacturers'] = $this->language->get('text_total_manufacturers');
		$this->data['text_total_returns'] = $this->language->get('text_total_returns');
		$this->data['text_day'] = $this->language->get('text_day');
		$this->data['text_week'] = $this->language->get('text_week');
		$this->data['text_month'] = $this->language->get('text_month');
		$this->data['text_year'] = $this->language->get('text_year');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_control_unit'] = $this->language->get('text_control_unit');
		$this->data['text_edit_items'] = $this->language->get('text_edit_items');
		$this->data['text_view'] = $this->language->get('text_view');
		
		$this->data['column_order'] = $this->language->get('column_order');
		$this->data['column_customer'] = $this->language->get('column_customer');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_total'] = $this->language->get('column_total');
		$this->data['column_firstname'] = $this->language->get('column_firstname');
		$this->data['column_lastname'] = $this->language->get('column_lastname');
		$this->data['column_action'] = $this->language->get('column_action');
		
		$this->data['entry_range'] = $this->language->get('entry_range');
		
		$this->data['control_unit'] = $this->url->link('tool/control_unit', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['clear_all_cache'])) {
			$files = glob(DIR_CACHE . 'cache.*');
			foreach($files as $file){
				$this->delete($file);
			}
			$this->data['success_all_cache'] = $this->language->get('text_success_all_cache');
		} else {
			$this->data['success_all_cache'] = '';
		}
		
		if (isset($this->request->get['clear_image_cache'])) {
			$image_files = glob(DIR_IMAGE . 'cache/*');
			foreach($image_files as $image_file){
				 $this->delete($image_file);
			}
			$this->data['success_image_cache'] = $this->language->get('text_success_image_cache');
		} else {
			$this->data['success_image_cache'] = '';
		}
		
		if (isset($this->request->get['clear_seo_cache'])) {
			$files = glob(DIR_CACHE . 'cache.seo_*');
			foreach($files as $file){
				$this->delete($file);
			}
			$this->data['success_seo_cache'] = $this->language->get('text_success_seo_cache');
		} else {
			$this->data['success_seo_cache'] = '';
		}
		
		// Check install directory exists
 		if (is_dir(dirname(DIR_APPLICATION) . '/install')) {
			$this->data['error_install'] = $this->language->get('error_install');
		} else {
			$this->data['error_install'] = '';
		}

		// Check image directory is writable
		$file = DIR_IMAGE . 'test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_image'] = sprintf($this->language->get('error_image'). DIR_IMAGE);
		} else {
			$this->data['error_image'] = '';
			
			unlink($file);
		}
		
		// Check image cache directory is writable
		$file = DIR_IMAGE . 'cache/test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_image_cache'] = sprintf($this->language->get('error_image_cache'). DIR_IMAGE . 'cache/');
		} else {
			$this->data['error_image_cache'] = '';
			
			unlink($file);
		}
		
		// Check cache directory is writable
		$file = DIR_CACHE . 'test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_cache'] = sprintf($this->language->get('error_image_cache'). DIR_CACHE);
		} else {
			$this->data['error_cache'] = '';
			
			unlink($file);
		}
		
		// Check download directory is writable
		$file = DIR_DOWNLOAD . 'test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_download'] = sprintf($this->language->get('error_download'). DIR_DOWNLOAD);
		} else {
			$this->data['error_download'] = '';
			
			unlink($file);
		}
		
		// Check logs directory is writable
		$file = DIR_LOGS . 'test';
		
		$handle = fopen($file, 'a+'); 
		
		fwrite($handle, '');
			
		fclose($handle); 		
		
		if (!file_exists($file)) {
			$this->data['error_logs'] = sprintf($this->language->get('error_logs'). DIR_LOGS);
		} else {
			$this->data['error_logs'] = '';
			
			unlink($file);
		}
										
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('catalog/product');

		$this->data['total_product'] = $this->model_catalog_product->getTotalProducts();
		if ($this->config->get('config_product_quick_edit') == 1) {
			$this->data['view_total_product'] = $this->url->link('catalog/product_quick', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['view_total_product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'], 'SSL');
		}
		
		$this->load->model('sale/order');

		$this->data['total_sale'] = $this->currency->format($this->model_sale_order->getTotalSales(), $this->config->get('config_currency'));
		$this->data['total_sale_year'] = $this->currency->format($this->model_sale_order->getTotalSalesByYear(date('Y')), $this->config->get('config_currency'));
		$this->data['total_sale_month'] = $this->currency->format($this->model_sale_order->getTotalSalesByMonth(), $this->config->get('config_currency'));
		$this->data['total_sale_day'] = $this->currency->format($this->model_sale_order->getTotalSalesByDay(), $this->config->get('config_currency'));
		$this->data['total_order'] = $this->model_sale_order->getTotalOrders();
		$this->data['total_abandoned_orders'] = $this->model_sale_order->getAbandonedOrderCount();
		$this->data['abandoned_order_ids'] = $this->model_sale_order->getAbandonedOrderIds();
		$this->data['view_order'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['view_abandoned_orders'] =  $this->url->link('sale/order&filter_order_status_id=0&filter_order_id=' . $this->data['abandoned_order_ids'], 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('user/user');
		
		$this->data['total_admin'] = $this->model_user_user->getTotalUsersByGroupId($user_group_id=1);
		$this->data['total_users'] = $this->model_user_user->getTotalUsers();
		$this->data['view_users'] =  $this->url->link('user/user', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('sale/customer');
		
		$this->data['total_customer'] = $this->model_sale_customer->getTotalCustomers();
		$this->data['total_customer_approval'] = $this->model_sale_customer->getTotalCustomersAwaitingApproval();
		if ( $this->data['total_customer_approval'] > 0 )
			$this->data['total_customer_approval'] = sprintf('<span class="attn">%s</span>', $this->data['total_customer_approval']
		);
		$this->data['view_customer'] =  $this->url->link('sale/customer', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('sale/customer_ban_ip');
		$this->data['total_banned_ip'] = $this->model_sale_customer_ban_ip->getTotalCustomerBanIps();
		$this->data['view_banned_ip'] =  $this->url->link('sale/customer_ban_ip', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('catalog/review');
		
		$this->data['total_review'] = $this->model_catalog_review->getTotalReviews();
		$this->data['total_review_approval'] = $this->model_catalog_review->getTotalReviewsAwaitingApproval();
		if ( $this->data['total_review_approval'] > 0 )
			$this->data['total_review_approval'] = sprintf('<span class="attn">%s</span>', $this->data['total_review_approval']
		);
		
		$this->load->model('sale/affiliate');
		
		$this->data['total_affiliate'] = $this->model_sale_affiliate->getTotalAffiliates();
		$this->data['total_affiliate_approval'] = $this->model_sale_affiliate->getTotalAffiliatesAwaitingApproval();
		if( $this->data['total_affiliate_approval'] > 0 )
			$this->data['total_affiliate_approval'] = sprintf('<span class="attn">%s</span>', $this->data['total_affiliate_approval']
		);
		$this->data['view_affiliate'] =  $this->url->link('sale/affiliate', 'token=' . $this->session->data['token'], 'SSL');
		if ($this->config->get('config_review_quick_edit') == 1) {
			$this->data['view_review'] = $this->url->link('catalog/review_quick', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['view_review'] = $this->url->link('catalog/review', 'token=' . $this->session->data['token'], 'SSL');
		}
		
		$this->load->model('catalog/news');

		$this->data['total_news'] = $this->model_catalog_news->getTotalNews();
		$this->data['view_total_news'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('catalog/news_comment');
		
		$this->data['total_news_comments'] = $this->model_catalog_news_comment->getTotalNewsComments();
		$this->data['total_news_comments_approval'] = $this->model_catalog_news_comment->getTotalNewsCommentsAwaitingApproval();
		if ( $this->data['total_news_comments_approval'] > 0 )
			$this->data['total_news_comments_approval'] = sprintf('<span class="attn">%s</span>', $this->data['total_news_comments_approval']
		);
		$this->data['view_total_news_comments'] = $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('catalog/information');
		
		$this->data['total_informations'] = $this->model_catalog_information->getTotalInformations();
		$this->data['view_total_informations'] = $this->url->link('catalog/information', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('catalog/manufacturer');
		
		$this->data['total_manufacturers'] = $this->model_catalog_manufacturer->getTotalManufacturers();
		$this->data['view_total_manufacturers'] = $this->url->link('catalog/manufacturer', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('sale/return');
		
		$this->data['total_returns'] = $this->model_sale_return->getTotalReturns();
		$this->data['view_total_returns'] = $this->url->link('sale/return', 'token=' . $this->session->data['token'], 'SSL');
				
		$this->data['orders'] = array(); 
		
		$data = array(
			'sort'  => 'o.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => 10
		);
		
		$results = $this->model_sale_order->getOrders($data);
    	
    	foreach ($results as $result) {
			$action = array();

			if ($this->config->get('config_buttons_apply') == 0) {
				$action[] = array(
					'text' => $this->language->get('text_view'),
					'href' => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'], 'SSL')

				);
			} else {
				$action[] = array(
					'text' => $this->language->get('button_view'),
					'href' => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'], 'SSL')
				);
			}
					
			$this->data['orders'][] = array(
				'order_id'   => $result['order_id'],
				'customer'   => $result['customer'],
				'status'     => $result['status'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'total'      => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'action'     => $action
			);
		}

		if ($this->config->get('config_currency_auto')) {
			$this->load->model('localisation/currency');
		
			$this->model_localisation_currency->updateCurrencies();
		}
		
		$this->data['items'] = array(); 
		
		$data = array(
			'sort'  => 'sort_order',
			'order' => 'ASC'
		);
		
		$this->load->model('tool/image');
		
		$this->load->model('tool/control_unit');
		
		$this->language->load('tool/control_unit');
		
		$results = $this->model_tool_control_unit->getControlUnits($data);
		
		foreach ($results as $result) {
		
			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 64, 64);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 64, 64);
			}
			
			$this->data['items'][] = array(
				'control_unit_id'   => $result['control_unit_id'],
				'name'   			=> $result['name'],
				'status'   			=> $result['status'],
				'href' 				=> $this->url->link($result['link'], 'token=' . $this->session->data['token'], 'SSL'),
				'thumb'      	    => $image
			);

		}
		
		$this->template = 'common/home.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	}
	
	public function chart() {
		$this->language->load('common/home');
		
		$data = array();
		
		$data['order'] = array();
		$data['customer'] = array();
		$data['xaxis'] = array();
		
		$data['order']['label'] = $this->language->get('text_order');
		$data['customer']['label'] = $this->language->get('text_customer');
		
		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'month';
		}
		
		switch ($range) {
			case 'day':
				for ($i = 0; $i < 24; $i++) {
					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND (DATE(date_added) = DATE(NOW()) AND HOUR(date_added) = '" . (int)$i . "') GROUP BY HOUR(date_added) ORDER BY date_added ASC");
					
					if ($query->num_rows) {
						$data['order']['data'][]  = array($i, (int)$query->row['total']);
					} else {
						$data['order']['data'][]  = array($i, 0);
					}
					
					$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE DATE(date_added) = DATE(NOW()) AND HOUR(date_added) = '" . (int)$i . "' GROUP BY HOUR(date_added) ORDER BY date_added ASC");
					
					if ($query->num_rows) {
						$data['customer']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['customer']['data'][] = array($i, 0);
					}
			
					$data['xaxis'][] = array($i, date('H', mktime($i, 0, 0, date('n'), date('j'), date('Y'))));
				}					
				break;
			case 'week':
				$date_start = strtotime('-' . date('w') . ' days'); 
				
				for ($i = 0; $i < 7; $i++) {
					$date = date('Y-m-d', $date_start + ($i * 86400));

					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DATE(date_added)");
			
					if ($query->num_rows) {
						$data['order']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['order']['data'][] = array($i, 0);
					}
				
					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "customer` WHERE DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DATE(date_added)");
			
					if ($query->num_rows) {
						$data['customer']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['customer']['data'][] = array($i, 0);
					}
		
					$data['xaxis'][] = array($i, date('D', strtotime($date)));
				}
				
				break;
			default:
			case 'month':
				for ($i = 1; $i <= date('t'); $i++) {
					$date = date('Y') . '-' . date('m') . '-' . $i;
					
					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND (DATE(date_added) = '" . $this->db->escape($date) . "') GROUP BY DAY(date_added)");
					
					if ($query->num_rows) {
						$data['order']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['order']['data'][] = array($i, 0);
					}	
				
					$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE DATE(date_added) = '" . $this->db->escape($date) . "' GROUP BY DAY(date_added)");
			
					if ($query->num_rows) {
						$data['customer']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['customer']['data'][] = array($i, 0);
					}	
					
					$data['xaxis'][] = array($i, date('j', strtotime($date)));
				}
				break;
			case 'year':
				for ($i = 1; $i <= 12; $i++) {
					$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '" . (int)$this->config->get('config_complete_status_id') . "' AND YEAR(date_added) = '" . date('Y') . "' AND MONTH(date_added) = '" . $i . "' GROUP BY MONTH(date_added)");
					
					if ($query->num_rows) {
						$data['order']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['order']['data'][] = array($i, 0);
					}
					
					$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE YEAR(date_added) = '" . date('Y') . "' AND MONTH(date_added) = '" . $i . "' GROUP BY MONTH(date_added)");
					
					if ($query->num_rows) { 
						$data['customer']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$data['customer']['data'][] = array($i, 0);
					}
					
					$data['xaxis'][] = array($i, date('M', mktime(0, 0, 0, $i, 1, date('Y'))));
				}			
				break;	
		} 
		
		$this->response->setOutput(json_encode($data));
	}
	
	public function login() {
		$route = '';
		
		if (isset($this->request->get['route'])) {
			$part = explode('/', $this->request->get['route']);
			
			if (isset($part[0])) {
				$route .= $part[0];
			}
			
			if (isset($part[1])) {
				$route .= '/' . $part[1];
			}
		}
		
		$ignore = array(
			'common/login',
			'common/forgotten',
			'common/reset'
		);	
					
		if (!$this->user->isLogged() && !in_array($route, $ignore)) {
			return $this->forward('common/login');
		}
		
		if (isset($this->request->get['route'])) {
			$ignore = array(
				'common/login',
				'common/logout',
				'common/forgotten',
				'common/reset',
				'error/not_found',
				'error/permission'
			);
						
			$config_ignore = array();
			
			if ($this->config->get('config_token_ignore')) {
				$config_ignore = unserialize($this->config->get('config_token_ignore'));
			}
				
			$ignore = array_merge($ignore, $config_ignore);
						
			if (!in_array($route, $ignore) && (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token']))) {
				return $this->forward('common/login');
			}
		} else {
			if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
				return $this->forward('common/login');
			}
		}
	}
	
	public function permission() {
		if (isset($this->request->get['route'])) {
			$route = '';
			
			$part = explode('/', $this->request->get['route']);
			
			if (isset($part[0])) {
				$route .= $part[0];
			}
			
			if (isset($part[1])) {
				$route .= '/' . $part[1];
			}
			
			$ignore = array(
				'common/home',
				'common/login',
				'common/logout',
				'common/forgotten',
				'common/reset',
				'error/not_found',
				'error/permission'		
			);			
						
			if (!in_array($route, $ignore) && !$this->user->hasPermission('access', $route)) {
				return $this->forward('error/permission');
			}
		}

	}
	
	private function delete($directory_name) {         
		if(file_exists($directory_name)) {
			if(is_dir($directory_name)) {
				$directory=opendir($directory_name);
				while($file_name=readdir($directory)) {
					if($file_name!="." && $file_name!="..") {
						$file=$directory_name."/".$file_name;
						$this->delete($file); 
					}
				}
				closedir($directory);  
				rmdir($directory_name);
            } else {
				@unlink($directory_name);
			}			
		}
	}
}
?>