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
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="contentes">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_name; ?></td>
              <td class="right"><?php echo $column_sort_order; ?></td>
			  <td class="center"><?php echo $column_status; ?></td>
              <td class="center"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($news_categories) { ?>
            <?php foreach ($news_categories as $news_category) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($news_category['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $news_category['news_category_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $news_category['news_category_id']; ?>" />
                <?php } ?></td>
              <?php if ($news_category['href']) { ?>
                <td class="left"><?php echo $news_category['indent']; ?><a href="<?php echo $news_category['href']; ?>"><?php echo $news_category['name']; ?></a></td>
              <?php } else { ?>
                <td class="left"><?php echo $news_category['indent']; ?><?php echo $news_category['name']; ?></td>
              <?php } ?>
              <td align="right"><?php echo $news_category['sort_order']; ?></td>
			  <td align="center" width="100"><a class="ajax-status" id="status-<?php echo $news_category['news_category_id']; ?>"><?php echo $news_category['status']; ?></a></td>
              <td class="right" width="170">
				<?php if ($this->config->get('config_news_category_all_buttons') == 0) { ?>
				  <?php if ($this->config->get('config_news_category_general_data') == 1) { ?>
				    <a style="text-decoration: none;" href="<?php echo $link;?>&news_category_description&news_category_id=<?php echo $news_category['news_category_id'];?>" class="description_dialog button_general_data tooltip" title="<?php echo $text_description; ?>" /></a>
				  <?php } ?>
				  <?php if ($this->config->get('config_news_category_parent') == 1) { ?>
				    <a style="text-decoration: none;" href="<?php echo $link;?>&news_category_parent&news_category_id=<?php echo $news_category['news_category_id'];?>" class="category_dialog button_category tooltip" title="<?php echo $text_parent; ?>" /></a>
				  <?php } ?>
				  <?php if ($this->config->get('config_news_category_image') == 1) { ?>
				    <a style="text-decoration: none;" href="<?php echo $link;?>&news_category_img&news_category_id=<?php echo $news_category['news_category_id'];?>" class="image_dialog button_images tooltip" title="<?php echo $text_image; ?>" /></a>
				  <?php } ?>
				  <?php if ($this->config->get('config_news_category_stores') == 1) { ?>
				    <a style="text-decoration: none;" href="<?php echo $link;?>&news_category_stores&news_category_id=<?php echo $news_category['news_category_id'];?>" class="stores_dialog button_stores tooltip" title="<?php echo $text_stores; ?>" /></a>
				  <?php } ?>
				  <?php if ($this->config->get('config_news_category_design') == 1) { ?>
				    <a style="text-decoration: none;" href="<?php echo $link;?>&news_category_design&news_category_id=<?php echo $news_category['news_category_id'];?>" class="design_dialog button_design tooltip" title="<?php echo $text_design; ?>" /></a>
				  <?php } ?>
				<?php } ?>
				<?php foreach ($news_category['action'] as $action) { ?>					  
				  <a class="button_edites tooltip" href="<?php echo $action['href']; ?>" title="<?php echo $action['text']; ?>"></a>
				<?php } ?>
			  </td>
			</tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
		  <tfoot>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_name; ?></td>
              <td class="right"><?php echo $column_sort_order; ?></td>
			  <td class="center"><?php echo $column_status; ?></td>
              <td class="center"><?php echo $column_action; ?></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('.ajax-status').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=catalog/news_category/changeStatus&token=<?php echo $token; ?>',
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
$("a.tooltip, img.tooltip, div.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
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
$('a.category_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_parent; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 300,
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
$('a.image_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_image; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 380,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#image-form').serialize(), function(response){
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
			height: 550,
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
			height: 300,
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
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
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