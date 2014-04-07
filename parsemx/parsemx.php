<?php

define('version', '1.20');

$CURL_timeout = 20;
require_once('platform.php');
register_shutdown_function('mxshutdown');
function mxshutdown()
{
    global $locker;
    $error = error_get_last();
    if ($error !== NULL) if (($error['type'] != 2)and($error['type'] != 8)and($error['line'])) {
        chdir(dirname(__FILE__));
        $info = "WARNING! " . $error['message'] . " in " . $error['file'] . " at line " . $error['line'];
        xlog($info);
        if (!empty($locker)) @unlink($locker);
    }
}

function google_images($text, $number = 1)
{
    if (!$text) if ($number == 1) return ""; else return array();
    $html = get('http://www.google.com/search?tbm=isch&q=' . replace('+', '%20', urlencode(trim($text))));
    $r = array();
    $images = insides('imgurl=', '&', $html);
    if (!$images) if ($number == 1) return ""; else return array();
    foreach ($images as $image) {
        if ($image) {
            $r[] = $image;
            if (count($r) == $number) break;
        }
    }
    if ($number == 1) return @$r[0]; else return $r;
}

function GetNewTranslations($from, $to)
{
    global $translations_checked;
    if (!empty($translations_checked[$to])) return;
    if (!file_exists('translate')) mkdir('translate');
    if (!file_exists('translate/' . $to)) mkdir('translate/' . $to);
    $files = glob('translate/' . $to . '/*.html');
    if ($files) foreach ($files as $file) {
        xlog("Importing <b>$file</b>...");
        $text_id = 0;
        $max_text_id = 0;
        xlog("Analyzing...");
        if (!ini_get('safe_mode')) set_time_limit(1200);
        $lines = insides('<p', '/p>', file_get_contents($file));
        xlog("Total " . count($lines) . " lines:");
        foreach ($lines as $i => $line) {
            if (($i > 0)and!($i % 1000)) {
                xlog(" - " . $i . " lines processed");
                $locker = 'locker.tmp';
                @unlink($locker);
                file_put_contents($locker, "");
                if (!ini_get('safe_mode')) set_time_limit(120);
            }
            $text_id = inside("id=\"", "\"", $line);
            $text = html_entity_decode(inside(">", "<", $line));
            if ($text_id and $text) {
                $q = query("SELECT translate_id FROM parsemx_translate WHERE text_id=$text_id AND lang='$to'")->row;
                if ($q) query("UPDATE parsemx_translate SET text='" . escape($text) . "' WHERE translate_id=" . $q['translate_id']); else query("INSERT INTO parsemx_translate SET text_id=$text_id, text='" . escape($text) . "', lang='$to'");
            }
            if ($text_id > $max_text_id) $max_text_id = $text_id;
        }
        @unlink($file);
        @unlink(str_replace($to, $from, $file));
    }
    $translations_checked[$to] = true;
    $files = glob('translate/' . $from . '/*.html');
    if (!$files) SaveUntranslatedLangFiles($from);
}

function NoTranslation($text)
{
    global $skip;
    if ($skip) return;
    if (is_array($text)) $text = $text[0];
    xlog("NOTICE: No translation for '$text', skipping product.");
    $skip = true;
}

function NewUntranslated($text, $from, $text_id)
{
    global $lasttr_url, $last_url;
    if (!file_exists('translate')) mkdir('translate');
    if (!file_exists('translate/' . $from)) mkdir('translate/' . $from);
    $files = glob('translate/' . $from . '/*.html');
    $file = '';
    $write = "<p id=\"$text_id\">$text</p>\n";
    if ($lasttr_url != $last_url) {
        $lasttr_url = $last_url;
        $write = "<p id=\"0\"><a target='_blank' href='$last_url'>$last_url</a></p>\n" . $write;
    }
    if ($files) {
        sort($files);
        $file = end($files);
        clearstatcache();
        $maxsize = 1024 * 1024 - 24;
        if (filesize($file) + strlen($write) > $maxsize) {
            xlog("NOTICE: $file is full.");
            $file = '';
        }
    }
    if (!$file) {
        $file = 'translate/' . $from . '/' . 'TR' . date('ymd') . '-A';
        while (file_exists($file . '.html')) $file[strlen($file) - 1] = chr(ord($file[strlen($file) - 1]) + 1);
        $file .= '.html';
        xlog("Creating $file...");
        $f = fopen($file, 'w');
        fclose($f);
    }
    $f = fopen($file, 'a');
    fwrite($f, $write);
    fclose($f);
}

function SaveUntranslatedLangFiles($lang = 'EN')
{
    if (!ini_get('safe_mode')) set_time_limit(600);
    $entries = query("SELECT text_id, text, lang, COUNT(*) as n FROM parsemx_translate GROUP BY text_id HAVING (lang='$lang') and (n=1)")->rows;
    if (!count($entries)) return;
    xlog(count($entries) . ' untranslated entries found.');
    foreach ($entries as $i => $entry) {
        if (($i > 0)and!($i % 1000)) xlog(" - " . $i . " entries processed");
        NewUntranslated($entry['text'], $lang, $entry['text_id']);
    }
}

