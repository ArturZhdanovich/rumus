<?php
// *** ParseMX Instructions commands

require_once('nokogiri2.php');

if (!defined('DEV')) define('DEV',false);

// Inches to cm
function inch_to_cm($source=false) {
    if (!$source) $source = g('html');
    $source2 = replace_inside('"',"'","<",">",$source);
    $source = $source2;
    preg_match_all('/\d+[\.\,]?\d*"/',$source2,$inches,PREG_OFFSET_CAPTURE);
    $offset = 0;
    foreach ($inches[0] as $inch) {
        $cm = str_replace (",",".",$inch[0]);
        $cm = str_replace ('"',"",$cm);
        $cm = (int) ($cm * 2.54);
        $cm .= " cm";
        $pos = $inch[1] + $offset;
        $source = substr($source,0,$pos). $cm . substr($source,$pos+strlen($inch[0]));
        $offset = $offset - strlen($inch[0]) + strlen($cm);
    }
    return $source;
}

// JavaScript parsing
function run_js($script=false) {
    global $ohtml;
    if ($script===false) { // Gather javascript from page
        $scripts = insides('<script type="text/javascript">','</script>',$ohtml);
        $scripts2 = insides("<script type='text/javascript'>",'</script>',$ohtml);
        $scripts = array_merge($scripts,$scripts2);
        foreach ($scripts as $s) {
            $s = if_inside("/*<![CDATA[*/","/*]]>*/",$s);
            $s = if_inside("//<![CDATA[","//]]>",$s);
            $script.="\n$s";
        }
    }
    require_once "js/js.php";
    js::run($script);
}

// Get JS Var
function js($var) {
  $res = jsrt::$contexts[0]->var->get($var)->ToPHP();
  return($res);
}

// ----- EXCEL IO

function load_file ($file) {
    ini_set('memory_limit', '256M');
    require_once 'PHPExcel/IOFactory.php';
    $objReader = PHPExcel_IOFactory::createReader('Excel5');
    $objReader->setReadDataOnly(true);
    $objPHPExcel = $objReader->load($file);
    $sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
    $objPHPExcel->disconnectWorksheets();
    unset($objPHPExcel);
    return $sheetData;
}

function unzip($file,$path=false) {
    if ($path==false) $path='zip';
    $external = strpos($file,'://');
    if ($external) {
        _curl($file,'','temp.zip');
        global $last_result;
        if ($last_result!=200) return false;
        $file = 'temp.zip';
    }
    $zip = new ZipArchive;
    if ($zip->open($file) === TRUE) {
        $zip->extractTo($path);
        $zip->close();
        if ($external) @unlink($file);
        return true;
    }
    return false;
}

// Find first tag with selector on page and get its attribute
function find($text, $content = false)
{
    $org_content = $content;
    if ($content===false)
        $content = g('html');
    $x=strpos($content,$text);
    $r=($x!==false);

    if (DEV)
        xlogc('find', $r, $text, $org_content);
    return $r;
}

// ----- close_tags
function close_tags($html) {
    if (!trim($html)) return "";
    // Expand self-closed tags
    $p=-1;
    while ($p=strpos($html,'/>',++$p)) {
        $p2 = strrpos($html,'<',$p-strlen($html));
        if ($p2===false) continue;
        $tag='';
        while (ctype_alnum($html[++$p2])) $tag.=$html[$p2];
        if (strtolower($tag)=='img') continue;
        if (strtolower($tag)=='br') continue;
        $html=substr($html,0,$p)."></$tag>".substr($html,$p+2);
    }

    $tags=insides('<','>',$html);
    foreach ($tags as &$t)
        if ($p=strpos($t,' ')) $t=substr($t,0,$p);
    $before='';
    $stack=array();$p=-1;
    foreach ($tags as $tag)
        if ($tag[0]=='/') {
            // Closing tag
            $tag=substr($tag,1);
            while (($p>=0) and ($stack[$p]!=$tag)) $p--;
            if ($p==-1) $before="<$tag>".$before; // Closing tag not found
            else $p--;
        } else $stack[++$p]=$tag;
    $after='';
    while ($p>=0) $after.='</'.$stack[$p--].'>';
    return $before.$html.$after;
}

