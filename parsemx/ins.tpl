<?php

require_once("scripter.php");

$il = @$_GET['il'];

$donor = query("SELECT * FROM parsemx_donors WHERE donor_id=".$_GET['donor_id'])->row;

if ($_SERVER['REQUEST_METHOD']=='POST') {

    // Save data without validation
    if ($_POST['manufacturer']=='x') $_POST['manufacturer']='';

    if (@$_GET['id']) $q="UPDATE"; else $q="INSERT INTO";

    if (@$_POST['main_category'])
        if (@$_POST['categories'])
            $_POST['categories'] = $_POST['main_category'] . "," . implode(',',$_POST['categories']);
        else $_POST['categories'] = $_POST['main_category'];
    else @$_POST['categories'] = implode(',',$_POST['categories']);
    $q.=" parsemx_ins SET
        donor_id='".$_GET['donor_id']."',
        title='".@$_POST['title']."',
        url='".@$_POST['url']."',
        categories='".$_POST['categories']."',
        manufacturer='".@$_POST['manufacturer']."',
        price='".@$_POST['price']."',
        status='".@$_POST['status']."'";

    if (@$_GET['id']) $q.="WHERE ins_id=".$_GET['id'];
    query($q);

    $script_file = $donor['host'].'_'.@translit($_POST['title']).'.txt';

    if (@$_POST['script']) file_put_contents( $script_file ,@html_entity_decode($_POST['script']));
    else @unlink($script_file);

    $_GET['id'] = $_GET['donor_id'];
    require_once('tasks.tpl');
    exit;

}

if (@$_GET['delete']) {
    // Delete the instruction
    query("DELETE FROM parsemx_ins WHERE ins_id=".$_GET['id']);
    $_GET['id'] = $_GET['donor_id'];
    require_once('tasks.tpl');
    exit;

}

if (@$_GET['id']) {
    $ins = query("SELECT * FROM parsemx_ins WHERE ins_id=".$_GET['id'])->row;
    $script = @file_get_contents($donor['host'].'_'.translit($ins['title']).'.txt');
}
    else {
        $ins=array();
        $ins['donor_id']=$_GET['donor_id'];
        $ins['title'] = 'Задача';
        $ins['price'] = 'X';
        $ins['status'] = 1;
    }


$main_category = 0;
@$ins['categories']=explode(',',$ins['categories']);
if ($ins['categories']) {
    // Make main category
    $main_category = $ins['categories'][0];
    unset($ins['categories'][0]);
}

$categories = GetCategories();
$manufacturers = GetManufacturers();

require_once("header.tpl");

?>

<form data-direction="reverse" action="<?php u() ?>ins&id=<?php echo @$_GET['id'] ?>&donor_id=<?php echo @$donor['donor_id'] ?>&il=<?php echo $il ?>" method="post">

<h2>Задача <font color="grey">для <?php echo $donor['host'] ?></font>
<span style="float:right; font-size: medium;">
    <select name="status" data-inline="true" data-role="slider">
        <option value="0">Выкл</option>
        <option value="1" <?php if ($ins['status']) echo  'selected="true"'?> >Вкл</option>
    </select>
</span>
</h2>



    <p>Название <input type="text" name="title" value="<?php echo $ins['title'] ?>"></p>

    <p>Ссылки на источники товаров
        <br/><span class="remark">
            Один или несколько URL (с новой строки), которые указывают на страницы списков товаров
        </span>
        <textarea wrap="off" name="url"><?php echo @$ins['url'] ?></textarea></p>

    <p>Основная категория
        <select name="main_category" data-native-menu="false">
            <option value="0"
                <?php if (!$main_category) echo 'selected="true"' ?>
                    >Нет</option>
            <?php foreach ($categories as $category) { ?>
            <option value="<?php echo $category['category_id'] ?>"
                <?php if ($category['category_id']==$main_category) echo 'selected="true"' ?>
                    ><?php echo $category['name'] ?></option>
            <?php } ?>
        </select></p>

    <p>Дополнительные категории
        <select name="categories[]" multiple="multiple" data-native-menu="false">
          <?php foreach ($categories as $category) { ?>
            <option value="<?php echo $category['category_id'] ?>"
                    <?php if (in_array($category['category_id'],$ins['categories'])) echo 'selected="true"' ?>
                    ><?php echo $category['name'] ?></option>
          <?php } ?>
        </select></p>

    <p>Производитель по умолчанию
        <select name="manufacturer" data-native-menu="false">
            <option value="x"<?php if (@!$ins['manufacturer']) echo  'selected="true"'?>>Не устанавливать</option>
            <?php foreach ($manufacturers as $manufacturer) { ?>
            <option
                    <?php if (@$ins['manufacturer']==$manufacturer['manufacturer_id']) echo  'selected="true"'?>
                    value="<?php echo $manufacturer['manufacturer_id'] ?>"><?php echo $manufacturer['name'] ?></option>
            <?php } ?>
        </select></p>

    <p>Формула цены
        <br/><span class="remark">
           Например: X * 1.5 + 20
        </span>
        <input type="text" name="price" value="<?php echo $ins['price'] ?>"></p>

    <p>

    <p id="script">Дополнительный скрипт для задачи
        <br/><span class="remark">
            Будет выполнен после анализа товара
        </span>
        <textarea wrap="off" name="script"><?php echo @htmlspecialchars($script) ?></textarea></p>

    <span style="float: right">
        <?php if (@$_GET['id']) { ?>
        <a data-role="button" data-direction="reverse" data-inline="true" data-icon="delete" data-theme="a" href="<?php u() ?>ins&delete=1&id=<?php echo @$_GET['id'] ?>&donor_id=<?php echo @$donor['donor_id'] ?>&il=<?php echo $il ?>">Удалить</a>
        <?php } ?>
        <a data-role="button" data-direction="reverse" data-inline="true" data-icon="arrow-l" href="<?php u() ?>tasks&id=<?php echo $donor['donor_id'] ?>&il=<?php echo $il ?>">Отмена</a>
        <input type="submit" data-direction="reverse" data-inline="true" data-icon="check" data-theme="b" value="Готово"/>
    </span>


    </p>

</form>