function wtranslate($text, $from = 'EN', $to = '')
{
    global $last_url;
    $data['text'] = $text;
    $data['from'] = $from;
    $data['to'] = $to;
    $data['url'] = $last_url;
    $res = _curl(HTTP_CATALOG . 'parsemx/parsemx.php?wtranslate=1', 'data=' . serialize($data));
    $res = str_replace('(charset=UTF-8)', '', $res);
    $res = unserialize(htmlspecialchars_decode($res));
    if ($res == '!@#') {
        NoTranslation($text);
        return $text;
    }
    return $res;
}

function translate($text, $from = 'EN', $to = '', $no_split = false)
{
    if (!$text) return "";
    if ($from == $to) return $text;
    if (is_array($text)) {
        foreach ($text as $i => $line) $text[$i] = translate($line, $from, $to);
        return $text;
    }
    $text = str_replace('  ', ' ', $text);
    $text = str_replace('  ', ' ', $text);
    $text = trim($text);
    if (is_numeric($text)) return $text;
    if (!$to) $to = g('default_lang');
    if (!$to) return $text;
    $from = strtoupper($from);
    $to = strtoupper($to);
    if (!$text) return "";
    $openers = array('<');
    $closers = array('>');
    if (!$no_split and((strpos($text, '.')and(strpos($text, '.') < strlen($text) - 1))or(strpos($text, '<') !== false))) {
        $start = 0;
        $p = 0;
        while ($p <= strlen($text)) {
            if (($p == strlen($text))or in_array($text[$p], $openers)) {
                if ($p and ctype_space(@$text[$p - 1])) $p--;
                if ($p > $start) {
                    $sentence = substr($text, $start, $p - $start);
                    $slen = strlen($sentence);
                    $sentence = translate($sentence, $from, $to, true);
                    $text = substr($text, 0, $start) . $sentence . substr($text, $p);
                    $p = $p + strlen($sentence) - $slen;
                }
                $i = array_search(@$text[$p], $openers);
                if ($p < strlen($text)) {
                    $p = strpos($text, $closers[$i], $p);
                    if ($p == false) break; else $start = $p + 1;
                    if (($start < strlen($text))and ctype_space($text[$start])) $start++;
                }
            } else if ((@$text[$p] == '.')and(ctype_space(@$text[$p + 1])or in_array(@$text[$p + 1], $openers))) {
                $sentence = substr($text, $start, $p - $start + 1);
                $slen = strlen($sentence);
                $sentence = translate($sentence, $from, $to, true);
                $text = substr($text, 0, $start) . $sentence . substr($text, $p + 1);
                $p = $p + strlen($sentence) - $slen;
                if (ctype_space($text[$p + 1])) $p++;
                $start = $p + 1;
            }
            $p++;
        }
        return $text;
    } else if (strlen($text) > 2000) {
        $p = strrpos($text, ' ', 2000);
        if (!$p) $p = 1999;
        return translate(substr($text, 0, $p), $from, $to) . ' ' . translate(substr($text, $p + 1));
    } else {
        GetNewTranslations($from, $to);
        $q = query("SELECT text_id FROM parsemx_translate WHERE text='" . escape($text) . "' AND lang='$from'")->row;
        if ($q) {
            $text_id = $q['text_id'];
            $q = query("SELECT text FROM parsemx_translate WHERE text_id=$text_id AND lang='$to'")->row;
            if ($q) return $q['text']; else {
                NoTranslation($text);
                return $text;
            }
        } else {
            $text_id = @query("SELECT text_id FROM parsemx_translate ORDER BY text_id DESC LIMIT 1")->row['text_id'] + 1;
            query("INSERT INTO parsemx_translate SET text_id=$text_id, text='" . escape($text) . "', lang='$from'");
            NewUntranslated($text, $from, $text_id);
            NoTranslation($text);
            return $text;
        }
    }
}

function saveinfo($info, $tag = "", $id = 0)
{
    global $donor_id;
    if (!$info) return 0;
    $q = "SELECT id FROM parsemx_info WHERE (donor_id=$donor_id) and (tag='$tag') and (info='" . escape($info) . "')";
    if ($id) $q .= " and (id=$id)";
    $found = query($q)->row;
    if ($found) return $found['id'];
    if (!$id) {
        $q = query("SELECT id from parsemx_info WHERE (donor_id=$donor_id) and (tag='$tag') ORDER BY id DESC LIMIT 1")->row;
        @$id = $q['id'] + 1;
    }
    query("INSERT into parsemx_info SET id=$id, donor_id=$donor_id, tag='$tag', info='" . escape($info) . "'");
    return $id;
}

function deleteinfo($tag, $id)
{
    global $donor_id;
    query("DELETE FROM parsemx_info WHERE (id=$id) and (donor_id=$donor_id) and (tag='$tag')");
}

function loadinfo($tag = "", $id = 1)
{
    global $donor_id;
    $q = query("SELECT info FROM parsemx_info WHERE (id=$id) and (donor_id=$donor_id) and (tag='$tag') LIMIT 1")->row;
    return @$q['info'];
}

function loadinfos($tag = "", $id = 0)
{
    global $donor_id;
    $q = "SELECT info FROM parsemx_info WHERE (donor_id=$donor_id) and (tag='$tag')";
    if ($id) $q .= " and (id=$id)";
    $r = array();
    foreach (query($q)->rows as $row) $r[] = $row['info'];
    return $r;
}