/*
// -------- Automatic data mining functions ---------
function find($what) {
    switch (strtolower($what)) {
        case "title": return find_title();
    }
    return tag_text("@".$what);
}

function find_title() {
    $r = tag_text("h1");
    if (!$r) $r = inside ("<title>","</title");
    return $r;
}

// New @ functionality, find the tags with class/id that contains some text
function upgrade_selector(&$selector) {
    if ($selector[0]!='@') return $selector;

    if ($p=strpos($selector," ")) {
        $sel = substr($selector,1,$p);
        $tail = substr($selector,$p);
    } else {
        $sel = substr($selector,1);
        $tail = "";
    }
    xlog ("S:".$sel);
    $sels=array();
    // Get all classes
    $classes = insides('class="','"');
    $classes = array_merge(insides("class='","'"),$classes);
    foreach ($classes as $class) {
        $class = explode(' ',$class);
        foreach ($class as $c)
            if (strpos(strtolower($c),$sel)!==false)
                $sels[] = '.'.$c;
    }
    // Get all IDs
    // Get all classes
    $ids = insides('id="#','"');
    $ids = array_merge(insides("id='#","'"),$ids);
    foreach ($ids as $id)
            if (strpos(strtolower($id),$sel)!==false)
                $sels[] = '#'.$id;
    if (!count($sels)) $sels[]='.'.$sel;
    $l=1000;$p=0;
    foreach ($sels as $i=>$s) if (strlen($s)<$l) {$l = strlen($s); $p=$i;}
    $selector = $sels[$p].$tail;
    xlog ("R:".$selector);
    return $selector;
}
*/

// shred - merge arrays so first element is from first array, second - from second and so on
function shred_arrays() {
    $arrs = func_get_args();
    if (empty($arrs[0])) return array();
    foreach ($arrs as $i=>$arr)
        if (@!count($arr)) unset($arrs[$i]);
    if (!count($arrs)) return array();
    $r = array();
    foreach ($arrs[0] as $i=>$dummy)
        foreach ($arrs as $arr)
            $r [] = @$arr[$i];

    if (DEV)
        xlogc('shred', $r);
    return $r;
}

// RANDOM:
// Without $data returns float 0..1
function random($data=false) {
   if (func_num_args()>1) $data=func_get_args();
   if (!$data) $r = (float)rand()/(float)getrandmax();
   elseif (is_array($data)) $r=$data[ array_rand($data) ];
   else $r=rand(0,$data);

   if (DEV)
       xlogc('random', $r, $data);
   return $r;
}

// Regular expressions

function replace($search, $replace='', $text=false)
{
    if ($text===false) $text = g('html');

    if (is_array($text)) {
        $r=array();
        foreach ($text as $line) $r[]=replace($search,$replace,$line);
    } else

    if (!$search) {
        // Use replace.txt
        global $search_list,$replace_list;
        if (empty($search_list)) {
            $search_list=array();
            $replace_list=array();
            if (file_exists('replace.txt')) {
                $lines = file('replace.txt');
                foreach ($lines as $line)
                    if (($line=trim($line)) and ($p=strpos($line,'='))) {
                        $search_list[]=trim(substr($line,0,$p));
                        $replace_list[] = trim(substr($line,$p+1));
                    }
            }
        }
        $r = str_replace($search_list,$replace_list,$text);

    } else
    if (($p=strpos($search,'*'))!==false) {
      $before = substr($search,0,$p);
      $after = substr($search,$p+1);
      $r = replace_inside("","",$before,$after,$text);
        $r = str_replace($before.$after,$replace,$r);
    } else
    $r = str_replace($search,$replace,$text);

    if (DEV)
        xlogc('replace', $r, $search, $replace, $text);

    return $r;
}

function rreplace($search, $replace='', $text=false, $options = 'i')
{
    if ($text===false) $text = g('html');

    if (is_array($text)) {
        $r=array();
        foreach ($text as $line) $r[]=replace($search,$replace,$line);
    } else {

    $search = str_replace('/','\/',$search);
    $replace = str_replace('/','\/',$replace);

    $r = preg_replace('/' . $search . '/' . $options, $replace, $text);

    }

    if (DEV)
        xlogc('rreplace', $r, $search, $replace, $text, $options);

    return $r;
}

