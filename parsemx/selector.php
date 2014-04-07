<?php

require_once "parsemx.php";
require_once "scripter.php";

$url = @$_GET['url'];
$path = @$_GET['path'];
$single = (int)@$_GET['single'];
if (!$url) exit;
$url = urldecode($url);
if (!$path) $path='';
//$url = 'http://www.china-women-dress.com/en_shop_gjxa4/products.aspx?sku=1371480&shbid=21087';

if ($p=strpos($url,'@')) { // Get wizard cache
    $n = substr($url,$p+1);
    $dom = domain($url);
    if (!is_numeric($n)) {
        $dom.='L'; $n = (int)$n;
    }
    $url = substr($url,0,$p);
    $html = file_get_contents($dom.'_data'.$n.'.tmp');
} else $html = get($url);
//require_once("scripter.php");
//$html = replace_inside(';',";\n",'<script','/script>',$html);

$js = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
$js = substr($js,0, strpos($js,'selector.php'));
$rbase = $js;
//$js.='lib/selectorgadget_local.js';
$intro = "<base href='$url'><script type='text/javascript'> var rbase='$rbase'; var rpath='$path'; var rsingle=$single; </script>";

$intro.= "<link rel='stylesheet' href='".$rbase."lib/selectorgadget.css' type='text/css' media='screen' />";
$intro.= "<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.2.min.js'></script>";
$intro.= "<script type='text/javascript' src='".$rbase."lib/diff_match_patch.js'></script>";
$intro.= "<script type='text/javascript' src='".$rbase."lib/dom.js'></script>";
$intro.= "<script type='text/javascript' src='".$rbase."lib/interface.js'></script>";
$html = replace("<head*>","<head>",$html);
$html = str_ireplace('<head>',$intro,$html);
header('Content-Type: text/html; charset=utf-8');
echo $html;
