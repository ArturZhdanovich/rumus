<?php
class ControllerModuleVKExport extends Controller {
	private $error = array(); 
    private $db_version = '4.7.5';
    
    public function install() {
        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('vk_export', array(
            'vk_export_mode' => 2,
            'vk_export_user_id' => '',
            'vk_export_access_token' => '',
            'vk_export_group_id' => '',
            'vk_export_mode_desc' => 1,
            'vk_export_desc_tpl' => "{name} {model}\n{price}\n{link}",
            'vk_export_wallpost_tpl' => "{name} {model}\n{price}\n{link}",
            'vk_export_mode_comment' => 1,
            'vk_export_comment_tpl' => "{desc}",
            'vk_export_image_mode' => 1,
            'vk_export_album_name_mode' => 1,
            'vk_export_group_wallpost_from' => 2,
            'vk_export_wallpost_photos_count' => 1,
            'vk_export_cron_user' => '',
            'vk_export_cron_pass' => '',
            'vk_export_autoexport' => 0,
            'vk_export_debug_mode' => 0,
            'vk_export_products_per_page' => 20,
            'vk_export_only_instock' => 1,
            'vk_export_only_enabled' => 1,
            'vk_export_num_products_for_cron' => 20,
            'vk_export_http_catalog' => '',
            'vk_export_cron_wallpost_max' => 2,
            'vk_export_attributes_tpl' => '{name}: {value}',
            'vk_export_attributes_delimeter' => ',',
            'vk_export_vkcc' => 0,
            'vk_export_autoexport_category' => '',
            'vk_export_autoexport_category_wall' => '',
            'vk_export_group_photo_comment_from' => 1,
            'vk_export_user_replacements_keys' => '',
            'vk_export_user_replacements_values' => '',
            'vk_export_db_version' => '4.7.5',
            'vk_export_wall_unique' => 0,
            'vk_export_album_only' => 1,
            'vk_export_photos_count' => 1,
            'vk_export_cron_delete_out_of_stock' => 0,
            'vk_export_cron_delete_disabled' => 0,
            'vk_export_wall_export_services' => ''
        ));
        
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "vk_export_album` (
                              `category_id` int(11) NOT NULL, 
                              `vk_album_id` varchar(32) NOT NULL, 
                              `mode` ENUM('user','group') NOT NULL, 
                              PRIMARY KEY (`category_id`,`vk_album_id`,`mode`)
                            ) ENGINE=MyISAM  DEFAULT CHARSET=utf8");     
                           
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "vk_export_photo` (
                              `product_id` int(11) NOT NULL, 
                              `vk_photo_id` varchar(32) NOT NULL,
                              `category_id` int(11) NOT NULL,
                              `date` DATETIME NOT NULL,
                              `location` ENUM( 'albums', 'wall' ) NOT NULL,
                              PRIMARY KEY (`product_id`,`vk_photo_id`)
                            ) ENGINE=MyISAM DEFAULT CHARSET=utf8");                                                         
    }
	
    public function index() {   
		$this->load->language('module/vk_export');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
        
        $local_db_version = str_replace('.', '', $this->config->get('vk_export_db_version'));
        $db_version = str_replace('.', '', $this->db_version);
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->post['vk_export_mode_desc'])) {
                $this->request->post['vk_export_mode_desc'] = 0;
            }
            if (!isset($this->request->post['vk_export_mode_comment'])) {
                $this->request->post['vk_export_mode_comment'] = 0;
            }
            if (!isset($this->request->post['vk_export_autoexport'])) {
                $this->request->post['vk_export_autoexport'] = 0;
            }
            if (!isset($this->request->post['vk_export_only_instock'])) {
                $this->request->post['vk_export_only_instock'] = 0;
            }
            if (!isset($this->request->post['vk_export_only_enabled'])) {
                $this->request->post['vk_export_only_enabled'] = 0;
            }
            if (!isset($this->request->post['vk_export_vkcc'])) {
                $this->request->post['vk_export_vkcc'] = 0;
            }
            if (!isset($this->request->post['vk_export_wall_only_specials'])) {
                $this->request->post['vk_export_wall_only_specials'] = 0;
            }
            if (!isset($this->request->post['vk_export_albums_only_specials'])) {
                $this->request->post['vk_export_albums_only_specials'] = 0;
            }
            if (!isset($this->request->post['vk_export_wall_unique'])) {
                $this->request->post['vk_export_wall_unique'] = 0;
            }
            if (!isset($this->request->post['vk_export_column_model'])) {
                $this->request->post['vk_export_column_model'] = 0;
            }
            if (!isset($this->request->post['vk_export_column_price'])) {
                $this->request->post['vk_export_column_price'] = 0;
            }
            if (!isset($this->request->post['vk_export_column_quantity'])) {
                $this->request->post['vk_export_column_quantity'] = 0;
            }
            if (!isset($this->request->post['vk_export_column_status'])) {
                $this->request->post['vk_export_column_status'] = 0;
            }
            if (!isset($this->request->post['vk_export_column_date_added'])) {
                $this->request->post['vk_export_column_date_added'] = 0;
            }
            if (!isset($this->request->post['vk_export_album_only'])) {
                $this->request->post['vk_export_album_only'] = 0;
            }
            if (!isset($this->request->post['vk_export_cron_delete_out_of_stock'])) {
                $this->request->post['vk_export_cron_delete_out_of_stock'] = 0;
            }
            if (!isset($this->request->post['vk_export_cron_delete_disabled'])) {
                $this->request->post['vk_export_cron_delete_disabled'] = 0;
            }
            if (!trim($this->request->post['vk_export_access_token'])) {
               $this->request->post['vk_export_access_token'] = $this->config->get('vk_export_access_token');
            }
            else {
				if (preg_match('/access_token=(.*?)&/', $this->request->post['vk_export_access_token'], $m)) {
					$this->request->post['vk_export_access_token'] = $m[1];
				}
			}
            
            if (!trim($this->request->post['vk_export_cron_pass'])) {
               $this->request->post['vk_export_cron_pass'] = $this->config->get('vk_export_cron_pass');
            }
            
            $this->request->post['vk_export_db_version'] = $this->config->get('vk_export_db_version');
            // обновление БД
            if (!$local_db_version || $local_db_version < $db_version) {
                $this->db->query("ALTER TABLE `" . DB_PREFIX . "vk_export_photo` ADD `location` ENUM( 'albums', 'wall' ) NOT NULL");
                $this->request->post['vk_export_db_version'] = $this->db_version;
            }
            
            $this->model_setting_setting->editSetting('vk_export', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
            // удалить куки
            if (file_exists(DIR_SYSTEM . 'cache/.vkPhotoLoaderCookie')) {
                unlink(DIR_SYSTEM . 'cache/.vkPhotoLoaderCookie');
            }
            // удалить лог
            if (!$this->request->post['vk_export_debug_mode']) {
                if (file_exists(DIR_SYSTEM . 'logs/vkExportLog.zip')) {
                    unlink(DIR_SYSTEM . 'logs/vkExportLog.zip');
                }
                $files = glob(DIR_SYSTEM . 'logs/.vkExportLog_*');
                if ($files) {
                    foreach ($files as $file) {
                        unlink($file);
                    }
                }
            }
            
            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));

		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
        
        if (isset($this->error['warning_geo'])) {
			$this->data['error_warning_geo'] = $this->error['warning_geo'];
		} else {
			$this->data['error_warning_geo'] = '';
		}
			
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/vk_export', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
        $this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['entry_export_mode'] = $this->language->get('entry_export_mode');
        $this->data['text_export_mode_user'] = $this->language->get('text_export_mode_user');
        $this->data['text_export_mode_group'] = $this->language->get('text_export_mode_group');
        $this->data['text_export_mode_both'] = $this->language->get('text_export_mode_both');
        $this->data['entry_user_id'] = $this->language->get('entry_user_id');
        $this->data['text_user_id_example'] = $this->language->get('text_user_id_example');
        $this->data['entry_group_id'] = $this->language->get('entry_group_id');
        $this->data['text_group_owner'] = $this->language->get('text_group_owner');
        $this->data['entry_desc_tpl'] = $this->language->get('entry_desc_tpl');
        $this->data['text_desc_tpl'] = $this->language->get('text_desc_tpl');
        $this->data['entry_mode_desc'] = $this->language->get('entry_mode_desc');
        $this->data['entry_mode_comment'] = $this->language->get('entry_mode_comment');
        $this->data['entry_comment_tpl'] = $this->language->get('entry_comment_tpl');
        $this->data['entry_phone_number'] = $this->language->get('entry_phone_number');
        $this->data['text_phone_number'] = $this->language->get('text_phone_number');
        $this->data['entry_image_mode'] = $this->language->get('entry_image_mode');
        $this->data['text_image_orig'] = $this->language->get('text_image_orig');
        $this->data['text_image_resize'] = $this->language->get('text_image_resize');
        $this->data['entry_album_name_mode'] = $this->language->get('entry_album_name_mode');
        $this->data['entry_wallpost_tpl'] = $this->language->get('entry_wallpost_tpl');
        $this->data['text_album_name_orig'] = $this->language->get('text_album_name_orig');
        $this->data['text_album_name_path'] = sprintf($this->language->get('text_album_name_path'), $this->language->get('text_separator'));
        $this->data['entry_group_wallpost_from'] = $this->language->get('entry_group_wallpost_from');
        $this->data['text_wallpost_from_group'] = $this->language->get('text_wallpost_from_group');
        $this->data['text_wallpost_from_user'] = $this->language->get('text_wallpost_from_user');
        $this->data['entry_wallpost_photos_count'] = $this->language->get('entry_wallpost_photos_count');
        $this->data['entry_photos_count'] = $this->language->get('entry_photos_count');
        $this->data['text_all'] = $this->language->get('text_all');
        $this->data['entry_turn_on_autoexport'] = $this->language->get('entry_turn_on_autoexport');
        $this->data['text_cron_user_help'] = $this->language->get('text_cron_user_help');
        $this->data['entry_cron_user'] = $this->language->get('entry_cron_user');
        $this->data['entry_cron_pass'] = $this->language->get('entry_cron_pass');
        $this->data['entry_debug_mode'] = $this->language->get('entry_debug_mode');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['entry_products_per_page'] = $this->language->get('entry_products_per_page');
        $this->data['entry_export_only_instock'] = $this->language->get('entry_export_only_instock');
        $this->data['entry_export_only_enabled'] = $this->language->get('entry_export_only_enabled');
        $this->data['entry_num_products_for_cron'] = $this->language->get('entry_num_products_for_cron');
        $this->data['entry_http_catalog'] = $this->language->get('entry_http_catalog');
        $this->data['text_desc_http_catalog'] = $this->language->get('text_desc_http_catalog');
        $this->data['entry_num_wallpost_for_cron'] = $this->language->get('entry_num_wallpost_for_cron');
        $this->data['entry_attributes_tpl'] = $this->language->get('entry_attributes_tpl');
        $this->data['text_attributes_tpl'] = $this->language->get('text_attributes_tpl');
        $this->data['entry_attributes_delimeter'] = $this->language->get('entry_attributes_delimeter');
        $this->data['entry_vkcc'] = $this->language->get('entry_vkcc');
        $this->data['text_vkcc_help'] = $this->language->get('text_vkcc_help');
        $this->data['entry_category_autoexport'] = $this->language->get('entry_category_autoexport');
        $this->data['entry_category_autoexport_wall'] = $this->language->get('entry_category_autoexport_wall');
        $this->data['text_select_all'] = $this->language->get('text_select_all');
        $this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
        $this->data['text_desc_tpl_wall'] = $this->language->get('text_desc_tpl_wall');
        $this->data['entry_group_photo_comment_from'] = $this->language->get('entry_group_photo_comment_from');
        $this->data['entry_user_replacements'] = $this->language->get('entry_user_replacements');
        $this->data['text_search'] = $this->language->get('text_search');
        $this->data['text_replacement'] = $this->language->get('text_replacement');
        $this->data['text_replacements_desc'] = $this->language->get('text_replacements_desc');
        $this->data['entry_export_wall_only_specials'] = $this->language->get('entry_export_wall_only_specials');
        $this->data['entry_export_albums_only_specials'] = $this->language->get('entry_export_albums_only_specials');
        $this->data['entry_export_wall_unique'] = $this->language->get('entry_export_wall_unique');
        $this->data['entry_colums'] = $this->language->get('entry_colums');
        $this->data['text_model'] = $this->language->get('text_model');
        $this->data['text_price'] = $this->language->get('text_price');
        $this->data['text_quantity'] = $this->language->get('text_quantity');
        $this->data['text_status'] = $this->language->get('text_status');
        $this->data['text_date_added'] = $this->language->get('text_date_added');
        $this->data['entry_album_only'] = $this->language->get('entry_album_only');
        $this->data['entry_delete_out_of_stock'] = $this->language->get('entry_delete_out_of_stock');
        $this->data['entry_delete_disabled'] = $this->language->get('entry_delete_disabled');
        $this->data['entry_wall_export_services'] = $this->language->get('entry_wall_export_services');
        $this->data['entry_wall_export_services_help'] = $this->language->get('entry_wall_export_services_help');
        $this->data['entry_photos_count_help'] = $this->language->get('entry_photos_count_help');
        $this->data['text_account_step1'] = $this->language->get('text_account_step1');
        $this->data['text_account_step2'] = $this->language->get('text_account_step2');
        $this->data['text_account_step3'] = $this->language->get('text_account_step3');
        $this->data['text_account_step4'] = $this->language->get('text_account_step4');
        $this->data['text_account_step5'] = $this->language->get('text_account_step5');
        $this->data['text_account_step6'] = $this->language->get('text_account_step6');
        $this->data['text_account_step7'] = $this->language->get('text_account_step7');
        $this->data['text_account_setup'] = $this->language->get('text_account_setup');
        
		$this->data['action'] = $this->url->link('module/vk_export', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['check_app_security'] = $this->url->link('extension/vk_export/check_app_security', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['check_phone_number'] = $this->url->link('extension/vk_export/check_phone_number', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
        
		if (!$local_db_version || $local_db_version < $db_version) {
            $this->data['show_db_update'] = true;
        }
        else {
            $this->data['show_db_update'] = false;
        }
        
        $this->load->model('setting/extension');

        
        if (isset($this->request->post['vk_export_mode'])) {
			$this->data['vk_export_mode'] = $this->request->post['vk_export_mode'];
		} else {
            $this->data['vk_export_mode'] = $this->config->get('vk_export_mode');
		}
        
        if (isset($this->request->post['vk_export_user_id'])) {
			$this->data['vk_export_user_id'] = $this->request->post['vk_export_user_id'];
		} else {
			$this->data['vk_export_user_id'] = $this->config->get('vk_export_user_id');
		}
        
        if (isset($this->request->post['vk_export_group_id'])) {
			$this->data['vk_export_group_id'] = $this->request->post['vk_export_group_id'];
		} else {
			$this->data['vk_export_group_id'] = $this->config->get('vk_export_group_id');
		}
        
        if (isset($this->request->post['vk_export_mode_desc'])) {
			$this->data['vk_export_mode_desc'] = $this->request->post['vk_export_mode_desc'];
		} else {
            $this->data['vk_export_mode_desc'] = $this->config->get('vk_export_mode_desc');
		}
        
        if (isset($this->request->post['vk_export_desc_tpl'])) {
			$this->data['vk_export_desc_tpl'] = $this->request->post['vk_export_desc_tpl'];
		} else {
			$this->data['vk_export_desc_tpl'] = $this->config->get('vk_export_desc_tpl');
		}
        
        if (isset($this->request->post['vk_export_mode_comment'])) {
			$this->data['vk_export_mode_comment'] = $this->request->post['vk_export_mode_comment'];
		} else {
            $this->data['vk_export_mode_comment'] = $this->config->get('vk_export_mode_comment');
		}
        
        if (isset($this->request->post['vk_export_comment_tpl'])) {
			$this->data['vk_export_comment_tpl'] = $this->request->post['vk_export_comment_tpl'];
		} else {
			$this->data['vk_export_comment_tpl'] = $this->config->get('vk_export_comment_tpl');
		}
        
        if (isset($this->request->post['vk_export_image_mode'])) {
			$this->data['vk_export_image_mode'] = $this->request->post['vk_export_image_mode'];
		} else {
			$this->data['vk_export_image_mode'] = $this->config->get('vk_export_image_mode');
		}
        
        if (isset($this->request->post['vk_export_album_name_mode'])) {
			$this->data['vk_export_album_name_mode'] = $this->request->post['vk_export_album_name_mode'];
		} else {
			$this->data['vk_export_album_name_mode'] = $this->config->get('vk_export_album_name_mode');
		}
        
        if (isset($this->request->post['vk_export_wallpost_tpl'])) {
			$this->data['vk_export_wallpost_tpl'] = $this->request->post['vk_export_wallpost_tpl'];
		} else {
			$this->data['vk_export_wallpost_tpl'] = $this->config->get('vk_export_wallpost_tpl');
		}
        
        if (isset($this->request->post['vk_export_group_wallpost_from'])) {
			$this->data['vk_export_group_wallpost_from'] = $this->request->post['vk_export_group_wallpost_from'];
		} else {
			$this->data['vk_export_group_wallpost_from'] = $this->config->get('vk_export_group_wallpost_from');
		}
        
        if (isset($this->request->post['vk_export_wallpost_photos_count'])) {
			$this->data['vk_export_wallpost_photos_count'] = $this->request->post['vk_export_wallpost_photos_count'];
		} else {
			$this->data['vk_export_wallpost_photos_count'] = $this->config->get('vk_export_wallpost_photos_count');
		}
        
        if (isset($this->request->post['vk_export_autoexport'])) {
			$this->data['vk_export_autoexport'] = $this->request->post['vk_export_autoexport'];
		} else {
			$this->data['vk_export_autoexport'] = $this->config->get('vk_export_autoexport');
		}
        
        if (isset($this->request->post['vk_export_cron_user'])) {
			$this->data['vk_export_cron_user'] = $this->request->post['vk_export_cron_user'];
		} else {
			$this->data['vk_export_cron_user'] = $this->config->get('vk_export_cron_user');
		}
        
        if (isset($this->request->post['vk_export_debug_mode'])) {
			$this->data['vk_export_debug_mode'] = $this->request->post['vk_export_debug_mode'];
		} else {
			$this->data['vk_export_debug_mode'] = $this->config->get('vk_export_debug_mode');
		}
        
        if (isset($this->request->post['vk_export_products_per_page'])) {
			$this->data['vk_export_products_per_page'] = $this->request->post['vk_export_products_per_page'];
		} else {
			$this->data['vk_export_products_per_page'] = $this->config->get('vk_export_products_per_page');
		}
        
        if (isset($this->request->post['vk_export_only_instock'])) {
			$this->data['vk_export_only_instock'] = $this->request->post['vk_export_only_instock'];
		} else {
			$this->data['vk_export_only_instock'] = $this->config->get('vk_export_only_instock');
		}
        
        if (isset($this->request->post['vk_export_only_new'])) {
			$this->data['vk_export_only_new'] = $this->request->post['vk_export_only_new'];
		} else {
			$this->data['vk_export_only_new'] = $this->config->get('vk_export_only_new');
		}
        
        if (isset($this->request->post['vk_export_only_enabled'])) {
			$this->data['vk_export_only_enabled'] = $this->request->post['vk_export_only_enabled'];
		} else {
			$this->data['vk_export_only_enabled'] = $this->config->get('vk_export_only_enabled');
		}
        
        if (isset($this->request->post['vk_export_num_products_for_cron'])) {
			$this->data['vk_export_num_products_for_cron'] = $this->request->post['vk_export_num_products_for_cron'];
		} else {
			$this->data['vk_export_num_products_for_cron'] = $this->config->get('vk_export_num_products_for_cron');
		}
        
        if (isset($this->request->post['vk_export_http_catalog'])) {
			$this->data['vk_export_http_catalog'] = $this->request->post['vk_export_http_catalog'];
		} else {
			$this->data['vk_export_http_catalog'] = $this->config->get('vk_export_http_catalog');
		}
        
        if (isset($this->request->post['vk_export_cron_wallpost_max'])) {
			$this->data['vk_export_cron_wallpost_max'] = $this->request->post['vk_export_cron_wallpost_max'];
		} else {
			$this->data['vk_export_cron_wallpost_max'] = $this->config->get('vk_export_cron_wallpost_max');
		}
        
        if (isset($this->request->post['vk_export_attributes_tpl'])) {
			$this->data['vk_export_attributes_tpl'] = $this->request->post['vk_export_attributes_tpl'];
		} else {
			$this->data['vk_export_attributes_tpl'] = $this->config->get('vk_export_attributes_tpl');
		}
        
        if (isset($this->request->post['vk_export_attributes_delimeter'])) {
			$this->data['vk_export_attributes_delimeter'] = $this->request->post['vk_export_attributes_delimeter'];
		} else {
			$this->data['vk_export_attributes_delimeter'] = $this->config->get('vk_export_attributes_delimeter');
		}
        
        if (isset($this->request->post['vk_export_vkcc'])) {
			$this->data['vk_export_vkcc'] = $this->request->post['vk_export_vkcc'];
		} else {
            $this->data['vk_export_vkcc'] = $this->config->get('vk_export_vkcc');
		}
        
        if (isset($this->request->post['vk_export_albums_only_specials'])) {
			$this->data['vk_export_albums_only_specials'] = $this->request->post['vk_export_albums_only_specials'];
		} else {
            $this->data['vk_export_albums_only_specials'] = $this->config->get('vk_export_albums_only_specials');
		}
        
        if (isset($this->request->post['vk_export_wall_only_specials'])) {
			$this->data['vk_export_wall_only_specials'] = $this->request->post['vk_export_wall_only_specials'];
		} else {
            $this->data['vk_export_wall_only_specials'] = $this->config->get('vk_export_wall_only_specials');
		}
        
        if (isset($this->request->post['vk_export_group_photo_comment_from'])) {
			$this->data['vk_export_group_photo_comment_from'] = $this->request->post['vk_export_group_photo_comment_from'];
		} else {
            $this->data['vk_export_group_photo_comment_from'] = $this->config->get('vk_export_group_photo_comment_from');
		}
        
        if (isset($this->request->post['vk_export_user_replacements_keys'])) {
			$this->data['vk_export_user_replacements_keys'] = $this->request->post['vk_export_user_replacements_keys'];
		} else {
            $this->data['vk_export_user_replacements_keys'] = $this->config->get('vk_export_user_replacements_keys');
		}
        
        if (isset($this->request->post['vk_export_user_replacements_values'])) {
			$this->data['vk_export_user_replacements_values'] = $this->request->post['vk_export_user_replacements_values'];
		} else {
            $this->data['vk_export_user_replacements_values'] = $this->config->get('vk_export_user_replacements_values');
		}
        
        if (isset($this->request->post['vk_export_wall_unique'])) {
			$this->data['vk_export_wall_unique'] = $this->request->post['vk_export_wall_unique'];
		} else {
            $this->data['vk_export_wall_unique'] = $this->config->get('vk_export_wall_unique');
		}
        
        if (isset($this->request->post['vk_export_column_model'])) {
			$this->data['vk_export_column_model'] = $this->request->post['vk_export_column_model'];
		} else {
            $this->data['vk_export_column_model'] = $this->config->get('vk_export_column_model');
		}
        
        if (isset($this->request->post['vk_export_column_price'])) {
			$this->data['vk_export_column_price'] = $this->request->post['vk_export_column_price'];
		} else {
            $this->data['vk_export_column_price'] = $this->config->get('vk_export_column_price');
		}
        
        if (isset($this->request->post['vk_export_column_quantity'])) {
			$this->data['vk_export_column_quantity'] = $this->request->post['vk_export_column_quantity'];
		} else {
            $this->data['vk_export_column_quantity'] = $this->config->get('vk_export_column_quantity');
		}
        
        if (isset($this->request->post['vk_export_column_status'])) {
			$this->data['vk_export_column_status'] = $this->request->post['vk_export_column_status'];
		} else {
            $this->data['vk_export_column_status'] = $this->config->get('vk_export_column_status');
		}
        
        if (isset($this->request->post['vk_export_column_date_added'])) {
			$this->data['vk_export_column_date_added'] = $this->request->post['vk_export_column_date_added'];
		} else {
            $this->data['vk_export_column_date_added'] = $this->config->get('vk_export_column_date_added');
		}
        
        if (isset($this->request->post['vk_export_album_only'])) {
			$this->data['vk_export_album_only'] = $this->request->post['vk_export_album_only'];
		} else {
            $this->data['vk_export_album_only'] = $this->config->get('vk_export_album_only');
		}
        
        if (isset($this->request->post['vk_export_photos_count'])) {
			$this->data['vk_export_photos_count'] = $this->request->post['vk_export_photos_count'];
		} else {
            $this->data['vk_export_photos_count'] = $this->config->get('vk_export_photos_count');
		}
        
        if (isset($this->request->post['vk_export_cron_delete_out_of_stock'])) {
			$this->data['vk_export_cron_delete_out_of_stock'] = $this->request->post['vk_export_cron_delete_out_of_stock'];
		} else {
            $this->data['vk_export_cron_delete_out_of_stock'] = $this->config->get('vk_export_cron_delete_out_of_stock');
		}
        
        if (isset($this->request->post['vk_export_cron_delete_disabled'])) {
			$this->data['vk_export_cron_delete_disabled'] = $this->request->post['vk_export_cron_delete_disabled'];
		} else {
            $this->data['vk_export_cron_delete_disabled'] = $this->config->get('vk_export_cron_delete_disabled');
		}
        
        if (isset($this->request->post['vk_export_wall_export_services'])) {
			$this->data['vk_export_wall_export_services'] = $this->request->post['vk_export_wall_export_services'];
		} else {
            $this->data['vk_export_wall_export_services'] = $this->config->get('vk_export_wall_export_services');
		}
        
        // категории 
        $this->load->model('catalog/vk_export');
        
        $categories = $this->model_catalog_vk_export->getAllCategories();

		$this->data['categories'] = $this->getAllCategories($categories);
        
        // категории автоэкспорта в альбомы
        if (isset($this->request->post['vk_export_autoexport_category'])) {
			$this->data['vk_export_autoexport_category'] = $this->request->post['vk_export_autoexport_category'];
		} else {
			$this->data['vk_export_autoexport_category'] = $this->config->get('vk_export_autoexport_category');
            if (!is_array($this->data['vk_export_autoexport_category'])) {
                $this->data['vk_export_autoexport_category'] = array();
            }
		}
		
		// категории автоэкспорта на стену
        if (isset($this->request->post['vk_export_autoexport_category_wall'])) {
			$this->data['vk_export_autoexport_category_wall'] = $this->request->post['vk_export_autoexport_category_wall'];
		} else {
			$this->data['vk_export_autoexport_category_wall'] = $this->config->get('vk_export_autoexport_category_wall');
            if (!is_array($this->data['vk_export_autoexport_category_wall'])) {
                $this->data['vk_export_autoexport_category_wall'] = array();
            }
		}	
                
		$this->template = 'module/vk_export.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
    
    private function getAllCategories($categories, $parent_id = 0, $parent_name = '') {
		$output = array();

		if (array_key_exists($parent_id, $categories)) {
			if ($parent_name != '') {
				$parent_name .= $this->language->get('text_separator');
			}

			foreach ($categories[$parent_id] as $category) {
				$output[$category['category_id']] = array(
					'category_id' => $category['category_id'],
					'name'        => $parent_name . $category['name']
				);

				$output += $this->getAllCategories($categories, $category['category_id'], $parent_name . $category['name']);
			}
		}

		return $output;
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/vk_export')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
			
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	
}
?>
