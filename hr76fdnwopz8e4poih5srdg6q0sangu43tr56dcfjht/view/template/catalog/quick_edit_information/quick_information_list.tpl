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
      <h1><img src="view/image/information.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="contentes">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'id.title') { ?>
                <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                <?php } ?>
				<div class="info-name tooltip" title="<?php echo $text_info_title; ?>"></div></td>
              <td class="right"><?php if ($sort == 'i.sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
			  <td class="center"><?php echo $column_status; ?></td>
              <td class="center"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($informations) { ?>
            <?php foreach ($informations as $information) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($information['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $information['information_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $information['information_id']; ?>" />
                <?php } ?>
			  </td>
			  <td class="left">
				<span class="ajax-edit-left" id="title-<?php echo $information['information_id']; ?>" value="<?php echo $information['information_id']; ?>">
				  <input type="text" value="<?php echo $information['title']; ?>" id="title-<?php echo $information['information_id']; ?>" class="input-edit-left" size="44">
				  <a onclick="save_title(<?php echo $information['information_id']; ?>)" class="button-save-name"></a>
				</span>
				<span><?php echo $information['title']; ?></span>
			  </td> 
			  <td align="right">
				<span class="ajax-edit-right" id="sort-order-<?php echo $information['information_id']; ?>" value="<?php echo $information['information_id']; ?>">
				  <input type="text" value="<?php echo $information['sort_order']; ?>" class="input-edit-right" size="12">
				  <a onclick="save_sort_order(<?php echo $information['information_id']; ?>)" class="button-save-right"></a>
				</span>
				<span><?php echo $information['sort_order']; ?></span>
			  </td>  
			  <td align="center" width="100"><a class="ajax-status" id="status-<?php echo $information['information_id']; ?>"><?php echo $information['status']; ?></a></td>
              <td class="center" width="120">
			    <?php foreach ($information['action'] as $action) { ?>
				  <div class="button-action">
				    <a style="text-decoration: none;" href="<?php echo $link;?>&information_description&information_id=<?php echo $information['information_id'];?>" class="description_dialog button_general_data tooltip" title="<?php echo $text_description; ?>" /></a>
					<a style="text-decoration: none;" href="<?php echo $link;?>&information_data&information_id=<?php echo $information['information_id'];?>" class="data_dialog button_stores tooltip" title="<?php echo $text_data; ?>" /></a>
                    <a class="button_edites tooltip" href="<?php echo $action['href']; ?>" title="<?php echo $action['text']; ?>"></a>
                    <a class="button_view tooltip" href="<?php echo HTTP_CATALOG;?>?route=information/information&information_id=<?php echo $information['information_id'];?>" target="_blank" title="<?php echo $text_view; ?>"></a>
				  </div>
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
              <td class="left"><?php if ($sort == 'id.title') { ?>
                <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                <?php } ?>
				<div class="info-name tooltip" title="<?php echo $text_info_title; ?>"></div></td>
              <td class="right"><?php if ($sort == 'i.sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
			  <td class="center"><?php echo $column_status; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </tfoot>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/information.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function save_title(id) {
    var input_title = $('#title-'+id+' input');
    var title = $(input_title).val();
    $(title).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=catalog/information_quick/changeTitle&information_id='+id+'&title='+title+'&token=<?php echo $token; ?>',
        dataType: 'html',
        data: {},
        success: function(title) { 
            $('#title-'+id).next().html(title);
			close_input(id);
        }
    });
    $(input_title).css('cursor','default');
}
function save_sort_order(id) {
    var input_sort_order = $('#sort-order-'+id+' input');
    var sort_order = $(input_sort_order).val();
    $(sort_order).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=catalog/information_quick/changeSortOrder&information_id='+id+'&sort_order='+sort_order+'&token=<?php echo $token; ?>',
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
	$('#title-'+id).siblings().show();
    $('#title-'+id).hide();
	$('#sort-order-'+id).siblings().show();
    $('#sort-order-'+id).hide();
}
$('.ajax-status').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=catalog/information_quick/changeStatus&token=<?php echo $token; ?>',
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
			height: 900,
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
$('a.data_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_data; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 500,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#data-form').serialize(), function(response){
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
$("a.tooltip, img.tooltip, div.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script>
<?php echo $footer; ?>