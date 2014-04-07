<?php
class ControllerModuleNewsLatest extends Controller {
	protected function index($setting) {
		$this->language->load('module/news_latest');
		
      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_more'] = $this->language->get('button_more');
		
		$this->data['setting'] = $setting;
				
		$this->load->model('catalog/news');
		
		$this->load->model('catalog/news_comments');
		
		$this->load->model('tool/image');
		
		$this->data['top_bottom'] = $setting['position'] == 'content_top' || $setting['position'] == 'content_bottom';
		$this->data['side_left'] = $setting['position'] == 'column_left';
		$this->data['side_right'] = $setting['position'] == 'column_right';
		$this->data['side'] = $setting['position'] == 'column_left' || $setting['position'] == 'column_right';
		$this->data['image_preview'] = $setting['image_preview'];

		$this->data['news'] = array();
		
		$data = array(
			'sort'  => 'p.date_available',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_news->getNews($data);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
			
			$this->data['news'][] = array(
				'news_id' 		 => $result['news_id'],
				'thumb'		 	 => $image,
				'no_image' 	  	 => $this->model_tool_image->resize('no_image.jpg', $setting['image_width'], $setting['image_height']),
				'name'    	 	 => $result['name'],
				'date_available' => sprintf($this->language->get('text_date_available'), date($this->language->get('date_format_short'), strtotime($result['date_available']))),
				'viewed' 		 => sprintf($this->language->get('text_viewed'), $result['viewed']),
				'news_comments'  => sprintf($this->language->get('text_news_comments'), $this->model_catalog_news_comments->getTotalCommentsByNewsId($result['news_id'])),
				'description' 	 => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_limit']) . '...',
				'href'    	 	 => $this->url->link('news/news', 'news_id=' . $result['news_id']),
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news_latest.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/news_latest.tpl';
		} else {
			$this->template = 'default/template/module/news_latest.tpl';
		}

		$this->render();
	}
}
?>