// DOM Nodes

function nodes($selector, $source = false)
{
    //echo ("<br>nodes source: ");
    //print_r($source);
    //echo ("<br>noko source: "); echo g('xparser')->toText();
    $r = get_noko($source)->get($selector)->getNodes();

    if (DEV)
        xlogc('nodes', $r, $selector, $source);

    return $r;
}

// YANDEX SERVICES =========================================================================================

// Yandex translate

function y_translate($text, $lang = "en-ru")
{
    global $encoding;
    $save_encoding = @$encoding;
    $encoding = 'UTF-8';
    $url = 'http://translate.yandex.net/api/v1/tr.json/translate?format=html&lang=' . $lang . '&text=' . urlencode($text);
    for ($i=0;$i<5;$i++) {
        $result = json_decode(get($url), true);
        if (g('last_result')==200) break;
    }
    $encoding=$save_encoding;
    if ($result['code'] == 200) {
        $r = implode('<br />', $result['text']);
    } else $r = $text;

    if (DEV)
        xlogc('y_translate', $r, $text, $lang);

    return $r;
}

// END YANDEX SERVICES =========================================================================================

// Make translit (for URLs)
function translit($name)
{
    $rus = array('а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я', ' ');
    $rusUp = array('А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', ' ');
    $lat = array('a', 'b', 'v', 'g', 'd', 'e', 'e', 'zh', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'c', 'ch', 'sh', 'sh', '', 'i', '', 'e', 'u', 'ya', '-');
    $characters = 'abcdefghijklmnopqrstuvwxyz1234567890-_';

    $res = str_replace($rus, $lat, trim($name));
    $res = str_replace($rusUp, $lat, $res);

    $return = '';

    for ($i = 0; $i < strlen($res); $i++) {
        $c = strtolower(substr($res, $i, 1));
        if (strpos($characters, $c) === false)
            $c = '';
        $return .= $c;
    }

    $r = $return;

    if (DEV)
        xlogc('translit', $r, $name);

    return $r;

}

// Replaces something inside $start and $end
function replace_inside($find,$replace,$start, $end, $content = false) {
    if ($content!==false) $r = $content;
        else $r = g('html');
    $s=0;
    while (($s = strpos($r,$start,$s)) !==false) {

        $s += strlen($start);
        if ($end) $e = strpos($r,$end,$s);
        else $e = strlen($r);
     if ($e) {

         $left = substr($r,0,$s);
         $right = substr($r,$e);
         $mid = substr($r,$s,$e-$s);
         $midlen = strlen($mid);
         //echo "[$left-$mid-$right]";

         if ($find) $mid = str_replace($find,$replace,$mid);
         else $mid = $replace;
         $r=$left.$mid.$right;
         $e = $e + strlen($mid) - $midlen;
         $s = $e + strlen($end);
         if ($s>strlen($r)) break;
     }
    }

    if (DEV)
        xlogc('replace_inside', $r, $find,$replace,$start, $end, $content);


    return $r;
}


// functions insidex - return inside contents with start and end
function insidex($start, $end="", $content = false) {
    $r = inside($start, $end, $content);
    if ($r) $r = $start . $r . $end;

    if (DEV)
        xlogc('insidex', $r, $start, $end, $content);

    return $r;
}

function insidesx($start, $end="", $content = false) {
    $r = insides($start, $end, $content);
    if (is_array($r))
        foreach ($r as &$e)
            $e = $start . $e . $end;

    if (DEV)
        xlogc('insidesx', $r, $start, $end, $content);

    return $r;
}

// Find the content with nested start and end
function insiden($start, $end, $content = false)
{
    $org_content = $content;
    if ($content===false)
        $content = g('html');
    $r = '';
    $s = strpos($content, $start);
    if ($s!==false) {
        $p = $s+strlen($start);
        $level = 0;
        while ($p<strlen($content)) {
            $e = strpos($content, $end, $p);
            if ($e===false) break;
            $s2 = strpos($content, $start, $p);
            if (($s2!==false) and ($s2<$e)) {$level++; $p=$s2+strlen($start); }
            else if (!$level) {
                $s += strlen($start);
                $r = trim(substr($content, $s, $e - $s));
                break;
            } else {$level--; $p=$e+strlen($end); }
        }
    }

    if (DEV)
        xlogc('insiden', $r, $start, $end, $org_content);

    return $r;
}

