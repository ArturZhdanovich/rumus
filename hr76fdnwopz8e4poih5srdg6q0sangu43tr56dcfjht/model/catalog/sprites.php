<?php
//-----------------------------------------------------
// Amazon Menu II for Opencart v1.5.4   
// Created by villagedefrance                          
// contact@villagedefrance.net                         
//-----------------------------------------------------

class ModelCatalogSprites extends Model {

	public function addSprites($data) {
	
		$this->db->query("INSERT INTO " . DB_PREFIX . "sprites SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
		$sprites_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "sprites SET image = '" . $this->db->escape($data['image']) . "' WHERE sprites_id = '" . (int)$sprites_id . "'");
		}
		
		foreach ($data['sprites_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "sprites_description SET sprites_id = '" . (int)$sprites_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'sprites_id=" . (int)$sprites_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		if (isset($data['sprites_store'])) {
			foreach ($data['sprites_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "sprites_to_store SET sprites_id = '" . (int)$sprites_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->cache->delete('sprites');
	}

	public function editSprites($sprites_id, $data) {
	
		$this->db->query("UPDATE " . DB_PREFIX . "sprites SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE sprites_id = '" . (int)$sprites_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "sprites_description WHERE sprites_id = '" . (int)$sprites_id . "'");
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "sprites SET image = '" . $this->db->escape($data['image']) . "' WHERE sprites_id = '" . (int)$sprites_id . "'");
		}
		
		foreach ($data['sprites_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "sprites_description SET sprites_id = '" . (int)$sprites_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'sprites_id=" . (int)$sprites_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'sprites_id=" . (int)$sprites_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "sprites_to_store WHERE sprites_id = '" . (int)$sprites_id . "'");
		
		if (isset($data['sprites_store'])) {		
			foreach ($data['sprites_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "sprites_to_store SET sprites_id = '" . (int)$sprites_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->cache->delete('sprites');
	}

	public function deleteSprites($sprites_id) {
	
		$this->db->query("DELETE FROM " . DB_PREFIX . "sprites WHERE sprites_id = '" . (int)$sprites_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "sprites_description WHERE sprites_id = '" . (int)$sprites_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'sprites_id=" . (int)$sprites_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "sprites_to_store WHERE sprites_id = '" . (int)$sprites_id . "'");
		
		$this->cache->delete('sprites');
	}	

	public function getSpritesStory($sprites_id) {
	
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'sprites_id=" . (int)$sprites_id . "') AS keyword FROM " . DB_PREFIX . "sprites WHERE sprites_id = '" . (int)$sprites_id . "'");
		
		return $query->row;
	}

	public function getSpritesDescriptions($sprites_id) {
	
		$sprites_description_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sprites_description WHERE sprites_id = '" . (int)$sprites_id . "'");
		
		foreach ($query->rows as $result) {
			$sprites_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description']
			);
		}
		
		return $sprites_description_data;
	}

	public function getSpritesStores($sprites_id) {
	
		$spritespage_store_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sprites_to_store WHERE sprites_id = '" . (int)$sprites_id . "'");
		
		foreach ($query->rows as $result) {
			$spritespage_store_data[] = $result['store_id'];
		}
		
		return $spritespage_store_data;
	}

	public function getSprites() {
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sprites s LEFT JOIN " . DB_PREFIX . "sprites_description sd ON (s.sprites_id = sd.sprites_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY s.sort_order");

		return $query->rows;
	}

	public function getTotalSprites() {
	
		$this->checkSprites();
     	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sprites");

		return $query->row['total'];
	}	

	public function checkSprites() {
	
		$create_sprites = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sprites` (`sprites_id` int(11) NOT NULL auto_increment, `status` int(1) NOT NULL default '0', `image` varchar(255) collate utf8_bin default NULL, `image_size` int(1) NOT NULL default '0', `sort_order` int(3) NOT NULL default '0', PRIMARY KEY  (`sprites_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_sprites);
		
		$create_sprites_descriptions = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sprites_description` (`sprites_id` int(11) NOT NULL default '0', `language_id` int(11) NOT NULL default '0', `title` varchar(64) collate utf8_bin NOT NULL default '', `meta_description` varchar(255) collate utf8_bin NOT NULL, `description` text collate utf8_bin NOT NULL, PRIMARY KEY  (`sprites_id`,`language_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_sprites_descriptions);
		
		$create_sprites_to_store = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sprites_to_store` (`sprites_id` int(11) NOT NULL, `store_id` int(11) NOT NULL, PRIMARY KEY  (`sprites_id`, `store_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_sprites_to_store);
	}
}
?>