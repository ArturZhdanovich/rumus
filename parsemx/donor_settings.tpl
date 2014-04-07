<?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Save data without validation
        if (empty($_POST['proxy'])) $_POST['proxy_url'] = '';
        if ($_POST['proxy_url']) @unlink('proxy.txt');
        $dhost = domain(@$_POST['host']);
        if (@$_POST['missing']=='0') $_POST['missing']='';
        if (@$_GET['id'])
            $q = "UPDATE"; else $q = "INSERT INTO";
        $q .= " parsemx_donors SET
        host='" . $dhost . "',
        missing='" . @$_POST['missing'] . "',
        proxy='" . @$_POST['proxy_url'] . "',
        autorun='" . @$_POST['autorun'] . "'";
        if (@$_GET['id'])
            $q .= " WHERE donor_id=" . $_GET['id'];
        query($q);

        $id = query("SELECT donor_id FROM parsemx_donors ORDER BY donor_id DESC LIMIT 1")->row['donor_id'];

        if (@!$_GET['id']) {
            // Create task
            query("INSERT INTO parsemx_ins SET donor_id=$id, title='Задача', price='X', status='1', categories='',manufacturer=''");
            if (!file_exists($dhost.'.txt'))
                file_put_contents($dhost.'.txt',"[LIST]\n\n\n[PRODUCT]\n");
            redirect("wizard1&id=$id");
        }

        redirect('');
        exit;
    }

    if (@$_GET['delete']) {
        // Delete the donor
        if (!$_GET['id']) exit;
        query("DELETE FROM parsemx_donors WHERE donor_id=" . $_GET['id']);
        query("DELETE FROM parsemx_ins WHERE donor_id=" . $_GET['id']);
        redirect('');
        exit;
    }

    if (@$_GET['delete_entities']) {
        if (ini_get('max_execution_time')<600)
            if( !ini_get('safe_mode') )
                set_time_limit(600);
        DeleteDonorEntities($_GET['id'],0);
    }




    if (@$_GET['id']) {
        LoadDonorMeters($_GET['id']);
        RecountDonorMeters();
        SaveDonorMeters();
        $show_options = true;
    } else {
        $donor = array();
        $donor['donor_id'] = 0;
        $donor['host'] = '';
        $donor['state'] = 0;
        $donor['total_entities'] = 0;
        $donor['autorun'] = 0;
        $donor['missing'] = '';
        $donor['proxy'] = '';
        $show_options = false;
    }

require_once("header.tpl");
?>
<h2>Донор <font color="grey">для <?php echo $site ?></font></h2>

<form data-direction="reverse" rel="external" data-ajax="false" action="<?php u() ?>donor_settings&id=<?php echo @$_GET['id'] ?>"
      method="post">

    <p>Домен
        <?php if (!$donor['host']) { ?>
            <span style="color:grey">(вставьте ссылку на страницу донора, домен будет получен из неё)</span>
        <?php } ?>
        <input type="text" name="host" value="<?php echo $donor['host'] ?>">
    </p>
    <?php if ($show_options) { ?>
    <p>Сканировать каждый день <font color="grey">(сейчас на сервере <strong><?php echo date('H:i') ?>)</strong></font>
        <select data-inline="true" name="autorun" data-native-menu="false">
            <option value="0"<?php if (@!$donor['autorun'])
                echo  'selected="true"'?>>Вручную
            </option>
            <?php for ($i=1;$i<25;$i++) { ?>
            <option
                <?php if (@$donor['autorun'] == $i)
                echo  'selected="true"'?>
                    value="<?php echo $i ?>">в <?php echo $i.":00" ?></option>
            <?php } ?>
        </select>

    </p>

    <p>Товары, которые пропали у донора
        <select data-inline="true" name="missing" data-native-menu="false">
            <option value="none" <?php if ($donor['missing']=='none') echo 'selected="true"' ?> >
                Не изменять
            </option>
            <option value="0" <?php if ($donor['missing']=='') echo 'selected="true"' ?> >
                Удалять
            </option>
            <option value="stock" <?php if ($donor['missing']=='stock') echo 'selected="true"' ?>>
                Ставить "Нет в наличии"
            </option>
            <option value="disable" <?php if ($donor['missing']=='disable') echo 'selected="true"' ?> >
                Ставить статус "Отключено"
            </option>
        </select>
    </p>
    <p>
    <label><input type="checkbox" name="proxy" data-inline="true" data-mini="true"
            <?php if ($donor['proxy']) echo 'checked="true"'?>
            onclick="if (this.checked) $('#proxies').show(300); else $('#proxies').hide(300);"
            />Использовать прокси</label>
        <div id="proxies" <?php if (!$donor['proxy']) echo 'style="display:none"'?> >
        URL страницы с прокси-серверами: <input id="proxy_url" type="text" name="proxy_url" data-inline="true" data-mini="true"
        value="<?php if ($donor['proxy']) echo $donor['proxy']; else echo 'http://www.vpngeeks.com/proxylist.php?country=0&port=&speed%5B%5D=3&anon%5B%5D=1&anon%5B%5D=2&anon%5B%5D=3&type%5B%5D=1&type%5B%5D=2&conn%5B%5D=3&sort=2&order=1&rows=200&search=Find+Proxy' ?>">
        </div>
    </p>
    <?php } ?>

<?php if ($donor['donor_id']) { ?>
    <a data-role="button" rel="external" data-direction="reverse" data-inline="true" data-icon="delete" data-theme="a"
       href="<?php u() ?>donor_settings&delete=1&id=<?php echo @$_GET['id'] ?>">Удалить донора</a>
    <?php } ?>
    <span style="float: right">
        <?php if ($donor['total_entities']) { ?>
        <a data-role="button" data-direction="reverse" data-transition="flip" data-inline="true" data-icon="grid" data-theme="c"
           href="<?php u() ?>donor_settings&delete_entities=1&id=<?php echo @$_GET['id'] ?>">Удалить <?php echo $donor['total_entities'] ?> товаров донора</a>
        <?php } ?>
        <input type="submit" data-inline="true" data-icon="check" data-theme="b" value="Готово"/>
    </span>


    </p>

</form>