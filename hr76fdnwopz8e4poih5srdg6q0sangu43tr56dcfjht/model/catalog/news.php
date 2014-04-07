<?php
class ModelCatalogNews extends Model {
	public function addNews($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news SET date_available = '" . $this->db->escape($data['date_available']) . "', news_comments = '" . $this->db->escape($data['news_comments']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
		
		$news_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE news_id = '" . (int)$news_id . "'");
		}
		
		$newsName = '';
		foreach ($data['news_description'] as $language_id => $value) {
			if ($language_id == $this->config->get('config_language_id')){
				$newsName = $value['name'];
			}
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'");
		}
		
		if (isset($data['news_store'])) {
			foreach ($data['news_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_store SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		if (isset($data['news_image'])) {
			foreach ($data['news_image'] as $news_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_image SET news_id = '" . (int)$news_id . "', image = '" . $this->db->escape(html_entity_decode($news_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$news_image['sort_order'] . "'");
			}
		}
		
		if (isset($data['news_news_category'])) {
			foreach ($data['news_news_category'] as $news_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_news_category SET news_id = '" . (int)$news_id . "', news_category_id = '" . (int)$news_category_id . "'");
			}
		}
		
		if (isset($data['main_category_id']) && $data['main_category_id'] > 0) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "' AND news_category_id = '" . (int)$data['main_category_id'] . "'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_news_category SET news_id = '" . (int)$news_id . "', news_category_id = '" . (int)$data['main_category_id'] . "', main_category = 1");
		} elseif (isset($data['news_news_category'][0])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news_to_news_category SET main_category = 1 WHERE news_id = '" . (int)$news_id . "' AND news_category_id = '" . (int)$data['news_news_category'][0] . "'");
		}
		
