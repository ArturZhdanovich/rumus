<?php
// *** ParseMX AJAX for wizard live updates and commands

require_once("finder.php");

//if( !ini_get('safe_mode') )
//    set_time_limit(300);

if (@$_GET['like']) {
    // Find like text
    $html = $_POST['text'];
    $html = str_replace('&nbsp;',' ',$html);
    $html = html_entity_decode($html);
    $html = preg_replace('/^\s+|\n|\r|\s+$/m', '', $html);

    // No double spaces
    $double=true;
    while ($double) $html=str_replace("  "," ",$html,$double);

    $html = preg_replace('/>\s*/', '>', $html);
    $html = preg_replace('/\s*</', '<', $html);
    $html=trim($html);

    $n=substr($_POST['name'],-1);
    $fname = $_POST['host'].'_data'.$n.'.tmp';
    $source = file_get_contents($fname);
    $data = @substr_like($html,$source);
    //if (strlen($data)>strlen($html)*4) $data='';
    //xlog("LIKE: ".$data);
    echo json_encode($data);
    exit;
}

// Load HTML files
$values = $_POST['values'];
$text = array();
foreach ($values as $i=>$value) {
  $fname = $_POST['host'].'_data'.$i.'.tmp';
  $wsources[$i] = file_get_contents($fname);
  foreach ($value as &$html) {
      $html = str_replace('&nbsp;',' ',$html);
      $html = html_entity_decode($html);
      $html = preg_replace('/^\s+|\n|\r|\s+$/m', '', $html);

      // No double spaces
      $double=true;
      while ($double) $html=str_replace("  "," ",$html,$double);

      $html = preg_replace('/>\s*/', '>', $html);
      $html = preg_replace('/\s*</', '<', $html);
      $html=trim($html);
  }
  $text[$i] = $value;
}

$data=array();
$com = html_entity_decode($_POST['com']);
$name = $_POST['name'];
$type = $_POST['type'];
$pfile = $_POST['host'].'_wizpages.inf';
$purls = array();
if (file_exists($pfile)) $purls=file($pfile,FILE_IGNORE_NEW_LINES);
if ($com=='false') $com=false;

if (!$com) $result = wz_find_text($text);
else {
    // Here's command, lets execute
    if ($com[0]=='~') {
        // Command need to be expanded.
        $pre = 'tags_text';
        if (strpos($name,'image')!==false) $pre = 'tags_image';
        if ($type=='html') $pre = 'tags_html';
        $url_names = array("products","nextpage","nextpages","subcategories");
        if (in_array($name, $url_names)) $pre = 'tags_href';
        $com = $pre.' "'.trim(substr($com,1)).'"';
    }
    // Command execution
    $result = $com;
    $line = MxBasic('res = '.$com);
    foreach ($values as $i=>$value) {
        $html = $wsources[$i];
        $url = $purls[$i];
        $last_url = $url;
        $last_base = substr($url, 0, strpos($last_url, '?'));
        if (!$last_base) $last_base = substr($url, 0, strrpos($last_url, '/')) . '/';
        StartCommands($html);
        eval($line);
        $text[$i][0] = $res;
        if (is_array($res)) {
            $text[$i][2] = $res;
            $text[$i][0] = reset($res);
            $text[$i][1] = end($res);
        }
        if (!$res) { $text[$i][0] = ''; $text[$i][1] = ''; }
    }
}

if ($result) {
    //$result=htmlentities($result);
    $p=strrpos($result,'inside');
    $data['result_list']=$result;
    if ($p!==false) $data['result_list']=substr($result,0,$p).'insides'.substr($result,$p+6);
}

$result = str_replace('tags_','tag_',$result);

if (!$result) { $data['result'] = 'Решение не найдено.'; $data['result_list'] = $data['result']; }
    else $data['result'] = $result;
if ($result=="FAILED: Source doesn't contain target text") $data['result']=false;

if ($data['result']=="''") $data['result']='';
if ($data['result_list']=="''") $data['result_list']='';

if ($result)
foreach ($text as $i=>$value) {
    if (!empty($value[2])) {
        $list = '<b>Полученые елементы:</b> ';
        foreach ($value[2] as $elem) {
            $ext=substr($elem,-4);
            $list.='<span style="white-space:nowrap">';
            if (($ext=='.jpg') or ($ext=='.png') or ($ext=='.gif'))
                $list.="<br/><a target='_blank' href='$elem'><img style='width:auto; height:40px; vertical-align:middle;' src='$elem'></a>";
            if (substr($elem,0,4)=='http') $elem="<a target='_blank' href='$elem'>$elem</a>";
            $list.='<span style="white-space:nowrap; line-height:25px; background:white; padding:3px; margin:3px; border:1px solid yellow;">'.$elem.'</span></span> ';
        }
        $value[2]=$list;
    }
    else $value[2]=false;

    //$value[1]='';$value[2]='';
    //$value[0]=htmlentities($value[0],ENT_COMPAT | ENT_HTML401 | ENT_SUBSTITUTE, 'UTF-8');
    $data['values'][$i] = $value;
}

//xlog($data);

echo json_encode($data);