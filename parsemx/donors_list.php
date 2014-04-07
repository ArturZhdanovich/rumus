<?php $result = '';

function DeleteLangFiles($lang)
{
    $files = glob("translate/$lang/*.html");
    foreach ($files as $file) @unlink($file);
}

if (@$_GET['reset_trans']) {
    query("TRUNCATE TABLE parsemx_translate");
    $langs = glob('translate/*');
    foreach ($langs as $lang) {
        DeleteLangFiles(substr($lang, 10));
        @rmdir($lang);
    }
    @rmdir('translate');
    redirect('');
}
if (@$_GET['deletefiles']) {
    DeleteLangFiles($_GET['deletefiles']);
    redirect('');
}
if (@$_GET['saveuntranslated']) {
    SaveUntranslatedLangFiles($_GET['saveuntranslated']);
    redirect('');
}
$donors = query("SELECT * FROM parsemx_donors ORDER BY donor_id DESC")->rows;
$langs = query("SELECT lang, COUNT(*) as n FROM parsemx_translate GROUP BY lang")->rows;
$tfiles = glob('*.txt');
$texts = array();
foreach ($tfiles as $tfile) {
    if (strpos(str_replace('.txt', '', $tfile), '.')) continue;
}
require_once("header.tpl");
if ($result) {
    echo "<h4 style='color: green'>$result</h4>";
    echo "<a href='index.php' rel='external' data-inline='true' data-role='button' data-icon='check' data-theme='b'>OK</a>";
    require_once("footer.tpl");
    exit;
} ?>

<?php if ($result) { ?>
    <h4 style="color: green"><?php echo $result ?></h4>
<?php } ?>

<div>

</div>

<h2>Сайты-доноры <font color="grey">для <?php echo $site ?></font>
    <span id="nocron" style="float:right; font-size: 10px; color: grey; display:none">Запуск CRON: не настроен</span>
    <span id="yescron" style="float:right; font-size: 10px; color: green; display:none">Запуск CRON: OK</span>
</h2>
<br/>

<ul data-role="listview">
    <?php foreach ($donors as $donor) {
        $id = $donor['donor_id'] ?>
        <li>

            <h3 style="font-size: 20px; margin:0px; height: 55px">
                <span style="float:left">
                    <div style="width: 210px; display: inline-block; overflow: hidden">
                        <?php if (strlen($donor['host']) > 201) echo substr($donor['host'], 0, 18) . '<span style="color:grey">...</span>'; else echo $donor['host'] ?>
                    </div>
                    <a id="l<?php echo $id ?>" data-role="button" data-inline="true" data-mini="true" data-icon="grid"
                       data-theme="c" href="<?php u() ?>tasks&id=<?php echo $donor['donor_id'] ?>">
                        Задачи</a>
                <a data-role="button" rel="external" data-inline="true" data-mini="true" data-icon="page" data-theme="c"
                   href="<?php u() ?>script&id=<?php echo $donor['donor_id'] ?>">Скрипт</a>
                <a data-role="button" data-inline="true" data-mini="true" data-icon="gear" data-theme="c"
                   href="<?php u() ?>donor_settings&id=<?php echo $donor['donor_id'] ?>">Настройки</a>
                </span>
                <span id="obj<?php echo $id ?>" style="float:right">
                    <div style='text-align:right;'>
                        <a data-role='button' id='go<?php echo $id ?>' data-inline='true' data-mini='true' data-icon='play' data-theme='b' style='display: none'
                           onclick='
                                    $("#go<?php echo $id ?>").hide();
                                    $.post("live.php?command=start&id=<?php echo $id ?>",false, function(data) {
                                    $("#go<?php echo $id ?>").hide();
                                    $("#stop<?php echo $id ?>").show();
                            });
                            '>Пуск</a>
                        <a data-role='button' id='stop<?php echo $id ?>' data-inline='true' data-mini='true' data-icon='stop' data-theme='a' style='display: none'
                           onclick='
                               $("#stop<?php echo $id ?>").hide();
                               $.post("live.php?command=stop&id=<?php echo $id ?>",false, function(data) {
                               $("#stop<?php echo $id ?>").hide();
                               $("#go<?php echo $id ?>").show();
                            });
                            '>Стоп</a>
                    </div>
                </span>
            </h3>
            <div id="<?php echo $donor['donor_id'] ?>"
                 style="margin-top:-10px; font-size:11px; font-weight: normal; min-height:43px;">&nbsp;</div>
        </li>
    <?php } ?>
</ul>

<br/> <br/>
<a data-transition="slideup" data-role="button" data-icon="plus" data-inline="true" href="<?php u() ?>donor_settings">Добавить
    донора</a>
<a data-transition="slideup" data-role="button" data-icon="grid" data-inline="true" href="<?php u() ?>log">Лог</a>

<br/> <br/>
<div id="translation">

</div>
<br/> <br/>
<a style="display:none" rel="external" id="clear_trans" data-transition="slideup" data-role="button" data-mini="true"
   data-inline="true" data-icon="delete" data-theme="a" href="<?php u() ?>donors_list&reset_trans=1">Удалить все данные
    перевода</a>

<script type="text/javascript">
    function UpdateDonors() {
        $.get('live.php?command=donors', false, function (data) {
            $.each(data['donors'], function (index, value) {
                $('#' + index).empty().append(value['text']);
                if (value['state']) {
                    $('#go' + index).hide();
                    $('#stop' + index).show();
                } else {
                    $('#go' + index).show();
                    $('#stop' + index).hide();
                }
            });
            $('#translation').html(data['translation']);
            if (data['translation'] && !data['work']) $('#clear_trans').show(); else $('#clear_trans').hide();
            if (data['cron']) {
                $('#nocron').hide();
                $('#yescron').show();
            }
            else {
                $('#yescron').hide();
                $('#nocron').show();
            }
            if ((!data['cron']) && (data['work'])) jQuery.ajax('locker.php?noidle=1');
        }, "json");
    }
</script>