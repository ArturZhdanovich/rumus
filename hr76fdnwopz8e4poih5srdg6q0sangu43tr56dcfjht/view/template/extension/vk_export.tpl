<?php echo $header; ?>
<div id="dialog-modal" style="dispay:none;"></div>
<style type="text/css">
.loading_info {
    padding: 10px 10px 10px 33px;
	margin-bottom: 15px;
	background: #F7F7F7;
	border: 1px solid #B8B8B8;
	color: #555555;
	-webkit-border-radius: 5px 5px 5px 5px;
	-moz-border-radius: 5px 5px 5px 5px;
	-khtml-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}
#progressbar_wrapper {
	font-size:14px;
	padding-left:16px;
}
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  <div id="loading_info" class="loading_info" style="display:none;"><img src="view/image/loading.gif">&nbsp;&nbsp;<span id="action_message"></span>
  <div id="progressbar_wrapper"><br>Экспортировано <span id="progress_value"></span> из <span id="total_export"></span></div>
  <div id="timer"></div>
  </div>
  <?php if ($warning) { ?>
  <div class="warning"><?php echo $warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php 
    if ($this->config->get('vk_export_debug_mode')) {
        echo '<div class="attention">Режим отладки включён. Не забудьте выключить его после отладочных действий.
        <a href="' . $get_log . '" target="_blank">Скачать лог</a>
        </div>';
    }
  ?>
  <div class="box" id="products_table">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
          <a id="extra_settings_button" onClick="$('#extra_settings').toggle('slow');">дополнительно</a> |
          <a id="export_action" class="button">Экспортировать в альбомы</a>
          <a id="reexport_action" class="button">Удалить из альбомов</a>
          <a id="wallpost_action" class="button">Экспортировать на стену</a>
          <a id="delete_wall_action" class="button">Удалить со стены</a>
          </div>
    </div>
    <div class="content">
        <form action="" method="post" enctype="multipart/form-data" id="form">
        <div id="extra_settings" style="<?php echo $extra_settings ?>">
            <table class="form">
              <tr>
                <td valign="top">Экспорт в произвольный альбом: </td>
                <td><?php if ($extra_album_error) : ?><span class="error"><?php echo $extra_album_error; ?></span><?php endif; ?>
                <input type="text"  maxlength="255" size="50" name="extra_album" value="<?php echo $extra_album ?>">
                    <a<?php echo $hide_clear_extra; ?> href="<?php echo $clear_extra; ?>" class="button">Очистить</a>
                     <div class="help">Здесь можно указать прямую ссылку на альбом, в который вы хотите экспортировать товары</div>
                </td>
              </tr>
            </table>
        </div>
        
        <table class="list">
          <thead>
              
            <tr>
              <td rowspan="2" width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td rowspan="2" class="center"><?php echo $column_image; ?></td>
              <td rowspan="2" class="left"><?php if ($sort == 'pd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
                
              <?php if ($show_column_model) { ?>  
              <td rowspan="2" class="left"><?php if ($sort == 'p.model') { ?>
                <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                <?php } ?></td>
              <?php } ?>
            
              <?php if ($show_column_price) { ?>  
              <td rowspan="2" class="left"><?php if ($sort == 'p.price') { ?>
                <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
                <?php } ?></td>
              <?php } ?>
              
              <?php if ($show_column_quantity) { ?>  
              <td rowspan="2" class="right"><?php if ($sort == 'p.quantity') { ?>
                <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                <?php } ?></td>
              <?php } ?>
            
              <?php if ($show_column_status) { ?>  
              <td rowspan="2" class="left"><?php if ($sort == 'p.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <?php } ?>
              
              <?php if ($show_column_date_added) { ?>  
              <td rowspan="2" class="left"><?php if ($sort == 'p.date_added') { ?>
                <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                <?php } ?></td>
              <?php } ?>
              
              <td rowspan="2" class="left">
                <?php echo $column_album; ?>
               </td>
              <td colspan="2" class="center">Экспорт</td>
            </tr>
            <tr>
              <td class="left"><?php if ($sort == 'export_albums') { ?>
                <a href="<?php echo $sort_export_albums; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_albums; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_export_albums; ?>"><?php echo $column_albums; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'export_wall') { ?>
                <a href="<?php echo $sort_export_wall; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_wall; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_export_wall; ?>"><?php echo $column_wall; ?></a>
                <?php } ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td align="center"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
              <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
              
              <?php if ($show_column_model) { ?> 
              <td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>
              <?php } ?>
              
              <?php if ($show_column_price) { ?> 
              <td align="left"><input type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8"/></td>
              <?php } ?>
              
              <?php if ($show_column_quantity) { ?> 
              <td align="right"><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align: right; width:50px;" /></td>
              <?php } ?>
              
              <?php if ($show_column_status) { ?> 
              <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <?php } ?>    
              
              <?php if ($show_column_date_added) { ?> 
              <td><input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" style="width:70px;" class="date" /></td>
              <?php } ?>
            
              <td><?php echo $category_select; ?></td>
              <td><select name="filter_export_albums">
                  <option value="*"></option>
                  <?php if ($filter_export_albums) { ?>
                  <option value="1" selected="selected"><?php echo $text_vk_export_on; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_vk_export_on; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_export_albums) && !$filter_export_albums) { ?>
                  <option value="0" selected="selected"><?php echo $text_vk_export_off; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_vk_export_off; ?></option>
                  <?php } ?>
                </select></td>
              <td><select name="filter_export_wall">
                  <option value="*"></option>
                  <?php if ($filter_export_wall) { ?>
                  <option value="1" selected="selected"><?php echo $text_vk_export_on; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_vk_export_on; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_export_wall) && !$filter_export_wall) { ?>
                  <option value="0" selected="selected"><?php echo $text_vk_export_off; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_vk_export_off; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <?php if ($products) { ?>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($product['selected']) { ?>
                <input id="selected" type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input id="selected" type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                <?php } ?></td>
              <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" /></td>
              <td class="left"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a></td>
              
              <?php if ($show_column_model) { ?>
              <td class="left"><?php echo $product['model']; ?></td>
              <?php } ?>
              
              <?php if ($show_column_price) { ?>
              <td class="left"><?php if ($product['special']) { ?>
                <span style="text-decoration: line-through;"><?php echo $product['price']; ?></span><br/>
                <span style="color: #b00;"><?php echo $product['special']; ?></span>
                <?php } else { ?>
                <?php echo $product['price']; ?>
                <?php } ?></td>
              <?php } ?>
            
              <?php if ($show_column_quantity) { ?>
              <td class="right"><?php if ($product['quantity'] <= 0) { ?>
                <span style="color: #FF0000;"><?php echo $product['quantity']; ?></span>
                <?php } elseif ($product['quantity'] <= 5) { ?>
                <span style="color: #FFA500;"><?php echo $product['quantity']; ?></span>
                <?php } else { ?>
                <span style="color: #008000;"><?php echo $product['quantity']; ?></span>
                <?php } ?></td>
              <?php } ?>
            
              <?php if ($show_column_status) { ?>
              <td class="left"><?php echo $product['status']; ?></td>
              <?php } ?>
            
              <?php if ($show_column_date_added) { ?>
              <td class="left"><?php echo $product['date_added']; ?></td>
              <?php } ?>
              
              <td class="left"><?php echo $product['album_select']; ?></td>
              <td class="left">
                  <?php if ($product['albums_export']) {
                      $total = count($product['albums_export']);
                      if ($total > 1) {
                          echo '<img src="view/image/success.png" style="margin-bottom:-4px;margin-right:3px;" /><b><a class="export_history" data-type="albums" data-id="' . $product['product_id'] . '" href="javascript:void(0);">Да (' . $total . ')</a></b>';
                      }
                      else {
                          echo '<img src="view/image/success.png" style="margin-bottom:-4px;margin-right:3px;" />Да
                          <div id="albums_export' . $product['product_id'] . '" style="width:100px;">';
                          foreach ($product['albums_export'] as $export) {
                              ?>
                              <div><a target="_blank" href="<?php echo $export['link']; ?>"><?php echo $export['date']; ?></a> 
                              <a title="Удалить из альбомов" onclick="if (!confirm('Действительно удалить?')) return false;" href="<?php echo $export['delete_link'] ?>">[x]</a></div>
                              <?php
                          }
                      echo '</div>';
                      }
                      
                  }
                  else echo 'Нет';
                  ?>
                  
              </td>
              <td class="left">
                  <?php if ($product['wall_export']) {
                      $total = count($product['wall_export']);
                      if ($total > 1) {
                          echo '<img src="view/image/success.png" style="margin-bottom:-4px;margin-right:3px;" /><b><a class="export_history" data-type="wall" data-id="' . $product['product_id'] . '" href="javascript:void(0);">Да (' . $total . ')</a></b>
                          <div id="albums_export' . $product['product_id'] . '" style="display:none;width:100px;">';
                      }
                      else {
                          echo '<img src="view/image/success.png" style="margin-bottom:-4px;margin-right:3px;" />Да
                          <div id="albums_export' . $product['product_id'] . '" style="width:100px;">';
                      }
                      foreach ($product['wall_export'] as $export) {
                          
                          ?>
                          <div><a target="_blank" href="<?php echo $export['link']; ?>"><?php echo $export['date']; ?></a> 
                          <a title="Удалить со стены" onclick="if (!confirm('Действительно удалить?')) return false;" href="<?php echo $export['delete_link'] ?>">[x]</a></div>
                          <?php
                      }
                      echo '</div>';
                  }
                  else echo 'Нет';
                      ?>
              </td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="10"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
  <br>
  vkExport v<?php echo $version; ?>
  <br>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=extension/vk_export&token=<?php echo $token; ?>';
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var filter_model = $('input[name=\'filter_model\']').attr('value');
	
	if (filter_model) {
		url += '&filter_model=' + encodeURIComponent(filter_model);
	}
	
	var filter_price = $('input[name=\'filter_price\']').attr('value');
	
	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}
	
	var filter_quantity = $('input[name=\'filter_quantity\']').attr('value');
	
	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}
	
	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
	if ($('select[name=\'filter_status\']').length && filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}	
    
	var filter_date_added = $('input[name=\'filter_date_added\']').attr('value');
	
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}	
    
	var filter_category = $('select[name=\'filter_category\']').attr('value');
	
	if (filter_category != '*') {
		url += '&filter_category=' + encodeURIComponent(filter_category);
	}	
    
    var filter_export_albums = $('select[name=\'filter_export_albums\']').attr('value');
	
	if (filter_export_albums != '*') {
		url += '&filter_export_albums=' + encodeURIComponent(filter_export_albums);
	}	
    
    var filter_export_wall = $('select[name=\'filter_export_wall\']').attr('value');
	
	if (filter_export_wall != '*') {
		url += '&filter_export_wall=' + encodeURIComponent(filter_export_wall);
	}	

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=extension/vk_export/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_name\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_model\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=extension/vk_export/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.model,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_model\']').val(ui.item.label);
						
		return false;
	}
});