function GenerateScripts($name)
{
    require_once('scripter.php');
    $lines = file($name . '.txt', FILE_IGNORE_NEW_LINES and FILE_SKIP_EMPTY_LINES);
    $section = '';
    $php_mode = false;
    $f = false;
    foreach ($lines as $line) {
        if ($php_mode) {
            if (strpos($line, '//END') !== false) $php_mode = false; else@fwrite($f, $line . "\n");
        } else if (@$line[0] == '[') {
            if ($section) {
                ScriptAfterSection($section, $f);
                fclose($f);
            }
            $section = strtolower(trim(substr($line, 1, strpos($line, ']') - 1)));
            $f = fopen($name . '_' . $section . '.php', 'w');
            fwrite($f, "<?php \n");
            fwrite($f, '// *** ParseMX autogenerated script. Do not edit. Generated at ' . date("F j, Y, g:i a") . "\n");
            fwrite($f, '// *** SITE: ' . $_SERVER['SERVER_NAME'] . ' DONOR: ' . $name . ' SECTION: ' . $section . "\n\n");
            fwrite($f, "ini_set('display_errors','On');");
            ScriptBeforeSection($section, $f);
        } else if (strpos($line, '//PHP') !== false) $php_mode = true; else {
            $line = MxBasic($line);
            if (strtolower(trim($line)) == 'taskcommands();') $line = 'if ($s=PrepareScript()) include($s);';
            @fwrite($f, $line . "\n");
        }
    }
    ScriptAfterSection($section, $f);
    @fclose($f);
}

function DonorStart($ins_id, $donor_id)
{
    global $donor;
    if (!$ins_id) {
        DonorStop($donor_id);
    } else {
        LoadDonorMeters($donor_id);
    }
    if ($ins_id) {
        query("DELETE FROM parsemx_links WHERE ins_id = " . $ins_id);
    } else {
        query("DELETE FROM parsemx_links WHERE donor_id=" . $donor_id);
    }
    if ($ins_id) {
        $instructions = query("SELECT * FROM parsemx_ins WHERE donor_id = " . $donor_id . " AND ins_id = " . $ins_id)->rows;
    } else {
        $instructions = query("SELECT * FROM parsemx_ins WHERE donor_id = " . $donor_id . " AND status = 1")->rows;
    }
    //var_dump($instructions); die();
    if (!count($instructions)) {
        return;
    }
    $ins_id = $instructions[0]['ins_id'];
    $url = $instructions[0]['url'];
    if (!$donor['state']) {
        $donor['done_tasks'] = 0;
    }
    $data = array(
        "UPDATE parsemx_entities SET status=2 WHERE ins_id = " . $ins_id,
        "INSERT INTO parsemx_tasks (entity, url, ins_id, donor_id, z_order) VALUES ('list', '" . mysql_real_escape_string($url). "'," . $ins_id . "," . $donor_id . ", 4)",
        "UPDATE parsemx_donors SET state=2 WHERE donor_id=" . $donor_id,
    );
    $donor['active_tasks'] += $data[count($data) - 1];
    foreach ($data as $d) {
        query($d);
    }
    SaveDonorMeters();
}

function DonorStop($donor_id = 0, $mark = false)
{
    global $donor;
    SaveDonorMeters();
    LoadDonorMeters($donor_id);
    query("DELETE FROM parsemx_tasks WHERE donor_id=$donor_id");
    $donor['active_tasks'] = 0;
    SaveDonorMeters();
    query("UPDATE parsemx_donors SET state=0 WHERE donor_id=$donor_id");
    $q = query("SELECT DISTINCT tag FROM parsemx_info WHERE (donor_id=$donor_id)")->rows;
    if ($q) xlog("Cleaning up info...");
    foreach ($q as $tag) if (!ctype_upper(@substr($tag = $tag['tag'], 0, 1))) query("DELETE FROM parsemx_info WHERE (donor_id=$donor_id) and (tag='$tag')");
    if ($mark) {
        $total = query("SELECT count(*) as total FROM parsemx_entities WHERE donor_id=$donor_id AND status>0")->row['total'];
        if (!$total) return;
        $missing = query("SELECT count(*) as missing FROM parsemx_entities WHERE donor_id=$donor_id AND status=2")->row['missing'];
        if ($missing / $total > 0.5) {
            xlog("NOTICE: Too much missing entries - $missing. Mark action cancelled.");
            DonorPassFinished();
            return;
        }
        if ($missing > 0) xlog("NOTICE: Processing $missing missing entries.");
        $missing = query("SELECT * FROM parsemx_entities WHERE donor_id=$donor_id AND status=2")->rows;
        foreach ($missing as $entry) MissingEntity($entry['entity'], $entry['platform_id']);
        query("UPDATE parsemx_entities SET status=0 WHERE donor_id=$donor_id");
        DonorPassFinished();
        SaveDonorMeters();
    }
}