// Positional grouping

function pgroup($groups,$elems,$additional=false,$default_group="Default") {
    $res=array();
    global $xparser;
    $phtml = $xparser -> toHtml();
    // Get positions
    $xpos = 0;
    if ($groups and !is_array($groups[0]))
        foreach ($groups as $i=>$group) {
            $pos = strpos($phtml,$group);
            if ($pos) $xpos = $pos;
            $group = get_noko($group) -> toText();
            $groups[$i] = array($group,$xpos);
        }
    // Get positions
    $xpos = 0;
    if ($elems and !is_array($elems[0]))
        foreach ($elems as $i=>$elem) {
            $pos = strpos($phtml,$elem);
            if ($pos) $xpos = $pos;
            $elem = get_noko($elem) -> toText();
            $elems[$i] = array($elem,$xpos);
        }

    foreach ($elems as $i=>$elem) {
        if (is_numeric($elem[0]))
            $elem[0].=" ";
        @$pos=$elem[1];
        // Find group
        $egroup=$default_group;
        foreach ($groups as $group)
            if ($pos>$group[1]) $egroup=$group[0];
        if ($egroup) {
            // Write to the group
            $res[$egroup][] = $elem[0];
            if (isset($additional[$i]))
                if (is_array($additional[$i])) $res[$egroup][] = $additional[$i][0];
                else $res[$egroup][] = $additional[$i];
        }
    }
    return $res;
}

// Inside functions with position info

function pinside($start, $end="", $content = false)
{
    $org_content = $content;
    if ($content===false)
        $content = g('html');
    $r = '';
    if ($start) $s = strpos($content, $start);
    else $s=0;
    if ($s !== false) {
        $s += strlen($start);
        if ($end) $e = strpos($content, $end, $s);
        else $e = strlen($content);
        if ($e !== false) {
            $r = array(trim(substr($content, $s, $e - $s)),$s);

        }
    }

    if (DEV)
        xlogc('pinside', $r, $start, $end, $org_content);

    return $r;
}

// Find the texts inside the $start and $end
function pinsides($start, $end, $content = false)
{
    $org_content = $content;
    if ($content===false)
        $content = g('html');
    if (is_array($content)) {
        $startp=$content[1];
        $content=$content[0];
    } else $startp=0;
    $r = array(); $s=0;
    while ( ($s = strpos($content, $start,$s) ) !== false ) {
        $s += strlen($start);
        $e = strpos($content, $end, $s);
        if ($e !== false) {
            $r[] = array(trim(substr($content, $s, $e - $s)),$s+$startp);
            $s = $e + strlen($end);
        }
    }

    if (DEV)
        xlogc('pinsides', $r, $start, $end, $org_content);
    return $r;
}

// Find inside, if not found - return original string

function if_inside ($start, $end="", $content) {
    $res = inside ($start,$end,$content);
    if ($res) return $res;
    else return $content;
}


// Find the text inside the $start and $end.
//    If $start="" then start is start of content.
//    If $end="" then end is end of content.
function inside($start, $end="", $content = false)
{
    $org_content = $content;
    if ($content===false)
        $content = g('html');
    $r = '';
    if ($start) $s = strpos($content, $start);
    else $s=0;
    if ($s !== false) {
        $s += strlen($start);
        if ($end) $e = strpos($content, $end, $s);
        else $e = strlen($content);
        if ($e !== false)
            $r = trim(substr($content, $s, $e - $s));
    }

    if (DEV)
        xlogc('inside', $r, $start, $end, $org_content);

    return $r;
}

// Find the texts inside the $start and $end
function insides($start, $end, $content = false)
{
    $org_content = $content;
    if ($content===false)
        $content = g('html');
    if (is_array($content)) $content = implode('#$%',$content);
    $r = array(); $s=0;
    while ( ($s = strpos($content, $start,$s) ) !== false ) {
        $s += strlen($start);
        $e = strpos($content, $end, $s);
        if ($e !== false) {
            $r[] = trim(substr($content, $s, $e - $s));
            $s = $e + strlen($end);
        }
    }

    if (DEV)
        xlogc('insides', $r, $start, $end, $org_content);
    return $r;
}

