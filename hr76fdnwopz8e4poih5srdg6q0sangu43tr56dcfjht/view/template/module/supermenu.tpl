<?php echo $header; ?>
<style type="text/css">
  table.list td {
    vertical-align: top;  
	}
	input[type='text'], input[type='password'] {
	border: 1px solid #bbb;
	border-top: 1px solid #e7e7e7;
	border-left: 1px solid #e7e7e7;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	-khtml-border-radius: 2px;
	border-radius: 2px;
	padding: 5px;
	margin: 3px;
	}
	input[type='text']:focus, input[type='password']:focus {
	-webkit-box-shadow: 0px 0px 3px #07f;
	-moz-box-shadow: 0px 0px 3px #07f;
	box-shadow: 0px 0px 3px #07f;
	}
	select { 
    border: 2px solid #DDDDDD;
    padding: 5px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	border-radius: 3px;
    }
    a.button, .list a.button {
    background: #4094D8;
	color: #fff;
	padding: 6px;
	font-weight: bold;
	border: 1px solid #4FB0FA;
	border-right: 1px solid #3E83B7;
	border-bottom: 1px solid #3E83B7;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	border-radius: 3px;
	}
	a.button:hover, .list a.button:hover {
	background: #333;
	border: 1px solid #444;
	border-right: 1px solid #222;
	border-bottom: 1px solid #222;
	}
	.htabs {
	border-bottom: 3px solid #ddd;
	}
	.htabs a {
    border-top: 3px solid #ddd;
	border-left: 3px solid #ddd;
	border-right: 3px solid #ddd;
	background: #88C847;
	-webkit-border-radius: 3px 3px 0px 0px;
	-moz-border-radius: 3px 3px 0px 0px;
	-khtml-border-radius: 3px 3px 0px 0px;
	border-radius: 3px 3px 0px 0px;
	padding: 6px 15px 5px;
	color: #fff;
    }	
	.htabs a.selected { 
     background: #FFFFFF;
	 color: #88C847;
     padding-bottom: 8px;
     }
	 a.butonas, .list a.butonas {
    background: #4094D8;
	color: #fff;
	padding: 4px;
	margin-bottom: 2px;
	display: inline-block;
	line-height: 16px;
	padding-left: 5px;
	padding-right: 5px;
	font-weight: bold;
	border: 1px solid #4FB0FA;
	border-right: 1px solid #3E83B7;
	border-bottom: 1px solid #3E83B7;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	border-radius: 3px;
	text-decoration: none;
	}
	 a.butonas:hover, .list a.butonas:hover {
	 background: #3A81B7;
	}
	 a.butonasc, .list a.butonasc {
    background: #FF2323;
	color: #fff;
	padding: 4px;
	line-height: 16px;
	padding-left: 7px;
	padding-right: 7px;
	display: inline-block;
	font-weight: bold;
	border: 1px solid #FB6262;
	border-right: 1px solid #C11818;
	border-bottom: 1px solid #C11818;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	border-radius: 3px;
	margin-bottom: 4px;
	text-decoration: none;
	}
	 a.butonasc:hover, .list a.butonasc:hover {
	 background: #EB1D1D;
	}
	table.sets td {
	 padding-top: 5px;
	 padding-bottom: 5px;
	 border-bottom: 2px solid #ddd;
	}
	.box > .content {
	overflow: visible;
	}
	.advs {
	  overflow: visible;
	  width: 100%;
	  height: 35px;
	  position: relative;
	  text-align: center;
	  padding-top: 10px;
	}
	.advs a {
	  text-decoration: none !important;
	  font-weight: bold;
	  color: #DF8406;
	}
	.advs a.closeadvm {
	  float: right;
	  margin-top: -20px;
	}
	.advs .advh {
	  position: absolute;
	  z-index: 99;
	  display: block;
	  width: 700px;
	  background: #fff;
	  border: 3px solid #eee;
	  padding: 20px;
	  text-align: left;
	  right: 0px;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	-khtml-border-radius: 7px;
	border-radius: 7px;
	-webkit-box-shadow: 0px 0px 10px #999;
	-moz-box-shadow: 0px 0px 10px #999;
	box-shadow: 0px 0px 10px #999;
	}
	table.smenua {
	  width: 100%;
	  background: none;
	  border-top: 1px solid #ddd;
	  border-left: 1px solid #ddd;
	}
	table.smenua td {
	  background: #fff !important;
	  padding: 2px;
	  }
  </style>
