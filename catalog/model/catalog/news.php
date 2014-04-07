<?php
class ModelCatalogNews extends Model {
	public function updateViewed($news_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "news SET viewed = (viewed + 1) WHERE news_id = '" . (int)$news_id . "'");
	}
	
	public function getArticle($news_id) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
				
		$query = $this->db->query("SELECT DISTINCT *, nd.name AS name, n.image, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_comments c2 WHERE c2.news_id = n.news_id AND c2.status = '1' GROUP BY c2.news_id) AS news_comments, n.sort_order FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store n2s ON (n.news_id = n2s.news_id) WHERE n.news_id = '" . (int)$news_id . "'  AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			return array(
				'news_id'          => $query->row['news_id'],
				'name'             => $query->row['name'],
				'seo_title'        => $query->row['seo_title'],
				'seo_h1'           => $query->row['seo_h1'],
				'description'      => $query->row['description'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'tag'              => $query->row['tag'],
				'image'            => $query->row['image'],
				'date_available'   => $query->row['date_available'],
				'sort_order'       => $query->row['sort_order'],
				'news_comments'    => $query->row['news_comments'] ? $query->row['news_comments'] : 0,
				'status'           => $query->row['status'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed']
			);
		} else {
			return false;
		}
	}

	public function getNews($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
		
		$sql = "SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store n2s ON (n.news_id = n2s.news_id) ";
		if (!empty($data['filter_news_category_id'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "news_to_news_category n2n ON (n.news_id = n2n.news_id)";			
		}
		$sql .= " WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";	
		
		if (!empty($data['filter_news_category_id'])) {
			if (!empty($data['filter_sub_news_category'])) {
				$implode_data = array();
					
				$implode_data[] = "n2n.news_category_id = '" . (int)$data['filter_news_category_id'] . "'";
				
				$this->load->model('catalog/news_category');
				
				$news_categories = $this->model_catalog_news_category->getNewsCategoriesByParentId($data['filter_news_category_id']);
										
				foreach ($news_categories as $news_category_id) {
					$implode_data[] = "n2n.news_category_id = '" . (int)$news_category_id . "'";
				}
							
				$sql .= " AND (" . implode(' OR ', $implode_data) . ")";			
			} else {
				$sql .= " AND n2n.news_category_id = '" . (int)$data['filter_news_category_id'] . "'";
			}
		}		

		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";
			
			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s\s+/', ' ', $data['filter_name'])));

				foreach ($words as $word) {
					$implode[] = "nd.name LIKE '%" . $this->db->escape($word) . "%'";
				}
				
				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR nd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}
			
			if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
				$sql .= " OR ";
			}
			
			if (!empty($data['filter_tag'])) {
				$sql .= "nd.tag LIKE '%" . $this->db->escape($data['filter_tag']) . "%'";
			}
			
			$sql .= ")";
		}
		
		if (!$this->config->get('config_news_sort_order') == 0) {
			$sql .= " ORDER BY n.date_available DESC ";
		} else {
			$sql .= " ORDER BY n.date_available ASC";	
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
		
		$news_data = array();
				
		$query = $this->db->query($sql);
	
		foreach ($query->rows as $result) {
			$news_data[$result['news_id']] = $this->getArticle($result['news_id']);
		}

		return $news_data;
	}
	
	public function getNewsImages($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_image WHERE news_id = '" . (int)$news_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}
		
	public function getNewsLayoutId($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_layout WHERE news_id = '" . (int)$news_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return  $this->config->get('config_layout_product');
		}
	}
	
	public function getNewsProductRelated($news_id) {
		$product_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_relateds nr LEFT JOIN " . DB_PREFIX . "news n ON (nr.news_id = n.news_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (nr.product_id = p2s.product_id) WHERE nr.news_id = '" . (int)$news_id . "' AND n.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		$this->load->model('catalog/product');
		foreach ($query->rows as $result) { 
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
		}
		
		return $product_data;
	}
	
	public function getNewsRelatedNews($news_id) {
		$news_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_related_articles nr LEFT JOIN " . DB_PREFIX . "news n ON (nr.news_id = n.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store p2s ON (nr.news_id = p2s.news_id) WHERE nr.news_id = '" . (int)$news_id . "' AND n.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		$this->load->model('catalog/news');
		foreach ($query->rows as $result) { 
			$news_data[$result['article_id']] = $this->model_catalog_news->getArticle($result['article_id']);
		}
		
		return $news_data;
	}
	
	public function getNewsCategories($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_news_category WHERE news_id = '" . (int)$news_id . "'");
		
		return $query->rows;
	}	
		
	public function getTotalNews($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	

		$sql = "SELECT COUNT(DISTINCT n.news_id) AS total"; 
		
		if (!empty($data['filter_news_category_id'])) {
			if (!empty($data['filter_sub_news_category'])) {
				$sql .= " FROM " . DB_PREFIX . "news_category cn LEFT JOIN " . DB_PREFIX . "news_to_news_category n2c ON (cn.news_category_id = n2c.news_category_id)";			
			} else {
				$sql .= " FROM " . DB_PREFIX . "news_to_news_category n2c";
			}
		
			if (!empty($data['filter_filter'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "news_filter nf ON (n2c.news_id = nf.news_id) LEFT JOIN " . DB_PREFIX . "news n ON (nf.news_id = n.news_id)";
			} else {
				$sql .= " LEFT JOIN " . DB_PREFIX . "news n ON (n2c.news_id = n.news_id)";
			}
		} else {
			$sql .= " FROM " . DB_PREFIX . "news n";
		}
		
		$sql .= " LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store n2s ON (n.news_id = n2s.news_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' AND n.date_available <= NOW() AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		
		if (!empty($data['filter_news_category_id'])) {
			if (!empty($data['filter_sub_news_category'])) {
				$sql .= " AND n2c.news_category_id = '" . (int)$data['filter_news_category_id'] . "'";			
			}	
		
			if (!empty($data['filter_filter'])) {
				$implode = array();
				
				$filters = explode(',', $data['filter_filter']);
				
				foreach ($filters as $filter_id) {
					$implode[] = (int)$filter_id;
				}
				
				$sql .= " AND nf.filter_id IN (" . implode(',', $implode) . ")";				
			}
		}
		
		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";
			
			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s\s+/', ' ', $data['filter_name'])));

				foreach ($words as $word) {
					$implode[] = "nd.name LIKE '%" . $this->db->escape($word) . "%'";
				}
				
				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR nd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}
			
			if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
				$sql .= " OR ";
			}
			
			if (!empty($data['filter_tag'])) {
				$sql .= "nd.tag LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_tag'])) . "%'";
			}

			$sql .= ")";				
		}
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	public function getAutocomplete($q = '') {
        $sql = "SELECT n.name FROM " . DB_PREFIX . "news_description n WHERE n.language_id = '" . (int)$this->config->get('config_language_id') . "' AND LCASE(n.name) LIKE '" . $this->db->escape(mb_strtolower($q, 'UTF-8')) . "%'";
       
        $sql .= " ORDER BY n.name ASC";

        $query = $this->db->query($sql);
        return $query->rows;
    } 
}
?>