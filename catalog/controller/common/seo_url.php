<?php
class ControllerCommonSeoUrl extends Controller {
	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
		
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);
            
            
            
            
            
            
			if (count($parts)) {
     $parts =  array_map(array($this->db, 'escape'), $parts);
     $db_query = $this->db->query("
     SELECT SUBSTRING_INDEX(query,'=',1) AS name,
     CONVERT(SUBSTRING_INDEX(query,'=',-1),UNSIGNED INTEGER) AS value
     FROM " . DB_PREFIX . "url_alias WHERE keyword IN('" . implode("','", $parts) . "') ORDER BY
     FIND_IN_SET(keyword, '" . implode(",", $parts) . "')
     ");
 if ($db_query->num_rows) {
  foreach($db_query->rows as $row) {
   if($row['name'] == 'category_id') {
    if (!isset($this->request->get['path'])) {
      $this->request->get['path'] = $row['value'];
    } else { 
      $this->request->get['path'] .= '_' . $row['value'];
    }
   } else $this->request->get[$row['name']] = $row['value'];
  }
 } else $this->request->get['route'] = 'error/not_found';  
}

			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			} elseif (isset($this->request->get['news_id'])) {
				$this->request->get['route'] = 'news/news';
			} elseif (isset($this->request->get['ncat'])) {
				$this->request->get['route'] = 'news/news_category';
			 }else{
				if(!isset($this->request->get['route'])|| $this->request->get['route']!='error/not_found'){
					$this->request->get['route']= $route;
				}
			}
			
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}
	
	public function rewrite($link) {
		if ($this->config->get('config_seo_url')) {
			$url_data = parse_url(str_replace('&amp;', '&', $link));
		
			$url = ''; 
			
			$data = array();
			
			parse_str($url_data['query'], $data);
			
            
            
            
            
            
            
            
            
            $queries = array();
foreach ($data as $key => $value) {
    if (isset($data['route'])) {
     if (($data['route'] == 'product/product' && $key == 'product_id') || 
        (($data['route'] == 'product/manufacturer/info' || 
          $data['route'] == 'product/product') && $key == 'manufacturer_id') || 
        ($data['route'] == 'information/information' && $key == 'information_id')) {     
          $queries[] = $this->db->escape($key . '=' . (int)$value); 
          } elseif ($key == 'path') {
          $categories = explode('_', $value);
           foreach ($categories as $category) {
               $queries[] = "category_id=" . (int)$category;
          }
      }
    }
 }

if (count($queries)) {    
    $cache = md5(http_build_query($queries));
    $rows = $this->cache->get('url.alias.' . (int)$this->config->get('config_store_id') . $cache);
    if (!$rows) {
     $db_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias 
                           WHERE `query` IN('" . implode("', '", $queries) . "')");
     $rows = $db_query->rows;
     $this->cache->set('url.alias.' . (int)$this->config->get('config_store_id') . $cache, $rows );
    }
    foreach ($queries as $query) {   
     foreach ($rows as $row) {
      if($row['query'] == $query) {
       $url .= '/' . $row['keyword'];
       $query = explode('=', $query);
       $key = array_shift($query);
       $key = ($key=='category_id') ? 'path' : $key;       
       unset($data[$key]);
       break;
      }
     }   
  }
}
       
			if ($url) {
				unset($data['route']);

				$query = '';
			
				if ($data) {
					foreach ($data as $key => $value) {
						$query .= '&' . $key . '=' . $value;
					}
					
					if ($query) {
						$query = '?' . trim($query, '&');
					}
				}

				return $url_data['scheme'] . '://' . $url_data['host'] . (isset($url_data['port']) ? ':' . $url_data['port'] : '') . str_replace('/index.php', '', $url_data['path']) . $url . $query;
			} else {
				return $link;
			}
		} else {
			return $link;
		}		
	}	
}
?>