if (empty($host)) if (!@$_SERVER['SERVER_NAME']) $host = domain(HTTP_SERVER); else $host = domain($_SERVER['SERVER_NAME']);
function get_file($url, $savepath, $accesspath = '')
{
    if ($savepath[strlen($savepath) - 1] != '/') $savepath .= '/';
    $dirs = explode('/', $savepath);
    $path = '';
    foreach ($dirs as $dir) {
        if (!$dir) continue;
        if ($path) $path .= '/';
        $path .= $dir;
        if (!file_exists($path)) mkdir($path);
    }
    $l = parse_url($url);
    $name = stristr($l['path'], "/");
    $n = pathinfo($name);
    if (empty($n['extension'])) if (preg_match('/[\w\.]*\z/', $url, $m)) $n = pathinfo($m[0]);
    if (empty($n['extension'])or($n['extension'] == 'php')) $n['extension'] = 'jpg';
    global $image_filename;
    $xfilename = $image_filename;
    if (strpos($xfilename, '/')) $xfilename = trim(substr($xfilename, strrpos($image_filename, '/') + 1));
    if ($xfilename) $n['filename'] = $xfilename;
    $pathe = $savepath . $n['filename'];
    $add = '';
    while (file_exists($file = $pathe . $add . '.' . $n['extension'])) $add += 1;
    _curl($url, '', $file);
    if ((g('last_result') == 200)and file_exists($file)) {
        global $donor;
        $donor['total_files'] += 1;
        return $accesspath . $n['filename'] . $add . '.' . $n['extension'];
    }
    return '';
}

function g($name, $defaultValue = false)
{
    $result = $defaultValue;
    if (array_key_exists($name, $GLOBALS)) {
        $result = $GLOBALS[$name];
    }
    return $result;
}

function LoadDonorMeters($donor_id)
{
    global $donor;
    $q = query("SELECT * FROM parsemx_donors WHERE donor_id=$donor_id")->row;
    $donor = $q;
}

function SaveDonorMeters()
{
    global $donor;
    if (empty($donor['donor_id'])) return;
    query("UPDATE parsemx_donors SET total_entities=" . $donor['total_entities'] . ", active_tasks=" . $donor['active_tasks'] . ", done_tasks=" . $donor['done_tasks'] . ", total_files=" . $donor['total_files'] . " WHERE donor_id=" . $donor['donor_id']);
}

function RecountDonorMeters()
{
    global $donor;
    $donor['total_entities'] = query("SELECT count(*) as x FROM parsemx_entities e LEFT JOIN parsemx_ins i ON e.ins_id=i.ins_id  WHERE i.donor_id=" . $donor['donor_id'])->row['x'];
    $donor['active_tasks'] = query("SELECT count(task_id) as x FROM parsemx_tasks WHERE donor_id=" . $donor['donor_id'])->row['x'];
}

function DeleteDonorEntities($donor_id, $ins_id = 1)
{
    LoadDonorMeters($donor_id);
    global $donor;
    if ($ins_id) $entities = query("SELECT * FROM parsemx_entities WHERE donor_id=" . $donor['donor_id'] . " AND ins_id=" . $ins_id)->rows; else $entities = query("SELECT * FROM parsemx_entities WHERE donor_id=" . $donor['donor_id'])->rows;
    foreach ($entities as $entity) DeleteEntity($entity['entity'], $entity['platform_id']);
    SaveDonorMeters();
}

function EntityId($type, $platform_id)
{
    global $donor;
    $q = query("SELECT entity_id FROM parsemx_entities WHERE entity='$type' and platform_id=$platform_id and donor_id=" . $donor['donor_id'])->row;
    if ($q) return $q['entity_id']; else return false;
}

function EntityPlatformId($id)
{
    global $donor;
    $q = query("SELECT platform_id FROM parsemx_entities WHERE url='$id' and donor_id=" . $donor['donor_id'])->row;
    if ($q) return $q['platform_id']; else return false;
}

function DeleteEntity($type, $platform_id)
{
    global $donor;
    DeletePlatformEntity($type, $platform_id);
    $q = query("DELETE FROM parsemx_entities WHERE entity='$type' and platform_id=$platform_id");
    $donor['total_entities'] -= $q;
}

function AddEntity($id, $type, $platform_id)
{
    global $donor, $ins;
    query("INSERT INTO parsemx_entities SET ourl='" . escape(g('url')) . "', url='$id', status=1, entity='$type', platform_id=$platform_id, ins_id=" . $ins['ins_id'] . ", donor_id=" . $donor['donor_id']);
    $donor['total_entities']++;
}

function LiveEntity($type, $platform_id)
{
    query("UPDATE parsemx_entities SET status=1 WHERE entity='$type' AND platform_id=$platform_id");
}

