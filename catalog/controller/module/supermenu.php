<?php  
class ControllerModulesupermenu extends Controller {
	protected function index($setting) {
	
		$this->load->model('catalog/category');
	
		$this->load->model('tool/image'); 
		
		$this->load->model('catalog/information');
		
		$this->load->model('catalog/manufacturer');
		
		$this->language->load('common/footer');
		
	    $this->data['mitems'] = array();
		
		$items = $this->config->get('supermenu_item');
		
		$this->data['supermenu_settings_status'] = $this->config->get('supermenu_settings_status');
		
		$this->data['supermenu_settings'] = $this->config->get('supermenu_settings');
		
		if ($items) {
		
		 foreach ($items as $item) {
		 
		  $item_name = '';
		 
		  if ($item['type'] == 'cat') {
		 
           $katid = $item['category_id']; 
		 
           $kat_info = $this->model_catalog_category->getCategory($katid);	
		   
		    if ($kat_info) {
			
		     $item_name = $kat_info['name'];
			 
			 $item_view = $item['view'];
			 
			 $item_id = $kat_info['category_id'];
			 
			 $item_url = $this->url->link('product/category', 'path=' . $item_id);
			 
			 $firstkids_data = array();
			
			 $firstkids = $this->model_catalog_category->getCategories($item_id);
			 
			 foreach ($firstkids as $firstkid) {
			 
			  $secondkids_data = array();
			  
			  if ($firstkid['image']) {
				$image = $this->model_tool_image->resize($firstkid['image'], $this->config->get('supermenu_image_width'), $this->config->get('supermenu_image_height'));
			  } else {
				$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('supermenu_image_width'), $this->config->get('supermenu_image_height'));
			  }
			
			  $secondkids = $this->model_catalog_category->getCategories($firstkid['category_id']);
			  
			  foreach ($secondkids as $secondkid) {
			  
			   $secondkids_data[] = array(
						'category_id' => $secondkid['category_id'],
						'name'        => $secondkid['name'],
						'href'        => $this->url->link('product/category', 'path=' . $item_id . '_' . $firstkid['category_id'] . '_' . $secondkid['category_id'])	
					);	
			  }
			   
			  $firstkids_data[] = array(
						'category_id' => $firstkid['category_id'],
						'name'        => $firstkid['name'],
						'thumb'       => $image,
						'gchildren'   => $secondkids_data,
						'href'        => $this->url->link('product/category', 'path=' . $item_id . '_' . $firstkid['category_id'])	
					);						
			 }
			 
			 if ($kat_info['image']) {
				$item_image = $this->model_tool_image->resize($kat_info['image'], 100, 100);
			 } else {
				$item_image = $this->model_tool_image->resize('no_image.jpg', 100, 100);
			 }
		   
		   
		    }
		
		  } elseif ($item['type'] == 'more') {
		     
			 $itm = $this->config->get('supermenu_more_title');
			 
			 $item_name = $itm[$this->config->get('config_language_id')];
			 
			 $item_view = $item['view'];
			 
			 $item_id = '';
			 
			 $item_url = '';
			 
			 $firstkids_data = array();
			
			 $firstkids =  $this->config->get('supermenu_more');
			 
			 foreach ($firstkids as $kid) {
			 
			 $firstkid = $this->model_catalog_category->getCategory($kid);
			 
			  $secondkids_data = array();
			
			  if ($firstkid['image']) {
				$image = $this->model_tool_image->resize($firstkid['image'], $this->config->get('supermenu_image_width'), $this->config->get('supermenu_image_height'));
              } else {
				$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('supermenu_image_width'), $this->config->get('supermenu_image_height'));
			  }
			
			  $secondkids = $this->model_catalog_category->getCategories($firstkid['category_id']);
			  
			  foreach ($secondkids as $secondkid) {
			  
			   $secondkids_data[] = array(
						'category_id' => $secondkid['category_id'],
						'name'        => $secondkid['name'],
						'href'        => $this->url->link('product/category', 'path=' . $item_id . '_' . $firstkid['category_id'] . '_' . $secondkid['category_id'])	
					);	
			  }
			   
			  $firstkids_data[] = array(
						'category_id' => $firstkid['category_id'],
						'name'        => $firstkid['name'],
						'thumb'       => $image,
						'gchildren'   => $secondkids_data,
						'href'        => $this->url->link('product/category', 'path=' . $item_id . '_' . $firstkid['category_id'])	
					);						
			 }
			 
			 $item_image = false;
		   
		
		  } elseif ($item['type'] == 'infol') {
		  
		   $info_id = $item['information_id']; 
		   
		   $item_view = '';
		 
           $info_info = $this->model_catalog_information->getInformation($info_id);
		   
		   if ($info_info) {
		    
			 $item_name = $info_info['title'];
			 
			 $item_id = $info_info['information_id'];
			 
			 $item_url = $this->url->link('information/information', 'information_id=' . $item_id);
			 
			 $firstkids_data = array();
			 
			 $item_image = false;
			
		   }
			
			
		  } elseif ($item['type'] == 'infod') {
		  
		     $item_name = $this->language->get('text_information');
			 
			 $item_view = '';
			 
			 $item_id = '';
			 
			 $item_url = '';
			 
			 $firstkids_data = array();
			 
			 foreach ($this->model_catalog_information->getInformations() as $infolinks) {
			 
				$firstkids_data[] = array(
						'category_id' => false,
						'name'        => $infolinks['title'] . '<br /><span style=" font-weight: normal; color: #999; font-size: 11px;">' . substr(strip_tags(html_entity_decode($infolinks['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..</span>',
						'gchildren'   => false,
						'href'        => $this->url->link('information/information', 'information_id=' . $infolinks['information_id'])
					);
					
    	     }
			 
			 $item_image = false;
		
		  } elseif ($item['type'] == 'mand') {
		  
		     $item_name = $this->language->get('text_manufacturer');
			 
			 $item_view = $item['view'];
			 
			 $item_id = '';
			 
			 $item_url = '';
			 
			 $firstkids_data = array();
			 
			 foreach ($this->model_catalog_manufacturer->getManufacturers() as $brandlinks) {
			 
			     if ($brandlinks['image']) {
				  $image = $this->model_tool_image->resize($brandlinks['image'],  $this->config->get('supermenu_image_width'), $this->config->get('supermenu_image_height'));
                 } else {
			 	  $image = $this->model_tool_image->resize('no_image.jpg',  $this->config->get('supermenu_image_width'), $this->config->get('supermenu_image_height'));
			     }
			  
				$firstkids_data[] = array(
						'category_id' => false,
						'name'        => $brandlinks['name'],
						'thumb'       => $image,
						'gchildren'   => false,
						'href'        => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $brandlinks['manufacturer_id'])
					);
					
    	     }
			 
			 $item_image = false;
			 
			 $item_description = false;
		
		  } else {
		  
		     $item_name = $item['customname'][$this->config->get('config_language_id')];
			 
			 $item_view = '';
			 
			 $item_id = '';
			 
			 $item_url = $item['customurl'][$this->config->get('config_language_id')];
			 
			 $firstkids_data = array();
			 
			 $item_image = false;
		  
		  }
		  
		  $item_addurl = $item['addurl'][$this->config->get('config_language_id')];
		  
		  $item_add = $item['image'][$this->config->get('config_language_id')];
		  
		  if ($item['cchtml']) {
		   
		   $allareas = $this->config->get('supermenu_htmlarea');
		   if (isset($allareas[$this->config->get('config_language_id')][$item['cchtml']])) {
		    $cchtml = html_entity_decode($allareas[$this->config->get('config_language_id')][$item['cchtml']], ENT_QUOTES, 'UTF-8');
		   } else {
		    $cchtml = '';
		   }
		  } else {
		  
		   $cchtml = '';
		  
		  }
		  
		  $dwidth = '';
	      $ddwidth = '';
		  if ($item['dwidth']) {
		    $dwidth = $item['dwidth'];
			$ddwidth = $dwidth - 205;
		  }
		  
		  if ($item_name) {
		  
		  $this->data['mitems'][] = array(
				'name'        => $item_name,
				'id'          => $item_id,
				'children'    => $firstkids_data,
				'image'       => $item_image,
				'view'        => $item_view,
				'add'         => $item_add,
				'addurl'      => $item_addurl,
				'href'        => $item_url,
				'tlcolor'     => $item['tlcolor'],
				'tlstyle'     => $item['tlstyle'],
				'chtml'       => $item['chtml'],
				'dwidth'      => $dwidth,
				'ddwidth'     => $ddwidth,
				'iwidth'      => $item['iwidth'],
				'cchtml'      => $cchtml
			);
			
		  }	
		  
		 }
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/supermenu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/supermenu.tpl';
		} else {
			$this->template = 'default/template/module/supermenu.tpl';
		}
		
		$this->render();
  	}
}
?>