// Return links from tags
function tags_href($selector, $text = '', $source = false)
{
    $r = urls(tags_attr($selector, 'href', $text, $source));
    if (DEV)
        xlogc('tags_href', $r, $selector, $text, $source);

    return $r;
}

// Return link from tag
function tag_href($selector, $text = '', $source = false)
{
    $t = tags_href($selector, $text, $source);
    if ($t) $r = reset($t);
    else $r='';

    if (DEV)
        xlogc('tag_href', $r, $selector, $text, $source);

    return $r;
}

// Return text from tags
function tags_text($selector, $source = false)
{

    $r = array();
    foreach (nodes($selector, $source) as $node) {
        $text = trim(node_text($node));
        if (!$text) $text = $node->GetAttribute('content');
        if ($text) $r[] = $text;
    }

    if (DEV)
        xlogc('tags_text', $r, $selector, $source);

    return $r;
}

function is_imagelink($img) {
    if (!strpos($img,'://')) return false;
    return strpos($img,'.jpg') or strpos($img,'.jpeg') or strpos($img,'.png') or strpos($img,'.gif');
}

function tag_image($selector, $source = false) {
    $r = tags_image($selector,$source);
    if ($r) return $r[0];
    else return '';
}

function tags_image($selector, $source = false) {
    $hts = tags_html($selector,$source);
    if (!$hts) return array();
    // Get parent tag
    $images = array();
    if (substr($hts[0],0,4)=='<img')
        $hts = get_noko($source)->get_parents($selector);

    foreach ($hts as $ht) {
        $img = tags_href('a','',$ht);
        $links = false;
        foreach ($img as $im)
            if (is_imagelink($im)) {
                $images[] = $im;
                $links = true;
            }
        if (!$links) {
            $img = tags_attr('img','src','',$ht);
            foreach ($img as $im) {
                $im = url($im);
                if (is_imagelink($im))
                    $images[] = $im;
            }
        }
    }
    return $images;
}

// Return text from tag
function tag_text($selector, $source = false)
{   $t = tags_text($selector, $source);
    if ($t) $r = reset($t);
    else $r='';

    if (DEV)
        xlogc('tag_text', $r, $selector, $source);

    return $r;
}

// Find all tags with selector on page and get an array of their attribute
function tags_attr($selector, $attr, $text = '', $source = false)
{


    $result = array();
    $text = trim($text);
    foreach (get_noko($source)->get($selector)->toArray() as $tag)
        if (!$text or @in_array($text,$tag['#text']))
            if (!empty($tag[$attr])) $result[] = trim($tag[$attr]);
    $r = $result;

    if (DEV)
        xlogc('tags_attr', $r, $selector, $attr, $source, $text);

    return $r;
}

// Find first tag with selector on page and get its attribute
function tag_attr($selector, $attr, $text = '', $source = false)
{
    $t = tags_attr($selector, $attr, $text,$source);
    if ($t) $r = reset($t);
    else $r='';
    if (DEV)
        xlogc('tag_attr', $r, $selector, $attr, $source, $text);

    return $r;
}

// Return Nokogiri object from source
function get_noko($source=false)
{
    if ($source===false)
        return g('xparser');

    //if (is_string($source)) $source='<?xml encoding="UTF-8">'.$source;
    return new nokogiri($source);
}

// Get inner html of all entries of some tag
function tags_html($selector, $source = false)
{

    //$r = get_noko($source)->get($selector)->toHtml();
    $r=array();
    $noko = get_noko($source);
    foreach ($noko->get($selector)->getNodes() as $tag) {
        $html = $tag->ownerDocument->saveXML($tag);
        $html = str_replace(array("\n", "\t"), '', $html);
        if ($html=='<root/>') $html='';
        $html=close_tags($html);
        $r[] = $html;
    }
    if (DEV)
        xlogc('tags_html', $r, $selector, $source);

    return $r;
}