function AddTasks($type, $ins_id, $tasks, $z_order = 0)
{
    global $donor;
    $donor_id = $donor['donor_id'];
    if (!$tasks) return 0;
    if (!is_array($tasks)) $tasks = array($tasks);
    $tasks = array_unique($tasks);
    global $info, $_saved_info, $_saved_info_id;
    if ($info != @$_saved_info) {
        $_saved_info_id = saveinfo($info, "task");
        $_saved_info = $info;
    }
    if (@!$_saved_info) $_saved_info_id = 0;
    global $info2, $_saved_info2, $_saved_info2_id;
    if ($info2 != @$_saved_info2) {
        $_saved_info2_id = saveinfo($info2, "task2");
        $_saved_info2 = $info2;
    }
    if (@!$_saved_info2) $_saved_info2_id = 0;
    global $info3, $_saved_info3, $_saved_info3_id;
    if ($info3 != @$_saved_info3) {
        $_saved_info3_id = saveinfo($info3, "task3");
        $_saved_info3 = $info3;
    }
    if (@!$_saved_info3) $_saved_info3_id = 0;
    $q = "INSERT INTO parsemx_tasks (entity,url,ins_id,donor_id,z_order,info,info2,info3) VALUES ";
    $q_links = "INSERT INTO parsemx_links (ins_id,donor_id,url) VALUES ";
    $first = true;
    $updated = 0;
    $added = 0;
    foreach ($tasks as $i => $url) {
        $url = trim($url);
        if (query("SELECT link_id FROM parsemx_links WHERE url=\"$url\" and ins_id=$ins_id")->row) continue;
        global $ids, $prices, $ins;
        if ($ids and($type == 'product')) {
            $id = $ids[$i];
            if (strpos($id, '://')) $id = urlencode($id);
            $product_id = EntityPlatformId($id);
            if ($product_id) {
                $qq = query("SELECT product_id FROM " . DB_PREFIX . "product WHERE product_id=$product_id")->row;
                if (!$qq) {
                    DeleteEntity('product', $product_id);
                    $product_id = 0;
                }
            }
            if ($product_id) {
                LiveEntity('product', $product_id);
                if ($prices) {
                    $x = $prices[$i];
                    $x = preg_replace('/[^0-9,.]/i', '', $x);
                    $price = $x;
                    eval($ins['price']);
                    $price = ((int)($price * 100)) / 100;
                    query("UPDATE " . DB_PREFIX . "product SET price=$price WHERE product_id=$product_id");
                }
                $updated++;
                continue;
            }
        }
        if (!$first) {
            $q .= ",";
            $q_links .= ",";
        } else $first = false;
        $q .= "('$type',\"$url\",$ins_id,$donor_id,$z_order,$_saved_info_id,$_saved_info2_id,$_saved_info3_id)";
        $q_links .= "($ins_id,$donor_id,\"$url\")";
        $added++;
    }
    if ($added) {
        query($q);
        query($q_links);
    }
    if ($updated) xlog($updated . " " . $type . "s updated");
    if ($added) xlog($added . " $type added to queue");
    $donor['active_tasks'] += $added;
    return count($added);
}

$site = 'unknown';
$last_url = '';
$last_base = '';
$last_result = 0;
function get($url, $retry = true)
{
    global $last_result, $site, $donor, $ohtml;
    $last_result = 200;
    if (!$url) return "";
    if (strpos($url, '://') === false) {
        $site = $donor['host'];
        if (file_exists($url)) return file_get_contents($url);
        $last_result = 404;
        return "";
    }
    if ($retry) {
        for ($i = 0; $i < 3; $i++) {
            $html = get($url, false);
            if (($last_result == 200)or($last_result == 302)) return $html;
            if ($last_result == 404) return $html;
        }
        return false;
    }
    global $curl_proxy;
    $fproxy = 'proxy.txt';
    $donor_id = $donor['donor_id'];
    if ($donor['proxy']) {
        if (!file_exists($fproxy)or(filemtime($fproxy) < microtime(true) - 24 * 60 * 60)) {
            xlog('Receiving fresh proxies list:');
            $curl_proxy = false;
            $purl = $donor['proxy'];
            $post = false;
            if ($p = strpos($purl, '#')) {
                $post = substr($purl, $p + 1);
                $purl = substr($purl, 0, $p);
            }
            $html = '';
            if (strpos($purl, '*')) {
                for ($i = 1; $i < 10; $i++) {
                    $html .= _curl(str_replace('*', $i, $purl), $post);
                    $q = query("SELECT state FROM parsemx_donors WHERE donor_id=$donor_id")->row;
                    if (!$q['state']and!g('test')) return false;
                }
            } else $html = _curl($purl, $post);
            $html = preg_replace('/^\s+|\n|\r|\s+$/m', '', $html);
            $html = preg_replace('/>\s*</', '><', $html);
            $html = str_replace('</td><td>', ':', $html);
            require_once('scripter.php');
            $html = replace('<span style="display:none">*</span>', '', $html);
            $html = replace("<span style='display:none'>*</span>", '', $html);
            $html = replace('<div style="display:none">*</div>', '', $html);
            $html = replace("<div style='display:none'>*</div>", '', $html);
            $html = replace("<*>", '', $html);
            if (preg_match_all('/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d{2,4}/', $html, $proxies)) {
                $text = "";
                xlog(count($proxies[0]) . ' proxies found.');
                foreach ($proxies[0] as $entry) $text .= $entry . "\n";
                file_put_contents($fproxy, $text);
                if (count($proxies[0]) < 3) {
                    xlog('WARNING: There should be at least 3 proxies, aborting.');
                    unlink($fproxy);
                    $last_result = 0;
                    DonorStop($donor['donor_id']);
                }
            } else {
                xlog('WARNING: Proxies not found.');
                DonorStop($donor['donor_id']);
            }
        }
    }
    if (!$curl_proxy and file_exists($fproxy)and $donor['proxy']) {
        $proxies = file($fproxy, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        while (true) {
            $q = query("SELECT state FROM parsemx_donors WHERE donor_id=$donor_id")->row;
            if (!$q['state']and!g('test')) return false;
            $xproxies = array();
            for ($i = 0; $i < 20; $i++) $xproxies[] = $proxies[array_rand($proxies)];
            xlog("Checking proxies...");
            $curl_proxy = testproxies($xproxies, $url);
            if ($curl_proxy) {
                xlog("Using proxy: " . $curl_proxy);
                break;
            }
        }
    }
    if (file_exists(domain($url) . '_pass.php')) {
        global $encoding, $user_agent;
        require(domain($url) . '_pass.php');
        global $http_auth;
        if (!empty($auth)) $http_auth = $auth;
        $html = _curl($url);
        if (!empty($login_check)) if (strpos($html, $login_check)) {
            xlog('Not logged in detected at ' . domain($url) . '. Authorizing...');
            $html = _curl($login_url, $login_data);
            if (strpos($html, $login_check)) {
                xlog('Authorization failed!');
                $last_result = 500;
                $curl_proxy = false;
                return false;
            }
            $html = _curl($url);
        }
    } else $html = _curl($url);
    $ohtml = $html;
    $html = preg_replace('/^\s+|\n|\r|\s+$/m', '', $html);
    $double = true;
    while ($double) $html = str_replace("  ", " ", $html, $double);
    $html = preg_replace('/>\s*</', '><', $html);
    $html = preg_replace('/\s*>/', '>', $html);
    $html = preg_replace('/<\s*/', '<', $html);
    return $html;
}

function domain($url)
{
    $url = strtolower(trim($url));
    if (strpos($url, '://') !== false) {
        $url = parse_url($url);
        @$url = $url['host'];
    }
    if ($url[strlen($url) - 1] == '/') $url = substr($url, 0, -1);
    if (substr($url, 0, 4) == "www.") $url = substr($url, 4);
    return $url;
}

function testproxies($proxies, $url)
{
    $timeout = 10;
    if ($p = strpos($url, '/', 8)) $url = substr($url, 0, $p + 1);
    $chs = array();
    $mh = curl_multi_init();
    if (strpos($url, 'aliexpress.com')) $url = 'http://www.aliexpress.com/activities/';
    foreach ($proxies as $proxy) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        @curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_PROXY, $proxy);
        curl_multi_add_handle($mh, $ch);
        $chs[] = $ch;
    }
    $active = 0;
    $start_time = microtime(true);
    do {
        if (microtime(true) - $start_time > $timeout) break;
        $status = curl_multi_exec($mh, $active);
        $info = curl_multi_info_read($mh);
        if (false !== $info) {
            $res = curl_getinfo($info['handle']);
            if (($res['http_code'] == 200)or($res['http_code'] == 302)) {
                $h = curl_multi_getcontent($info['handle']);
                require_once("scripter.php");
                $h = inside("<title>", "</title>", $h);
                if (strpos(strtoupper($h), 'BLOCK') !== false) $h = '';
                if (strpos(strtoupper($h), 'CONFIGURATION') !== false) $h = '';
                if (strpos(mb_strtoupper($h), 'блок') !== false) $h = '';
                if (strpos($h, '403') !== false) $h = '';
                $h2 = iconv('Windows-1251', 'UTF-8//IGNORE', $h);
                if (strpos(mb_strtoupper($h2), 'блок') !== false) $h = '';
                if ($h) {
                    $i = array_search($info['handle'], $chs);
                    foreach ($chs as $ch) curl_close($ch);
                    return $proxies[$i];
                }
            }
        }
        sleep(0.1);
    } while ($status === CURLM_CALL_MULTI_PERFORM || $active);
    foreach ($chs as $ch) curl_close($ch);
    return false;
}

