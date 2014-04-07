<?php
class ModelCatalogNewsCategory extends Model {
	public function addNewsCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news_category SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");

		$news_category_id = $this->db->getLastId();
				
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news_category SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE news_category_id = '" . (int)$news_category_id . "'");
		}
		
		$news_categoryName = '';
		foreach ($data['news_category_description'] as $language_id => $value) {
			if ($language_id == $this->config->get('config_language_id')){
				$news_categoryName = $value['name'];
			}
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_description SET news_category_id = '" . (int)$news_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'");
		}
	
		if (isset($data['news_category_store'])) {
			foreach ($data['news_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_to_store SET news_category_id = '" . (int)$news_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		if (isset($data['news_category_layout'])) {
			foreach ($data['news_category_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_to_layout SET news_category_id = '" . (int)$news_category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
						
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_category_id=" . (int)$news_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		} else {
			$this->load->model('tool/seo_manager');
			if ($news_categoryName) {
				$this->model_tool_seo_manager->generateNewsCategory($news_category_id, $news_categoryName, $this->config->get('config_news_categories_template'), $this->config->get('config_language'));
			}
		}
		
		$this->cache->delete('news_category');
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
		return $news_category_id;
	}
	
	public function editNewsCategory($news_category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news_category SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE news_category_id = '" . (int)$news_category_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news_category SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE news_category_id = '" . (int)$news_category_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_description WHERE news_category_id = '" . (int)$news_category_id . "'");

		$news_categoryName = '';
		foreach ($data['news_category_description'] as $language_id => $value) {
			if ($language_id == $this->config->get('config_language_id')){
				$news_categoryName = $value['name'];
			}
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_description SET news_category_id = '" . (int)$news_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'");
		}
				
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_to_store WHERE news_category_id = '" . (int)$news_category_id . "'");
		
		if (isset($data['news_category_store'])) {		
			foreach ($data['news_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_to_store SET news_category_id = '" . (int)$news_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_to_layout WHERE news_category_id = '" . (int)$news_category_id . "'");

		if (isset($data['news_category_layout'])) {
			foreach ($data['news_category_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_to_layout SET news_category_id = '" . (int)$news_category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
						
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_category_id=" . (int)$news_category_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_category_id=" . (int)$news_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		} else {
			$this->load->model('tool/seo_manager');
			if ($news_categoryName) {
				$this->model_tool_seo_manager->generateNewsCategory($news_category_id, $news_categoryName, $this->config->get('config_news_categories_template'), $this->config->get('config_language'));
			}
		}
		
		$this->cache->delete('news_category');
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
		return $news_category_id;
	}
	
	public function deleteNewsCategory($news_category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category WHERE news_category_id = '" . (int)$news_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_description WHERE news_category_id = '" . (int)$news_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_to_store WHERE news_category_id = '" . (int)$news_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_to_layout WHERE news_category_id = '" . (int)$news_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_news_category WHERE news_category_id = '" . (int)$news_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_category_id=" . (int)$news_category_id . "'");
		
		$query = $this->db->query("SELECT news_category_id FROM " . DB_PREFIX . "news_category WHERE parent_id = '" . (int)$news_category_id . "'");

		foreach ($query->rows as $result) {
			$this->deleteNewsCategory($result['news_category_id']);
		}
		
		$this->cache->delete('news_category');
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
	} 
			
	public function getNewsCategory($news_category_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'news_category_id=" . (int)$news_category_id . "') AS keyword FROM " . DB_PREFIX . "news_category WHERE news_category_id = '" . (int)$news_category_id . "'");
		
		return $query->row;
	}  
	
	public function getNewsCategories($parent_id = 0) {
		$news_category_data = $this->cache->get('news_category.' . (int)$this->config->get('config_language_id') . '.' . (int)$parent_id);
	
		if (!$news_category_data) {
			$news_category_data = array();
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_category c LEFT JOIN " . DB_PREFIX . "news_category_description cd ON (c.news_category_id = cd.news_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
			foreach ($query->rows as $result) {
				$news_category_data[] = array(
					'news_category_id' 	=> $result['news_category_id'],
					'name'        		=> $this->getNcat($result['news_category_id'], $this->config->get('config_language_id')),
					'status'  	  		=> $result['status'],
					'sort_order'  		=> $result['sort_order']
				);
			
				$news_category_data = array_merge($news_category_data, $this->getNewsCategories($result['news_category_id']));
			}	
	
			$this->cache->set('news_category.' . (int)$this->config->get('config_language_id') . '.' . (int)$parent_id, $news_category_data);
		}
		
		return $news_category_data;
	}
		
	public function getNcat($news_category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "news_category c LEFT JOIN " . DB_PREFIX . "news_category_description cd ON (c.news_category_id = cd.news_category_id) WHERE c.news_category_id = '" . (int)$news_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		if ($query->row['parent_id']) {
			return $this->getNcat($query->row['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $query->row['name'];
		} else {
			return $query->row['name'];
		}
	}
				
	public function getNewsCategoryDescriptions($news_category_id) {
		$news_category_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_category_description WHERE news_category_id = '" . (int)$news_category_id . "'");
		
		foreach ($query->rows as $result) {
			$news_category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'seo_title'        => $result['seo_title'],
				'seo_h1'           => $result['seo_h1'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description']
			);
		}
		
		return $news_category_description_data;
	}	
	
	public function getNewsCategoryStores($news_category_id) {
		$news_category_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_category_to_store WHERE news_category_id = '" . (int)$news_category_id . "'");

		foreach ($query->rows as $result) {
			$news_category_store_data[] = $result['store_id'];
		}
		
		return $news_category_store_data;
	}

	public function getNewsCategoryLayouts($news_category_id) {
		$news_category_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_category_to_layout WHERE news_category_id = '" . (int)$news_category_id . "'");
		
		foreach ($query->rows as $result) {
			$news_category_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $news_category_layout_data;
	}
		
	public function getTotalNewsCategories() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_category");
		
		return $query->row['total'];
	}
		
	public function getTotalNewsCategoriesByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_category WHERE image_id = '" . (int)$image_id . "'");
		
		return $query->row['total'];
	}

	public function getTotalNewsCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
	
	public function getNewsCategoriesByParentId($parent_id = 0) {
		$query = $this->db->query("SELECT *, (SELECT COUNT(parent_id) FROM " . DB_PREFIX . "news_category WHERE parent_id = c.news_category_id) AS children FROM " . DB_PREFIX . "news_category c LEFT JOIN " . DB_PREFIX . "news_category_description cd ON (c.news_category_id = cd.news_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name");
		
		return $query->rows;
	}
	
	public function getNewsCategoryName($news_category_id) {
		$selected_language = (int)$this->config->get('config_language_id');
		$row = $this->db->query("SELECT name FROM " . DB_PREFIX . "news_category_description WHERE news_category_id = '" . (int) $news_category_id . "' AND language_id = '" . $selected_language . "'");
		if(isset($row->row['name'])){
			return $row->row['name'];
		}
	}
	
	public function getNewsCategoryIMG($news_category_id) {
		$row = $this->db->query("SELECT image FROM " . DB_PREFIX . "news_category WHERE news_category_id = '" . (int) $news_category_id . "'");
		if(isset($row->row['image'])){
			return $row->row['image'];
		}
	}
	
	public function getAllNewsCategories() {
		$news_category_data = $this->cache->get('news_category.all.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$news_category_data || !is_array($news_category_data)) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_category c LEFT JOIN " . DB_PREFIX . "news_category_description cd ON (c.news_category_id = cd.news_category_id) LEFT JOIN " . DB_PREFIX . "news_category_to_store c2s ON (c.news_category_id = c2s.news_category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  ORDER BY c.parent_id, c.sort_order, cd.name");

			$news_category_data = array();
			foreach ($query->rows as $row) {
				$news_category_data[$row['parent_id']][$row['news_category_id']] = $row;
			}

			$this->cache->set('news_category.all.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $news_category_data);
		}

		return $news_category_data;
	}
	
	public function changeName($news_category_id, $name){
		$selected_language = (int)$this->config->get('config_language_id');
		if($news_category_id > 0){
			$query = $this->db->query("UPDATE " . DB_PREFIX . "news_category_description SET name= '" .$this->db->escape($name) . "' WHERE news_category_id = '" . (int)$news_category_id . "' AND language_id='" . $selected_language . "'");
			$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "news_category_description WHERE news_category_id = '" . (int)$news_category_id . "' AND language_id= '" . $selected_language . "'");
		}
		$this->cache->delete('news_category');
		return $query->row['name'];
	}
	
	public function changeDescriptions($news_category_id, $data){
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_description WHERE news_category_id = '" . (int)$news_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_category_id=" . (int)$news_category_id. "'");

		foreach ($data['news_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_description SET news_category_id = '" . (int)$news_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_category_id=" . (int)$news_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('news_category');
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
	}
	
	public function changeNewsCategoryParent($news_category_id, $data){
		$this->db->query("UPDATE " . DB_PREFIX . "news_category SET parent_id = '" . (int)$data['parent_id'] . "', date_modified = NOW() WHERE news_category_id = '" . (int)$news_category_id . "'");
		
		$this->cache->delete('news_category');
	}
	
	public function changeNewsCategoryImage($news_category_id, $data){
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news_category SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE news_category_id = '" . (int)$news_category_id . "'");
		}
		
		$this->cache->delete('news_category');
	}
	
	public function changeNewsCategoryStore($news_category_id, $data){
		$this->db->query("UPDATE " . DB_PREFIX . "news_category SET `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE news_category_id = '" . (int)$news_category_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_to_store WHERE news_category_id = '" . (int)$news_category_id . "'");
		
		if (isset($data['news_category_store'])) {		
			foreach ($data['news_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_to_store SET news_category_id = '" . (int)$news_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->cache->delete('news_category');
	}
	
	public function changeNewsCategoryDesign($news_category_id, $data){
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_category_to_layout WHERE news_category_id = '" . (int)$news_category_id . "'");

		if (isset($data['news_category_layout'])) {
			foreach ($data['news_category_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "news_category_to_layout SET news_category_id = '" . (int)$news_category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
		
		$this->cache->delete('news_category');
	}
	
	public function changeStatus($news_category_id, $column_name, $value){
		$this->db->query("UPDATE " . DB_PREFIX . "news_category SET " . $column_name . " = '" . (int)$value . "' WHERE news_category_id = '" . (int)$news_category_id . "'");
	}
}
?>