// Get inner html of first entry of some tag
function tag_html($selector, $source = false)
{

    $r = get_noko($source)->get($selector)->toHtml();
    $r = str_replace(array("\n", "\t"), '', $r);
    if ($r=='<root/>') $r='';
    $r=close_tags($r);
    if (DEV)
        xlogc('tag_html', $r, $selector, $source);

    return $r;
}

function url($link) {
    $t= urls ( array ( $link ) );
    if ($t) $r = reset($t);
    else $r=false;
    if (DEV)
        xlogc('url', $r, $link);

    return $r;
}

/**
 * Create array of urls from any data
 *
 * @param $data
 * @return array
 */
function urls($data)
{
    $result = array();
    if (is_array($data)) {
        if (isset($data['href']))
            $result[] = $data['href']; else
            foreach ($data as $d)
                if (is_array($d))
                    $result[] = $d['href']; else
                    $result[] = $d;
    } else $result[] = $data;

    // Make URLs full
    $result2 = array();
    global $last_url, $last_base;
    $last_domain = substr($last_url, 0, strpos($last_url, '/', 10));
    if ($p = strpos($last_url,'?'))
        $last_php = substr($last_url,0,$p);
    else $last_php = $last_url;

    foreach ($result as $url) {
        $url = trim($url);
        if (!$url)
            continue;
        $url = str_replace('./','',$url);
        if (substr($url,0,2)=='//') $url = 'http:'.$url;
        if (strpos($url, '://') === false)
            if ($url[0] == '/')
                $url = $last_domain . $url;
            elseif ($url[0] == '?') $url = $last_php . $url;
            else $url = $last_base . $url;
        // Check for right donor
        //if (strpos(domain($url),$GLOBALS['instruction']['host'])===false) continue;
        $result2[] = $url;
    }
    $r = $result2;

    if (DEV)
        xlogc('urls', $r, $data);

    return $r;
}

// Log instrustion command and result
function logvar($v)
{
    global $logval_level;
    $logval_level++;
    if (is_array($v)) {
        $m = "[ ";
        $first = true;
        foreach ($v as $a) {
            if ($first)
                $first = false; else $m .= ", ";
            $m .= logvar($a);
        }
        $m .= " ]";

    } else
        if (is_object($v))
            $m = (get_class($v)); else
            if (is_numeric($v))
                $m = $v;
            else $m = '"' . htmlspecialchars($v) . '"';

    $logval_level--;
    //echo "LV:".$logval_level;
    if (!$logval_level)
        if (strlen($m)>32) { // Let's hide it
            $r=rand(1,1000000);
            $m= "<span id='s$r'>".substr($m,0,16)."<span onclick='document.getElementById(\"s$r\").style.display=\"none\";document.getElementById(\"f$r\").style.display=\"inline\"' style='cursor:pointer; background-color:yellow'>[...]</span></span><span id='f$r' style='display:none'>$m</span>";
        }

    return $m;
}

function xlogc($command, $r, $param1 = '', $param2 = '', $param3 = '', $param4 = '')
{
    if (empty($GLOBALS['test']))
        return;

    if (count(debug_backtrace (@DEBUG_BACKTRACE_IGNORE_ARGS))>4) return;

    $m = ("Command <font color=green><strong>$command</strong> (");
    if ($param1)
        $m .= " " . logvar($param1);
    if ($param2)
        $m .= ", " . logvar($param2);
    if ($param3)
        $m .= ", " . logvar($param3);
    if ($param4)
        $m .= ", " . logvar($param4);
    if ($param1)
        $m .= " ";
    $m .= ") = " . logvar($r) . "</font>";
    xlog($m);
}