		if (isset($data['news_related'])) {
			foreach ($data['news_related'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_relateds SET news_id = '" . (int)$news_id . "', product_id = '" . (int)$related_id . "'");
			}
		}
		
		if (isset($data['news_related_article'])) {
			foreach ($data['news_related_article'] as $related_news_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related_articles SET news_id = '" . (int)$news_id . "', article_id = '" . (int)$related_news_id . "'");
			}
		}

		if (isset($data['news_layout'])) {
			foreach ($data['news_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_layout SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
						
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		} else {
			$this->load->model('tool/seo_manager');
			if ($newsName) {
				$this->model_tool_seo_manager->generateArticle($news_id, $newsName, $this->config->get('config_template_seo_url_news'), $this->config->get('config_language'));
			}
		}
						
		$this->cache->delete('news');
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
		return $news_id;
	}
	
	public function editNews($news_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news SET date_available = '" . $this->db->escape($data['date_available']) . "', news_comments = '" . $this->db->escape($data['news_comments']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE news_id = '" . (int)$news_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		
		$newsName = '';
		foreach ($data['news_description'] as $language_id => $value) {
			if ($language_id == $this->config->get('config_language_id')){
				$newsName = $value['name'];
			}
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['news_store'])) {
			foreach ($data['news_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_store SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_image WHERE news_id = '" . (int)$news_id . "'");
		
		if (isset($data['news_image'])) {
			foreach ($data['news_image'] as $news_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_image SET news_id = '" . (int)$news_id . "', image = '" . $this->db->escape(html_entity_decode($news_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$news_image['sort_order'] . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "'");
		
		if (isset($data['news_news_category'])) {
			foreach ($data['news_news_category'] as $news_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_news_category SET news_id = '" . (int)$news_id . "', news_category_id = '" . (int)$news_category_id . "'");
			}		
		}
		
		if (isset($data['main_category_id']) && $data['main_category_id'] > 0) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "' AND news_category_id = '" . (int)$data['main_category_id'] . "'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_news_category SET news_id = '" . (int)$news_id . "', news_category_id = '" . (int)$data['main_category_id'] . "', main_category = 1");
		} elseif (isset($data['news_news_category'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news_to_news_category SET main_category = 1 WHERE news_id = '" . (int)$news_id . "' AND news_category_id = '" . (int)$data['news_news_category'][0] . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_relateds WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['news_related'])) {
			foreach ($data['news_related'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_relateds SET news_id = '" . (int)$news_id . "', product_id = '" . (int)$related_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_related_articles WHERE news_id = '" . (int)$news_id . "'");		
		
		if (isset($data['news_related_article'])) {
			foreach ($data['news_related_article'] as $related_news_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related_articles SET news_id = '" . (int)$news_id . "', article_id = '" . (int)$related_news_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_layout WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['news_layout'])) {
			foreach ($data['news_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_layout SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
						
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		} else {
			$this->load->model('tool/seo_manager');
			if ($newsName) {
				$this->model_tool_seo_manager->generateArticle($news_id, $newsName, $this->config->get('config_template_seo_url_news'), $this->config->get('config_language'));
			}
		}
						
		$this->cache->delete('news');
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
		return $news_id;
	}
	
	public function copyNews($news_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "news p LEFT JOIN " . DB_PREFIX . "news_description pd ON (p.news_id = pd.news_id) WHERE p.news_id = '" . (int)$news_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		if ($query->num_rows) {
			$data = array();
			
			$data = $query->row;
			
			$data['viewed'] = '0';
			$data['keyword'] = '';
			$data['status'] = '0';
						
			$data = array_merge($data, array('news_description' => $this->getNewsDescriptions($news_id)));			
			$data = array_merge($data, array('news_image' => $this->getNewsImages($news_id)));		
			$data = array_merge($data, array('news_related' => $this->getNewsRelated($news_id)));
			$data = array_merge($data, array('news_category' => $this->getNewsNewsCategories($news_id)));
			$data = array_merge($data, array('news_layout' => $this->getNewsLayouts($news_id)));
			$data = array_merge($data, array('news_store' => $this->getNewsStores($news_id)));
			
			$this->addNews($data);
		}
	}
	
	public function deleteNews($news_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_image WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_relateds WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_layout WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id. "'");
		
		$this->cache->delete('news');
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
	}
	
	public function getArticle($news_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id . "') AS keyword FROM " . DB_PREFIX . "news p LEFT JOIN " . DB_PREFIX . "news_description pd ON (p.news_id = pd.news_id) WHERE p.news_id = '" . (int)$news_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
		return $query->row;
	}
	
	public function getNews($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id)";
			
			if (!empty($data['filter_news_category'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "news_to_news_category n2c ON (n.news_id = n2c.news_id)";			
			}
					
			$sql .= " WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 
			
			if (!empty($data['filter_name'])) {
				$sql .= " AND LCASE(nd.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}
			
			if (isset($data['filter_news_comments']) && $data['filter_news_comments'] !== null) {
				$sql .= " AND n.news_comments = '" . (int)$data['filter_news_comments'] . "'";
			}
			
			if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
				$sql .= " AND n.status = '" . (int)$data['filter_status'] . "'";
			}
					
			if (!empty($data['filter_news_category'])) {
				if (!empty($data['filter_sub_news_category'])) {
					$implode_data = array();
					
					$implode_data[] = "news_category_id = '" . (int)$data['filter_news_category'] . "'";
					
					$this->load->model('catalog/news_category');
					
					$news_categories = $this->model_catalog_news_category->getNewsCategories($data['filter_news_category']);
					
					foreach ($news_categories as $news_category) {
						$implode_data[] = "n2c.news_category_id = '" . (int)$news_category['news_category_id'] . "'";
					}
					
					$sql .= " AND (" . implode(' OR ', $implode_data) . ")";			
				} else {
					$sql .= " AND n2c.news_category_id = '" . (int)$data['filter_news_category'] . "'";
				}
			}
			
			$sql .= " GROUP BY n.news_id";
						
			$sort_data = array(
				'nd.name',
				'n2c.news_category_id',
				'n.date_available',
				'n.news_comments',
				'n.status',
				'n.sort_order'
			);	
				
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY n.date_available";	
			}
				
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
			$query = $this->db->query($sql);
		
			return $query->rows;
		} else {
			$news_data = $this->cache->get('news.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		
			if (!$news_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY nd.name ASC");
	
				$news_data = $query->rows;
			
				$this->cache->set('news.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $news_data);
			}	
	
			return $news_data;
		}
	}
	
	public function getNewsByNewsCategoryId($news_category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_news_category n2c ON (n.news_id = n2c.news_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2c.news_category_id = '" . (int)$news_category_id . "' ORDER BY nd.name ASC");
								  
		return $query->rows;
	} 
	
	public function getNewsDescriptions($news_id) {
		$news_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		
		foreach ($query->rows as $result) {
			$news_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'seo_title'        => $result['seo_title'],
				'seo_h1'           => $result['seo_h1'],
				'description'      => $result['description'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description'],
				'tag'              => $result['tag']
			);
		}
		
		return $news_description_data;
	}
		
	public function getNewsNewsCategories($news_id) {
		$news_news_category_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "'");
		
		foreach ($query->rows as $result) {
			$news_news_category_data[] = $result['news_category_id'];
		}

		return $news_news_category_data;
	}
	
	public function getNewsMainCategoryId($news_id) {
		$query = $this->db->query("SELECT news_category_id FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "' AND main_category = '1' LIMIT 1");

		return ($query->num_rows ? (int)$query->row['news_category_id'] : 0);
	}
		
	public function getNewsImages($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_image WHERE news_id = '" . (int)$news_id . "'");
		
		return $query->rows;
	}

	public function getNewsStores($news_id) {
		$news_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");

		foreach ($query->rows as $result) {
			$news_store_data[] = $result['store_id'];
		}
		
		return $news_store_data;
	}

	public function getNewsLayouts($news_id) {
		$news_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_layout WHERE news_id = '" . (int)$news_id . "'");
		
		foreach ($query->rows as $result) {
			$news_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $news_layout_data;
	}

	public function getNewsRelated($news_id) {
		$news_related_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_relateds WHERE news_id = '" . (int)$news_id . "'");
		
		foreach ($query->rows as $result) {
			$news_related_data[] = $result['product_id'];
		}
		
		return $news_related_data;
	}
	
	public function getNewsRelatedNews($news_id) {
		$news_related_news_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_related_articles WHERE news_id = '" . (int)$news_id . "'");
		
		foreach ($query->rows as $result) {
			$news_related_news_data[] = $result['article_id'];
		}
		
		return $news_related_news_data;
	}
	
	public function getTotalNews($data = array()) {
		$sql = "SELECT COUNT(DISTINCT n.news_id) AS total FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id)";

		if (!empty($data['filter_news_category'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "news_to_news_category n2c ON (n.news_id = n2c.news_id)";			
		}
		 
		$sql .= " WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		 			
		if (!empty($data['filter_name'])) {
			$sql .= " AND LCASE(nd.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
		}
		
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND n.status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_news_category'])) {
			if (!empty($data['filter_sub_news_category'])) {
				$implode_data = array();
				
				$implode_data[] = "n2c.news_category_id = '" . (int)$data['filter_news_category'] . "'";
				
				$this->load->model('catalog/news_category');
				
				$news_categories = $this->model_catalog_news_category->getNewsCategories($data['filter_news_category']);
				
				foreach ($news_categories as $news_category) {
					$implode_data[] = "n2c.news_category_id = '" . (int)$news_category['news_category_id'] . "'";
				}
				
				$sql .= " AND (" . implode(' OR ', $implode_data) . ")";			
			} else {
				$sql .= " AND n2c.news_category_id = '" . (int)$data['filter_news_category'] . "'";
			}
		}
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}	
	
	public function getTotalNewsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
	
	public function getNewsName($news_id) {
		$selected_language = (int)$this->config->get('config_language_id');
		$row = $this->db->query("SELECT name FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int) $news_id . "' AND language_id = '" . $selected_language . "'");
		if(isset($row->row['name'])){
			return $row->row['name'];
		}
	}
	
	public function getNewsIMG($news_id) {
		$row = $this->db->query("SELECT image FROM " . DB_PREFIX . "news WHERE news_id = '" . (int) $news_id . "'");
		if(isset($row->row['image'])){
			return $row->row['image'];
		}
	}
	
	public function editImage($news_id, $image){
		if ($this->user->hasPermission('modify', 'catalog/news')) {
			$query = $this->db->query("UPDATE " . DB_PREFIX . "news SET image='" . $this->db->escape($image). "' WHERE news_id = '" . (int)$news_id . "'");
		}
		$query = $this->db->query("SELECT image FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");

		$this->cache->delete('news');
		return $query->row['image'];
	}
	
	public function changeName($news_id, $name){
		$selected_language = (int)$this->config->get('config_language_id');
		if ($this->user->hasPermission('modify', 'catalog/news')) {
			$query = $this->db->query("UPDATE " . DB_PREFIX . "news_description SET name='" . $this->db->escape($name) . "' WHERE news_id = '" . (int)$news_id . "' AND language_id='" . $selected_language . "'");
		}
		$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "' AND language_id= '" . $selected_language . "'");
		
		$this->cache->delete('news_description');
		return $query->row['name'];
	}
	
	public function changeStatus($news_id, $column_name, $value){
		if ($this->user->hasPermission('modify', 'catalog/news')) {
			$this->db->query("UPDATE " . DB_PREFIX . "news SET " . $column_name . " = '" . (int)$value . "' WHERE news_id = '" . (int)$news_id . "'");
		}
	}
	
	public function changeAllowComments($news_id, $column_name, $value){
		if ($this->user->hasPermission('modify', 'catalog/news')) {
			$this->db->query("UPDATE " . DB_PREFIX . "news SET " . $column_name . " = '" . (int)$value . "' WHERE news_id = '" . (int)$news_id . "'");
		}
	}
	
	public function changeDescriptions($news_id, $data){
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id. "'");

		foreach ($data['news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	
		$this->cache->delete('news');
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
	}
	
	public function changeNewsCategory($news_id, $data){
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "'");
		
		if (isset($data['news_news_category'])) {
			foreach ($data['news_news_category'] as $news_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_news_category SET news_id = '" . (int)$news_id . "', news_category_id = '" . (int)$news_category_id . "'");
			}		
		}
		
		if (isset($data['main_category_id']) && $data['main_category_id'] > 0) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "' AND news_category_id = '" . (int)$data['main_category_id'] . "'");
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_news_category SET news_id = '" . (int)$news_id . "', news_category_id = '" . (int)$data['main_category_id'] . "', main_category = 1");
		} elseif (isset($data['news_news_category'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "news_to_news_category SET main_category = 1 WHERE news_id = '" . (int)$news_id . "' AND news_category_id = '" . (int)$data['news_news_category'][0] . "'");
		}
		
		$this->cache->delete('news');
	}
	
	public function changeDateSort($news_id, $data){
		$this->db->query("UPDATE " . DB_PREFIX . "news SET date_available = '" . $this->db->escape($data['date_available']) . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE news_id = '" . (int)$news_id . "'");
		
		$this->cache->delete('news');
	}
	
	public function changeNewsRelated($news_id, $data) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_relateds WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['news_related'])) {
			foreach ($data['news_related'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_relateds SET news_id = '" . (int)$news_id . "', product_id = '" . (int)$related_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_related_articles WHERE news_id = '" . (int)$news_id . "'");		
		
		if (isset($data['news_related_article'])) {
			foreach ($data['news_related_article'] as $related_news_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related_articles SET news_id = '" . (int)$news_id . "', article_id = '" . (int)$related_news_id . "'");
			}
		}
		
		$this->cache->delete('news');
	}
	
	public function changeNewsImages($news_id, $data){
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_image WHERE news_id = '" . (int)$news_id . "'");
		
		if (isset($data['news_image'])) {
			foreach ($data['news_image'] as $news_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_image SET news_id = '" . (int)$news_id . "', image = '" . $this->db->escape(html_entity_decode($news_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$news_image['sort_order'] . "'");
			}
		}
		
		$this->cache->delete('news');
	}
	
	public function changeNewsStores($news_id, $data){
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['news_store'])) {
			foreach ($data['news_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_store SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->cache->delete('news');
	}
	
	public function changeNewsLayouts($news_id, $data){
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_layout WHERE news_id = '" . (int)$news_id . "'");

		if (isset($data['news_layout'])) {
			foreach ($data['news_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_layout SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
	}
}
?>