<script type="text/javascript" src="view/cpicker/jquery.miniColors.js"></script>
<link rel="stylesheet" type="text/css" href="view/cpicker/jquery.miniColors.css" />
<script type="text/javascript">
			
			$(document).ready( function() {
				
				//
				// Enabling miniColors
				//
				
				$(".colors").miniColors({
					
					change: function(hex, rgb) {
						$("#console").prepend('HEX: ' + hex + ' (RGB: ' + rgb.r + ', ' + rgb.g + ', ' + rgb.b + ')<br />');
					}
					
				});
			
			});
			
		</script>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
<?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
	<?php $this->load->model('tool/image'); ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	   <div id="tabs" class="htabs"><a href="#tab-items"><?php echo $tab_items; ?></a><a href="#tab-settings"><?php echo $tab_settings; ?></a><a href="#tab-html"><?php echo $tab_html; ?></a></div>
	    <div id="tab-settings">
	  <table style="width: 100%">
	  <tr>
	  <td style="border: 5px solid #eee; padding: 5px; background: #06f; color: #fff; font-weight: bold; font-size: 14px;">
	  Color Manager
	  </td>
	  <td style="border: 5px solid #eee; padding: 5px; background: #06f; color: #fff; font-weight: bold; font-size: 14px;">
	  +More Dropdown
	  </td>
	  </tr>
	  <tr>
	  <td style="border: 5px solid #eee; padding: 5px;">
	  <b>  Apply the colors below? </b> <?php if ($supermenu_settings_status) { ?>
                <input type="radio" name="supermenu_settings_status" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="supermenu_settings_status" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="supermenu_settings_status" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="supermenu_settings_status" value="0" checked="checked" />
                <?php echo $text_no; ?>
      <?php } ?>
	  <br />
	  <table>
	  <tr>
	  <td>Top menu background:</td>
	  <td><input type="text" name="supermenu_settings[bg]" class="colors" value="<?php echo isset($settings['bg']) ? $settings['bg'] : ''; ?>" size="7" /></td>
	  </tr><tr>
	  <td>Top menu link color: </td>
	  <td><input type="text" name="supermenu_settings[tlc]" class="colors" value="<?php echo isset($settings['tlc']) ? $settings['tlc'] : ''; ?>" size="7" /></td>
	  </tr><tr>
	  <td>Dropdown and mouseover top item background:</td>
	  <td><input type="text" name="supermenu_settings[dbg]" class="colors" value="<?php echo isset($settings['dbg']) ? $settings['dbg'] : ''; ?>" size="7" /> </td>
	  </tr><tr>
	  <td>Dropdown - second level link color: </td>
	  <td><input type="text" name="supermenu_settings[slc]" class="colors" value="<?php echo isset($settings['slc']) ? $settings['slc'] : ''; ?>" size="7" /></td>
	  </tr><tr>
	  <td>Dropdown - second level link background: </td>
	  <td><input type="text" name="supermenu_settings[slbg]" class="colors" value="<?php echo isset($settings['slbg']) ? $settings['slbg'] : ''; ?>" size="7" /></td>
	   </tr><tr>
	  <td>Dropdown - second level link border and mouseover background: </td>
	  <td><input type="text" name="supermenu_settings[slbgh]" class="colors" value="<?php echo isset($settings['slbgh']) ? $settings['slbgh'] : ''; ?>" size="7" /></td>
	  </tr><tr>
	  <td>Dropdown - third level link color: </td>
	  <td><input type="text" name="supermenu_settings[thlc]" class="colors" value="<?php echo isset($settings['thlc']) ? $settings['thlc'] : ''; ?>" size="7" /></td>
	  </tr><tr>
	  </table>
	  </td>
	  <td style="border: 5px solid #eee; padding: 5px; width: 35%;">	  
	  <?php foreach ($languages as $language) { ?>
	   <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $more_name; ?>
	   <input type="text" name="supermenu_more_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($supermenu_more_title[$language['language_id']]) ? $supermenu_more_title[$language['language_id']] : ''; ?>" /><br /><br />
      <?php } ?>
	   <div class="scrollbox" style="height: 160px;">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($categories as $kat) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($kat['category_id'], $supermenu_more)) { ?>
                    <input type="checkbox" name="supermenu_more[]" value="<?php echo $kat['category_id']; ?>" checked="checked" />
                    <?php echo $kat['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="supermenu_more[]" value="<?php echo $kat['category_id']; ?>" />
                    <?php echo $kat['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
        </div>
        <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
		<br/>
		 <?php echo $entry_image_size; ?>
	     <input type="text" name="supermenu_image_width" value="<?php echo $supermenu_image_width; ?>" size="3" />
		 <input type="text" name="supermenu_image_height" value="<?php echo $supermenu_image_height; ?>" size="3" />
				
	  </td>
	  </tr>
	  </table>
	  </div>
	  <div id="tab-items">
        <table id="item" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_type; ?></td>
              <td class="left"><?php echo $entry_category; ?></td>
              <td class="left"><?php echo $entry_information; ?></td>
              <td class="left"><?php echo $entry_custom; ?></td>
              <td class="left"><?php echo $entry_add; ?></td>
              <td class="left"><?php echo $entry_advanced; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $item_row = 0; ?>
		  <?php $libg = '#eee'; ?>
          <?php foreach ($items as $item) { ?>
		  <?php $libg = ($libg == '#fff' ? '#eee' : '#fff'); ?>
          <tbody id="item-row<?php echo $item_row; ?>">
            <tr>
           <td class="left" style="background: <?php echo $libg; ?>;"><select name="supermenu_item[<?php echo $item_row; ?>][type]">
			      <?php if ($item['type'] == 'cat') { ?>
                  <option value="cat" selected="selected"><?php echo $type_cat; ?></option>
                  <?php } else { ?>
                  <option value="cat"><?php echo $type_cat; ?></option>
                  <?php } ?>
				  <?php if ($item['type'] == 'infol') { ?>
                  <option value="infol" selected="selected"><?php echo $type_infol; ?></option>
                  <?php } else { ?>
                  <option value="infol"><?php echo $type_infol; ?></option>
                  <?php } ?>
				  <?php if ($item['type'] == 'infod') { ?>
                  <option value="infod" selected="selected"><?php echo $type_infod; ?></option>
                  <?php } else { ?>
                  <option value="infod"><?php echo $type_infod; ?></option>
                  <?php } ?>
				   <?php if ($item['type'] == 'custom') { ?>
                  <option value="custom" selected="selected"><?php echo $type_custom; ?></option>
                  <?php } else { ?>
                  <option value="custom"><?php echo $type_custom; ?></option>
                  <?php } ?>
				  <?php if ($item['type'] == 'mand') { ?>
                  <option value="mand" selected="selected"><?php echo $type_mand; ?></option>
                  <?php } else { ?>
                  <option value="mand"><?php echo $type_mand; ?></option>
                  <?php } ?>
				   <?php if ($item['type'] == 'more') { ?>
                  <option value="more" selected="selected"><?php echo $type_more; ?></option>
                  <?php } else { ?>
                  <option value="more"><?php echo $type_more; ?></option>
                  <?php } ?>
		 </select>
		 <br /><br /> <b><?php echo $text_sview; ?> </b>
		  <select name="supermenu_item[<?php echo $item_row; ?>][view]">
			      <?php if (!$item['view']) { ?>
                  <option value="0" selected="selected"><?php echo $text_slist; ?></option>
				  <option value="1"><?php echo $text_sgrid; ?></option>
                  <?php } else { ?>
                  <option value="1"  selected="selected"><?php echo $text_sgrid; ?></option>
				  <option value="0"><?php echo $text_slist; ?></option>
                  <?php } ?>
		  </select>
		 </td>
          <td class="left" style="background: <?php echo $libg; ?>;"><select style="width: 140px;" name="supermenu_item[<?php echo $item_row; ?>][category_id]">
		          <?php foreach ($categories as $category ){ ?>
		          <?php if ($category['category_id'] == $item['category_id']) { ?>
		          <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name'] ?></option>
		          <?php } else { ?>
                  <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name'] ?></option>
                  <?php } ?>
                  <?php } ?>
          </select>
		  
		  </td>
          <td class="left" style="background: <?php echo $libg; ?>;"><select name="supermenu_item[<?php echo $item_row; ?>][information_id]">
		          <?php foreach ($informations as $information){ ?>
		          <?php if ($information['information_id'] == $item['information_id']) { ?>
		          <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['name'] ?></option>
		          <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['name'] ?></option>
                  <?php } ?>
                  <?php } ?>
          </select></td>
          <td class="left" style="background: <?php echo $libg; ?>;">
			<?php foreach ($languages as $language) { ?>
              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $custom_name; ?>
			  <input type="text" name="supermenu_item[<?php echo $item_row; ?>][customname][<?php echo $language['language_id']; ?>]" value="<?php echo isset($item['customname'][$language['language_id']]) ? $item['customname'][$language['language_id']] : ''; ?>" /><br /><br />
			  <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $custom_url; ?>
			  <input type="text" name="supermenu_item[<?php echo $item_row; ?>][customurl][<?php echo $language['language_id']; ?>]" value="<?php echo isset($item['customurl'][$language['language_id']]) ? $item['customurl'][$language['language_id']] : ''; ?>" /><br /><br />
            <?php } ?>
		   </td>
              <td class="left" style="background: <?php echo $libg; ?>;">
			  <?php foreach ($languages as $language) { ?>
			  <div style="padding: 3px; background: #eee; border: 1px solid #ddd; margin-bottom: 2px; text-align: left; font-weight: bold;"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?><br />
			 URL: <input type="text" name="supermenu_item[<?php echo $item_row; ?>][addurl][<?php echo $language['language_id']; ?>]" value="<?php echo isset($item['addurl'][$language['language_id']]) ? $item['addurl'][$language['language_id']] : ''; ?>" /><br />
			  <div class="image"><img style="width: 50px; height: 50px; border: 2px solid #bbb; float: left; margin-right: 7px;" src="<?php if ($item['image'][$language['language_id']] && strlen($item['image'][$language['language_id']]) > 3) { ?><?php echo $this->model_tool_image->resize($item['image'][$language['language_id']],50,50); ?><?php } else { ?><?php echo $no_image; ?><?php } ?>" alt="" id="add_<?php echo $item_row; ?><?php echo $language['language_id']; ?>" />
                  <input type="hidden" name="supermenu_item[<?php echo $item_row; ?>][image][<?php echo $language['language_id']; ?>]" value="<?php echo $item['image'][$language['language_id']]; ?>" id="image_<?php echo $item_row; ?><?php echo $language['language_id']; ?>" />
                  <a class="butonas" onclick="image_upload('image_<?php echo $item_row; ?><?php echo $language['language_id']; ?>', 'add_<?php echo $item_row; ?><?php echo $language['language_id']; ?>');"><?php echo $text_browse; ?></a><br/><a class="butonasc" onclick="$('#add_<?php echo $item_row; ?><?php echo $language['language_id']; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image_<?php echo $item_row; ?><?php echo $language['language_id']; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
				</div>
				</div>
			  <?php } ?>
			  </td>
              <td class="left" style="background: <?php echo $libg; ?>;">
			  <style type="text/css">
			  .advm<?php echo $item_row; ?> .advh {
			     display:none;
			  }
			  </style>
			  <div class="advm<?php echo $item_row; ?> advs">
			  <a class="expand"><?php echo $text_expando; ?></a>
			  <div class="advh">
			  <a class="closeadvm"><strong><span style="font-size:20px;"><span style="font-family:lucida sans unicode,lucida grande,sans-serif;">x</span></span></strong></a>
			  <table class="smenua">
			  <tr><td><?php echo $text_tlcolor; ?></td>
			  <td><input type="text" name="supermenu_item[<?php echo $item_row; ?>][tlcolor]" class="colors" value="<?php echo isset($item['tlcolor']) ? $item['tlcolor'] : ''; ?>" size="7" /></td>
			  <td><?php echo $text_tlstyle; ?></td>
			  <td><input type="text" name="supermenu_item[<?php echo $item_row; ?>][tlstyle]" value="<?php echo isset($item['tlstyle']) ? $item['tlstyle'] : ''; ?>" size="28" /></td>
			  </tr>
			  <tr>
			  <td><?php echo $text_chtml; ?></td>
			  <td><select name="supermenu_item[<?php echo $item_row; ?>][chtml]">
			      <?php if (!$item['chtml']) { ?>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
				  <option value="1"><?php echo $text_alldrop; ?></option>
				  <option value="2"><?php echo $text_justadd; ?></option>
				  <option value="3"><?php echo $text_overdrop; ?></option>
                  <?php } elseif ($item['chtml'] == 1) { ?>
                  <option value="1"  selected="selected"><?php echo $text_alldrop; ?></option>
				  <option value="3"><?php echo $text_overdrop; ?></option>
				  <option value="2"><?php echo $text_justadd; ?></option>
				  <option value="0"><?php echo $text_no; ?></option>
				  <?php } elseif ($item['chtml'] == 3) { ?>
                  <option value="0"><?php echo $text_no; ?></option>
				  <option value="1"><?php echo $text_alldrop; ?></option>
				  <option value="3" selected="selected"><?php echo $text_overdrop; ?></option>
				  <option value="2"><?php echo $text_justadd; ?></option>
				  <?php } else { ?>
                  <option value="1"><?php echo $text_alldrop; ?></option>
				  <option value="3"><?php echo $text_overdrop; ?></option>
				  <option value="2"  selected="selected"><?php echo $text_justadd; ?></option>
				  <option value="0"><?php echo $text_no; ?></option>
                  <?php } ?>
			   </select>				   
			  </td>
	          <td> <?php echo $text_cchtml; ?></td>
			 <td> <select name="supermenu_item[<?php echo $item_row; ?>][cchtml]">
			      <?php if ($item['cchtml'] == 'area1') { ?>
                  <option value="area1" selected="selected">Area 1</option>
                  <?php } else { ?>
                  <option value="area1">Area 1</option>
                  <?php } ?>
				  <?php if ($item['cchtml'] == 'area2') { ?>
                  <option value="area2" selected="selected">Area 2</option>
                  <?php } else { ?>
                  <option value="area2">Area 2</option>
                  <?php } ?>
				  <?php if ($item['cchtml'] == 'area3') { ?>
                  <option value="area3" selected="selected">Area 3</option>
                  <?php } else { ?>
                  <option value="area3">Area 3</option>
                  <?php } ?>
				  <?php if ($item['cchtml'] == 'area4') { ?>
                  <option value="area4" selected="selected">Area 4</option>
                  <?php } else { ?>
                  <option value="area4">Area 4</option>
                  <?php } ?>
				  <?php if ($item['cchtml'] == 'area5') { ?>
                  <option value="area5" selected="selected">Area 5</option>
                  <?php } else { ?>
                  <option value="area5">Area 5</option>
                  <?php } ?>
				  <?php if ($item['cchtml'] == 'area6') { ?>
                  <option value="area6" selected="selected">Area 6</option>
                  <?php } else { ?>
                  <option value="area6">Area 6</option>
                  <?php } ?>
				  <?php if ($item['cchtml'] == 'area7') { ?>
                  <option value="area7" selected="selected">Area 7</option>
                  <?php } else { ?>
                  <option value="area7">Area 7</option>
                  <?php } ?>
				  <?php if ($item['cchtml'] == 'area8') { ?>
                  <option value="area8" selected="selected">Area 8</option>
                  <?php } else { ?>
                  <option value="area8">Area 8</option>
                  <?php } ?>
			   </select></td>
			   </tr><tr>
			   <td><?php echo $text_dwidth; ?></td>
		      <td><input size="3" type="text" name="supermenu_item[<?php echo $item_row; ?>][dwidth]" value="<?php echo isset($item['dwidth']) ? $item['dwidth'] : ''; ?>" /></td>
			  <td> <?php echo $text_iwidth; ?></td>
			  <td><input size="3" type="text" name="supermenu_item[<?php echo $item_row; ?>][iwidth]" value="<?php echo isset($item['iwidth']) ? $item['iwidth'] : ''; ?>" /></td></tr>
			  
			  </table>
			  </div></div>
			   <script type="text/javascript"><!--
              $('.advm<?php echo $item_row; ?> .expand').bind('click', function() {
	          $('.advm<?php echo $item_row; ?>').find('.advh').slideToggle('fast');
               });
              $('.advm<?php echo $item_row; ?> .advh .closeadvm').bind('click', function() {
	          $('.advm<?php echo $item_row; ?>').find('.advh').slideUp('fast');
              }); 
              //--></script>
			  </td>
              <td class="left" style="background: <?php echo $libg; ?>;"><a onclick="$('#item-row<?php echo $item_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a>
			  </td>
            </tr>
          </tbody>
          <?php $item_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="6"></td>
              <td class="left"><a onclick="additem();" class="button"><?php echo $button_add_item; ?></a></td>
            </tr>
          </tfoot>
        </table>
		</div>
		<div id="tab-html">
		<div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
        </div>
		 <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">
		   <table>
		   <tr>
                <td style="vertical-align: top; padding-right: 30px; color: #999"><h1>Area 1 </h1></td>
                <td><textarea name="supermenu_htmlarea[<?php echo $language['language_id']; ?>][area1]" id="area1<?php echo $language['language_id']; ?>"><?php echo isset($supermenu_htmlarea[$language['language_id']]['area1']) ? $supermenu_htmlarea[$language['language_id']]['area1'] : 'Insert custom code 1'; ?></textarea></td>
            </tr>
			<tr>
                <td style="vertical-align: top; padding-right: 30px; color: #999"><h1>Area 2 </h1></td>
                <td><textarea name="supermenu_htmlarea[<?php echo $language['language_id']; ?>][area2]" id="area2<?php echo $language['language_id']; ?>"><?php echo isset($supermenu_htmlarea[$language['language_id']]['area2']) ? $supermenu_htmlarea[$language['language_id']]['area2'] : 'Insert custom code 2'; ?></textarea></td>
            </tr>
			<tr>
                <td style="vertical-align: top; padding-right: 30px; color: #999"><h1>Area 3 </h1></td>
                <td><textarea name="supermenu_htmlarea[<?php echo $language['language_id']; ?>][area3]" id="area3<?php echo $language['language_id']; ?>"><?php echo isset($supermenu_htmlarea[$language['language_id']]['area3']) ? $supermenu_htmlarea[$language['language_id']]['area3'] : 'Insert custom code 3'; ?></textarea></td>
            </tr>
			<tr>
                <td style="vertical-align: top; padding-right: 30px; color: #999"><h1>Area 4</h1></td>
                <td><textarea name="supermenu_htmlarea[<?php echo $language['language_id']; ?>][area4]" id="area4<?php echo $language['language_id']; ?>"><?php echo isset($supermenu_htmlarea[$language['language_id']]['area4']) ? $supermenu_htmlarea[$language['language_id']]['area4'] : 'Insert custom code 4'; ?></textarea></td>
            </tr>
			<tr>
                <td style="vertical-align: top; padding-right: 30px; color: #999"><h1>Area 5</h1></td>
                <td><textarea name="supermenu_htmlarea[<?php echo $language['language_id']; ?>][area5]" id="area5<?php echo $language['language_id']; ?>"><?php echo isset($supermenu_htmlarea[$language['language_id']]['area5']) ? $supermenu_htmlarea[$language['language_id']]['area5'] : 'Insert custom code 5'; ?></textarea></td>
            </tr>
			<tr>
                <td style="vertical-align: top; padding-right: 30px; color: #999"><h1>Area 6</h1></td>
                <td><textarea name="supermenu_htmlarea[<?php echo $language['language_id']; ?>][area6]" id="area6<?php echo $language['language_id']; ?>"><?php echo isset($supermenu_htmlarea[$language['language_id']]['area6']) ? $supermenu_htmlarea[$language['language_id']]['area6'] : 'Insert custom code 6'; ?></textarea></td>
            </tr>
			<tr>
                <td style="vertical-align: top; padding-right: 30px; color: #999"><h1>Area 7</h1></td>
                <td><textarea name="supermenu_htmlarea[<?php echo $language['language_id']; ?>][area7]" id="area7<?php echo $language['language_id']; ?>"><?php echo isset($supermenu_htmlarea[$language['language_id']]['area7']) ? $supermenu_htmlarea[$language['language_id']]['area7'] : 'Insert custom code 7'; ?></textarea></td>
            </tr>
			<tr>
                <td style="vertical-align: top; padding-right: 30px; color: #999"><h1>Area 8</h1></td>
                <td><textarea name="supermenu_htmlarea[<?php echo $language['language_id']; ?>][area8]" id="area8<?php echo $language['language_id']; ?>"><?php echo isset($supermenu_htmlarea[$language['language_id']]['area8']) ? $supermenu_htmlarea[$language['language_id']]['area8'] : 'Insert custom code 8'; ?></textarea></td>
            </tr>
		   </table>	  
		  </div>
		 <?php } ?> 
		</div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var item_row = <?php echo $item_row; ?>;

function additem() {	
	html  = '<tbody id="item-row' + item_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="supermenu_item[' + item_row + '][type]">';
	html += '      <option value="cat"><?php echo $type_cat; ?></option>';
	html += '      <option value="infol"><?php echo $type_infol; ?></option>';
	html += '      <option value="infod"><?php echo $type_infod; ?></option>';
	html += '      <option value="custom"><?php echo $type_custom; ?></option>';
	html += '      <option value="mand"><?php echo $type_mand; ?></option>';
	html += '      <option value="more"><?php echo $type_more; ?></option>';
	html += '    </select><br /><br /> <b><?php echo $text_sview; ?> </b><select name="supermenu_item[' + item_row + '][view]"><option value="0" selected="selected"><?php echo $text_slist; ?></option><option value="1"><?php echo $text_sgrid; ?></option></select></td>';
	html += '    <td class="left"><select style="width: 140px;" name="supermenu_item[' + item_row + '][category_id]">';
	<?php foreach ($categories as $category ){ ?>
	html += '      <option value="<?php echo $category['category_id']; ?>"><?php echo str_replace("'", "", $category['name']); ?></option>';
	<?php } ?>       
	html += '    </select></td>';
	html += '    <td class="left"><select name="supermenu_item[' + item_row + '][information_id]">';
	<?php foreach ($informations as $information ){ ?>
	html += '      <option value="<?php echo $information['information_id']; ?>"><?php echo str_replace("'", "", $information['name']); ?></option>';
	<?php } ?>       
	html += '    </select></td>';
	html += '    <td class="left">';
    <?php foreach ($languages as $language) { ?>
	html += '     <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $custom_name; ?> <input type="text" name="supermenu_item[' + item_row + '][customname][<?php echo $language['language_id']; ?>]" value="" /><br /><br /> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $custom_url; ?> <input type="text" name="supermenu_item[' + item_row + '][customurl][<?php echo $language['language_id']; ?>]" value="" /><br /><br />';
	<?php } ?>
    html += '    </td>';
	html += '    <td class="left">';
	<?php foreach ($languages as $language) { ?>
	html +=	'		<div style="padding: 3px; background: #eee; border: 1px solid #ddd; margin-bottom: 2px; text-align: left; font-weight: bold;"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?><br />';
	html += '     URL: <input type="text" name="supermenu_item[' + item_row + '][addurl][<?php echo $language['language_id']; ?>]" value="" /><br />';
	html +=	'		<div class="image"><img style="width: 50px; height: 50px; border: 2px solid #bbb; float: left; margin-right: 7px;" src="<?php echo $no_image; ?>" alt="" id="add_' + item_row + '<?php echo $language['language_id']; ?>" />';
    html += '           <input type="hidden" name="supermenu_item[' + item_row + '][image][<?php echo $language['language_id']; ?>]" value="" id="image_' + item_row + '<?php echo $language['language_id']; ?>" /> ';
    html += '           <a class="butonas" onclick="image_upload(\'image_' + item_row + '<?php echo $language['language_id']; ?>\', \'add_' + item_row + '<?php echo $language['language_id']; ?>\');"><?php echo $text_browse; ?></a><br/><a class="butonasc" onclick="$(\'#add_' + item_row + '<?php echo $language['language_id']; ?>\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image_' + item_row + '<?php echo $language['language_id']; ?>\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a> ';
	<?php } ?>
	html += '		</div></div></td> ';
	html += '    <td class="left"><style type="text/css"> .advm' + item_row + ' .advh { display: none; } </style><div class="advm' + item_row + ' advs"><a class="expand"><?php echo $text_expando; ?></a><div class="advh"><a class="closeadvm"><strong><span style="font-size:20px;"><span style="font-family:lucida sans unicode,lucida grande,sans-serif;">x</span></span></strong></a><table class="smenua"><tr><td><?php echo $text_tlcolor; ?></td><td><input type="text" class="colors" name="supermenu_item[' + item_row + '][tlcolor]" value="" size="7" /></td><td><?php echo $text_tlstyle; ?></td><td><input type="text" name="supermenu_item[' + item_row + '][tlstyle]" value="" size="28" /></td></tr><tr><td><?php echo $text_chtml; ?></td><td><select name="supermenu_item[' + item_row + '][chtml]"><option value="0"><?php echo $text_no; ?></option><option value="1"><?php echo $text_alldrop; ?></option><option value="3"><?php echo $text_overdrop; ?></option><option value="2"><?php echo $text_justadd; ?></option></select></td><td><?php echo $text_cchtml; ?></td><td><select name="supermenu_item[' + item_row + '][cchtml]"><option value="area1">Area 1</option><option value="area2">Area 2</option><option value="area3">Area 3</option><option value="area4">Area 4</option><option value="area5">Area 5</option><option value="area6">Area 6</option><option value="area7">Area 7</option><option value="area8">Area 8</option></select></td></tr><tr><td><?php echo $text_dwidth; ?></td><td><input type="text" name="supermenu_item[' + item_row + '][dwidth]" value="" size="3" /></td><td><?php echo $text_iwidth; ?></td><td><input type="text" name="supermenu_item[' + item_row + '][iwidth]" value="" size="3" /></td></tr></table></div></div>';
	html += '<script type="text/javascript">';
    html += '$(\'.advm' + item_row + ' .expand\').bind(\'click\', function() {';
	html += '$(\'.advm' + item_row + '\').find(\'.advh\').slideToggle(\'fast\');';
    html += '});';
    html += '$(\'.advm' + item_row + ' .advh .closeadvm\').bind(\'click\', function() {';
	html += '$(\'.advm' + item_row + '\').find(\'.advh\').slideUp(\'fast\');';
    html += '});';
    html += '</script>';
	html += '<script type="text/javascript">';
	html += '$(document).ready( function() {'
	html += '$(".colors").miniColors({';
	html += 'change: function(hex, rgb) {';
	html += '$("#console").prepend(\'HEX: \' + hex + \' (RGB: \' + rgb.r + \', \' + rgb.g + \', \' + rgb.b + \')<br />\');';
	html += '}';
	html += '});';
	html += '});';
	html += '</script></td>';
	html += '    <td class="left"><a onclick="$(\'#item-row' + item_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#item tfoot').before(html);
	
	item_row++;
}
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
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('area1<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    width: '800px'
});
CKEDITOR.replace('area2<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    width: '800px'
});
CKEDITOR.replace('area3<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    width: '800px'
});
CKEDITOR.replace('area4<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    width: '800px'
});
CKEDITOR.replace('area5<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    width: '800px'
});
CKEDITOR.replace('area6<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    width: '800px'
});
CKEDITOR.replace('area7<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    width: '800px'
});
CKEDITOR.replace('area8<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    width: '800px'
});
<?php } ?>
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
//--></script> 
<?php echo $footer; ?>