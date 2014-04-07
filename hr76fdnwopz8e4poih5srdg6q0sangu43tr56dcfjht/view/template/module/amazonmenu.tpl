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
		<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons">
			<a onclick="location = '<?php echo $sprites; ?>';" class="button"><span><?php echo $button_sprite; ?></span></a>
			<a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
			<a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
		</div>
	</div>	
	<div class="content">
		<div class="preview1" style="color:#004488;margin-bottom:20px;">
			<fieldset><?php echo $text_module_help; ?></fieldset>
		</div>    
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<table class="form">
				<?php foreach ($languages as $language) { ?>
				<tr> 
					<td><?php echo $entry_titles; ?></td> 
					<td> 
					<input type="text" name="amazonmenu_titles<?php echo $language['language_id']; ?>" id="amazonmenu_titles<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'amazonmenu_titles' . $language['language_id']}; ?>" />
					<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
					</td>
				</tr>
				<?php } ?> 
				<tr> 
					<td><?php echo $entry_header; ?></td> 
					<td> 
						<?php if($amazonmenu_header) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="amazonmenu_header_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="amazonmenu_header_1" name="amazonmenu_header" value="1" /> 
					<label for="amazonmenu_header_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="amazonmenu_header_0" name="amazonmenu_header" value="0" /> 
					</td> 
				</tr>
				<tr> 
					<td><?php echo $entry_icon; ?></td> 
					<td colspan="3">  
						<?php if($amazonmenu_icon) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="amazonmenu_icon_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="amazonmenu_icon_1" name="amazonmenu_icon" value="1" /> 
					<label for="amazonmenu_icon_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="amazonmenu_icon_0" name="amazonmenu_icon" value="0" /> 
					</td> 
				</tr>
				<tr> 
					<td><?php echo $entry_box; ?></td> 
					<td> 
						<?php if($amazonmenu_box) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="amazonmenu_box_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="amazonmenu_box_0" name="amazonmenu_box" value="0" /> 
					<label for="amazonmenu_box_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="amazonmenu_box_1" name="amazonmenu_box" value="1" /> 
					</td> 
				</tr>
				<tr>
					<td><?php echo $entry_template; ?></td>
					<td>
						<?php foreach ($templates as $template) { ?>
							<?php if ($template == $config_template) { ?>
								<span style='color: #336600; padding: 0 5px;'><b><?php echo $template; ?></b></span> 
							<?php } ?>
						<?php } ?>	
					</td>
				</tr>
				<tr style="background:#FCFCFC;">
					<td><span class="required">*</span> <?php echo $entry_sprite_thumb; ?></td>
					<td>
						<input type="text" name="amazonmenu_thumb_width" value="<?php echo $amazonmenu_thumb_width; ?>" size="3" /> x
						<input type="text" name="amazonmenu_thumb_height" value="<?php echo $amazonmenu_thumb_height; ?>" size="3" />&nbsp;px
						<?php if ($error_sprite_thumb) { ?>
							<span class="error"><?php echo $error_sprite_thumb; ?></span>
						<?php } ?>
					</td>
				</tr>
				<tr style="background:#FCFCFC;">
					<td><?php echo $entry_sprite_links; ?></td>
					<td>
						<?php if ($amazonmenu_sprite_links) { ?>
							<input type="radio" name="amazonmenu_sprite_links" value="1" checked="checked" /><?php echo $text_yes; ?>
							<input type="radio" name="amazonmenu_sprite_links" value="0" /><?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="amazonmenu_sprite_links" value="1" /><?php echo $text_yes; ?>
							<input type="radio" name="amazonmenu_sprite_links" value="0" checked="checked" /><?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_directory; ?></td>
					<td>
						<?php if ($amazonmenu_directory) { ?>
							<input type="radio" name="amazonmenu_directory" value="1" checked="checked" /><?php echo $text_yes; ?>
							<input type="radio" name="amazonmenu_directory" value="0" /><?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="amazonmenu_directory" value="1" /><?php echo $text_yes; ?>
							<input type="radio" name="amazonmenu_directory" value="0" checked="checked" /><?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<td><img src="view/image/valid-xhtml10-blue.png" alt="" /></td>
					<td><b><?php echo $text_module_settings; ?></b></td>
				</tr>
			</table>			
			
			<table id="module" class="list">
				<thead>
					<tr>
						<td class="left"><?php echo $entry_layout; ?></td>
						<td class="left"><?php echo $entry_position; ?></td>
						<td class="left"><?php echo $entry_toplimit; ?></td>
						<td class="left"><?php echo $entry_botlimit; ?></td>
						<td class="left"><?php echo $entry_count; ?></td>
						<td class="left"><?php echo $entry_metawords; ?></td>
						<td class="left"><?php echo $entry_status; ?></td>
						<td class="left"><?php echo $entry_sort_order; ?></td>
						<td></td>
					</tr>
				</thead>
			<?php $module_row = 0; ?>
			<?php foreach ($modules as $module) { ?>
				<tbody id="module-row<?php echo $module_row; ?>">
					<tr>			
						<td class="left"><select name="amazonmenu_module[<?php echo $module_row; ?>][layout_id]">
						<?php foreach ($layouts as $layout) { ?>
							<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
								<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
							<?php } else { ?>
								<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
							<?php } ?>
						<?php } ?>
						</select></td>
						<td class="left"><select name="amazonmenu_module[<?php echo $module_row; ?>][position]">
							<?php if ($module['position'] == 'column_left') { ?>
								<option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
							<?php } else { ?>
								<option value="column_left"><?php echo $text_column_left; ?></option>
							<?php } ?>
							<?php if ($module['position'] == 'column_right') { ?>
								<option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
							<?php } else { ?>
								<option value="column_right"><?php echo $text_column_right; ?></option>
							<?php } ?>
							</select>
						</td>
						<td class="left"><input type="text" name="amazonmenu_module[<?php echo $module_row; ?>][toplimit]" value="<?php echo $module['toplimit']; ?>" size="1" />&nbsp Categories</td>
						<td class="left"><input type="text" name="amazonmenu_module[<?php echo $module_row; ?>][botlimit]" value="<?php echo $module['botlimit']; ?>" size="1" />&nbsp Categories</td>
						<td class="center">
							<input type="checkbox" name="amazonmenu_module[<?php echo $module_row; ?>][count]" value="1" <?php if (isset($module['count'])) { echo 'checked="checked"'; } ?> />
						</td>
						<td class="center">
							<input type="checkbox" name="amazonmenu_module[<?php echo $module_row; ?>][metawords]" value="1" <?php if (isset($module['metawords'])) { echo 'checked="checked"'; } ?> />
						</td>
						<td class="left"><select name="amazonmenu_module[<?php echo $module_row; ?>][status]">
							<?php if ($module['status']) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
							</select></td>
						<td class="center">
							<input type="text" name="amazonmenu_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="1" />
						</td>
						<td class="center">
							<a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a>
						</td>
					</tr>
				</tbody>
			<?php $module_row++; ?>
			<?php } ?>
				<tfoot>
					<tr>
						<td colspan="8"></td>
						<td class="center"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
  		<br>
		<div style="text-align:center; color:#555;">Amazon Menu v<?php echo $amazonmenu_version; ?></div>
</div>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';	
	html += '    <td class="left"><select name="amazonmenu_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="amazonmenu_module[' + module_row + '][position]">';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="amazonmenu_module[' + module_row + '][toplimit]" value="5" size="1" />&nbsp Categories</td>';
	html += '    <td class="left"><input type="text" name="amazonmenu_module[' + module_row + '][botlimit]" value="5" size="1" />&nbsp Categories</td>';
	html += '    <td class="center">';
	html += '		<input type="checkbox" name="amazonmenu_module[' + module_row + '][count]" value="1"  /><br />';
	html += '	  </td>';
	html += '    <td class="center">';
	html += '		<input type="checkbox" name="amazonmenu_module[' + module_row + '][metawords]" value="1"  /><br />';
	html += '	  </td>';
	html += '    <td class="left"><select name="amazonmenu_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="center"><input type="text" name="amazonmenu_module[' + module_row + '][sort_order]" value="" size="1" /></td>';
	html += '    <td class="center"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script>

<script type="text/javascript"><!--
$(document).ready(function(){	
	$('.preview1').hide().before('<a href="#" id="<?php echo 'preview1'; ?>" class="button"><span><?php echo $button_showhidehelp; ?></span></a>');
	$('a#<?php echo 'preview1'; ?>').click(function() {
		$('.preview1').slideToggle(1000);
		return false;
	});
});
//--></script>

<?php echo $footer; ?>