var refresh_list = function (data) {
    $("#products_table").html($("#products_table", data).html());
    $('#products_table').show();
    $('.success', data).clone().insertAfter('#loading_info');
    $('.warning', data).clone().insertAfter('#loading_info');
    $('#loading_info').hide();
    if ($('link[rel="icon"]').attr('href') == 'view/image/spinner.gif') {
        if ( $('.warning').length ) {
            changeFavicon('view/image/warning.png');
        }
        else {
            changeFavicon('view/image/success.png');
        }
    }
};

function getProgress() {
    $.ajax({
      url: "<?php echo htmlspecialchars_decode($vk_export_progress); ?>",
      dataType: "html",
      success: function (data) {
          $( "#progress_value" ).text(data);
      }
    });
}

function changeFavicon(href) {
    var icon = $('link[rel="icon"]');
    var cache = icon.clone()
    cache.attr('href', href);
    icon.replaceWith(cache);
}

$('#export_action').live('click', function () {
	var total_export = $('#selected:checked').length;
    if (total_export < 1) {
        return alert('Вы не выбрали ни одного товара!');
    }
    $('#action_message').text('Идёт процесс экспорта товаров, пожалуйста подождите. Это может занять от нескольких секунд, до нескольких минут.');
    $('#loading_info').show();
    $('#products_table').hide();
    $('.success').remove();
    $('.warning').remove();
    $( "#progressbar_wrapper" ).show();
    $( "#progress_value" ).text(0);
    $( "#total_export" ).text(total_export);
    
    if ($('link[rel="icon"]').length == 0) {
        $('head').append('<link rel="icon" href="view/image/spinner.gif" type="image/gif" />');
    }
    else {
        changeFavicon('view/image/spinner.gif');
    }
    
    var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($vk_export); ?>",
      type: "POST",
      data: $("#form").serialize(),
      dataType: "html"
    });
    
    var progress_timer = setInterval('getProgress();', 1000);
    
    request.done(function(data) {
        clearInterval(progress_timer);

        refresh_list(data);
    });
});

