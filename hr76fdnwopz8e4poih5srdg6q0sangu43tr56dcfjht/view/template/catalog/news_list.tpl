<?php echo $header; ?>
<div id="content">
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="contentes">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="center"><?php echo $column_image; ?></td>
              <td class="left"><?php if ($sort == 'nd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?>
				<div class="info-name tooltip" title="<?php echo $text_info_name; ?>"></div></td>
			  <td class="left"><?php if ($sort == 'n2c.news_category_id') { ?>
				<a href="<?php echo $sort_news_category; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_news_category; ?></a>
				<?php } else { ?>
				<a href="<?php echo $sort_news_category; ?>"><?php echo $column_news_category; ?></a>
			    <?php } ?></td>
			  <td class="center"><?php if ($sort == 'n.date_available') { ?>
                <a href="<?php echo $sort_date_available; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_available; ?>"><?php echo $column_date_added; ?></a>
                <?php } ?></td>
			  <td class="center"><?php if ($sort == 'n.news_comments') { ?>
                <a href="<?php echo $sort_news_comments; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_news_comments; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_news_comments; ?>"><?php echo $column_news_comments; ?></a>
                <?php } ?></td>
              <td class="center"><?php if ($sort == 'n.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td></td>
              <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
			  <td align="left">
			    <select name="filter_news_category" style="max-width: 250px;" onchange="filter();">
				  <option value="*"></option>
				  <?php foreach ($news_categories as $news_category) { ?>
					<?php if ($news_category['news_category_id']==$filter_news_category) { ?>
					  <option value="<?php echo $news_category['news_category_id']; ?>" selected="selected"><?php echo $news_category['name']; ?></option>
					<?php } else { ?>
					  <option value="<?php echo $news_category['news_category_id']; ?>"><?php echo $news_category['name']; ?></option> 
					<?php } ?>
				  <?php } ?>
				</select>
              </td>
			  <td></td>
			  <td align="center"><select name="filter_news_comments" onchange="filter();">
                  <option value="*"></option>
                  <?php if ($filter_news_comments) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (($filter_news_comments !== null) && !$filter_news_comments) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td align="center"><select name="filter_status" onchange="filter();">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (($filter_status !== null) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td align="right"><a onclick="filter();" class="button_filter tooltip" title="<?php echo $button_filter; ?>"></a></td>
            </tr>
            <?php if ($news) { ?>
            <?php foreach ($news as $article) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($article['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $article['news_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $article['news_id']; ?>" />
                <?php } ?></td>
              <td class="center" rel="<?php echo $link;?>&edit_image&news_id=<?php echo $article['news_id'];?>">
                <div>
				  <a class="edit-image">
				    <img src="<?php echo $article['image']; ?>" alt="<?php echo $article['name']; ?>" id="thumb<?php echo $article['news_id'];?>"/>
				  </a>
				  <input type="hidden" name="image" value="<?php echo $article['image']; ?>" id="image<?php echo $article['news_id'];?>" />
				</div></td>
              <td class="left">
				<span class="ajax-edit-left" id="name-<?php echo $article['news_id']; ?>" value="<?php echo $article['news_id']; ?>">
				  <input type="text" value="<?php echo $article['name']; ?>" id="name-<?php echo $article['news_id']; ?>" class="input-edit-left" size="44">
				  <a onclick="save_name(<?php echo $article['news_id']; ?>)" class="button-save-name"></a>
				</span>
				<span><?php echo $article['name']; ?></span></td>
			  <td class="left">
				<?php foreach ($news_categories as $news_category) { ?>
                  <?php if (in_array($news_category['news_category_id'], $article['news_category'])) { ?>
                    <?php echo $news_category['name'];?><br>
                  <?php } ?>
				<?php } ?>
			  </td>
			  <td class="center"><?php echo $article['date_available']; ?></td>
			  <td align="center" width="100"><a class="ajax-news-comments" id="news_comments-<?php echo $article['news_id']; ?>"><?php echo $article['news_comments']; ?></a></td>
			  <td align="center" width="100"><a class="ajax-status" id="status-<?php echo $article['news_id']; ?>"><?php echo $article['status']; ?></a></td>
              <td class="right" width="260">
			    <?php foreach ($article['action'] as $action) { ?>
				  <div class="button-action">
				    <?php if ($this->config->get('config_news_all_buttons') == 0) { ?>
				      <?php if ($this->config->get('config_news_general_data') == 1) { ?>
					    <a style="text-decoration: none;" href="<?php echo $link;?>&news_description&news_id=<?php echo $article['news_id'];?>" class="description_dialog button_general_data tooltip" title="<?php echo $text_description; ?>" /></a>
					  <?php } ?>
					  <?php if ($this->config->get('config_news_category') == 1) { ?>
					    <a style="text-decoration: none;" href="<?php echo $link;?>&news_category&news_id=<?php echo $article['news_id'];?>" class="category_dialog button_category tooltip" title="<?php echo $text_categories; ?>" /></a>
					  <?php } ?>
					  <?php if ($this->config->get('config_quick_news_related') == 1) { ?>
					    <a style="text-decoration: none;" href="<?php echo $link;?>&news_related&news_id=<?php echo $article['news_id'];?>" class="related_dialog button_related tooltip" title="<?php echo $text_related; ?>" /></a>
					  <?php } ?>
					  <?php if ($this->config->get('config_quick_news_date_sort') == 1) { ?>
					    <a style="text-decoration: none;" href="<?php echo $link;?>&news_date_sort&news_id=<?php echo $article['news_id'];?>" class="date_sort_dialog button_date_available tooltip" title="<?php echo $text_date_sort; ?>" /></a>
					  <?php } ?>
					  <?php if ($this->config->get('config_quick_news_images') == 1) { ?>	
						<a style="text-decoration: none;" href="<?php echo $link;?>&news_img&news_id=<?php echo $article['news_id'];?>" class="images_dialog button_images tooltip" title="<?php echo $text_images_news; ?>" /></a>
					  <?php } ?>
					  <?php if ($this->config->get('config_quick_news_stores') == 1) { ?>
					    <a style="text-decoration: none;" href="<?php echo $link;?>&news_stores&news_id=<?php echo $article['news_id'];?>" class="stores_dialog button_stores tooltip" title="<?php echo $text_stores; ?>" /></a>
					  <?php } ?>
					  <?php if ($this->config->get('config_quick_news_design') == 1) { ?>
					    <a style="text-decoration: none;" href="<?php echo $link;?>&news_design&news_id=<?php echo $article['news_id'];?>" class="design_dialog button_design tooltip" title="<?php echo $text_design; ?>" /></a>
					  <?php } ?>
					<?php } ?>
					<a class="button_edites tooltip" href="<?php echo $action['href']; ?>" title="<?php echo $action['text']; ?>"></a>
					<a class="button_view tooltip" href="<?php echo HTTP_CATALOG;?>?route=news/news&news_id=<?php echo $article['news_id'];?>" target="_blank" title="<?php echo $text_view; ?>"></a>
				  </div>
                <?php } ?>
			  </td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
		  <tfoot>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="center"><?php echo $column_image; ?></td>
              <td class="left"><?php if ($sort == 'nd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?>
				<div class="info-name tooltip" title="<?php echo $text_info_name; ?>"></div></td>
			  <td class="left"><?php if ($sort == 'n2c.news_category_id') { ?>
				<a href="<?php echo $sort_news_category; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_news_category; ?></a>
				<?php } else { ?>
				<a href="<?php echo $sort_news_category; ?>"><?php echo $column_news_category; ?></a>
			    <?php } ?></td>
			  <td class="center"><?php if ($sort == 'n.date_available') { ?>
                <a href="<?php echo $sort_date_available; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_available; ?>"><?php echo $column_date_added; ?></a>
                <?php } ?></td>
			  <td class="center"><?php if ($sort == 'n.news_comments') { ?>
                <a href="<?php echo $sort_news_comments; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_news_comments; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_news_comments; ?>"><?php echo $column_news_comments; ?></a>
                <?php } ?></td>
              <td class="center"><?php if ($sort == 'n.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </tfoot>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=catalog/news&token=<?php echo $token; ?>';
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var filter_news_category = $('select[name=\'filter_news_category\']').attr('value');
    		
    if (filter_news_category != '*') {
		url += '&filter_news_category=' + encodeURIComponent(filter_news_category);
	}
	
	var filter_news_comments = $('select[name=\'filter_news_comments\']').attr('value');
	
	if (filter_news_comments != '*') {
		url += '&filter_news_comments=' + encodeURIComponent(filter_news_comments);
	}	
	
	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
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
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/news/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.news_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_name\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script> 
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});
$('a.description_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_description; ?>',
			modal: true,
			resizable: true,
			width: 1000,
			height: 950,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					for ( inst in CKEDITOR.instances ){
						CKEDITOR.instances[inst].updateElement();
					}
					$.post(link, $('#description-form').serialize(), function(response){
					})
                $(this).dialog("close"); $(this).remove();
				},
				'<?php echo $button_cancel; ?>': function(){
					$(this).dialog("close"); $(this).remove();
				},
			},
			close: function(){
				$(this).remove();
			}
		});
    });
});
$('a.category_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_categories; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 600,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#category-form').serialize(), function(response){
					})
                $(this).dialog("close"); $(this).remove();
				},
				'<?php echo $button_cancel; ?>': function(){
					$(this).dialog("close"); $(this).remove();
				},
			},
			close: function(){
				$(this).remove();
			}
		});
    });
});
$('a.date_sort_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_date_sort; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 350,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#date-sort-form').serialize(), function(response){
					})
                $(this).dialog("close"); $(this).remove();
				},
				'<?php echo $button_cancel; ?>': function(){
					$(this).dialog("close"); $(this).remove();
				},
			},
			close: function(){
				$(this).remove();
			}
		});
    });
});
$('a.related_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_related; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 700,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#related-form').serialize(), function(response){
					})
                $(this).dialog("close"); $(this).remove();
				},
				'<?php echo $button_cancel; ?>': function(){
					$(this).dialog("close"); $(this).remove();
				},
			},
			close: function(){
				$(this).remove();
			}
		});
    });
});
$('a.images_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_images_news; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 770,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#images-form').serialize(), function(response){
					})
                $(this).dialog("close"); $(this).remove();
				},
				'<?php echo $button_cancel; ?>': function(){
					$(this).dialog("close"); $(this).remove();
				},
			},
			close: function(){
				$(this).remove();
			}
		});
    });
});
$('a.stores_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_stores; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 400,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#stores-form').serialize(), function(response){
					})
                $(this).dialog("close"); $(this).remove();
				},
				'<?php echo $button_cancel; ?>': function(){
					$(this).dialog("close"); $(this).remove();
				},
			},
			close: function(){
				$(this).remove();
			}
		});
    });
});
$('a.design_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_design; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 500,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#design-form').serialize(), function(response){
					})
                $(this).dialog("close"); $(this).remove();
				},
				'<?php echo $button_cancel; ?>': function(){
					$(this).dialog("close"); $(this).remove();
				},
			},
			close: function(){
				$(this).remove();
			}
		});
    });
});
$('.ajax-status').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=catalog/news/changeStatus&token=<?php echo $token; ?>',
		type: 'get',
		data: {object_id:object_id},
		dataType: 'html',
		success: function(html) {
			if(html!=''){				
				$('#'+object_id).html(html);
			}
		}
	});
});
$('.ajax-news-comments').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=catalog/news/changeAllowComments&token=<?php echo $token; ?>',
		type: 'get',
		data: {object_id:object_id},
		dataType: 'html',
		success: function(html) {
			if(html!=''){				
				$('#'+object_id).html(html);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
    $('.ajax-edit-left, .ajax-edit-right').each(function(index, wrapper) {
        $(this).siblings().click(function() {
            $(wrapper).show();
            $(wrapper).siblings().hide();
        })
    });
})
function close_input(id) {
    $('.ajax-edit input').blur();
	$('#name-'+id).siblings().show();
    $('#name-'+id).hide();
}
function save_name(id) {
    var input_name = $('#name-'+id+' input');
    var name = $(input_name).val();
    $(name).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=catalog/news/changeName&news_id='+id+'&name='+name+'&token=<?php echo $token; ?>',
        dataType: 'html',
        data: {},
        success: function(name) { 
            $('#name-'+id).next().html(name);
			close_input(id);
        }
    });
    $(input_name).css('cursor','default');
}
$('a.edit-image').live('click', function(){
	var thumb = $(this).children().attr('id');
    var field = $(this).next().attr('id');
	$('#dialog').remove();
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/images&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
						var td = $('#' + field).parents('td')
						td.addClass('updated');
						$.get(td.attr('rel')+'&image='+encodeURIComponent($('#' + field).attr('value')), function(){
						    td.removeClass('updated');
						})
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: true
	});
});
$("a.tooltip, span.tooltip, div.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<?php echo $footer; ?>