function _curl($url, $post = '', $file = '', $log = true)
{
    if (isset($url) and is_string($url)) {
    } else {
        xlog('Invalid *_curl* call.');
        return null;
    }

    global $site, $last_url;

    $url = str_replace('&amp;', '&', $url);
    $url = str_replace('&amp;', '&', $url);
    $url = str_replace(' ', '%20', $url);
    xlog("Fetching <a href='$url' target='_blank'>$url</a>");

    $site = domain($url);

    $user_agent = array();
    $user_agent[] = 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.205 Safari/534.16';
    $user_agent[] = 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.6) Gecko/2007072300 Iceweasel/2.0.0.6 (Debian-2.0.0.6-0etch1+lenny1)';
    $user_agent[] = 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)';
    $user_agent[] = 'Mozilla/5.0 (X11; U; Linux i686; cs-CZ; rv:1.7.12) Gecko/20050929';
    $user_agent[] = 'Opera/9.80 (Windows NT 5.1; U; ru) Presto/2.9.168 Version/11.51';
    $user_agent[] = 'Mozilla/5.0 (Windows; I; Windows NT 5.1; ru; rv:1.9.2.13) Gecko/20100101 Firefox/4.0';
    $user_agent[] = 'Opera/9.80 (Windows NT 6.1; U; ru) Presto/2.8.131 Version/11.10';
    $user_agent[] = 'Opera/9.80 (Macintosh; Intel Mac OS X 10.6.7; U; ru) Presto/2.8.131 Version/11.10';
    $user_agent[] = 'Mozilla/5.0 (Macintosh; I; Intel Mac OS X 10_6_7; ru-ru) AppleWebKit/534.31+ (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1';

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_USERAGENT, $user_agent[array_rand($user_agent)]);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, g('CURL_timeout'));
    if (g('cookie')) curl_setopt($ch, CURLOPT_COOKIE, g('cookie'));
    curl_setopt($ch, CURLOPT_COOKIEFILE, 'cookie.txt');
    curl_setopt($ch, CURLOPT_COOKIEJAR, 'cookie.txt');
    curl_setopt($ch, CURLOPT_REFERER, $last_url);
    if (!$file) $last_url = $url;
    if (g('user_agent')) curl_setopt($ch, CURLOPT_USERAGENT, g('user_agent')); else curl_setopt($ch, CURLOPT_USERAGENT, 'Googlebot/2.1 (+http://www.google.com/bot.html)');
    if ($file) {
        $f = fopen($file, 'w');
        curl_setopt($ch, CURLOPT_FILE, $f);
    }
    if ($post) {
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
    }
    global $http_auth;
    if ($http_auth) curl_setopt($ch, CURLOPT_USERPWD, $http_auth);
    global $curl_proxy;
    if ($curl_proxy) {
        curl_setopt($ch, CURLOPT_PROXY, $curl_proxy);
    }
    if (!$file and!$post) $html = curl_redir_exec($ch); else $html = curl_exec($ch);
    if ($file) fclose($f); else {
        preg_match('/charset\s*="?[\w-]*/i', $html, $enc);
        if (!$enc) preg_match('/encoding\s*="?[\w-]*/i', $html, $enc);
        if ($enc) {
            $enc = $enc[0];
            $enc = trim(substr($enc, strpos($enc, '=') + 1));
            if ($enc[0] == '"') $enc = substr($enc, 1);
            if (g('encoding')) $enc = g('encoding');
        } else if (g('encoding')) $enc = g('encoding'); else $enc = "iso-8859-1";
        if (strpos(strtoupper($enc), 'UTF') === false) {
            if (g('test')) xlog('Converting from encoding: ' . $enc);
            $html = iconv($enc, 'UTF-8//IGNORE', $html);
            $html = str_replace($enc, 'UTF-8', $html);
        }
    }
    global $last_result;
    $last_result = curl_getinfo($ch);
    $last_result = $last_result['http_code'];
    curl_close($ch);
    if ($last_result != 200) {
        $curl_proxy = false;
        if ($file) @unlink($file);
        if ($log) xlog('NOTICE! Error code: ' . $last_result);
    }
    global $last_base;
    $last_base = substr($url, 0, strpos($last_url, '?'));
    if (!$last_base) $last_base = substr($url, 0, strrpos($last_url, '/')) . '/';
    if (g('test')) {
        $rand = rand(1000, 1000000);
        $m = "<a style='background-color:yellow' href='javascript: document.getElementById(\"$rand\").hidden = ! document.getElementById(\"$rand\").hidden'>
        [ Fetch Result ]</a>
        <div id='$rand' hidden='hidden'>";
        if ($file) $m .= "<img src='$url' />"; else $m .= "<code>" . htmlspecialchars($html) . "</code>";
        $m .= "</div><br/>";
        echo $m;
    }
    return $html;
}

