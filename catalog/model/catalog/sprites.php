<?php
//-----------------------------------------------------
// AmazonMenu II for Opencart v1.5.4    
// Created by villagedefrance                          
// contact@villagedefrance.net                                    
//-----------------------------------------------------

class ModelCatalogSprites extends Model {

	public function getSpritesStory($sprites_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "sprites s LEFT JOIN " . DB_PREFIX . "sprites_description sd ON (s.sprites_id = sd.sprites_id) LEFT JOIN " . DB_PREFIX . "sprites_to_store s2s ON (s.sprites_id = s2s.sprites_id) WHERE s.sprites_id = '" . (int)$sprites_id . "' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND s2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND s.status = '1'");
		return $query->row;
	}

	public function getSprites() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sprites s LEFT JOIN " . DB_PREFIX . "sprites_description sd ON (s.sprites_id = sd.sprites_id) LEFT JOIN " . DB_PREFIX . "sprites_to_store s2s ON (s.sprites_id = s2s.sprites_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND s2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND s.status = '1' ORDER BY s.sort_order DESC");
		return $query->rows;
	}

	public function getSpritesShorts($limit) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sprites s LEFT JOIN " . DB_PREFIX . "sprites_description nd ON (s.sprites_id = sd.sprites_id) LEFT JOIN " . DB_PREFIX . "sprites_to_store s2s ON (n.sprites_id = s2s.sprites_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND s2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND s.status = '1' ORDER BY s.sort_order DESC LIMIT " . (int)$limit); 
		return $query->rows;
	}

	public function getTotalSprites() {
     	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sprites s LEFT JOIN " . DB_PREFIX . "sprites_to_store s2s ON (s.sprites_id = s2s.sprites_id) WHERE s2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND s.status = '1'");
		
		if ($query->row) {
			return $query->row['total'];
		} else {
			return FALSE;
		}
	}	
}
?>
