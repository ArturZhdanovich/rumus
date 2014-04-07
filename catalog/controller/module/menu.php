<?php  
class ControllerModuleMenu extends Controller {
	protected function index() {
		$this->language->load('module/menu');
		
		// News
		$this->load->model('catalog/news');
		$this->load->model('catalog/news_category');
		
		$this->data['all_news_top_menu'] = $this->config->get('config_news_top_menu');
		
		$this->data['text_all_news'] = sprintf($this->language->get('text_all_news'),  $this->config->get('config_news_count') ? ' (' . $this->model_catalog_news->getTotalNews() . ')' : '');
		$this->data['all_news'] = $this->url->link('news/all_news', '', 'SSL');
		
		$this->data['news_categories'] = array();
					
		$news_categories = $this->model_catalog_news_category->getNewsCategories(0);
		
		foreach ($news_categories as $news_category) {
			if ($news_category['top']) {
				// Level 2
				$children_data = array();
				
				$children = $this->model_catalog_news_category->getNewsCategories($news_category['news_category_id']);
				
				foreach ($children as $child) {
					$data = array(
						'filter_news_category_id'  => $child['news_category_id'],
						'filter_sub_news_category' => true
					);
					
					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_news_count') ? ' (' . $this->model_catalog_news->getTotalNews($data) . ')' : ''),
						'href'  => $this->url->link('news/news_category', 'ncat=' . $news_category['news_category_id'] . '_' . $child['news_category_id'])
					);						
				}
				
				// Level 1
				$this->data['news_categories'][] = array(
					'name'     => $news_category['name'],
					'children' => $children_data,
					'column'   => $news_category['column'] ? $news_category['column'] : 1,
					'href'     => $this->url->link('news/news_category', 'ncat=' . $news_category['news_category_id'])
				);
			}
		}
		
		// Brands
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		
		$this->data['manufacturer_top_menu'] = $this->config->get('config_manufacturer_top_menu');
		$this->data['manufacturer_image'] = $this->config->get('config_manufacturer_image_top_menu');
		
		$this->data['text_manufacturers'] = $this->language->get('text_manufacturers');
		
		$this->data['manufacturers'] = array();
		
		$manufacturers = $this->model_catalog_manufacturer->getManufacturers();
		
		foreach ($manufacturers as $manufacturer) {	
			if ($manufacturer['image']) {
				$image = $manufacturer['image'];
			} else {
				$image = 'no_image.jpg';
			}
			
			$this->data['manufacturers'][] = array(
				'name' 	=> $manufacturer['name'],
				'image' => $this->model_tool_image->resize($image, 25, 25),
				'href' 	=> $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'])
			);
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/menu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/menu.tpl';
		} else {
			$this->template = 'default/template/module/menu.tpl';
		}
	
		$this->render();
	}
}
?>