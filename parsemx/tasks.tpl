<?php

$il = @$_GET['il'];

if (@$_GET['delgoods']) {
    if (ini_get('max_execution_time')<600)
        if( !ini_get('safe_mode') )
            set_time_limit(600);
    DeleteDonorEntities($_GET['id'],$_GET['delgoods']);
    redirect('tasks&id='.$_GET['id'].'&il='.$il);
}

if (@$_GET['run']) {
    DonorStart($_GET['run'],$_GET['id']);
    $ins = query("SELECT * FROM parsemx_ins WHERE ins_id=".$_GET['run'])->row;
    xlog("NOTICE: Task <b>".$ins['title']."</b> started.");
    redirect('tasks&id='.$_GET['id'].'&il='.$il);
}

$donor = query("SELECT * FROM parsemx_donors WHERE donor_id=".$_GET['id'])->row;

require_once("header.tpl");
?>
<h2>Задачи <font color="grey">для <?php echo $donor['host'] ?></font></h2>

    <ul data-role="listview">
    <?php
    $inses = query("SELECT *, (SELECT COUNT(*) FROM parsemx_entities WHERE ins_id=i.ins_id) as n FROM parsemx_ins i WHERE donor_id=".$donor['donor_id'])->rows;
    foreach ($inses as $ins) { ?>
        <li <?php if ($ins['status']) echo 'data-theme="e"' ?> >
            <a href="<?php u() ?>ins&id=<?php echo $ins['ins_id'] ?>&donor_id=<?php echo $donor['donor_id'] ?>&il=<?php echo $il ?>">
            <?php echo $ins['title'] ?>
            </a>
            <?php if ($ins['n']) { ?>
                <span class="ui-li-count" title="Удалить товары"
                        onclick="
                        if (confirm('Удалить <?php echo $ins['n'] ?> товаров задачи <?php echo $ins['title'] ?>?')) window.location = '<?php echo $_SERVER['REQUEST_URI'].'&delgoods='.$ins['ins_id'] ?>&il=<?php echo $il ?>';
                        ">
                    <?php echo $ins['n'] ?> товаров</span>
            <?php } ?>
                <?php if (@$_GET['il']) { ?>
                    <a data-icon='play' data-theme='b' href="<?php echo $_SERVER['REQUEST_URI'].'&run='.$ins['ins_id'] ?>&il=<?php echo $il ?>">Пуск задачи</a>
                <?php } ?>

        </li>
    <?php } ?>
    </ul>
    <br />
    <a data-transition="reverse" rel="external" data-role="button" data-icon="arrow-l" data-inline="true" href="<?php u() ?>">Назад</a>
    <a data-transition="slideup" data-role="button" data-theme="b" data-icon="plus" data-inline="true" href="<?php u() ?>ins&donor_id=<?php echo $donor['donor_id'] ?>&il=<?php echo $il ?>">Добавить задачу</a>