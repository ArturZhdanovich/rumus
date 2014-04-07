<?php
class ModelModuleFilterPro extends Model
{
	public function getAttributes($data = array())
	{
		$sql = "SELECT *, (SELECT agd.name FROM " . DB_PREFIX . "attribute_group_description agd WHERE agd.attribute_group_id = a.attribute_group_id AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS attribute_group, (SELECT agt.tooltip FROM " . DB_PREFIX . "attribute_group_tooltip agt WHERE agt.attribute_group_id = a.attribute_group_id AND agt.language_id = '" . (int)$this->config->get('config_language_id') . "') AS attribute_group_tooltip, (SELECT at.tooltip FROM " . DB_PREFIX . "attribute_tooltip at WHERE at.attribute_id = a.attribute_id AND at.language_id = '" . (int)$this->config->get('config_language_id') . "') AS attribute_tooltip FROM " . DB_PREFIX . "attribute a LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "')";

		if (!empty($data['filter_name']))
		{
			$sql .= " AND LCASE(ad.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
		}

		if (!empty($data['filter_attribute_group_id']))
		{
			$sql .= " AND a.attribute_group_id = '" . $this->db->escape($data['filter_attribute_group_id']) . "'";
		}

		$sort_data = array
		(
			'ad.name',
			'attribute_group',
			'a.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data))
		{
			$sql .= " ORDER BY " . $data['sort'];
		}
		else
		{
			$sql .= " ORDER BY attribute_group, ad.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC'))
		{
			$sql .= " DESC";
		}
		else
		{
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit']))
		{
			if ($data['start'] < 0)
			{
				$data['start'] = 0;
			}

			if ($data['limit'] < 1)
			{
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getOptions($data = array())
	{
		$sql = "SELECT * FROM `" . DB_PREFIX . "option` o" .
			   " LEFT JOIN " . DB_PREFIX . "option_tooltip ot ON (o.option_id = ot.option_id AND ot.language_id = '" . (int)$this->config->get('config_language_id') . "')" .
			   " LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE od.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (isset($data['filter_name']) && !is_null($data['filter_name']))
		{
			$sql .= " AND LCASE(od.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
		}

		$sort_data = array
		(
			'od.name',
			'o.type',
			'o.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data))
		{
			$sql .= " ORDER BY " . $data['sort'];
		}
		else
		{
			$sql .= " ORDER BY od.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC'))
		{
			$sql .= " DESC";
		}
		else
		{
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit']))
		{
			if ($data['start'] < 0)
			{
				$data['start'] = 0;
			}

			if ($data['limit'] < 1)
			{
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function ChangeAttributeTooltips($data)
	{
		if ($data)
		{
			foreach ($data as $attribute => $value)
			{
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "attribute_tooltip` WHERE attribute_id = '" . (int)$value['attribute_id'] . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");

				if ($query->rows)
				{
					$this->db->query("UPDATE `" . DB_PREFIX . "attribute_tooltip` SET tooltip = '" . $value['attribute_tooltip'] . "' WHERE attribute_id = '" . (int)$value['attribute_id'] . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
				}
				else
				{
					$this->db->query("INSERT INTO `" . DB_PREFIX . "attribute_tooltip` SET attribute_id = '" . (int)$value['attribute_id'] . "', language_id = '" . (int)$this->config->get('config_language_id') . "', tooltip = '" . $value['attribute_tooltip'] . "'");
				}
			}
		}
	}
	
	public function ChangeAttributeGroupTooltips($data)
	{
		if ($data)
		{
			foreach ($data as $attribute_group => $value)
			{
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "attribute_group_tooltip` WHERE attribute_group_id = '" . (int)$value['attribute_group_id'] . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");

				if ($query->rows)
				{
					$this->db->query("UPDATE `" . DB_PREFIX . "attribute_group_tooltip` SET tooltip = '" . $value['attribute_group_tooltip'] . "' WHERE attribute_group_id = '" . (int)$value['attribute_group_id'] . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
				}
				else
				{
					$this->db->query("INSERT INTO `" . DB_PREFIX . "attribute_group_tooltip` SET attribute_group_id = '" . (int)$value['attribute_group_id'] . "', language_id = '" . (int)$this->config->get('config_language_id') . "', tooltip = '" . $value['attribute_group_tooltip'] . "'");
				}
			}
		}
	}

	public function ChangeOptionTooltips($data)
	{
		if ($data)
		{
			foreach ($data as $option => $value)
			{
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "option_tooltip` WHERE option_id = '" . (int)$value['option_id'] . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");

				if ($query->rows)
				{
					$this->db->query("UPDATE `" . DB_PREFIX . "option_tooltip` SET tooltip = '" . $value['tooltip'] . "' WHERE option_id = '" . (int)$value['option_id'] . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
				}
				else
				{
					$this->db->query("INSERT INTO `" . DB_PREFIX . "option_tooltip` SET option_id = '" . (int)$value['option_id'] . "', language_id = '" . (int)$this->config->get('config_language_id') . "', tooltip = '" . $value['tooltip'] . "'");
				}
			}
		}
	}
}
?>