function MxBasic($line) {
    $line = trim($line);
    $phps = array('if','else','foreach','while','and','or','continue','break','as','true','false','int','float', 'global');

    // Comments - KILLER CODE! :-)
    /*$p=0;
    while ( ($p = strpos($line, "'",$p)) !==false ) {
        $p3=$p+1;
        while ( ( ($p2 = strpos($line, "'",$p3)) !==false ) and ($line[$p2-1]=='\\') ) $p3=$p2+1;
        if ($p2!==false)
            $p=$p2+1; else
        {   $line = trim ( substr($line, 0, $p) );
            break;
        }
    }*/

    $line=replace_inside("//","@%$",'"','"',$line);
    if ($p=strpos($line,'//')) $line = trim(substr($line,0,$p));
    $line=str_replace("@%$","//",$line);
    $line=trim($line);
    if (!$line) return '';



    // Check if this is parse-basic procedure call
    $procedure = preg_match('/^\s*\w[^$=;]*$/', $line); // $procedure is checked later
    if (substr($line,0,7)=='global ') {
        $procedure = false;
        $line = replace("  "," ",$line);
        $line = replace(" "," $",$line).";";
    }
    if ($procedure) {
        if (preg_match('/^\s*\w*$/', $line) and !in_array($line,$phps)) $line.="()";
        $line = 'x='.$line;
    }

    $xline = replace_inside("","",'"','"',$line);
    $nophp = preg_match('/^[^$;]*$/', $xline);

    //xlog("Line: $line");
    // Check if this is parse-basic string
    if (preg_match('/^\s*@?\w[^$]*\s*=/', $line)) {
        // Convert PARSE-BASIC string into PHP
        //xlog("ParseB");


        // Do =>
        if ($p=strpos($line,'=>'))
            if ( !(($p2=strpos($line,'(')) && ($p2<$p)) )
            if ( !(($p2=strpos($line,'=')) && ($p2<$p)) )
                $line = substr($line,0,$p).'='.substr($line,0,$p).'->'.substr($line,$p+2);

        $line = str_replace('\%','$#@',$line);
        $line = str_replace('%','$',$line);
        $line = str_replace('$#@','%',$line);

        // for(entities) - foreach shortcut
        if ((substr($line,0,6)=='x=for ') or (substr($line,0,4)=='for ')) {
            $ins = insiden('(',')',$line);
            if (!strpos($ins,';')) {
                $p = strpos($line,'(');
                $p2 = strpos($line,')',$p+strlen($ins)+1);
                preg_match('/\w+/',substr($line,$p),$word);
                $word = substr($word[0],0,-1);
                $ins = $ins .' as i=>&'.$word;
                $line = substr($line,0,$p+1). $ins . substr($line,$p2);
                $line = str_replace('for','foreach',$line);
            }
        }

        // foreach(entities)
        if ((substr($line,0,10)=='x=foreach ') or (substr($line,0,8)=='foreach ')) {
            $ins = insiden('(',')',$line);
            if (!strpos($ins,' as ')) {
                $p = strpos($line,'(');
                $p2 = strpos($line,')',$p+strlen($ins)+1);
                preg_match('/\w+/',substr($line,$p),$word);
                $word = substr($word[0],0,-1);
                $ins = $ins .' as i=>&'.$word;
                $line = substr($line,0,$p+1). $ins . substr($line,$p2);
            }
        }

        // Make function calls without brackets - at start of the expr only
        $left = substr($line, 0, $e = strpos($line, '='));
        $right = trim(substr($line, $e+1));
        $p=0;
        while (ctype_alnum($c=substr($right,$p,1)) or ($c=='_')) $p++;
        $c2=substr($right,$p+1,1);
        //echo "<br>c:$c: c2:$c2:";
        if (ctype_space($c) and (ctype_alnum($c2) or ($c2=='"'))) {
            //echo "Ya!";
            // Make it!
            $p2 = strpos($right,'->');
            if ($p2===false) $p2 = strlen($right);
            $tail = substr($right, $p2);
            $right = substr($right, 0, $p2);
            $line = $left.'='.substr($right,0,$p).'('.substr($right,$p+1).')'.$tail;
        }

        // Process ->
        while ($p = strpos($line, '->')) {
            //echo "<br/>In: ".$line;
            $p2 = strpos($line, '->', $p + 1);
            if ($p2 === false)
                $p2 = strlen($line);
            $tail = substr($line, $p2);
            $line = substr($line, 0, $p2);

            $left = substr($line, 0, $e = strpos($line, '='));
            $args = substr($line, $e + 1, $p - $e - 1);

            $func = substr($line, $p + 2);
            $func = trim($func);

            if ($a = strpos($func,' ')) { // There is more arguments
                $args2 = substr($func,$a);
                $func = substr($func,0,$a);
            } else $args2=""; // No arguments
            {

                // Find the source argument place for this function
                $sou = 1;
                $sources = array(
                    array('nodes','tags_text','tag_text','tag_html','tags_html','explode','implode',

                        // Function from platform - not nice
                        'attr','del_attr'

                    ) // 2ND ARG
                ,array('tags_href','tag_href','replace','rreplace','inside','if_inside','insides','insidex','insidesx','insiden','pinside','pinsides') // 3RD ARG
                ,array('tags_attr','tag_attr') // 4TH ARG
                ,array('replace_inside') // 5TH ARG
                );
                foreach ($sources as $level => $funcs)
                    foreach ($funcs as $p)
                        if ($p==$func) $sou = $level+2;
                // DONE args

                $comma = '@%$';
                $args2 = replace_inside(',',$comma,'"','"',$args2);
                $args2 = replace_inside('(','{[','"','"',$args2);
                $args2 = replace_inside('(',']}','"','"',$args2);
                $args2 = replace_inside(',',$comma,'(',')',$args2);
                $args2 = replace_inside('{[','(','"','"',$args2);
                $args2 = replace_inside(']}',')','"','"',$args2);
                $list = explode(',',$args2);
                //echo "<br> Sou:$sou List in: "; print_r($list);
                $sou--;
                for ($i=0;$i<$sou;$i++) // Add empty args is missing
                    if (empty($list[$i])) $list[$i]="''";
                //echo "<br> List em: "; print_r($list);
                $listn = count($list);
                for ($i=$listn;$i>$sou;$i--) $list[$i] = $list[$i-1]; // Move args to make place for source
                $list[$sou] = $args;
                //print_r($list);
                //echo "<br> List ins: "; print_r($list);
                foreach ($list as $i=>$l) if (trim($l)=="") unset($list[$i]);
                $args = implode(',',$list);
                $args = str_replace($comma,',',$args);
            }

            $line = $left.'='.$func.'('.$args.')'.$tail;
            //echo "<br/>Out: ".$line;
        }

        // Add $ to identifiers
        $p = 0; $quoted = false;
        while ($p<strlen($line)) {
            $c=substr($line,$p,1); $c=$c[0];
            if ($quoted) {
                if (($c=='"') and (substr($line,$p+1,1)=='"')) $line[$p]='\\'; // "" support
                if (($c=='"') and (substr($line,$p-1,1)!='\\')) $quoted=false;
            } else
                if ($c=='"') $quoted = true; else
                    if (ctype_alpha($c) or ($c=='_')) {
                        //echo "<br> Line:".$line;
                        //echo "<br> p:".$p;
                        $p2=$p;
                        while (ctype_alnum( $c=substr($line,$p2,1) ) or ($c[0]=='_')) $p2++;
                        //echo " p2:".$p2;
                        $p3=$p2;
                        while (ctype_space($end = substr($line,$p3,1))) $p3++;
                        //echo " p3:".$p3;
                        //echo "<br>End:".$end;

                        if (($end[0]!='(') and !in_array(substr($line,$p,$p2-$p),$phps)) { // This is identifier!
                            //echo $end;
                            $line = substr($line,0,$p).'$'.substr($line,$p);
                            $p3++;
                        }
                        $p = $p3-1;
                    }
            $p++;
        }


    }


    if ($procedure) $line = substr($line,3); // delete =

    if ($nophp) {
        // Check for closing bracket
        $no = false;
        //$p = strpos($line,' ');
        $p = strpos($line,'(');
        if ($p) {
            $l=0;
            while (++$p<strlen($line)) {
                if ($line[$p]=='(') $l++;
                if ($line[$p]==')')
                    if (!$l) break; else $l--;
            }
            $no = ($p == strlen($line)-1);
        }
        $if = preg_match('/^\s*\w+/',$line,$word) && in_array($word[0],$phps) && $no;

        if (!$if)
            if ((substr($line,-1)!=';') and (substr($line,-1)!='{') and (substr($line,-1)!='}')) $line = $line . ';'; // add ending ;
    }

    return $line;


}

function StartCommands($html)
{   global $xparser;
    if (!empty($sparser)) EndCommands();
    $xparser = new nokogiri($html);
}

function EndCommands()
{
    unset($GLOBALS['xparser']);
}

?>