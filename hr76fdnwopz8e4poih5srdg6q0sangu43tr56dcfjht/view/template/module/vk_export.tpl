<?php echo $header; ?>
<div id="dialog-modal" style="dispay:none;"></div>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($error_warning_geo) { ?>
<div class="warning"><?php echo $error_warning_geo; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <div id="tabs" class="htabs">
        <a href="#tab1" style="display: inline;" class="selected">Экспорт</a>
        <a href="#tab2" style="display: inline;">Автоматизация (cron)</a>
        <a href="#tab3" style="display: inline;">Аккаунт</a>
        <a href="#tab4" style="display: inline;">Обновление</a>
        </div>
    <div id="tab1">
    <table class="form">
        <tr>
          <td><?php echo $entry_export_mode ?></td>
          <td>
            <label><input type="radio" name="vk_export_mode" value="1" <?php echo $vk_export_mode == 1 ? 'checked="checked"' : ''; ?> /><?php echo $text_export_mode_user ?></label><br />
            <label><input type="radio" name="vk_export_mode" value="2" <?php echo $vk_export_mode == 2 ? 'checked="checked"' : ''; ?> /><?php echo $text_export_mode_group ?></label><br />
            <label><input type="radio" name="vk_export_mode" value="3" <?php echo $vk_export_mode == 3 ? 'checked="checked"' : ''; ?> /><?php echo $text_export_mode_both ?></label><br />
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_image_mode ?></td>
          <td>
            <label><input type="radio" name="vk_export_image_mode" value="1" <?php echo $vk_export_image_mode == 1 ? 'checked="checked"' : ''; ?> /><?php echo $text_image_orig ?></label><br />
            <label><input type="radio" name="vk_export_image_mode" value="2" <?php echo $vk_export_image_mode == 2 ? 'checked="checked"' : ''; ?> /><?php echo $text_image_resize ?></label><br />
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_album_name_mode ?></td>
          <td>
            <label><input type="radio" name="vk_export_album_name_mode" value="1" <?php echo $vk_export_album_name_mode == 1 ? 'checked="checked"' : ''; ?> /><?php echo $text_album_name_orig ?></label><br />
            <label><input type="radio" name="vk_export_album_name_mode" value="2" <?php echo $vk_export_album_name_mode == 2 ? 'checked="checked"' : ''; ?> /><?php echo $text_album_name_path ?></label><br />
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_album_only ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_album_only" value="1" <?php echo $vk_export_album_only == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_mode_desc ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_mode_desc" value="1" <?php echo $vk_export_mode_desc == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
          <td valign="top"><?php echo $entry_desc_tpl ?></td>
          <td>
            <textarea name="vk_export_desc_tpl" style="float:left;" /><?php echo $vk_export_desc_tpl ?></textarea>
            <div class="help" style="float:left;padding-left:10px;" ><?php echo  $text_desc_tpl ?></div>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_mode_comment ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_mode_comment" value="1" <?php echo $vk_export_mode_comment == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
          <td valign="top"><?php echo $entry_comment_tpl ?></td>
          <td>
            <textarea name="vk_export_comment_tpl" style="float:left;" /><?php echo $vk_export_comment_tpl ?></textarea>
            <div class="help" style="float:left;padding-left:10px;" ><?php echo  $text_desc_tpl ?></div>
          </td>
        </tr> 
         <tr>
          <td><?php echo $entry_group_photo_comment_from ?></td>
          <td>
            <label><input type="radio" name="vk_export_group_photo_comment_from" value="0" <?php echo $vk_export_group_photo_comment_from == 0 ? 'checked="checked"' : ''; ?> /><?php echo $text_wallpost_from_user ?></label><br />
            <label><input type="radio" name="vk_export_group_photo_comment_from" value="1" <?php echo $vk_export_group_photo_comment_from == 1 ? 'checked="checked"' : ''; ?> /><?php echo $text_wallpost_from_group ?></label><br />
          </td>
        </tr>
        <tr>
          <td valign="top"><?php echo $entry_wallpost_tpl ?></td>
          <td>
            <textarea name="vk_export_wallpost_tpl" style="float:left;" /><?php echo $vk_export_wallpost_tpl ?></textarea>
            <div class="help" style="float:left;padding-left:10px;" ><?php echo  $text_desc_tpl ?></div>
            <div class="help" style="float:left;padding-left:10px;" ><?php echo  $text_desc_tpl_wall ?></div>
          </td>
        </tr>
        <tr>
          <td><?php echo $entry_group_wallpost_from ?></td>
          <td>
            <label><input type="radio" name="vk_export_group_wallpost_from" value="1" <?php echo $vk_export_group_wallpost_from == 1 ? 'checked="checked"' : ''; ?> /><?php echo $text_wallpost_from_user ?></label><br />
            <label><input type="radio" name="vk_export_group_wallpost_from" value="2" <?php echo $vk_export_group_wallpost_from == 2 ? 'checked="checked"' : ''; ?> /><?php echo $text_wallpost_from_group ?></label><br />
          </td>
        </tr> 
        <tr>
          <td valign="top"><?php echo $entry_user_replacements ?></td>
          <td>
            <div style="float:left;">
                <div class="help"><?php echo  $text_search ?></div>
                <textarea name="vk_export_user_replacements_keys" /><?php echo $vk_export_user_replacements_keys ?></textarea>
            </div>
            <div style="">
                <div class="help"><?php echo  $text_replacement ?></div>
                <textarea name="vk_export_user_replacements_values" /><?php echo $vk_export_user_replacements_values ?></textarea>
            </div>
            <div class="help"><?php echo  $text_replacements_desc ?></div>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_attributes_tpl ?></td>
          <td>
            <input type="text" name="vk_export_attributes_tpl" value="<?php echo $vk_export_attributes_tpl ?>" />
            <div class="help"><?php echo $text_attributes_tpl ?></div>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_attributes_delimeter ?></td>
          <td>
            <input type="text" name="vk_export_attributes_delimeter" value="<?php echo $vk_export_attributes_delimeter ?>" /> 
            <div class="help">{br} - перевод строки</div>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_photos_count ?></td>
          <td>
            <label><select name="vk_export_photos_count">
                <option value="1" <?php echo $vk_export_photos_count == 1 ? 'selected="selected"' : ''; ?>>1</option>
                <option value="2" <?php echo $vk_export_photos_count == 2 ? 'selected="selected"' : ''; ?>>2</option>
                <option value="3" <?php echo $vk_export_photos_count == 3 ? 'selected="selected"' : ''; ?>>3</option>
                <option value="4" <?php echo $vk_export_photos_count == 4 ? 'selected="selected"' : ''; ?>>4</option>
                <option value="5" <?php echo $vk_export_photos_count == 5 ? 'selected="selected"' : ''; ?>>5</option>
            </select></label>
            <div class="help"><?php echo $entry_photos_count_help ?></div>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_wallpost_photos_count ?></td>
          <td>
            <label><select name="vk_export_wallpost_photos_count">
                <option value="1" <?php echo $vk_export_wallpost_photos_count == 1 ? 'selected="selected"' : ''; ?>>1</option>
                <option value="2" <?php echo $vk_export_wallpost_photos_count == 2 ? 'selected="selected"' : ''; ?>>2</option>
                <option value="3" <?php echo $vk_export_wallpost_photos_count == 3 ? 'selected="selected"' : ''; ?>>3</option>
                <option value="4" <?php echo $vk_export_wallpost_photos_count == 4 ? 'selected="selected"' : ''; ?>>4</option>
                <option value="5" <?php echo $vk_export_wallpost_photos_count == 5 ? 'selected="selected"' : ''; ?>>5</option>
                <option value="all" <?php echo $vk_export_wallpost_photos_count == 'all' ? 'selected="selected"' : ''; ?>><?php echo $text_all ?></option>
            </select></label>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_wall_export_services ?></td>
          <td>
            <input type="text" name="vk_export_wall_export_services" value="<?php echo $vk_export_wall_export_services ?>" /> 
            <div class="help"><?php echo $entry_wall_export_services_help ?></div>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_http_catalog ?></td>
          <td>
            <label><input type="text" size="50" name="vk_export_http_catalog" value="<?php echo $vk_export_http_catalog ?>" /></label>
            <div class="help"><?php echo $text_desc_http_catalog ?></div>
          </td>
        </tr>
        <!--tr>
          <td><?php echo $entry_vkcc ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_vkcc" value="1" <?php echo $vk_export_vkcc == 1 ? 'checked="checked"' : ''; ?> /></label>
            <div class="help"><?php echo $text_vkcc_help ?></div>
          </td>
        </tr-->
        <tr>
          <td><?php echo $entry_products_per_page ?></td>
          <td>
            <label><input type="text" size="1" name="vk_export_products_per_page" value="<?php echo $vk_export_products_per_page ?>" /></label>
          </td>
        </tr>
        <tr>
          <td><?php echo $entry_colums ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_column_model" value="1" <?php echo $vk_export_column_model == 1 ? 'checked="checked"' : ''; ?> /> <?php echo $text_model; ?></label><br>
            <label><input type="checkbox" name="vk_export_column_price" value="1" <?php echo $vk_export_column_price == 1 ? 'checked="checked"' : ''; ?> /> <?php echo $text_price; ?></label><br>
            <label><input type="checkbox" name="vk_export_column_quantity" value="1" <?php echo $vk_export_column_quantity == 1 ? 'checked="checked"' : ''; ?> /> <?php echo $text_quantity; ?></label><br>
            <label><input type="checkbox" name="vk_export_column_status" value="1" <?php echo $vk_export_column_status == 1 ? 'checked="checked"' : ''; ?> /> <?php echo $text_status; ?></label><br>
            <label><input type="checkbox" name="vk_export_column_date_added" value="1" <?php echo $vk_export_column_date_added == 1 ? 'checked="checked"' : ''; ?> /> <?php echo $text_date_added; ?></label><br>
          </td>
        </tr>
        <tr>
          <td><?php echo $entry_debug_mode ?></td>
          <td>
            <label><select name="vk_export_debug_mode">
                <option value="0" <?php echo $vk_export_debug_mode == 0 ? 'selected="selected"' : ''; ?>><?php echo $text_disabled ?></option>
                <option value="1" <?php echo $vk_export_debug_mode == 1 ? 'selected="selected"' : ''; ?>><?php echo $text_enabled ?></option>
            </select></label>
          </td>
        </tr> 
      </table>
    </div>
    <div id="tab2" style="display:none;">
        Данную функцию рекомендуется использовать только опытным пользователям.
        <br><br>
        <table class="form">
        <tr>
          <td><?php echo $entry_turn_on_autoexport ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_autoexport" value="1" <?php echo $vk_export_autoexport == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_cron_user ?></td>
          <td>
            <label><input type="text" name="vk_export_cron_user" value="<?php echo $vk_export_cron_user ?>" /></label>
            <div class="help"><?php echo $text_cron_user_help ?></div>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_cron_pass ?></td>
          <td>
            <label><input type="password" name="vk_export_cron_pass" value="" /></label>
          </td>
        </tr>
        
        <tr>
          <td><?php echo $entry_export_only_instock ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_only_instock" value="1" <?php echo $vk_export_only_instock == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_delete_out_of_stock ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_cron_delete_out_of_stock" value="1" <?php echo $vk_export_cron_delete_out_of_stock == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_export_only_enabled ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_only_enabled" value="1" <?php echo $vk_export_only_enabled == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
		<tr>
          <td><?php echo $entry_delete_disabled ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_cron_delete_disabled" value="1" <?php echo $vk_export_cron_delete_disabled == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr> 
        <tr>
          <td><?php echo $entry_export_albums_only_specials ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_albums_only_specials" value="1" <?php echo $vk_export_albums_only_specials == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_export_wall_only_specials ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_wall_only_specials" value="1" <?php echo $vk_export_wall_only_specials == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_export_wall_unique ?></td>
          <td>
            <label><input type="checkbox" name="vk_export_wall_unique" value="1" <?php echo $vk_export_wall_unique == 1 ? 'checked="checked"' : ''; ?> /></label>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_num_products_for_cron ?></td>
          <td>
            <label><input type="text" size="1" name="vk_export_num_products_for_cron" value="<?php echo $vk_export_num_products_for_cron ?>" /></label>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_num_wallpost_for_cron ?></td>
          <td>
            <label><input type="text" size="1" name="vk_export_cron_wallpost_max" value="<?php echo $vk_export_cron_wallpost_max ?>" /></label>
          </td>
        </tr>  
        <tr>
          <td><?php echo $entry_category_autoexport; ?></td>
          <td><div class="scrollbox">
              <?php $class = 'odd'; ?>
              <?php foreach ($categories as $category) { ?>
              <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
              <div class="<?php echo $class; ?>">
                <?php if (in_array($category['category_id'], $vk_export_autoexport_category)) { ?>
                <input type="checkbox" name="vk_export_autoexport_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                <?php echo $category['name']; ?>
                <?php } else { ?>
                <input type="checkbox" name="vk_export_autoexport_category[]" value="<?php echo $category['category_id']; ?>" />
                <?php echo $category['name']; ?>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
            <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
        </tr>
        <tr>
          <td><?php echo $entry_category_autoexport_wall; ?></td>
          <td><div class="scrollbox">
              <?php $class = 'odd'; ?>
              <?php foreach ($categories as $category) { ?>
              <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
              <div class="<?php echo $class; ?>">
                <?php if (in_array($category['category_id'], $vk_export_autoexport_category_wall)) { ?>
                <input type="checkbox" name="vk_export_autoexport_category_wall[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                <?php echo $category['name']; ?>
                <?php } else { ?>
                <input type="checkbox" name="vk_export_autoexport_category_wall[]" value="<?php echo $category['category_id']; ?>" />
                <?php echo $category['name']; ?>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
            <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
        </tr>
        </table>
        <h2>Что дальше?</h2>
        <b>Теперь самое главное.</b>
        <ul>
          <li>Скопировать файл <font color="green"><b>vk_export_cron.php</b></font> из архива в директорию <font color="green"><b>admin/</b></font><br><br></li>
          
          <li>Для запрета прямого запуска скрипта в файл <font color="green"><b>admin/.htaccess</b></font> добавить код:<br>
          <font color="green"><pre>
&lt;Files vk_export_cron.php&gt;
    Order Deny,Allow
    Deny from all 
&lt;/Files&gt;</pre></font>
          
          <li>Через панель управление хостингом сайта создать задание в <a href="http://ru.wikipedia.org/wiki/Cron" target="_new">cron</a><br><br></li>
          
          <li>Создать команду запуска: <br><br>
          Путь к php <input type="text" id="php_path" value="/usr/bin/php"><br>
          <input type="radio" name="cmd_type" class="cmd_type" id="cmd_type1" value="" checked="checked"> <label for="cmd_type1">экспорт в альбомы</label><br>
          <input type="radio" name="cmd_type" class="cmd_type" id="cmd_type2" value=" -- -wall"> <label for="cmd_type2">экспорт на стену</label><br>
          <input type="radio" name="cmd_type" class="cmd_type" id="cmd_type3" value=" -- -update"> <label for="cmd_type3">обновление товаров в альбомах</label><br>
          <br>
          <input type="button" id="create_cmd" value="Создать команду"><br><br>
          <div id="cron_cmd" style="display:none;">
          Ваша команда: <font color="green"><pre><span id="cmd_php_path">/usr/bin/php</span> <?php echo DIR_APPLICATION; ?>vk_export_cron.php<span id="cmd_param"></span></pre></font> 
          Укажите её в задании cron.<br><br>
          </div>
          </li>
          <li>Остается указать расписание запуска автоэкспорта. Можно например назначить запуск ежедневно в 3:00 часа ночи, в период минимальной активности посетителей на сайте.
          <br><br></li>
          <li>Следует включить отправку отчетов на e-mail. Лог будет располагаться в файле <font color="#8B6914">system/logs/vkExport_cron.txt</font></li>
        </ul>
    </div>
    <div id="tab3" style="display:none;">
		<h2><?php echo $text_account_setup ?></h2>
		<ol>
			<li><?php echo $text_account_step1 ?></li>
			<li><?php echo $text_account_step2 ?></li>
			<li><?php echo $text_account_step3 ?></li>
			<li><?php echo $text_account_step4 ?>
				<br>
				<input type="text" id="client_id" value="">
			</li>
			<li><?php echo $text_account_step5 ?></li>
			<li><?php echo $text_account_step6 ?>
				<br>
				<input type="text" id="vk_export_access_token" name="vk_export_access_token" value=""><a href="javascript:void(0);" id="check_app_security" class="button">Подключить</a>
			</li>
			<li><?php echo $text_account_step7 ?></li>
		</ol>
      <table class="form">
        <tr>
          <td><?php echo $entry_user_id ?></td>
          <td>
            <label><input type="text" name="vk_export_user_id" value="<?php echo $vk_export_user_id ?>" /></label>
            <div class="help"><?php echo $text_user_id_example ?></div>
          </td>
        </tr>  
         
        <tr>
          <td><?php echo $entry_group_id ?></td>
          <td>
            <label><input type="text" name="vk_export_group_id" value="<?php echo $vk_export_group_id ?>" /></label>
            <div class="help"><?php echo $text_group_owner ?></div>
          </td>
        </tr>  
         
    </table>
    </div>
    <div id="tab4" style="display:none;">
        Обновление модуля производится вручную, путём загрузки файлов на сервер через FTP. <br>Здесь производится обновление структуры БД.<br>
        Это необходимо делать только один раз, после загрузки обновлённых файлов на сервер.<br>
        <?php
        if ($show_db_update) {
            ?>
            <br>
            <div class="buttons"><a onclick="$('#form').submit();" class="button">Обновить структуру БД</a></div>
            <?php
        }
        else {
            ?>
            <br><br>
            <b>Обновление структуры БД не требуется.</b>
            <?php 
        }
        ?>
    </div>
    </form>
  </div>
</div> 

<script type="text/javascript"><!--
$('#tabs a').tabs(); 

$('#create_cmd').click(function () {
    $('#cmd_param').text($('.cmd_type:checked').val());
    $('#cmd_php_path').text($('#php_path').val());
    $('#cron_cmd').show();
});

$('#client_id').change(function (e) {
	$('#token_link').attr('href', 'https://oauth.vk.com/authorize?client_id=' + $('#client_id').val() + '&scope=photos,wall,groups,offline&redirect_uri=https://oauth.vk.com/blank.html&display=page&v=5.3&response_type=token&test_redirect_uri=1');
});

$('#check_app_security').live('click', function () {
    
    var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($check_app_security); ?>",
      type: "POST",
      data: $("#vk_export_access_token").serialize(),
      dataType: "html"
    });
    
    request.done(function(data) {

		$( "#dialog-modal" ).html(data);
		
		$( "#dialog-modal" ).dialog({
            modal: true,
            buttons: {
                Ok: function() {
                $( this ).dialog( "close" );
                }
            },
            title: 'Проверка доступа',
            maxHeight: 600
        });

    });
});
$('#check_phone_number').live('click', function () {
    
    var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($check_phone_number); ?>",
      type: "POST",
      data: $('input[name="code"], #security_url').serialize(),
      dataType: "html"
    });
    
    request.done(function(data) {

		$( "#dialog-modal" ).html(data);
		
		$( "#dialog-modal" ).dialog({
            modal: true,
            buttons: {
                Ok: function() {
                $( this ).dialog( "close" );
                }
            },
            title: 'Проверка доступа',
            maxHeight: 600
        });

    });
});


//--></script> 

<?php echo $footer; ?>
