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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="contentes">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
		  <tr>
		    <td><?php echo $text_limit_new; ?></td>
			<td><input type="text" name="config_limit_days_new_product" value="<?php echo $config_limit_days_new_product; ?>" size="2" /></td>
		  </tr>
		  <tr>
		    <td><?php echo $text_limit_popular; ?></td>
			<td><input type="text" name="config_limit_viewed_popular_product" value="<?php echo $config_limit_viewed_popular_product; ?>" size="2" /></td>
		  </tr>
		</table>
		<table class="list">
		  <thead>
		    <tr>
              <td class="left"><?php echo $column_select; ?></td>
			  <td class="center" width="15%"><?php echo $column_special; ?></td>
			  <td class="center" width="15%"><?php echo $column_new_product; ?></td>
			  <td class="center" width="15%"><?php echo $column_popular; ?></td>
            </tr>
		  </thead>
		  <tbody>
            <tr>
			  <td class="left"><?php echo $entry_sticker_module_bestseller; ?></td>
			  <td class="center"><select name="config_sticker_special_module_bestseller">
                <?php if ($config_sticker_special_module_bestseller == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_module_bestseller == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_module_bestseller">
                <?php if ($config_sticker_new_module_bestseller == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_module_bestseller == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_module_bestseller">
                <?php if ($config_sticker_popular_module_bestseller == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_module_bestseller == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_module_featured; ?></td>
			  <td class="center"><select name="config_sticker_special_module_featured">
                <?php if ($config_sticker_special_module_featured == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_module_featured == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_module_featured">
                <?php if ($config_sticker_new_module_featured == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_module_featured == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_module_featured">
                <?php if ($config_sticker_popular_module_featured == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_module_featured == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_module_latest; ?></td>
			  <td class="center"><select name="config_sticker_special_module_latest">
                <?php if ($config_sticker_special_module_latest == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_module_latest == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_module_latest">
                <?php if ($config_sticker_new_module_latest == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_module_latest == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_module_latest">
                <?php if ($config_sticker_popular_module_latest == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_module_latest == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_module_special; ?></td>
			  <td class="center"><select name="config_sticker_special_module_special">
                <?php if ($config_sticker_special_module_special == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_module_special == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_module_special">
                <?php if ($config_sticker_new_module_special == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_module_special == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_module_special">
                <?php if ($config_sticker_popular_module_special == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_module_special == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_categories; ?></td>
			  <td class="center"><select name="config_sticker_special_categories">
                <?php if ($config_sticker_special_categories == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_categories == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_categories">
                <?php if ($config_sticker_new_categories == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_categories == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_categories">
                <?php if ($config_sticker_popular_categories == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_categories == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_manufacturer; ?></td>
			  <td class="center"><select name="config_sticker_special_manufacturer">
                <?php if ($config_sticker_special_manufacturer == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_manufacturer == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_manufacturer">
                <?php if ($config_sticker_new_manufacturer == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_manufacturer == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_manufacturer">
                <?php if ($config_sticker_popular_manufacturer == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_manufacturer == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_product; ?></td>
			  <td class="center"><select name="config_sticker_special_product">
                <?php if ($config_sticker_special_product == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_product == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_product">
                <?php if ($config_sticker_new_product == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_product == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_product">
                <?php if ($config_sticker_popular_product == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_product == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_product_related; ?></td>
			  <td class="center"><select name="config_sticker_special_product_related">
                <?php if ($config_sticker_special_product_related == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_product_related == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_product_related">
                <?php if ($config_sticker_new_product_related == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_product_related == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_product_related">
                <?php if ($config_sticker_popular_product_related == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_product_related == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_search; ?></td>
			  <td class="center"><select name="config_sticker_special_search">
                <?php if ($config_sticker_special_search == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_search == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_search">
                <?php if ($config_sticker_new_search == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_search == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_search">
                <?php if ($config_sticker_popular_search == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_search == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_special; ?></td>
			  <td class="center"><select name="config_sticker_special_special">
                <?php if ($config_sticker_special_special == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_special == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_special">
                <?php if ($config_sticker_new_special == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_special == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_special">
                <?php if ($config_sticker_popular_special == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_special == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_quick_view; ?></td>
			  <td class="center"><select name="config_sticker_special_quick_view">
                <?php if ($config_sticker_special_quick_view == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_quick_view == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_quick_view">
                <?php if ($config_sticker_new_quick_view == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_quick_view == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_quick_view">
                <?php if ($config_sticker_popular_quick_view == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_quick_view == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_quick_view_related; ?></td>
			  <td class="center"><select name="config_sticker_special_quick_view_related">
                <?php if ($config_sticker_special_quick_view_related == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_quick_view_related == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_quick_view_related">
                <?php if ($config_sticker_new_quick_view_related == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_quick_view_related == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_quick_view_related">
                <?php if ($config_sticker_popular_quick_view_related == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_quick_view_related == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
			  <td class="left"><?php echo $entry_sticker_news_related_product; ?></td>
			  <td class="center"><select name="config_sticker_special_news_related_product">
                <?php if ($config_sticker_special_news_related_product == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_special_news_related_product == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_new_news_related_product">
                <?php if ($config_sticker_new_news_related_product == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_new_news_related_product == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
			  <td class="center"><select name="config_sticker_popular_news_related_product">
                <?php if ($config_sticker_popular_news_related_product == '1') { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <?php } ?>
                <?php if ($config_sticker_popular_news_related_product == '0') { ?>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            </tr>
		  </tbody>
        </table>
      </form>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
  </div>
</div> 
<?php echo $footer; ?>