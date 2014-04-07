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
      <h1><img src="view/image/shipping.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="contentes">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td width="100" class="center"><?php echo $column_image; ?></td>
			  <td class="left"><?php if ($sort == 'name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
              <td class="center"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($manufacturers) { ?>
            <?php foreach ($manufacturers as $manufacturer) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($manufacturer['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
                <?php } ?></td>
			  <td class="center" rel="<?php echo $link;?>&edit_image&manufacturer_id=<?php echo $manufacturer['manufacturer_id'];?>">
                <div>
				  <a class="edit-image">
					<img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>" id="thumb<?php echo $manufacturer['manufacturer_id'];?>"/>
				  </a>
				  <input type="hidden" name="image" value="<?php echo $manufacturer['image']; ?>" id="image<?php echo $manufacturer['manufacturer_id'];?>" />
				</div></td>
              <td class="left">
				<span class="ajax-edit-left" id="name-<?php echo $manufacturer['manufacturer_id']; ?>" value="<?php echo $manufacturer['manufacturer_id']; ?>">
				  <input type="text" value="<?php echo $manufacturer['name']; ?>" id="name-<?php echo $manufacturer['manufacturer_id']; ?>" class="input-edit-left" size="44">
				  <a onclick="save_name(<?php echo $manufacturer['manufacturer_id']; ?>)" class="button-save-name"></a>
				</span>
				<span><?php echo $manufacturer['name']; ?></span>
			  </td> 
              <td align="right">
				<span class="ajax-edit-right" id="sort-order-<?php echo $manufacturer['manufacturer_id']; ?>" value="<?php echo $manufacturer['manufacturer_id']; ?>">
				  <input type="text" value="<?php echo $manufacturer['sort_order']; ?>" class="input-edit-right" size="12">
				  <a onclick="save_sort_order(<?php echo $manufacturer['manufacturer_id']; ?>)" class="button-save-right"></a>
				</span>
				<span><?php echo $manufacturer['sort_order']; ?></span>
			  </td>
              <td class="center" width="90">
			    <a style="text-decoration: none;" href="<?php echo $link;?>&manufacturer_description&manufacturer_id=<?php echo $manufacturer['manufacturer_id'];?>" class="description_dialog button_general_data tooltip" title="<?php echo $text_description; ?>" /></a>
				  <a style="text-decoration: none;" href="<?php echo $link;?>&manufacturer_stores&manufacturer_id=<?php echo $manufacturer['manufacturer_id'];?>" class="stores_dialog button_stores tooltip" title="<?php echo $text_stores; ?>" /></a>
			    <?php foreach ($manufacturer['action'] as $action) { ?>
                  <a class="button_edites tooltip" href="<?php echo $action['href']; ?>" title="<?php echo $action['text']; ?>"></a>
                <?php } ?>
			  </td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
		  <tfoot>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td width="100" class="center"><?php echo $column_image; ?></td>
			  <td class="left"><?php if ($sort == 'name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
              <td class="center"><?php echo $column_action; ?></td>
            </tr>
          </tfoot>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/shipping.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
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
			height: 850,
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
			height: 350,
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
function save_name(id) {
    var input_name = $('#name-'+id+' input');
    var name = $(input_name).val();
    $(name).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=catalog/manufacturer_quick/changeName&manufacturer_id='+id+'&name='+name+'&token=<?php echo $token; ?>',
        dataType: 'html',
        data: {},
        success: function(name) { 
            $('#name-'+id).next().html(name);
			close_input(id);
        }
    });
    $(input_name).css('cursor','default');
}
function save_sort_order(id) {
    var input_sort_order = $('#sort-order-'+id+' input');
    var sort_order = $(input_sort_order).val();
    $(sort_order).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=catalog/manufacturer_quick/changeSortOrder&manufacturer_id='+id+'&sort_order='+sort_order+'&token=<?php echo $token; ?>',
        dataType: 'html',
        data: {},
        success: function(sort_order) { 
            $('#sort-order-'+id).next().html(sort_order);
			close_input(id);
        }
    });
    $(input_sort_order).css('cursor','default');
}
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
	$('#sort-order-'+id).siblings().show();
    $('#sort-order-'+id).hide();
}
//--></script>
<script type="text/javascript"><!--
$("a.tooltip, img.tooltip, div.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script>
<?php echo $footer; ?>