function curl_redir_exec($ch)
{
    static $curl_loops = 0;
    static $curl_max_loops = 20;
    if ($curl_loops++ >= $curl_max_loops) {
        $curl_loops = 0;
        return FALSE;
    }
    curl_setopt($ch, CURLOPT_HEADER, true);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $data = curl_exec($ch);
    $header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
    $header = substr($data, 0, $header_size);
    $data = substr($data, $header_size);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    if ($http_code == 301 || $http_code == 302) {
        $matches = array();
        preg_match('/Location:(.*?)\n/', $header, $matches);
        if (empty($matches[1])) {
            $curl_loops = 0;
            return $data;
        }
        $new_url = trim($matches[1]);
        curl_setopt($ch, CURLOPT_URL, $new_url);
        xlog("Redirected to <a target='_blank' href='$new_url'>$new_url</a>...");
        return curl_redir_exec($ch);
    } else {
        $curl_loops = 0;
        return $data;
    }
}

function xlog($xmessage)
{
    if (!is_string($xmessage)) {
        require_once('scripter.php');
        $message = logvar($xmessage);
    } else $message = $xmessage;
    if (!g('test')) file_put_contents('parsemx.log', '[' . date('m-d H:i:s') . '] ' . $message . "\n", FILE_APPEND);
    $color = 'black';
    if (!(strpos($message, 'WARNING') === false)) $color = 'red';
    if (!(strpos($message, 'NOTICE') === false)) {
        $color = 'green';
        $message = str_replace('NOTICE: ', '', $message);
    }
    if (defined('DEV')and DEV) echo '<font color="grey">[' . date('H:i') . ']</font> <font color="' . $color . '">' . $message . '</font><br/>';
    if (!g('test')) file_put_contents('feed.log', '<font color="' . $color . '">' . $message . '</font><br/>', FILE_APPEND);
    return $xmessage;
}

function CheckField($table, $field, $type = 'int(11)', $index = true)
{
    $exists = query("SHOW COLUMNS FROM `$table` LIKE '$field'")->row;
    if ($exists) return;
    xlog("NOTICE: adding database field $field to $table");
    query("ALTER TABLE `$table` ADD $field $type");
    if ($index) query("ALTER TABLE `$table` ADD INDEX `$field` (`$field`)");
}

function CheckKey($table, $key)
{
    $exists = query("SHOW KEYS FROM `$table` WHERE Key_name='$key'")->row;
    if ($exists) return;
    xlog("NOTICE: adding database key $key to $table");
    query("ALTER TABLE `$table` ADD INDEX `$key` (`$key`)");
}

