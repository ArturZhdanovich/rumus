<?php
class ModelToolSeoManager extends Model {
	public function addUrlAlias($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = '" . $this->db->escape($data['query']) . "', keyword = '" . $this->db->escape($data['keyword']) . "'");	
	
		$this->cache->delete('seo_url');
		$this->cache->delete('seo_pro');
	}
	
	public function editUrlAlias($url_alias_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "url_alias SET query = '" . $this->db->escape($data['query']) . "', keyword = '" . $this->db->escape($data['keyword']) . "' WHERE url_alias_id = '" . (int)$url_alias_id . "'");
		
		$this->cache->delete('seo_url');
		$this->cache->delete('seo_pro');
	}
	
	public function deleteUrlAlias($url_alias_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE url_alias_id = '" . (int)$url_alias_id . "'");
		
		$this->cache->delete('seo_url');
		$this->cache->delete('seo_pro');
	}
	
	public function getUrlAlias($url_alias_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "url_alias WHERE url_alias_id = '" . (int)$url_alias_id . "'");
		
		return $query->row;
	}
		
	public function getUrlAliases($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "url_alias` WHERE url_alias_id";
					
		if (!empty($data['filter_query'])) {
			$sql .= " AND query LIKE '" . $this->db->escape($data['filter_query']) . "%'";
		}

		if (!empty($data['filter_keyword'])) {
			$sql .= " AND keyword LIKE '" . $this->db->escape($data['filter_keyword']) . "%'";
		}
			
		$sql .= " GROUP BY url_alias_id";
		
		$sort_data = array(
			'query',
			'keyword',
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY keyword";	
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

		return  $query->rows;
	}
		
	public function getTotalUrlAlias($data = array()) {
		$sql = "SELECT COUNT(DISTINCT url_alias_id) AS total FROM " . DB_PREFIX . "url_alias";
		
		$sql .= " ";
		
		if (!empty($data['filter_query'])) {
			$sql .= " AND query LIKE '" . $this->db->escape($data['filter_query']) . "%'";
		}

		if (!empty($data['filter_keyword'])) {
			$sql .= " AND keyword LIKE '" . $this->db->escape($data['filter_keyword']) . "%'";
		}
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	// Categories
	public function generateCategory($category_id, $categoryName, $template, $source_langcode) {
		$slugs = $this->getSlugs('category_id');
		$tags = array('[category_name]' => $categoryName);
		$slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode);
		$index = 1;
		while (in_array($uniqueSlug, $slugs)) {
			$uniqueSlug = $slug . '-' . $index++;
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'category_id=" . (int)$category_id . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
	}
	
    public function generateCategories($template, $source_langcode, $overwrite) {
        $categories = $this->getCategories($overwrite);
        $slugs = $this->getExistingSlugs();
        foreach ($categories as $category) {
            unset($slugs['category_id=' . $category['category_id']]);
            $tags = array('[category_name]' => $category['name']);
            $slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode);
            $index = 1;
            while (in_array($uniqueSlug, $slugs)) {
                $uniqueSlug = $slug . '-' . $index++;
            }
            $slugs[] = $uniqueSlug;
            $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'category_id=" . (int)$category['category_id'] . "'");
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'category_id=" . (int)$category['category_id'] . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
        }
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
    }
	
	public function generateMetaH1Categories($template,  $source_langcode) {
		$slugs = array();			
		$categories = $this->getCategoriesForMeta();
        foreach ($categories as $category) {
			if (!is_null($category['seo_h1']) && strlen($category['seo_h1']) > 0){
				continue;
			}
			$tags = array(
				'[categories_names]' => $category['name'],
            );
			$finalH1 = array();
            $h1 = explode(',', strtr($template, $tags));
            
            foreach ($h1 as $keyword) {
                $finalH1[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalH1 = array_filter(array_unique($finalH1));
            $finalH1 = implode(', ', $finalH1);

            $this->db->query("UPDATE " . DB_PREFIX . "category_description SET seo_h1 = '" . $this->db->escape($finalH1) . "' where category_id = " . (int)$category['category_id'] . " and language_id = " . (int)$category['language_id']);
        }	
    }
	
	public function deleteMetaH1Categories() {
		$query = $this->db->query("update " . DB_PREFIX . "category_description set seo_h1 = '';");
		
		$this->cache->delete('category');
	}
	
	public function generateMetaTitleCategories($template,  $source_langcode) {
		$slugs = array();			
		$categories = $this->getCategoriesForMeta();
        foreach ($categories as $category) {	
			if (!is_null($category['seo_title']) && strlen($category['seo_title']) > 0){
				continue;
			}
			$tags = array(
				'[categories_names]' => $category['name'],
            );
			$finalTitle = array();
            $Title = explode(',', strtr($template, $tags));
            
            foreach ($Title as $keyword) {
                $finalTitle[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalTitle = array_filter(array_unique($finalTitle));
            $finalTitle = implode(', ', $finalTitle);

            $this->db->query("UPDATE " . DB_PREFIX . "category_description SET seo_title = '" . $this->db->escape($finalTitle) . "' where category_id = " . (int)$category['category_id'] . " and language_id = " . (int)$category['language_id']);
        }	
    }
	
	public function deleteMetaTitleCategories() {
		$query = $this->db->query("update " . DB_PREFIX . "category_description set seo_title = '';");
		
		$this->cache->delete('category');
	}
	
	public function generateMetaKeywordsCategories($template,  $source_langcode) {
		$slugs = array();			
		$categories = $this->getCategoriesForMeta();
        foreach ($categories as $category) {	
			if (!is_null($category['meta_keyword']) && strlen($category['meta_keyword']) > 0){
				continue;
			}
			$tags = array(
				'[categories_names]' => $category['name'],
				'[store_name]' => $this->config->get('config_name')
            );
			$finalKeywords = array();
            $MetaKeywords = explode(',', strtr($template, $tags));
            
            foreach ($MetaKeywords as $keyword) {
                $finalKeywords[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalKeywords = array_filter(array_unique($finalKeywords));
            $finalKeywords = implode(', ', $finalKeywords);

            $this->db->query("UPDATE " . DB_PREFIX . "category_description SET meta_keyword = '" . $this->db->escape($finalKeywords) . "' where category_id = " . (int)$category['category_id'] . " and language_id = " . (int)$category['language_id']);
        }	
    }
	
	public function deleteMetaKeywordsCategories() {
		$query = $this->db->query("update " . DB_PREFIX . "category_description set meta_keyword = '';");
		
		$this->cache->delete('category');
	}
	
	public function generateMetaDescriptionCategories($template,  $source_langcode) {
		$slugs = array();			
		$categories = $this->getCategoriesForMeta();
        foreach ($categories as $category) {	
			if (!is_null($category['meta_description']) && strlen($category['meta_description']) > 0){
				continue;
			}
			$tags = array(
				'[categories_names]' => $category['name'],
				'[description]' 	 => utf8_substr(strip_tags(html_entity_decode($category['description'], ENT_QUOTES, 'UTF-8')), 0, 200),
            );
			$finalDescription = array();
            $MetaDescription = explode(',', strtr($template, $tags));
            
            foreach ($MetaDescription as $keyword) {
                $finalDescription[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalDescription = array_filter(array_unique($finalDescription));
            $finalDescription = implode(', ', $finalDescription);

            $this->db->query("UPDATE " . DB_PREFIX . "category_description SET meta_description = '" . $this->db->escape($finalDescription) . "' where category_id = " . (int)$category['category_id'] . " and language_id = " . (int)$category['language_id']);
        }	
    }
	
	public function deleteMetaDescriptionCategories() {
		$query = $this->db->query("update " . DB_PREFIX . "category_description set meta_description = '';");
		
		$this->cache->delete('category');
	}
	
	// Products
	public function generateProduct($product_id, $productName, $productModel, $productManufr, $template, $source_langcode) {
		$slugs = $this->getSlugs('product_id');
		$tags = array(
			'[product_name]' => $productName,
			'[model_name]' => $productModel,
			'[manufacturer_name]' => $productManufr
		);
		$slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode);
		$index = 1;
		while (in_array($uniqueSlug, $slugs)) {
			$uniqueSlug = $slug . '-' . $index++;
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
	}

    public function generateProducts($template, $suffix, $source_langcode, $overwrite) {
        $products = $this->getProducts($overwrite);
        $slugs = $this->getExistingSlugs();
        foreach ($products as $product) {
            unset($slugs['product_id=' . $product['product_id']]);
            $tags = array(
				'[product_name]' 	  => $product['name'],
                '[model_name]' 		  => $product['model'],
                '[manufacturer_name]' => $product['manufacturer_name']
            );
            $slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode) . $suffix;
            $index = 1;
            while (in_array($uniqueSlug, $slugs)) {
                $uniqueSlug = $slug . '-' . $index++;
            }
            $slugs[] = $uniqueSlug;
            $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product['product_id'] . "'");
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product['product_id'] . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
        }
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
    }
	
	public function generateMetaH1Products($template,  $source_langcode) {
        $products = $this->getProductsForMeta();
        $slugs = array();
        foreach ($products as $product) {
			if (!is_null($product['seo_h1']) && strlen($product['seo_h1']) > 0){
				continue;
			}
            $finalCategories = array();
            $categories = $this->getProductCategories($product['product_id'], $product['language_id']);
            foreach ($categories as $category) {
                $finalCategories[] = $category['name'];
            }
            $tags = array(
				'[product_name]' 	  => $product['name'],
                '[model_name]' 		  => $product['model'],
                '[manufacturer_name]' => $product['manufacturer_name'],
				'[sku]'			  	  => $product['sku'],
				'[price]'			  => (float)$product['price'],
                '[categories_names]'  => implode(',', $finalCategories)
            );
            $finalH1 = array();
            $h1 = explode(',', strtr($template, $tags));
            
            foreach ($h1 as $keyword) {
                $finalH1[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalH1 = array_filter(array_unique($finalH1));
            $finalH1 = implode(', ', $finalH1);
            $this->db->query("UPDATE " . DB_PREFIX . "product_description SET seo_h1 = '" . $this->db->escape($finalH1) . "' where product_id = " . (int)$product['product_id'] . " and language_id = " . (int)$product['language_id']);
        }
    }
	
	public function deleteMetaH1Products() {
		$query = $this->db->query("update " . DB_PREFIX . "product_description set seo_h1 = '';");
		
		$this->cache->delete('product');
	}
	
	public function generateMetaTitleProducts($template,  $source_langcode) {
        $products = $this->getProductsForMeta();
        $slugs = array();
        foreach ($products as $product) {
            if (!is_null($product['seo_title']) && strlen($product['seo_title']) > 0){
				continue;
			}
			$finalCategories = array();
            $categories = $this->getProductCategories($product['product_id'], $product['language_id']);
            foreach ($categories as $category) {
                $finalCategories[] = $category['name'];
            }
            $tags = array(
				'[product_name]' 	  => $product['name'],
                '[model_name]' 		  => $product['model'],
                '[manufacturer_name]' => $product['manufacturer_name'],
				'[sku]'			  	  => $product['sku'],
				'[price]'			  => (float)$product['price'],
                '[categories_names]'  => implode(',', $finalCategories)
            );
            $finalTitle = array();
            $title = explode(',', strtr($template, $tags));
            
            foreach ($title as $keyword) {
                $finalTitle[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalTitle = array_filter(array_unique($finalTitle));
            $finalTitle = implode(', ', $finalTitle);
            $this->db->query("UPDATE " . DB_PREFIX . "product_description SET seo_title = '" . $this->db->escape($finalTitle) . "' where product_id = " . (int)$product['product_id'] . " and language_id = " . (int)$product['language_id']);
        }
    }
	
	public function deleteMetaTitleProducts() {
		$query = $this->db->query("update " . DB_PREFIX . "product_description set seo_title = '';");
		
		$this->cache->delete('product');
	}

    public function generateProductsMetaKeywords($template, $source_langcode) {
        $products = $this->getProductsForMeta();
        foreach ($products as $product) {
            if (!is_null($product['meta_keyword']) && strlen($product['meta_keyword']) > 0){
				continue;
			}
			$finalCategories = array();
            $categories = $this->getProductCategories($product['product_id'], $product['language_id']);
            foreach ($categories as $category) {
                $finalCategories[] = $category['name'];
            }
            $tags = array(
				'[product_name]' 	  => $product['name'],
                '[model_name]' 		  => $product['model'],
                '[manufacturer_name]' => $product['manufacturer_name'],
				'[sku]'			  	  => $product['sku'],
                '[categories_names]'  => implode(',', $finalCategories)

            );
            $finalKeywords = array();
            $keywords = explode(',', strtr($template, $tags));
            foreach ($keywords as $keyword) {
				$finalKeywords[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalKeywords = array_filter(array_unique($finalKeywords));
            $finalKeywords = implode(', ', $finalKeywords);
            $this->db->query("UPDATE " . DB_PREFIX . "product_description SET meta_keyword = '" . $this->db->escape($finalKeywords) . "' where product_id = " . (int)$product['product_id'] . " and language_id = " . (int)$product['language_id']);
        }
    }
	
	public function deleteKeywordsProducts() {
		$query = $this->db->query("update " . DB_PREFIX . "product_description set meta_keyword = '';");
		
		$this->cache->delete('product');
	}

    public function generateTagsProducts($template, $source_langcode) {
        $products = $this->getProductsForMeta();
        foreach ($products as $product) {
            if (!is_null($product['tag']) && strlen($product['tag']) > 0){
				continue;
			}
			$finalCategories = array();
            $categories = $this->getProductCategories($product['product_id'], $product['language_id']);
            foreach ($categories as $category) {
                $finalCategories[] = $category['name'];
            }
            $tags = array(
				'[product_name]' 	  => $product['name'],
                '[model_name]' 		  => $product['model'],
                '[manufacturer_name]' => $product['manufacturer_name'],
				'[sku]'			  	  => $product['sku'],
                '[categories_names]'  => implode(',', $finalCategories)

            );
            $finalKeywords = array();
            $keywords = explode(',', strtr($template, $tags));
            foreach ($keywords as $keyword) {
                $finalKeywords[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalKeywords = array_filter(array_unique($finalKeywords));
            $this->db->query("UPDATE " . DB_PREFIX . "product_description SET tag = '" . $this->db->escape(implode(',', $finalKeywords)) . "' WHERE product_id = " . (int)$product['product_id'] . " AND language_id = " . (int)$product['language_id']);
        }
    }
	
	public function deleteTagsProducts() {
		$query = $this->db->query("update " . DB_PREFIX . "product_description set tag = '';");
		
		$this->cache->delete('product');
	}
	
	public function generateMetaDescriptionProducts($template,  $source_langcode) {
        $products = $this->getProductsForMeta();
        $slugs = array();
        foreach ($products as $product) {
             if (!is_null($product['meta_description']) && strlen($product['meta_description']) > 0){
				continue;
			}
			$finalCategories = array();
            $categories = $this->getProductCategories($product['product_id'], $product['language_id']);
            foreach ($categories as $category) {
                $finalCategories[] = $category['name'];
            }
            $tags = array(
				'[product_name]' 	  => $product['name'],
                '[model_name]' 		  => $product['model'],
				'[description]'  	  => utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, 200),
                '[manufacturer_name]' => $product['manufacturer_name'],
				'[price]' 			  => (float)$product['price'],
				'[sku]' 			  => $product['sku'],
                '[categories_names]'  => implode(',', $finalCategories)

            );
            $finalDescription = array();
            $description = explode(',', strtr($template, $tags));
            
             foreach ($description as $description) {
                $finalDescription[] = $this->makeSlugss(trim($description), 0, false, $source_langcode); 
				$finalDescription = preg_replace("~\s+~", " ", $finalDescription);
            }
            $finalDescription = array_filter(array_unique($finalDescription));
            $finalDescription = implode(', ', $finalDescription);
            $this->db->query("UPDATE " . DB_PREFIX . "product_description SET meta_description = '" . $this->db->escape($finalDescription) . "' where product_id = " . (int)$product['product_id'] . " and language_id = " . (int)$product['language_id']);
        }
    }
	
	public function deleteMetaDescriptionProducts() {
		$query = $this->db->query("update " . DB_PREFIX . "product_description set meta_description = '';");
		
		$this->cache->delete('product');
	}
	
	// Manufacturers
	public function generateManufacturer($manufacturer_id, $template, $source_langcode) {
		$slugs = $this->getSlugs('manufacturer_id');
		$tags = array('[manufacturer_name]' => $this->getManufacturerName($manufacturer_id));
		$slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode);
		$index = 1;
		while (in_array($uniqueSlug, $slugs)) {
			$uniqueSlug = $slug . '-' . $index++;
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'manufacturer_id=" . (int)$manufacturer_id . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
	}
	
	public function generateManufacturers($template, $suffix, $source_langcode, $overwrite) {
        $manufacturers = $this->getManufacturers($overwrite);
        $slugs = $this->getExistingSlugs();
        foreach ($manufacturers as $manufacturer) {
            $tags = array('[manufacturer_name]' => $manufacturer['name']);
            $slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode) . $suffix;
            $index = 1;
            while (in_array($uniqueSlug, $slugs)) {
                $uniqueSlug = $slug . '-' . $index++;
            }
            $slugs[] = $uniqueSlug;
            $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'manufacturer_id=" . (int)$manufacturer['manufacturer_id'] . "'");
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'manufacturer_id=" . (int)$manufacturer['manufacturer_id'] . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
        }
		
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
    }
	
	public function generateMetaH1Manufacturers($template,  $source_langcode) {
		$slugs = array();			
		$manufacturers = $this->getManufacturersForMeta();
        foreach ($manufacturers as $manufacturer) {
			if (!is_null($manufacturer['seo_h1']) && strlen($manufacturer['seo_h1']) > 0){
				continue;
			}
			$tags = array(
				'[manufacturer_name]' => $manufacturer['name'],
            );
			$finalH1 = array();
            $h1 = explode(',', strtr($template, $tags));
            
            foreach ($h1 as $keyword) {
                $finalH1[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalH1 = array_filter(array_unique($finalH1));
            $finalH1 = implode(', ', $finalH1);

            $this->db->query("UPDATE " . DB_PREFIX . "manufacturer_description SET seo_h1 = '" . $this->db->escape($finalH1) . "' where manufacturer_id = " . (int)$manufacturer['manufacturer_id'] . " and language_id = " . (int)$manufacturer['language_id']);
        }	
    }
	
	public function deleteMetaH1Manufacturers() {
		$query = $this->db->query("update " . DB_PREFIX . "manufacturer_description set seo_h1 = '';");
		
		$this->cache->delete('manufacturer');
	}
	
	public function generateMetaTitleManufacturers($template,  $source_langcode) {
		$slugs = array();			
		$manufacturers = $this->getManufacturersForMeta();
        foreach ($manufacturers as $manufacturer) {	
			if (!is_null($manufacturer['seo_title']) && strlen($manufacturer['seo_title']) > 0){
				continue;
			}
			$tags = array(
				'[manufacturer_name]' => $manufacturer['name'],
            );
			$finalTitle = array();
            $Title = explode(',', strtr($template, $tags));
            
            foreach ($Title as $keyword) {
                $finalTitle[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalTitle = array_filter(array_unique($finalTitle));
            $finalTitle = implode(', ', $finalTitle);

            $this->db->query("UPDATE " . DB_PREFIX . "manufacturer_description SET seo_title = '" . $this->db->escape($finalTitle) . "' where manufacturer_id = " . (int)$manufacturer['manufacturer_id'] . " and language_id = " . (int)$manufacturer['language_id']);
        }	
    }
	
	public function deleteMetaTitleManufacturers() {
		$query = $this->db->query("update " . DB_PREFIX . "manufacturer_description set seo_title = '';");
		
		$this->cache->delete('manufacturer');
	}
	
	public function generateMetaKeywordsManufacturers($template,  $source_langcode) {
		$slugs = array();			
		$manufacturers = $this->getManufacturersForMeta();
        foreach ($manufacturers as $manufacturer) {	
			if (!is_null($manufacturer['meta_keyword']) && strlen($manufacturer['meta_keyword']) > 0){
				continue;
			}
			$tags = array(
				'[manufacturer_name]' => $manufacturer['name'],
				'[store_name]' 		  => $this->config->get('config_name')
            );
			$finalKeywords = array();
            $MetaKeywords = explode(',', strtr($template, $tags));
            
            foreach ($MetaKeywords as $keyword) {
                $finalKeywords[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalKeywords = array_filter(array_unique($finalKeywords));
            $finalKeywords = implode(', ', $finalKeywords);

            $this->db->query("UPDATE " . DB_PREFIX . "manufacturer_description SET meta_keyword = '" . $this->db->escape($finalKeywords) . "' where manufacturer_id = " . (int)$manufacturer['manufacturer_id'] . " and language_id = " . (int)$manufacturer['language_id']);
        }	
    }
	
	public function deleteKeywordsManufacturers() {
		$query = $this->db->query("update " . DB_PREFIX . "manufacturer_description set meta_keyword = '';");
		
		$this->cache->delete('manufacturer');
	}
	
	public function generateMetaDescriptionManufacturers($template,  $source_langcode) {
		$slugs = array();			
		$manufacturers = $this->getManufacturersForMeta();
        foreach ($manufacturers as $manufacturer) {	
			if (!is_null($manufacturer['meta_description']) && strlen($manufacturer['meta_description']) > 0){
				continue;
			}
			$tags = array(
				'[manufacturer_name]' => $manufacturer['name'],
				'[description]' 	  => utf8_substr(strip_tags(html_entity_decode($manufacturer['description'], ENT_QUOTES, 'UTF-8')), 0, 200),
            );
			$finalDescription = array();
            $MetaDescription = explode(',', strtr($template, $tags));
            
            foreach ($MetaDescription as $keyword) {
                $finalDescription[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalDescription = array_filter(array_unique($finalDescription));
            $finalDescription = implode(', ', $finalDescription);

            $this->db->query("UPDATE " . DB_PREFIX . "manufacturer_description SET meta_description = '" . $this->db->escape($finalDescription) . "' where manufacturer_id = " . (int)$manufacturer['manufacturer_id'] . " and language_id = " . (int)$manufacturer['language_id']);
        }	
    }
	
	public function deleteMetaDescriptionManufacturers() {
		$query = $this->db->query("update " . DB_PREFIX . "manufacturer_description set meta_description = '';");
		
		$this->cache->delete('manufacturer');
	}
	
	// Informations
	public function generateInformation($information_id, $informationTitle, $template, $source_langcode) {
		$slugs = $this->getSlugs('information_id');
		$tags = array('[information_title]' => $informationTitle);
		$slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode);
		$index = 1;
		while (in_array($uniqueSlug, $slugs)) {
			$uniqueSlug = $slug . '-' . $index++;
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'information_id=" . (int)$information_id . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
	}
	
	public function generateInformations($template, $suffix, $source_langcode, $overwrite) {
        $informations = $this->getInformations($overwrite);
        $slugs = $this->getExistingSlugs();
        foreach ($informations as $information) {
            unset($slugs['information_id=' . $information['information_id']]);
            $tags = array(
				'[information_title]' 	  => $information['title']
            );
            $slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode) . $suffix;
            $index = 1;
            while (in_array($uniqueSlug, $slugs)) {
                $uniqueSlug = $slug . '-' . $index++;
            }
            $slugs[] = $uniqueSlug;
            $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'information_id=" . (int)$information['information_id'] . "'");
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'information_id=" . (int)$information['information_id'] . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
        }
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
    }
	
	public function generateMetaH1Informations($template,  $source_langcode) {
		$slugs = array();			
		$informations = $this->getInformationsForMeta();
        foreach ($informations as $information) {
			if (!is_null($information['seo_h1']) && strlen($information['seo_h1']) > 0){
				continue;
			}
			$tags = array(
				'[information_title]' 	  => $information['title']
            );
			$finalH1 = array();
            $h1 = explode(',', strtr($template, $tags));
            
            foreach ($h1 as $keyword) {
                $finalH1[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalH1 = array_filter(array_unique($finalH1));
            $finalH1 = implode(', ', $finalH1);

            $this->db->query("UPDATE " . DB_PREFIX . "information_description SET seo_h1 = '" . $this->db->escape($finalH1) . "' where information_id = " . (int)$information['information_id'] . " and language_id = " . (int)$information['language_id']);
        }	
    }
	
	public function deleteMetaH1Informations() {
		$query = $this->db->query("update " . DB_PREFIX . "information_description set seo_h1 = '';");
		
		$this->cache->delete('information');
	}
	
	public function generateMetaTitleInformations($template,  $source_langcode) {
		$slugs = array();			
		$informations = $this->getInformationsForMeta();
        foreach ($informations as $information) {	
			if (!is_null($information['seo_title']) && strlen($information['seo_title']) > 0){
				continue;
			}
			$tags = array(
				'[information_title]' 	  => $information['title']
            );
			$finalTitle = array();
            $Title = explode(',', strtr($template, $tags));
            
            foreach ($Title as $keyword) {
                $finalTitle[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalTitle = array_filter(array_unique($finalTitle));
            $finalTitle = implode(', ', $finalTitle);

            $this->db->query("UPDATE " . DB_PREFIX . "information_description SET seo_title = '" . $this->db->escape($finalTitle) . "' where information_id = " . (int)$information['information_id'] . " and language_id = " . (int)$information['language_id']);
        }	
    }
	
	public function deleteMetaTitleInformations() {
		$query = $this->db->query("update " . DB_PREFIX . "information_description set seo_title = '';");
		
		$this->cache->delete('information');
	}
	
	public function generateMetaKeywordsInformations($template,  $source_langcode) {
		$slugs = array();			
		$informations = $this->getInformationsForMeta();
        foreach ($informations as $information) {	
			if (!is_null($information['meta_keyword']) && strlen($information['meta_keyword']) > 0){
				continue;
			}
			$tags = array(
				'[information_title]' => $information['title'],
				'[store_name]' 		  => $this->config->get('config_name')
            );
			$finalKeywords = array();
            $MetaKeywords = explode(',', strtr($template, $tags));
            
            foreach ($MetaKeywords as $keyword) {
                $finalKeywords[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalKeywords = array_filter(array_unique($finalKeywords));
            $finalKeywords = implode(', ', $finalKeywords);

            $this->db->query("UPDATE " . DB_PREFIX . "information_description SET meta_keyword = '" . $this->db->escape($finalKeywords) . "' where information_id = " . (int)$information['information_id'] . " and language_id = " . (int)$information['language_id']);
        }	
    }
	
	public function deleteKeywordsInformations() {
		$query = $this->db->query("update " . DB_PREFIX . "information_description set meta_keyword = '';");
		
		$this->cache->delete('information');
	}
	
	public function generateMetaDescriptionInformations($template,  $source_langcode) {
		$slugs = array();			
		$informations = $this->getInformationsForMeta();
        foreach ($informations as $information) {	
			if (!is_null($information['meta_description']) && strlen($information['meta_description']) > 0){
				continue;
			}
			$tags = array(
				'[information_title]' => $information['title'],
				'[description]' 	  => utf8_substr(strip_tags(html_entity_decode($information['description'], ENT_QUOTES, 'UTF-8')), 0, 200),
            );
			$finalDescription = array();
            $MetaDescription = explode(',', strtr($template, $tags));
            
            foreach ($MetaDescription as $keyword) {
                $finalDescription[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalDescription = array_filter(array_unique($finalDescription));
            $finalDescription = implode(', ', $finalDescription);

            $this->db->query("UPDATE " . DB_PREFIX . "information_description SET meta_description = '" . $this->db->escape($finalDescription) . "' where information_id = " . (int)$information['information_id'] . " and language_id = " . (int)$information['language_id']);
        }	
    }
	
	public function deleteMetaDescriptionInformations() {
		$query = $this->db->query("update " . DB_PREFIX . "information_description set meta_description = '';");
		
		$this->cache->delete('information');
	}
	
	// News Categories	
	public function generateNewsCategory($news_category_id, $news_categoryName, $template, $source_langcode) {
		$slugs = $this->getSlugs('news_category_id');
		$tags = array('[news_category_name]' => $news_categoryName);
		$slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode);
		$index = 1;
		while (in_array($uniqueSlug, $slugs)) {
			$uniqueSlug = $slug . '-' . $index++;
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_category_id=" . (int)$news_category_id . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
	}
	
    public function generateNewsCategories($template, $source_langcode, $overwrite) {
        $news_categories = $this->getNewsCategories($overwrite);
        $slugs = $this->getExistingSlugs();
        foreach ($news_categories as $news_category) {
            unset($slugs['news_category_id=' . $news_category['news_category_id']]);
            $tags = array('[news_category_name]' => $news_category['name']);
            $slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode);
            $index = 1;
            while (in_array($uniqueSlug, $slugs)) {
                $uniqueSlug = $slug . '-' . $index++;
            }
            $slugs[] = $uniqueSlug;
            $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_category_id=" . (int)$news_category['news_category_id'] . "'");
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_category_id=" . (int)$news_category['news_category_id'] . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
        }
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
    }
	
	public function generateMetaH1NewsCategories($template,  $source_langcode) {
		$slugs = array();			
		$news_categories = $this->getNewsCategoriesForMeta();
        foreach ($news_categories as $news_category) {
			if (!is_null($news_category['seo_h1']) && strlen($news_category['seo_h1']) > 0){
				continue;
			}
			$tags = array(
				'[news_category_name]' => $news_category['name'],
            );
			$finalH1 = array();
            $h1 = explode(',', strtr($template, $tags));
            
            foreach ($h1 as $keyword) {
                $finalH1[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalH1 = array_filter(array_unique($finalH1));
            $finalH1 = implode(', ', $finalH1);

            $this->db->query("UPDATE " . DB_PREFIX . "news_category_description SET seo_h1 = '" . $this->db->escape($finalH1) . "' where news_category_id = " . (int)$news_category['news_category_id'] . " and language_id = " . (int)$news_category['language_id']);
        }	
    }
	
	public function deleteMetaH1NewsCategories() {
		$query = $this->db->query("update " . DB_PREFIX . "news_category_description set seo_h1 = '';");
		
		$this->cache->delete('news_category');
	}
	
	public function generateMetaTitleNewsCategories($template,  $source_langcode) {
		$slugs = array();			
		$news_categories = $this->getNewsCategoriesForMeta();
        foreach ($news_categories as $news_category) {	
			if (!is_null($news_category['seo_title']) && strlen($news_category['seo_title']) > 0){
				continue;
			}
			$tags = array(
				'[news_category_name]' => $news_category['name'],
            );
			$finalTitle = array();
            $Title = explode(',', strtr($template, $tags));
            
            foreach ($Title as $keyword) {
                $finalTitle[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalTitle = array_filter(array_unique($finalTitle));
            $finalTitle = implode(', ', $finalTitle);

            $this->db->query("UPDATE " . DB_PREFIX . "news_category_description SET seo_title = '" . $this->db->escape($finalTitle) . "' where news_category_id = " . (int)$news_category['news_category_id'] . " and language_id = " . (int)$news_category['language_id']);
        }	
    }
	
	public function deleteMetaTitleNewsCategories() {
		$query = $this->db->query("update " . DB_PREFIX . "news_category_description set seo_title = '';");
		
		$this->cache->delete('news_category');
	}
	
	public function generateMetaKeywordsNewsCategories($template,  $source_langcode) {
		$slugs = array();			
		$news_categories = $this->getNewsCategoriesForMeta();
        foreach ($news_categories as $news_category) {	
			if (!is_null($news_category['meta_keyword']) && strlen($news_category['meta_keyword']) > 0){
				continue;
			}
			$tags = array(
				'[news_category_name]' 	=> $news_category['name'],
				'[store_name]' 			=> $this->config->get('config_name')
            );
			$finalKeywords = array();
            $MetaKeywords = explode(',', strtr($template, $tags));
            
            foreach ($MetaKeywords as $keyword) {
                $finalKeywords[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalKeywords = array_filter(array_unique($finalKeywords));
            $finalKeywords = implode(', ', $finalKeywords);

            $this->db->query("UPDATE " . DB_PREFIX . "news_category_description SET meta_keyword = '" . $this->db->escape($finalKeywords) . "' where news_category_id = " . (int)$news_category['news_category_id'] . " and language_id = " . (int)$news_category['language_id']);
        }	
    }
	
	public function deleteMetaKeywordsNewsCategories() {
		$query = $this->db->query("update " . DB_PREFIX . "news_category_description set meta_keyword = '';");
		
		$this->cache->delete('news_category');
	}
	
	public function generateMetaDescriptionNewsCategories($template,  $source_langcode) {
		$slugs = array();			
		$news_categories = $this->getNewsCategoriesForMeta();
        foreach ($news_categories as $news_category) {	
			if (!is_null($news_category['meta_description']) && strlen($news_category['meta_description']) > 0){
				continue;
			}
			$tags = array(
				'[news_category_name]' 	=> $news_category['name'],
				'[description]' 	 	=> utf8_substr(strip_tags(html_entity_decode($news_category['description'], ENT_QUOTES, 'UTF-8')), 0, 200),
            );
			$finalDescription = array();
            $MetaDescription = explode(',', strtr($template, $tags));
            
            foreach ($MetaDescription as $keyword) {
                $finalDescription[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalDescription = array_filter(array_unique($finalDescription));
            $finalDescription = implode(', ', $finalDescription);

            $this->db->query("UPDATE " . DB_PREFIX . "news_category_description SET meta_description = '" . $this->db->escape($finalDescription) . "' where news_category_id = " . (int)$news_category['news_category_id'] . " and language_id = " . (int)$news_category['language_id']);
        }	
    }
	
	public function deleteMetaDescriptionNewsCategories() {
		$query = $this->db->query("update " . DB_PREFIX . "news_category_description set meta_description = '';");
		
		$this->cache->delete('news_category');
	}
	
	// News
	public function generateArticle($news_id, $newsName, $template, $source_langcode) {
		$slugs = $this->getSlugs('news_id');
		$tags = array(
			'[news_name]' => $newsName
		);
		$slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode);
		$index = 1;
		while (in_array($uniqueSlug, $slugs)) {
			$uniqueSlug = $slug . '-' . $index++;
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
	}
	
	public function generateNews($template, $suffix, $source_langcode, $overwrite) {
        $articles = $this->getNews($overwrite);
        $slugs = $this->getExistingSlugs();
        foreach ($articles as $article) {
            unset($slugs['news_id=' . $article['news_id']]);
            $tags = array(
				'[news_name]' 	  => $article['name']
            );
            $slug = $uniqueSlug = $this->makeSlugs(strtr($template, $tags), 0, true, $source_langcode) . $suffix;
            $index = 1;
            while (in_array($uniqueSlug, $slugs)) {
                $uniqueSlug = $slug . '-' . $index++;
            }
            $slugs[] = $uniqueSlug;
            $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$article['news_id'] . "'");
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$article['news_id'] . "', keyword = '" . $this->db->escape($uniqueSlug) . "'");
        }
		$this->cache->delete('seo_pro');
        $this->cache->delete('seo_url');
    }
	
	public function generateMetaH1News($template,  $source_langcode) {
        $articles = $this->getNewsForMeta();
        $slugs = array();
        foreach ($articles as $article) {
			if (!is_null($article['seo_h1']) && strlen($article['seo_h1']) > 0){
				continue;
			}
            $finalNewsCategories = array();
            $news_categories = $this->getNewsCategoriesNews($article['news_id'], $article['language_id']);
            foreach ($news_categories as $news_category) {
                $finalNewsCategories[] = $news_category['name'];
            }
            $tags = array(
				'[news_name]' 	  		=> $article['name'],
                '[news_category_name]'  => implode(',', $finalNewsCategories)
            );
            $finalH1 = array();
            $h1 = explode(',', strtr($template, $tags));
            
            foreach ($h1 as $keyword) {
                $finalH1[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalH1 = array_filter(array_unique($finalH1));
            $finalH1 = implode(', ', $finalH1);
            $this->db->query("UPDATE " . DB_PREFIX . "news_description SET seo_h1 = '" . $this->db->escape($finalH1) . "' where news_id = " . (int)$article['news_id'] . " and language_id = " . (int)$article['language_id']);
        }
    }
	
	public function deleteMetaH1News() {
		$query = $this->db->query("update " . DB_PREFIX . "news_description set seo_h1 = '';");
		
		$this->cache->delete('news');
	}
	
	public function generateMetaTitleNews($template,  $source_langcode) {
        $articles = $this->getNewsForMeta();
        $slugs = array();
        foreach ($articles as $article) {
			if (!is_null($article['seo_title']) && strlen($article['seo_title']) > 0){
				continue;
			}
            $finalNewsCategories = array();
            $news_categories = $this->getNewsCategoriesNews($article['news_id'], $article['language_id']);
            foreach ($news_categories as $news_category) {
                $finalNewsCategories[] = $news_category['name'];
            }
            $tags = array(
				'[news_name]' 	  		=> $article['name'],
                '[news_category_name]'  => implode(',', $finalNewsCategories)
            );
            $finalTitle = array();
            $title = explode(',', strtr($template, $tags));
            
            foreach ($title as $keyword) {
                $finalTitle[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalTitle = array_filter(array_unique($finalTitle));
            $finalTitle = implode(', ', $finalTitle);
            $this->db->query("UPDATE " . DB_PREFIX . "news_description SET seo_title = '" . $this->db->escape($finalTitle) . "' where news_id = " . (int)$article['news_id'] . " and language_id = " . (int)$article['language_id']);
        }
    }
	
	public function deleteMetaTitleNews() {
		$query = $this->db->query("update " . DB_PREFIX . "news_description set seo_title = '';");
		
		$this->cache->delete('news');
	}
	
	public function generateNewsMetaKeywords($template, $source_langcode) {
        $articles = $this->getNewsForMeta();
        foreach ($articles as $article) {
			if (!is_null($article['meta_keyword']) && strlen($article['meta_keyword']) > 0){
				continue;
			}
            $finalNewsCategories = array();
            $news_categories = $this->getNewsCategoriesNews($article['news_id'], $article['language_id']);
            foreach ($news_categories as $news_category) {
                $finalNewsCategories[] = $news_category['name'];
            }
            $tags = array(
				'[news_name]' 	  		=> $article['name'],
                '[news_category_name]'  => implode(',', $finalNewsCategories),
				'[store_name]' 			=> $this->config->get('config_name')
            );
            $finalKeywords = array();
            $keywords = explode(',', strtr($template, $tags));
            foreach ($keywords as $keyword) {
				$finalKeywords[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalKeywords = array_filter(array_unique($finalKeywords));
            $finalKeywords = implode(', ', $finalKeywords);
            $this->db->query("UPDATE " . DB_PREFIX . "news_description SET meta_keyword = '" . $this->db->escape($finalKeywords) . "' where news_id = " . (int)$article['news_id'] . " and language_id = " . (int)$article['language_id']);
        }
    }
	
	public function deleteKeywordsNews() {
		$query = $this->db->query("update " . DB_PREFIX . "news_description set meta_keyword = '';");
		
		$this->cache->delete('news');
	}
	
	public function generateTagsNews($template, $source_langcode) {
        $articles = $this->getNewsForMeta();
        foreach ($articles as $article) {
			if (!is_null($article['tag']) && strlen($article['tag']) > 0){
				continue;
			}
            $finalNewsCategories = array();
            $news_categories = $this->getNewsCategoriesNews($article['news_id'], $article['language_id']);
            foreach ($news_categories as $news_category) {
                $finalNewsCategories[] = $news_category['name'];
            }
            $tags = array(
				'[news_name]' 	  		=> $article['name'],
                '[news_category_name]'  => implode(',', $finalNewsCategories),
				'[store_name]' 			=> $this->config->get('config_name')
            );
            $finalKeywords = array();
            $keywords = explode(',', strtr($template, $tags));
            foreach ($keywords as $keyword) {
                $finalKeywords[] = $this->makeSlugss(trim($keyword), 0, false, $source_langcode);
            }
            $finalKeywords = array_filter(array_unique($finalKeywords));
            $this->db->query("UPDATE " . DB_PREFIX . "news_description SET tag = '" . $this->db->escape(implode(',', $finalKeywords)) . "' WHERE news_id = " . (int)$article['news_id'] . " AND language_id = " . (int)$article['language_id']);
        }
    }
	
	public function deleteTagsNews() {
		$query = $this->db->query("update " . DB_PREFIX . "news_description set tag = '';");
		
		$this->cache->delete('news');
	}
	
	public function generateMetaDescriptionNews($template,  $source_langcode) {
        $articles = $this->getNewsForMeta();
        foreach ($articles as $article) {
			if (!is_null($article['meta_description']) && strlen($article['meta_description']) > 0){
				continue;
			}
            $finalNewsCategories = array();
            $news_categories = $this->getNewsCategoriesNews($article['news_id'], $article['language_id']);
            foreach ($news_categories as $news_category) {
                $finalNewsCategories[] = $news_category['name'];
            }
            $tags = array(
				'[news_name]' 	  		=> $article['name'],
                '[news_category_name]'  => implode(',', $finalNewsCategories),
				'[store_name]' 			=> $this->config->get('config_name'),
				'[description]'  	  	=> utf8_substr(strip_tags(html_entity_decode($article['description'], ENT_QUOTES, 'UTF-8')), 0, 200)
            );
            $finalDescription = array();
            $description = explode(',', strtr($template, $tags));
            
             foreach ($description as $description) {
                $finalDescription[] = $this->makeSlugss(trim($description), 0, false, $source_langcode); 
				$finalDescription = preg_replace("~\s+~", " ", $finalDescription);
            }
            $finalDescription = array_filter(array_unique($finalDescription));
            $finalDescription = implode(', ', $finalDescription);
            $this->db->query("UPDATE " . DB_PREFIX . "news_description SET meta_description = '" . $this->db->escape($finalDescription) . "' where news_id = " . (int)$article['news_id'] . " and language_id = " . (int)$article['language_id']);
        }
    }
	
	public function deleteMetaDescriptionNews() {
		$query = $this->db->query("update " . DB_PREFIX . "news_description set meta_description = '';");
		
		$this->cache->delete('news');
	}
	
	// -------------------------------------------------------------------------------------------------- //

    private function getCategories($overwrite) {
        $query = $this->db->query("SELECT c.category_id, cd.name, c.parent_id, cd.language_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "url_alias a ON (CONCAT('category_id=', c.category_id) = a.query) WHERE cd.language_id = " . (int)$this->config->get('config_language_id') . ($overwrite ? '' : ' AND a.query IS NULL') . " ORDER BY c.sort_order, cd.name ASC");
        return $query->rows;
    }
	
	private function getCategoriesForMeta() {
        $query = $this->db->query("SELECT c.category_id, cd.name, cd.description, cd.meta_keyword, cd.meta_description, cd.seo_title, cd.seo_h1, cd.language_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) ORDER BY cd.name ASC");
        return $query->rows;
    }
	
	private function getSlugs($query_starts) {
		$result = array();
		$query = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "url_alias` WHERE `query` like '" . $query_starts . "=%'");
		foreach ($query->rows as $row) {
			$result[] = $row['keyword'];
		}
		return $result;
	}

    private function getProductCategories($productId, $languageId) {
        $query = $this->db->query("SELECT c.category_id, cd.name FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) INNER JOIN " . DB_PREFIX . "product_to_category pc ON (pc.category_id = c.category_id) WHERE cd.language_id = " . (int)$languageId . " AND pc.product_id = " . (int)$productId . " ORDER BY c.sort_order, cd.name ASC");
        return $query->rows;
    }

    private function getProducts($overwrite) {
        $query = $this->db->query("SELECT p.product_id, pd.name, p.model, m.name as manufacturer_name FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) LEFT JOIN " . DB_PREFIX . "url_alias a ON (CONCAT('product_id=', p.product_id) = a.query) WHERE pd.language_id = " . (int)$this->config->get('config_language_id') . ($overwrite ? '' : ' AND a.query IS NULL') . " ORDER BY pd.name ASC");
        return $query->rows;
    }
	
	private function getProductsForMeta() {
        $query = $this->db->query("SELECT p.product_id, pd.name, p.model, p.sku, p.price, m.name as manufacturer_name, pd.description, pd.meta_keyword, pd.meta_description, pd.tag, pd.seo_title, pd.seo_h1, pd.language_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) ORDER BY pd.name ASC");
        return $query->rows;
    }

	private function getManufacturers($overwrite) {
        $query = $this->db->query("SELECT m.manufacturer_id, m.name FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "url_alias a ON (CONCAT('manufacturer_id=', m.manufacturer_id) = a.query)" . ($overwrite ? '' : ' WHERE a.query IS NULL') . " ORDER BY m.name ASC");
        return $query->rows;
    }
	
	public function getManufacturerName($manufacturer_id) {
		$row = $this->db->query("SELECT name FROM " . DB_PREFIX . "manufacturer WHERE manufacturer_id = '" . (int) $manufacturer_id . "'");
		if(isset($row->row['name'])){
			return $row->row['name'];
		}
	}
	
	private function getManufacturersForMeta() {
        $query = $this->db->query("SELECT m.manufacturer_id, m.name, md.description, md.meta_keyword, md.meta_description, md.seo_title, md.seo_h1, md.language_id FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id) ORDER BY m.name ASC");
        return $query->rows;
    }
	
	private function getInformations($overwrite) {
        $query = $this->db->query("SELECT i.information_id, id.title FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) LEFT JOIN " . DB_PREFIX . "url_alias a ON (CONCAT('information_id=', i.information_id) = a.query) WHERE id.language_id = " . (int)$this->config->get('config_language_id') . ($overwrite ? '' : ' AND a.query IS NULL') . " ORDER BY id.title ASC");
        return $query->rows;
    }
	
	private function getInformationsForMeta() {
        $query = $this->db->query("SELECT i.information_id, id.title, id.description, id.meta_keyword, id.meta_description, id.seo_title, id.seo_h1, id.language_id FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) ORDER BY id.title ASC");
        return $query->rows;
    }
	
	private function getNewsCategories($overwrite) {
        $query = $this->db->query("SELECT n.news_category_id, nd.name, n.parent_id, nd.language_id FROM " . DB_PREFIX . "news_category n LEFT JOIN " . DB_PREFIX . "news_category_description nd ON (n.news_category_id = nd.news_category_id) LEFT JOIN " . DB_PREFIX . "url_alias a ON (CONCAT('news_category_id=', n.news_category_id) = a.query) WHERE nd.language_id = " . (int)$this->config->get('config_language_id') . ($overwrite ? '' : ' AND a.query IS NULL') . " ORDER BY n.sort_order, nd.name ASC");
        return $query->rows;
    }
	
	private function getNewsCategoriesForMeta() {
        $query = $this->db->query("SELECT n.news_category_id, nd.name, nd.description, nd.meta_keyword, nd.meta_description, nd.seo_title, nd.seo_h1, nd.language_id FROM " . DB_PREFIX . "news_category n LEFT JOIN " . DB_PREFIX . "news_category_description nd ON (n.news_category_id = nd.news_category_id) ORDER BY nd.name ASC");
        return $query->rows;
    }
	
	private function getNews($overwrite) {
        $query = $this->db->query("SELECT n.news_id, nd.name FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) LEFT JOIN " . DB_PREFIX . "url_alias a ON (CONCAT('news_id=', n.news_id) = a.query) WHERE nd.language_id = " . (int)$this->config->get('config_language_id') . ($overwrite ? '' : ' AND a.query IS NULL') . " ORDER BY nd.name ASC");
        return $query->rows;
    }
	
	private function getNewsCategoriesNews($newsId, $languageId) {
        $query = $this->db->query("SELECT n.news_category_id, nd.name FROM " . DB_PREFIX . "news_category n LEFT JOIN " . DB_PREFIX . "news_category_description nd ON (n.news_category_id = nd.news_category_id) INNER JOIN " . DB_PREFIX . "news_to_news_category nn ON (nn.news_category_id = n.news_category_id) WHERE nd.language_id = " . (int)$languageId . " AND nn.news_id = " . (int)$newsId . " ORDER BY n.sort_order, nd.name ASC");
        return $query->rows;
    }
	
	private function getNewsForMeta() {
        $query = $this->db->query("SELECT n.news_id, nd.name, nd.description, nd.meta_keyword, nd.meta_description, nd.tag, nd.seo_title, nd.seo_h1, nd.language_id FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) ORDER BY nd.name ASC");
        return $query->rows;
    }

    public function getLanguages() {
        $query = $this->db->query("SELECT substring(code,1,2) as code, name FROM " . DB_PREFIX . "language");
        return $query->rows;
    }

    public function getExistingSlugs() {
        $slugs = array();
        $query = $this->db->query("SELECT query, keyword FROM " . DB_PREFIX . "url_alias");
        foreach ($query->rows as $row) {
            $slugs[$row['query']] = $row['keyword'];
        }
        return $slugs;
    }

    private function my_str_split($string) {
        $slen = strlen($string);
        for ($i = 0; $i < $slen; $i++) {
            $sArray[$i] = $string{$i};
        }
        return $sArray;
    }

    function _transliteration_process($string, $unknown = '?', $source_langcode = NULL) {
        if (!preg_match('/[\x80-\xff]/', $string)) {
            return $string;
        }
        static $tailBytes;

        if (!isset($tailBytes)) {
            $tailBytes = array();
            for ($n = 0; $n < 256; $n++) {
                if ($n < 0xc0) {
                    $remaining = 0;
                } elseif ($n < 0xe0) {
                    $remaining = 1;
                } elseif ($n < 0xf0) {
                    $remaining = 2;
                } elseif ($n < 0xf8) {
                    $remaining = 3;
                } elseif ($n < 0xfc) {
                    $remaining = 4;
                } elseif ($n < 0xfe) {
                    $remaining = 5;
                } else {
                    $remaining = 0;
                }
                $tailBytes[chr($n)] = $remaining;
            }
        }
        preg_match_all('/[\x00-\x7f]+|[\x80-\xff][\x00-\x40\x5b-\x5f\x7b-\xff]*/', $string, $matches);

        $result = '';
        foreach ($matches[0] as $str) {
            if ($str[0] < "\x80") {
                $result .= $str;
                continue;
            }
            $head = '';
            $chunk = strlen($str);
            $len = $chunk + 1;

            for ($i = -1; --$len;) {
                $c = $str[++$i];
                if ($remaining = $tailBytes[$c]) {
                    $sequence = $head = $c;
                    do {
                        if (--$len && ($c = $str[++$i]) >= "\x80" && $c < "\xc0") {
                            $sequence .= $c;
                        } else {
                            if ($len == 0) {
                                $result .= $unknown;
                                break 2;
                            } else {
                                $result .= $unknown;
                                --$i;
                                ++$len;
                                continue 2;
                            }
                        }
                    } while (--$remaining);

                    $n = ord($head);
                    if ($n <= 0xdf) {
                        $ord = ($n - 192) * 64 + (ord($sequence[1]) - 128);
                    } elseif ($n <= 0xef) {
                        $ord = ($n - 224) * 4096 + (ord($sequence[1]) - 128) * 64 + (ord($sequence[2]) - 128);
                    } elseif ($n <= 0xf7) {
                        $ord = ($n - 240) * 262144 + (ord($sequence[1]) - 128) * 4096 + (ord($sequence[2]) - 128) * 64 + (ord($sequence[3]) - 128);
                    } elseif ($n <= 0xfb) {
                        $ord = ($n - 248) * 16777216 + (ord($sequence[1]) - 128) * 262144 + (ord($sequence[2]) - 128) * 4096 + (ord($sequence[3]) - 128) * 64 + (ord($sequence[4]) - 128);
                    } elseif ($n <= 0xfd) {
                        $ord = ($n - 252) * 1073741824 + (ord($sequence[1]) - 128) * 16777216 + (ord($sequence[2]) - 128) * 262144 + (ord($sequence[3]) - 128) * 4096 + (ord($sequence[4]) - 128) * 64 + (ord($sequence[5]) - 128);
                    }
                    $result .= $this->_transliteration_replace($ord, $unknown, $source_langcode);
                    $head = '';
                } elseif ($c < "\x80") {
                    $result .= $c;
                    $head = '';
                } elseif ($c < "\xc0") {
                    if ($head == '') {
                        $result .= $unknown;
                    }
                } else {
                    $result .= $unknown;
                    $head = '';
                }
            }
        }
        return $result;
    }

    function _transliteration_replace($ord, $unknown = '?', $langcode = NULL) {
        static $map = array();

        $bank = $ord >> 8;

        if (!isset($map[$bank][$langcode])) {
            $file = dirname(__FILE__) . '/seo_manager_data/' . sprintf('x%02x', $bank) . '.php';
            if (file_exists($file)) {
                include $file;
                if ($langcode != 'en' && isset($variant[$langcode])) {
                    $map[$bank][$langcode] = $variant[$langcode] + $base;
                } else {
                    $map[$bank][$langcode] = $base;
                }
            } else {
                $map[$bank][$langcode] = array();
            }
        }

        $ord = $ord & 255;

        return isset($map[$bank][$langcode][$ord]) ? $map[$bank][$langcode][$ord] : $unknown;
    }
	
	private function makeSlugs($string, $maxlen = 0, $noSpace = true, $source_langcode = null) {
        global $session;
        $newStringTab = array();
        $string = strtolower($this->_transliteration_process(trim(html_entity_decode($string, ENT_QUOTES, "UTF-8")), '-', $source_langcode));
        if (function_exists('str_split')) {
            $stringTab = str_split($string);
        } else {
            $stringTab = $this->my_str_split($string);
        }
        $numbers = array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-");
        foreach ($stringTab as $letter) {
            if (in_array($letter, range("a", "z")) || in_array($letter, $numbers)) {
                $newStringTab[] = $letter;
            } elseif ($letter == " ") {
                if ($noSpace) {
                    $newStringTab[] = "-";
                } else {
                    $newStringTab[] = " ";
                }
            }
        }
        if (count($newStringTab)) {
            $newString = implode($newStringTab);
            if ($maxlen > 0) {
                $newString = substr($newString, 0, $maxlen);
            }
            $newString = $this->removeDuplicates('--', '-', $newString);
        } else {
            $newString = '';
        }
        return $newString;
    }
	
	private function makeSlugss($string, $maxlen = 0, $noSpace = true, $source_langcode = null) {
        global $session;
        $newStringTab = array();
        if (function_exists('str_split')) {
            $stringTab = str_split($string);
        } else {
            $stringTab = $this->my_str_split($string);
        }
        $numbers = array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-");
        foreach ($stringTab as $letter) {
            $newStringTab[] = $letter;
        }
        if (count($newStringTab)) {
            $newString = implode($newStringTab);
            if ($maxlen > 0) {
                $newString = substr($newString, 0, $maxlen);
            }
            $newString = $this->removeDuplicates('--', '-', $newString);
        } else {
            $newString = '';
        }
        return $newString;
    }

    private function removeDuplicates($sSearch, $sReplace, $sSubject) {
        $i = 0;
        do {
            $sSubject = str_replace($sSearch, $sReplace, $sSubject);
            $pos = strpos($sSubject, $sSearch);
            $i++;
            if ($i > 100) {
                die('removeDuplicates() loop error');
            }
        } while ($pos !== false);
        return $sSubject;
    }
}
?>