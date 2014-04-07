<?php echo $header; ?>
<div id="content">
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
      <h1><img src="view/image/banner.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="contentes">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
			  <td class="center" width="80"><?php echo $column_image; ?></td>
              <td class="left" width="30%"><?php if ($sort == 'name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
			  <td class="left" width="30%"><?php echo $column_link; ?></td>
			  <td class="right"><?php if ($sort == 'sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
              <td class="center"><?php if ($sort == 'status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="center"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($control_units) { ?>
            <?php foreach ($control_units as $control_unit) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($control_unit['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $control_unit['control_unit_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $control_unit['control_unit_id']; ?>" />
                <?php } ?></td>
			   <td class="center" rel="<?php echo $link;?>&edit_image&control_unit_id=<?php echo $control_unit['control_unit_id'];?>">
                <div>
				  <a class="edit-image">
					<img src="<?php echo $control_unit['image']; ?>" alt="<?php echo $control_unit['name']; ?>" id="thumb<?php echo $control_unit['control_unit_id'];?>"/>
				  </a>
				  <input type="hidden" name="image" value="<?php echo $control_unit['image']; ?>" id="image<?php echo $control_unit['control_unit_id'];?>" />
				</div></td>
			  <td class="left">
				<span class="ajax-edit-left" id="name-<?php echo $control_unit['control_unit_id']; ?>" value="<?php echo $control_unit['control_unit_id']; ?>">
				  <input type="text" value="<?php echo $control_unit['name']; ?>" id="name-<?php echo $control_unit['control_unit_id']; ?>" class="input-edit-left" size="44">
				  <a onclick="save_name(<?php echo $control_unit['control_unit_id']; ?>)" class="button-save-name"></a>
				</span>
				<span><?php echo $control_unit['name']; ?></span></td>
			  <td class="left">
				<span class="ajax-edit-left" id="link-<?php echo $control_unit['control_unit_id']; ?>" value="<?php echo $control_unit['control_unit_id']; ?>">
				  <input type="text" value="<?php echo $control_unit['link']; ?>" id="link-<?php echo $control_unit['control_unit_id']; ?>" class="input-edit-left" size="44">
				  <a onclick="save_link(<?php echo $control_unit['control_unit_id']; ?>)" class="button-save-name"></a>
				</span>
				<span><?php echo $control_unit['link']; ?></span></td>  
			  <td align="right">
				<span class="ajax-edit-right" id="sort_order-<?php echo $control_unit['control_unit_id']; ?>" value="<?php echo $control_unit['control_unit_id']; ?>">
				  <input type="text" value="<?php echo $control_unit['sort_order']; ?>" class="input-edit-right" size="15">
				  <a onclick="save_sort_order(<?php echo $control_unit['control_unit_id']; ?>)" class="button-save-right"></a>
				</span>
			    <span><?php echo $control_unit['sort_order']; ?></span></td>			
			  <td align="center" width="100"><a class="ajax-status" id="status-<?php echo $control_unit['control_unit_id']; ?>"><?php echo $control_unit['status']; ?></a></td>
              <td class="center" width="80">
			    <?php foreach ($control_unit['action'] as $action) { ?>
				  <?php if ($this->config->get('config_buttons_apply') == 0) { ?>
					[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
				  <?php } else { ?>
				    <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a>
				  <?php } ?>
                <?php } ?>
			  </td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
		  <tfoot>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
			  <td class="center"><?php echo $column_image; ?></td>
              <td class="left"><?php if ($sort == 'name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
			  <td class="left"><?php echo $column_link; ?></td>
			  <td class="right"><?php if ($sort == 'sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
              <td class="center"><?php if ($sort == 'status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="center"><?php echo $column_action; ?></td>
            </tr>
          </tfoot>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/banner.png" alt="" /> <?php echo $heading_title; ?></h1>
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
$(document).ready(function() {
    $('.ajax-edit-left, .ajax-edit-right').each(function(index, wrapper) {
        $(this).siblings().click(function() {
            $(wrapper).show();
            $(wrapper).siblings().hide();
        })
    });
})
function save_name(id) {
    var input_name = $('#name-'+id+' input');
    var name = $(input_name).val();
    $(name).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=tool/control_unit/changeName&control_unit_id='+id+'&name='+name+'&token=<?php echo $token; ?>',
        dataType: 'html',
        data: {},
        success: function(name) { 
            $('#name-'+id).next().html(name);
			close_input(id);
        }
    });
    $(input_name).css('cursor','default');
}
function save_link(id) {
    var input_link = $('#link-'+id+' input');
    var link = $(input_link).val();
    $(link).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=tool/control_unit/changeRoute&control_unit_id='+id+'&link='+link+'&token=<?php echo $token; ?>',
        dataType: 'html',
        data: {},
        success: function(link) { 
            $('#link-'+id).next().html(link);
			close_input(id);
        }
    });
    $(input_link).css('cursor','default');
}
function save_sort_order(id) {
    var input_sort_order = $('#sort_order-'+id+' input');
    var sort_order = $(input_sort_order).val();
    $(sort_order).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=tool/control_unit/changeSortOrder&control_unit_id='+id+'&sort_order='+sort_order+'&token=<?php echo $token; ?>',
        dataType: 'html',
        data: {},
        success: function(sort_order) { 
            $('#sort_order-'+id).next().html(sort_order);
			close_input(id);
        }
    });
    $(input_sort_order).css('cursor','default');
}
function close_input(id) {
    $('.ajax-edit input').blur();
	$('#name-'+id).siblings().show();
    $('#name-'+id).hide();
	$('#link-'+id).siblings().show();
    $('#link-'+id).hide();
	$('#sort_order-'+id).siblings().show();
    $('#sort_order-'+id).hide();
}
$('.ajax-status').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=tool/control_unit/changeStatus&token=<?php echo $token; ?>',
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
$("span.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script>
<?php echo $footer; ?>