$('#wallpost_action').live('click', function () {
	var total_export = $('#selected:checked').length;
    if (total_export < 1) {
        return alert('Вы не выбрали ни одного товара!');
    }
    $('#action_message').text('Идёт процесс отправки товаров на стену, пожалуйста подождите. Это может занять от нескольких секунд, до нескольких минут.');
    $('#loading_info').show();
    $('#products_table').hide();
    $('.success').remove();
    $('.warning').remove();
    $( "#progressbar_wrapper" ).show();
    $( "#progress_value" ).text(0);
    $( "#total_export" ).text(total_export);
    
    if ($('link[rel="icon"]').length == 0) {
        $('head').append('<link rel="icon" href="view/image/spinner.gif" type="image/gif" />');
    }
    else {
        changeFavicon('view/image/spinner.gif');
    }
    
    var progress_timer = setInterval('getProgress();', 1000);
    
    var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($vk_wallpost); ?>",
      type: "POST",
      data: $("#form").serialize(),
      dataType: "html"
    });
    
    request.done(function(data) {
		clearInterval(progress_timer);
        refresh_list(data);
    });
});

$('#reexport_action').live('click', function () {
	if (!confirm('Действительно удалить?')) return false;
    if ($('#selected:checked').length < 1) {
        return alert('Вы не выбрали ни одного товара!');
    }
    $('#action_message').text('Идёт процесс удаления товаров из экспорта, пожалуйста подождите. Это может занять от нескольких секунд, до нескольких минут.');
    $('#loading_info').show();
    $('#products_table').hide();
    $('.success').remove();
    $('.warning').remove();
    $( "#progressbar_wrapper" ).hide();
    
    if ($('link[rel="icon"]').length == 0) {
        $('head').append('<link rel="icon" href="view/image/spinner.gif" type="image/gif" />');
    }
    else {
        changeFavicon('view/image/spinner.gif');
    }
    
    var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($vk_delete); ?>",
      type: "POST",
      data: $("#form").serialize(),
      dataType: "html"
    });
    
    request.done(function(data) {
        refresh_list(data);
    });
});

