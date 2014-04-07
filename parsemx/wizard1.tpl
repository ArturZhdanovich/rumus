<?php
$donor = query("SELECT * FROM parsemx_donors WHERE donor_id=".$_GET['id'])->row;
require_once("scripter.php");
$code = @file_get_contents($donor['host'] . '.txt');
$code = replace("[*]",'',$code);
$code = trim($code);
if (!$code) { // Check site for instructions
    $html = _curl("http://devs.mx/forum/13-%D0%B8%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8-parsemx/","","",false);
    $html = strtolower($html);
    $topics = tags_text("h4 .topic_title span",$html);
    $urls = tags_href("h4 a.topic_title",'',$html);
    $i = array_search(strtolower($donor['host']),$topics);
    if ($i!==false) { // Ins found
        $url = $urls[$i];
        $html = _curl($url,"","",false);
        $code = tag_text(".prettyprint",$html);
        file_put_contents($donor['host'] . '.txt',$code);
        GenerateScripts($donor['host']);
        redirect('script_settings&id='.$_GET['id']);
    }
}

$list = @$_GET['list'];
if ($list) $donor['host']=$donor['host'].'L';
$pfile = $donor['host'].'_wizpages.inf';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if( !ini_get('safe_mode') )
        @set_time_limit(300);

    // Save to the file.
    $f=fopen($pfile,'w');
    for($i=0;$i<10;$i++) {
        $purls[$i] = $_POST['prod'.$i];
        fwrite($f,$purls[$i]."\n");
    }
    fclose($f);

    // Load product pages
    foreach ($purls as $i=>$url) {
        if (!$i and !$donor['check_url']) query("UPDATE parsemx_donors SET check_url='$url'WHERE donor_id=".$donor['donor_id']);
        $fname = $donor['host'].'_data'.$i.'.tmp';
        @unlink($fname);
        if (!$url) continue;
        $html = get($url);
        if ($last_result==200) file_put_contents($fname,$html);
    }
    redirect('wizard2&id='.$donor['donor_id'].'&list='.$list);
}

$purls = array();
if (file_exists($pfile)) $purls=file($pfile,FILE_IGNORE_NEW_LINES);

require_once("header.tpl");
?>
<h2>Мастер инструкций <font color="grey">для <?php if ($list) echo substr($donor['host'],0,-1); else echo $donor['host'] ?></font></h2>

    <p><?php if ($list) { ?>
        <?php if (!$purls) { ?>
            Вставьте ссылку на страницу со списком товаров (<a href="http://bookup.me/internet" target="_blank" style="font-weight: normal; text-decoration: none">пример</a>).
            <?php } else { ?>
            Что бы улучшить результат, добавьте еще несколько ссылок.
            Если есть страницы, которые не обрабатываются как следует - добавляйте их в список.
            <?php } ?>
        <?php } else { ?>
        <?php if (!$purls) { ?>
        Вставьте ссылки на несколько товаров донора (<a href="http://bookup.me/unlimited-energy" target="_blank" style="font-weight: normal; text-decoration: none">пример</a>).
        <br/>Старайтесь брать максимально разнотипные из интересных вам продуктов.<br/><br/>
        <?php } else { ?>
        Что бы улучшить результат, добавьте еще ссылок на товары.
        Если есть товары, которые не обрабатываются как следует - добавляйте их в список.
                <br/><br/>
                Для настройки массового парсинга нажмите "Категории".
        <?php } ?>
    <?php } ?>
    </p>

<form rel="external" data-ajax="false" data-transition="flip" action="<?php u() ?>wizard1&id=<?php echo $donor['donor_id'] ?>&list=<?php echo $list ?>" method="post">

    <?php if ($purls) { ?>
        <br />
        <a data-transition="reverse" rel="external" data-role="button" data-icon="arrow-l" data-inline="true" href="<?php u() ?>script&id=<?php echo $donor['donor_id'] ?>">Назад</a>
        <input type="submit" data-inline="true" data-icon="check" data-theme="b"
               value="Продолжить" onclick="$('#wait').show(500)"/>
    <?php } ?>

<?php if ($purls and !$list) { ?>
    <a data-role="button" data-icon="plus" data-theme="d" data-inline="true"
       href="<?php echo $_SERVER["REQUEST_URI"] ?>&list=1">Категории</a>
    <?php } ?>

    <p id="wait" style="display:none; color:green">
        Ждите, загружаются страницы <?php if ($list) echo 'категорий'; else echo 'товаров' ?>...
    </p>

    <?php for($i=0;$i<10;$i++) { ?>
    <div data-role="fieldcontain" <?php if (!$purls and ( ($i>2) or ($list and $i) )) echo 'style="display:none"' ?> >
     <label><?php if ($list) echo "Категория "; else echo "Товар "; echo $i+1 ?>:
         <input data-inline="true" data-mini="true" type="text" name="prod<?php echo $i ?>" value="<?php echo @$purls[$i] ?>">
     </label>
    </div>
    <?php } ?>

    <?php if (!$purls) { ?>
        <br />
        <a data-transition="reverse" rel="external" data-role="button" data-icon="arrow-l" data-inline="true" href="<?php u() ?>script&id=<?php echo $donor['donor_id'] ?>">Назад</a>
        <input type="submit" data-inline="true" data-icon="check" data-theme="b"
               value="Продолжить" onclick="$('#wait').show(500)"/>
    <?php } ?>

</form>