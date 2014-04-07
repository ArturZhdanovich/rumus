<?php
// *** ParseMX AJAX for live updates and commands
$nosession = true;
require_once("parsemx.php");
require_once('platform.php'); // Use platform connector

$data=false;
$work=false;

if ($_GET['command']=='donors') { // Send donors stats

    $donors = query("SELECT * FROM parsemx_donors")->rows;
    $data=array();
    foreach ($donors as $donor) {
        $m="";

        if ($donor['state']) {
            $percent = $donor['done_tasks']*100 / ($donor['done_tasks']+$donor['active_tasks']+1);
            $percent = (int) $percent;
            $m.="<div style='margin-top:14px; float:right; width:70%; background-color: #ccc; height:24px;'>
            <div style='width:$percent%; height:100%; background-color: green; text-align: center; color:white; vertical-align: bottom;line-height:24px;'> $percent% </div>
            </div>";
        }

        /*$m.="<strong>Состояние: ";
        switch ((int)@$donor['state']) {
            case 0: $m.="<font color='grey'> остановлено"; break;
            case 1: $m.="<font color='blue'> пауза"; break;
            case 2: $work=true; $m.="<font color='green'> сканируем"; break;
        }
        $m.="</font></strong><br/>";*/



        if ($donor['active_tasks']) $m.="Активных действий: <font color='blue'>".$donor['active_tasks']."</font><br/>";
        if ($donor['done_tasks']) $m.="Выполненных действий: <font color='green'>".$donor['done_tasks']."</font><br/>";
        if ($donor['total_entities']) $m.="Всего товаров: <font color='blue'>".$donor['total_entities']."</font><br/>";
        //if ($donor['total_files']) $m.="Всего изображений: <font color='green'>".$donor['total_files']."</font><br/>";



        $data['donors'][$donor['donor_id']]['text'] = $m;
        $state=(int)@$donor['state'];
        if ($state) $work=true;
        $data['donors'][$donor['donor_id']]['state'] = $state;
    }

    $data['work'] = $work;

    $cron_status = 'cron_status.tmp';
    $data['cron'] = false;
    if (file_exists($cron_status) and (filemtime($cron_status)>time() - 5*60)) $data['cron'] = true;
}

// Translations --------------------
$thtml = '';
$langs=glob('translate/*');
if ($langs)
foreach ($langs as $lang) {
    $lang = substr($lang,10);
    $q = query("SELECT COUNT(*) as n FROM parsemx_translate WHERE lang='$lang' GROUP BY lang")->row;
    $thtml.= "<h3 style='margin-bottom: -15px'>Язык $lang: ";

    if (empty($q['n'])) $thtml .= "<font color='red'>нет фраз</font>";
    else $thtml.= "<font color='green'>".$q['n']."</font> фраз";
    $thtml.= "</h3>";
    $files=glob("translate/$lang/*.html");
    if ($files) {
        $thtml .= "<p>Файлы: ";
        foreach ($files as $i=>$file) {
            $thtml.="<a target='_blank' ";
            if (!$work or ($i<count($files)-1)) $thtml.="href='$file'";
            $thtml.=">".substr($file,strrpos($file,'/')+1)."</a> <i>(".(int)(filesize($file)/1024)." Kb)</i> ";
        }
        if (!$work) $thtml .= "<a rel='external' data-transition='slideup' data-role='button' data-mini='true' data-inline='true' data-icon='delete' data-theme='a' href='index.php?route=donors_list&deletefiles=$lang' data-corners='true' data-shadow='true' data-iconshadow='true' data-wrapperels='span' class='ui-btn ui-shadow ui-btn-corner-all ui-mini ui-btn-inline ui-btn-icon-left ui-btn-up-a' style=''><span class='ui-btn-inner ui-btn-corner-all'><span class='ui-btn-text'>Удалить файлы</span><span class='ui-icon ui-icon-delete ui-icon-shadow'>&nbsp;</span></span></a>";
        $thtml .= "</p>";
    }

}
$data['translation'] = $thtml;

// ---------------------------------

if ($_GET['command']=='start') { // Start donor parsing
    DonorStart(0,$_GET['id']);
    exit;
}

if ($_GET['command']=='stop') { // Start donor parsing
    DonorStop($_GET['id']);
    exit;
}

echo json_encode($data);