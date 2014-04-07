<?php
class ModelToolControlUnit extends Model {
	public function addItem($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "control_unit SET name = '" . $this->db->escape($data['name']) . "', link = '" . $this->db->escape($data['link']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . $this->db->escape($data['sort_order']) . "'");	
		
		$control_unit_id = $this->db->getLastId();
				
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "control_unit SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE control_unit_id = '" . (int)$control_unit_id . "'");
		}
	}
	
	public function editItem($control_unit_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "control_unit SET name = '" . $this->db->escape($data['name']) . "', link = '" . $this->db->escape($data['link']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . $this->db->escape($data['sort_order']) . "' WHERE control_unit_id = '" . (int)$control_unit_id . "'");
	
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "control_unit SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE control_unit_id = '" . (int)$control_unit_id . "'");
		}
		
		$this->cache->delete('control_unit');
	}
	
	public function deleteItem($control_unit_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "control_unit WHERE control_unit_id = '" . (int)$control_unit_id . "'");
	}
	
	public function getControlUnit($control_unit_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "control_unit WHERE control_unit_id = '" . (int)$control_unit_id . "'");
		
		return $query->row;
	}
		
	public function getControlUnits($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "control_unit";
		
		$sort_data = array(
			'name',
			'status',
			'sort_order'
		);	
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";	
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
		
	public function getTotalControlUnits() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "control_unit");
		
		return $query->row['total'];
	}
	
	public function editImage($control_unit_id, $image){
		if ($this->user->hasPermission('modify', 'tool/control_unit')) {
			$query = $this->db->query("UPDATE " . DB_PREFIX . "control_unit SET image= '" . $this->db->escape($image) . "' WHERE control_unit_id = '". $control_unit_id . "'");
		}
		$query = $this->db->query("SELECT image FROM " . DB_PREFIX . "control_unit WHERE control_unit_id = '". $control_unit_id . "'");

		$this->cache->delete('control_unit');
		return $query->row['image'];
	}
	
	public function changeName($control_unit_id, $name) {
		if ($this->user->hasPermission('modify', 'tool/control_unit')) {
			$this->db->query("UPDATE " . DB_PREFIX . "control_unit SET name = '" . $this->db->escape($name) . "' WHERE control_unit_id = '". $control_unit_id . "'");
		}

        $query = $this->db->query("SELECT name FROM " . DB_PREFIX . "control_unit WHERE control_unit_id = '". $control_unit_id . "'");
        $row = $query->row;

        return $row['name'];
    }
	
	public function changeRoute($control_unit_id, $link) {
		if ($this->user->hasPermission('modify', 'tool/control_unit')) {
			$this->db->query("UPDATE " . DB_PREFIX . "control_unit SET link = '" . $this->db->escape($link) . "' WHERE control_unit_id = '". $control_unit_id . "'");
		}

        $query = $this->db->query("SELECT link FROM " . DB_PREFIX . "control_unit WHERE control_unit_id = '". $control_unit_id . "'");
        $row = $query->row;

        return $row['link'];
    }
	
	public function changeSortOrder($control_unit_id, $sort_order) {
		if ($this->user->hasPermission('modify', 'tool/control_unit')) {
			$this->db->query("UPDATE " . DB_PREFIX . "control_unit SET sort_order = '" . (float)$sort_order . "' WHERE control_unit_id = '". $control_unit_id . "'");
		}

        $query = $this->db->query("SELECT sort_order FROM " . DB_PREFIX . "control_unit WHERE control_unit_id = '". $control_unit_id . "'");
        $row = $query->row;

        return $row['sort_order'];
    }
	
	public function changeStatus($control_unit_id, $column_name, $value){
		$this->db->query("UPDATE " . DB_PREFIX . "control_unit SET " . $column_name . " = '" . (int)$value . "' WHERE control_unit_id = '" . (int)$control_unit_id . "'");
	}
}
?>