$('#delete_wall_action').live('click', function () {
	if (!confirm('Действительно удалить?')) return false;
    if ($('#selected:checked').length < 1) {
        return alert('Вы не выбрали ни одного товара!');
    }
    $('#action_message').text('Идёт процесс удаления товаров со стены, пожалуйста подождите. Это может занять от нескольких секунд, до нескольких минут.');
    $('#loading_info').show();
    $('#products_table').hide();
    $('.success').remove();
    $('.warning').remove();
    $( "#progressbar_wrapper" ).hide();
    
    if ($('link[rel="icon"]').length == 0) {
        $('head').append('<link rel="icon" href="view/image/spinner.gif" type="image/gif" />');
    }
    else {
        changeFavicon('view/image/spinner.gif');
    }
    
    var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($vk_delete_wall); ?>",
      type: "POST",
      data: $("#form").serialize(),
      dataType: "html"
    });
    
    request.done(function(data) {
        refresh_list(data);
    });
});

// отправка капчи
$('#send_captcha').live('click', function () {
    $('#action_message').text('Отправка...');
    $('#loading_info').show();
    $('#products_table').hide();
    
    $( "#progressbar_wrapper" ).hide();
    
    if ($('link[rel="icon"]').length == 0) {
        $('head').append('<link rel="icon" href="view/image/spinner.gif" type="image/gif" />');
    }
    else {
        changeFavicon('view/image/spinner.gif');
    }
    
    var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($send_captcha); ?>",
      type: "POST",
      data: $("input[name^='captcha']").serialize(),
      dataType: "json"
    });
    
    request.done(function(data) {
		$('.success').hide();
		$('.warning').hide();
		$('#products_table').show();
		$('#loading_info').hide();
        if (data.success) {
			$('.success').html(data.success);
			$('.success').show();
		}
        if (data.warning) {
			$('.warning').html(data.warning);
			$('.warning').show();
			changeFavicon('view/image/warning.png');
		}
		else {
			changeFavicon('view/image/success.png');
		}
    });
});

// отправка проверки номера
$('#send_security').live('click', function () {
    $('#action_message').text('Отправка...');
    $('#loading_info').show();
    $('#products_table').hide();
    
    $( "#progressbar_wrapper" ).hide();
    
    if ($('link[rel="icon"]').length == 0) {
        $('head').append('<link rel="icon" href="view/image/spinner.gif" type="image/gif" />');
    }
    else {
        changeFavicon('view/image/spinner.gif');
    }
    
    var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($send_security); ?>",
      type: "POST",
      data: $("input[name='code'], #security_url").serialize(),
      dataType: "json"
    });
    
    request.done(function(data) {
		$('.success').hide();
		$('.warning').hide();
		$('#products_table').show();
		$('#loading_info').hide();
        if (data.success) {
			$('.success').html(data.success);
			$('.success').show();
		}
        if (data.warning) {
			$('.warning').html(data.warning);
			$('.warning').show();
			changeFavicon('view/image/warning.png');
		}
		else {
			changeFavicon('view/image/success.png');
		}
    });
});

$('.export_history').live('click', function () {
     var type = $(this).attr('data-type');
     var product_id = $(this).attr('data-id');
     var request = $.ajax({
      url: "<?php echo htmlspecialchars_decode($export_history); ?>",
      type: "GET",
      dataType: "html",
      data: {type: type, product_id: product_id}
    });
    if (type == 'albums') {
         var title = "История экспорта товара в альбомы";
    }
    else {
        var title = 'История экспорта товара на стену';
    }
    
    request.done(function(data) {
        $( "#dialog-modal" ).html(data);
        $( "#dialog-modal" ).dialog({
            modal: true,
            buttons: {
                Ok: function() {
                $( this ).dialog( "close" );
                }
            },
            title: title,
            maxHeight: 600
        });
    });
});

$('.date').datepicker({dateFormat: 'dd-mm-yy'});

//--></script> 
<?php echo $footer; ?>
