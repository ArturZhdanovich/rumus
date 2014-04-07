<?php
class ModelCatalogNewsComment extends Model {
	public function addNewsComment($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news_comments SET author = '" . $this->db->escape($data['author']) . "', news_id = '" . $this->db->escape($data['news_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
	
		$this->cache->delete('news');
	}
	
	public function editNewsComment($news_comment_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news_comments SET author = '" . $this->db->escape($data['author']) . "', news_id = '" . $this->db->escape($data['news_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', status = '" . (int)$data['status'] . "', date_added = NOW() WHERE news_comment_id = '" . (int)$news_comment_id . "'");
	
		$this->cache->delete('news');
	}
	
	public function deleteNewsComment($news_comment_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_comments WHERE news_comment_id = '" . (int)$news_comment_id . "'");
		
		$this->cache->delete('news');
	}
	
	public function getNewsComment($news_comment_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT nd.name FROM " . DB_PREFIX . "news_description nd WHERE nd.news_id = c.news_id AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS news FROM " . DB_PREFIX . "news_comments c WHERE c.news_comment_id = '" . (int)$news_comment_id . "'");
		
		return $query->row;
	}

	public function getNewsComments($data = array()) {
		$sql = "SELECT c.news_comment_id, nd.name, c.author, c.status, c.date_added FROM " . DB_PREFIX . "news_comments c LEFT JOIN " . DB_PREFIX . "news_description nd ON (c.news_id = nd.news_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  
		
		$sort_data = array(
			'nd.name',
			'c.author',
			'c.status',
			'c.date_added'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY c.date_added";	
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
	}
	
	public function getTotalNewsComments() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_comments");
		
		return $query->row['total'];
	}
	
	public function getTotalNewsCommentsAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_comments WHERE status = '0'");
		
		return $query->row['total'];
	}

	public function changeStatus($news_comment_id, $column_name, $value){
		$this->db->query("UPDATE " . DB_PREFIX . "news_comments SET " . $column_name . " = '" . (int)$value . "' WHERE news_comment_id = '" . (int)$news_comment_id . "'");
	}	
}
?>