function CheckParseMXTables()
{
    if (!query("SHOW tables like 'parsemx_donors'")->row) {
        xlog("Creating ParseMX database tables...");
        query(" DROP TABLE IF EXISTS parsemx_donors; ");
        query(" CREATE TABLE parsemx_donors (
                  donor_id int(11) AUTO_INCREMENT,
                  host varchar(128),
                  autorun varchar(128),
                  missing varchar(128),
                  state int(11) DEFAULT 0,
                  active_tasks int(11) DEFAULT 0,
                  done_tasks int(11) DEFAULT 0,
                  total_entities int(11) DEFAULT 0,
                  total_files int(11) DEFAULT 0,
                  check_url varchar(2000),
                  proxy varchar(2000),


                  PRIMARY KEY (donor_id),
                  KEY (state),
                  KEY (host)
                ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1; ");
        query(" INSERT INTO parsemx_donors SET host='bookup.me', check_url='http://bookup.me/unlimited-energy'; ");
        query(" DROP TABLE IF EXISTS parsemx_ins; ");
        query(" CREATE TABLE parsemx_ins (
                  ins_id int(11) AUTO_INCREMENT,
                  donor_id int(11) NOT NULL,
                  title varchar(128),
                  url varchar(6000),
                  categories varchar(128) DEFAULT '',
                  manufacturer int(11) DEFAULT 0,
                  price varchar(512),
                  status tinyint(1) DEFAULT 1,

                  PRIMARY KEY (ins_id),
                  KEY (donor_id),
                  KEY (status)
                ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1; ");
        query(" INSERT INTO parsemx_ins SET donor_id=1, title='Money Books', url='http://bookup.me/money', price='X * 1.2 + 3'; ");
        query(" DROP TABLE IF EXISTS parsemx_tasks; ");
        query(" CREATE TABLE parsemx_tasks (
                  task_id int(11) AUTO_INCREMENT,
                  ins_id int(11),
                  donor_id int(11),
                  z_order int(11) DEFAULT 0,
                  url varchar(2000),
                  entity varchar(64),
                  info int(11),
                  info2 int(11),
                  info3 int(11),

                  PRIMARY KEY (task_id),
                  KEY (ins_id),
                  KEY (donor_id),
                  KEY (url),
                  KEY (entity),
                  KEY (z_order)
                ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1; ");
        query(" DROP TABLE IF EXISTS parsemx_entities; ");
        query(" CREATE TABLE parsemx_entities (
                  entity_id int(11) AUTO_INCREMENT,
                  platform_id int(11),
                  ins_id int(11),
                  donor_id int(11),
                  url varchar(2000),
                  entity varchar(64),
                  status int(11),

                  PRIMARY KEY (entity_id),
                  KEY (platform_id),
                  KEY (ins_id),
                  KEY (url),
                  KEY (donor_id),
                  KEY (status),
                  KEY (entity)
                ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1; ");
    }
    if (!query("SHOW TABLES LIKE 'parsemx_info'")->row) {
        xlog("NOTICE: adding INFO table");
        query(" CREATE TABLE parsemx_info (
                  info_id int(11) AUTO_INCREMENT,
                  donor_id int(11),
                  tag varchar(32),
                  id int(11),
                  info varchar(2000),

                  PRIMARY KEY (info_id),
                  KEY (tag),
                  KEY (donor_id),
                  KEY (id),
                  KEY (info)
                ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1; ");
    }
    if (!query("SHOW TABLES LIKE 'parsemx_translate'")->row) {
        xlog("NOTICE: adding TRANSLATE table");
        query(" CREATE TABLE parsemx_translate (
                  translate_id int(11) AUTO_INCREMENT,
                  text_id int(11),
                  lang varchar(3),
                  text varchar(2000),

                  PRIMARY KEY (translate_id),
                  KEY (text_id),
                  KEY (lang),
                  KEY (text)
                ) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1; ");
    }
    if (!query("SHOW TABLES LIKE 'parsemx_links'")->row) {
        xlog("NOTICE: adding LINKS table");
        query(" CREATE TABLE parsemx_links (
                  link_id int(11) AUTO_INCREMENT,
                  donor_id int(11),
                  ins_id int(11),
                  url varchar(2000),

                  PRIMARY KEY (link_id),
                  KEY (ins_id),
                  KEY (donor_id),
                  KEY (url)
                ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1; ");
    }
    CheckField('parsemx_entities', 'status');
    CheckField('parsemx_entities', 'donor_id');
    CheckField('parsemx_donors', 'missing', 'varchar(128)');
    CheckField('parsemx_donors', 'proxy', 'varchar(2000)', false);
    CheckKey('parsemx_tasks', 'url');
    CheckField('parsemx_tasks', 'info', 'int(11)', false);
    CheckField('parsemx_tasks', 'info2', 'int(11)', false);
    CheckField('parsemx_tasks', 'info3', 'int(11)', false);
    CheckField('parsemx_entities', 'ourl', 'varchar(2000)', false);
}

if (!empty($_GET['wtranslate'])) {
    global $skip;
    require_once('platform.php');
    require_once('scripter.php');
    $data = unserialize(htmlspecialchars_decode($_POST['data']));
    $skip = false;
    $last_url = $data['url'];
    $lasttr_file = 'translate/last_url';
    if (file_exists($lasttr_file)) $lasttr_url = file_get_contents($lasttr_file);
    $res = translate($data['text'], $data['from'], $data['to']);
    @file_put_contents($lasttr_file, $lasttr_file);
    if ($skip) $res = '!@#';
    echo '(charset=UTF-8)';
    echo serialize($res);
}

?>