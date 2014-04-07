<?php
//-----------------------------------------------------
// AmazonMenu II for Opencart v1.5.4   
// Created by villagedefrance                          
// contact@villagedefrance.net                                    
//-----------------------------------------------------
?>

<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
		<h1><img src="view/image/edit.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons">
			<a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
			<a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
		</div>
    </div>
    <div class="content">
	
		<div id="tabs" class="htabs">
			<a href="#tab_language"><?php echo $tab_language; ?></a>
			<a href="#tab_setting"><?php echo $tab_setting; ?></a>
		</div>
		
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab_language">
			<div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
				<a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
			</div>
			<?php foreach ($languages as $language) { ?>
			<div id="language<?php echo $language['language_id']; ?>">
				<table class="form">
				<tr>
					<td><span class="required">*</span> <?php echo $entry_title; ?></td>
					<td><input name="sprites_description[<?php echo $language['language_id']; ?>][title]" size="60" value="<?php echo isset($sprites_description[$language['language_id']]) ? $sprites_description[$language['language_id']]['title'] : ''; ?>" />
					<?php if (isset($error_title[$language['language_id']])) { ?>
						<span class="error"><?php echo $error_title[$language['language_id']]; ?></span>
					<?php } ?>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_meta_description; ?></td>
					<td><textarea name="sprites_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="3"><?php echo isset($sprites_description[$language['language_id']]) ? $sprites_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_description; ?></td>
					<td><input name="sprites_description[<?php echo $language['language_id']; ?>][description]" size="80" value="<?php echo isset($sprites_description[$language['language_id']]) ? $sprites_description[$language['language_id']]['description'] : ''; ?>" /> <span class="help"><?php echo $text_link; ?></span>
					<?php if (isset($error_description[$language['language_id']])) { ?>
						<span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
					<?php } ?>
					</td>
				</tr>
				</table>
			</div>
			<?php } ?>
        </div>
		
        <div id="tab_setting">
			<table class="form">
            <tr>
				<td><?php echo $entry_store; ?></td>
				<td>
					<div class="scrollbox" style="width:225px;height:60px;">
						<?php $class = 'even'; ?>
						<div class="<?php echo $class; ?>">
							<?php if (in_array(0, $sprites_store)) { ?>
								<input type="checkbox" name="sprites_store[]" value="0" checked="checked" />
							<?php echo $text_default; ?>
							<?php } else { ?>
								<input type="checkbox" name="sprites_store[]" value="0" />
							<?php echo $text_default; ?>
							<?php } ?>
						</div>
						<?php foreach ($stores as $store) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div class="<?php echo $class; ?>">
							<?php if (in_array($store['store_id'], $sprites_store)) { ?>
								<input type="checkbox" name="sprites_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
							<?php echo $store['name']; ?>
							<?php } else { ?>
								<input type="checkbox" name="sprites_store[]" value="<?php echo $store['store_id']; ?>" />
							<?php echo $store['name']; ?>
							<?php } ?>
						</div>
					<?php } ?>
					</div>
				</td>
            </tr>
            <tr>
				<td><?php echo $entry_keyword; ?></td>
				<td><input type="text" name="keyword" value="<?php echo $keyword; ?>" size="50" /></td>
            </tr>
            <tr>
				<td><?php echo $entry_image; ?></td>
				<td><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
					<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
					<a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div>
				</td>
            </tr>
			<tr style="background:#FCFCFC;">
				<td>Sprite <?php echo $entry_sort_order; ?></td>
				<td><input name="sort_order" value="<?php echo $sort_order; ?>" size="1" /><span class="help"><?php echo $text_order; ?></span></td>
            </tr>
			<tr style="background:#F8F8F8;">
				<td>Sprite <?php echo $entry_status; ?></td>
				<td><select name="status">
					<?php if ($status) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				</select>
				</td>
            </tr>
			</table>
        </div>
		</form>
    </div>
	</div>
</div>

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

<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs();
//--></script> 

<?php echo $footer; ?>
