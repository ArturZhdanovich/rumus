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
      <div class="buttons"><a href="<?php echo $generator_categories; ?>" class="button"><?php echo $button_generator_categories; ?></a><a href="<?php echo $generator_products; ?>" class="button"><?php echo $button_generator_products; ?></a><a href="<?php echo $generator_manufacturers; ?>" class="button"><?php echo $button_generator_manufacturers; ?></a><a href="<?php echo $generator_information; ?>" class="button"><?php echo $button_generator_information; ?></a><a href="<?php echo $generator_news_categories; ?>" class="button"><?php echo $button_generator_news_categories; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_seo_manager; ?></a></div>
    </div>
    <div class="contentes">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr class="hidden">
            <td><?php echo $entry_source_language;?></td>
            <td>
              <select name="source_language_code" id="source_language_code">
                <?php foreach ($languages as $language) { ?>
				  <?php if ($language['code'] == $source_language_code) { ?>
				    <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>   
                  <?php } else { ?>
                    <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </td>
          </tr>
		</table>
		<div class="box">
		  <div class="heading">
		    <h1><?php echo $heading_seo_url; ?></h1>
            <div class="buttons"><button type="submit" name="news" value="news"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_news" value="save_templates_news"><?php echo $button_save_templates; ?></button></div>
          </div>
          <div class="contents">
		    <table class="list over">
			  <thead>
				<tr>
				  <td class="left"><?php echo $column_template; ?></td>
				  <td class="left"><?php echo $column_overwrite; ?></td>
				  <td class="left"><?php echo $column_suffix; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td class="left">
					<input type="text" id="template_seo_url_news" name="template_seo_url_news" value="<?php echo $template_seo_url_news;?>" size="100">
					<span class="help"><?php echo $text_news_tags; ?></span>
				  </td>
				  <td class="left">
					<select name="overwrite_news">
					  <option value="dont_overwrite"><?php echo $text_no_overwrite; ?></option>
					  <option value="overwrite"><?php echo $text_overwrite; ?></option>
					</select>
					<span class="help"><?php echo $text_warning_overwrite; ?></span>
				  </td>
				  <td class="left" width="20%">
				    <input type="text" id="news_suffix" name="news_suffix" value="<?php echo $news_suffix;?>" size="10">
				    <span class="help"><?php echo $text_products_suffix; ?></span>
				  </td>
				</tr>
			  </tbody>
			</table>
		  </div>
		</div>		
		<div class="box left-manager">
		  <div class="heading">
		    <h1><?php echo $heading_meta_h1; ?></h1>
            <div class="buttons"><button type="submit" name="meta_h1_news_delete" value="meta_h1_news_delete"><?php echo $button_delete; ?></button><button type="submit" name="meta_h1_news" value="meta_h1_news"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_news" value="save_templates_news"><?php echo $button_save_templates; ?></button></div>
          </div>
          <div class="contents">
		    <table class="list over">
			  <thead>
				<tr>
				  <td class="left"><?php echo $column_template; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td class="left">
					<input type="text" id="template_meta_h1_news" name="template_meta_h1_news" value="<?php echo $template_meta_h1_news;?>" size="100">
					<span class="help"><?php echo $text_meta_h1_news_tags; ?></span>
				  </td>
				</tr>
				<tr>
				  <td class="left">
					<span class="help"><?php echo $text_warning_h1; ?></span>
				  </td>				
				</tr>
			  </tbody>
			</table>
		  </div>
		</div>
		<div class="box right-manager">
		  <div class="heading">
		    <h1><?php echo $heading_meta_title; ?></h1>
            <div class="buttons"><button type="submit" name="meta_title_news_delete" value="meta_title_news_delete"><?php echo $button_delete; ?></button><button type="submit" name="meta_title_news" value="meta_title_news"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_news" value="save_templates_news"><?php echo $button_save_templates; ?></button></div>
          </div>
          <div class="contents">
		    <table class="list over">
			  <thead>
				<tr>
				  <td class="left"><?php echo $column_template; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td class="left">
					<input type="text" id="template_meta_title_news" name="template_meta_title_news" value="<?php echo $template_meta_title_news; ?>" size="100">
					<span class="help"><?php echo $text_meta_title_news_tags; ?></span>
				  </td>
				</tr>
				<tr>
				  <td class="left">
					<span class="help"><?php echo $text_warning_title; ?></span>
				  </td>				
				</tr>
			  </tbody>
			</table>
		  </div>
		</div>
		<div class="box left-manager">
		  <div class="heading">
		    <h1><?php echo $heading_meta_keywords; ?></h1>
            <div class="buttons"><button type="submit" name="meta_keywords_news_delete" value="meta_keywords_news_delete"><?php echo $button_delete; ?></button><button type="submit" name="meta_keywords_news" value="meta_keywords_news"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_news" value="save_templates_news"><?php echo $button_save_templates; ?></button></div>
          </div>
          <div class="contents">
		    <table class="list over">
			  <thead>
				<tr>
				  <td class="left"><?php echo $column_template; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td class="left">
					<input type="text" id="template_meta_keywords_news" name="template_meta_keywords_news" value="<?php echo $template_meta_keywords_news;?>" size="100">
					<span class="help"><?php echo $text_meta_keywords_news_tags; ?></span>
				  </td>
				</tr>
				<tr>
				  <td class="left">
					<span class="help"><?php echo $text_warning_keywords; ?></span>
				  </td>				
				</tr>
			  </tbody>
			</table>
		  </div>
		</div>		
		<div class="box right-manager">
		  <div class="heading">
		    <h1><?php echo $heading_tags; ?></h1>
            <div class="buttons"><button type="submit" name="tags_news_delete" value="tags_news_delete"><?php echo $button_delete; ?></button><button type="submit" name="tags_news" value="tags_news"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_news" value="save_templates_news"><?php echo $button_save_templates; ?></button></div>
          </div>
          <div class="contents">
		    <table class="list over">
			  <thead>
				<tr>
				  <td class="left"><?php echo $column_template; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td class="left">
					<input type="text" id="template_tags_news" name="template_tags_news" value="<?php echo $template_tags_news;?>" size="100">
					<span class="help"><?php echo $text_tags_news; ?></span>
				  </td>
				</tr>
				<tr>
				  <td class="left">
					<span class="help"><?php echo $text_warning_tags; ?></span>
				  </td>				
				</tr>
			  </tbody>
			</table>
		  </div>
		</div>
		<div class="box center-manager">
		  <div class="heading">
		    <h1><?php echo $heading_meta_description; ?></h1>
            <div class="buttons"><button type="submit" name="meta_description_news_delete" value="meta_description_news_delete"><?php echo $button_delete; ?></button><button type="submit" name="meta_description_news" value="meta_description_news"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_news" value="save_templates_news"><?php echo $button_save_templates; ?></button></div>
          </div>
          <div class="contents">
		    <table class="list over">
			  <thead>
				<tr>
				  <td class="left"><?php echo $column_template; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td class="left">
					<input type="text" id="template_meta_description_news" name="template_meta_description_news" value="<?php echo $template_meta_description_news; ?>" size="100" class="input-left">
					<span class="help desc-left"><?php echo $text_news_meta_description; ?></span>
				  </td>
				</tr>
				<tr>
				  <td class="left">
					<span class="help"><?php echo $text_warning_description; ?></span>
				  </td>				
				</tr>
			  </tbody>
			</table>
		  </div>
		</div>
      </form>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/banner.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $generator_categories; ?>" class="button"><?php echo $button_generator_categories; ?></a><a href="<?php echo $generator_products; ?>" class="button"><?php echo $button_generator_products; ?></a><a href="<?php echo $generator_manufacturers; ?>" class="button"><?php echo $button_generator_manufacturers; ?></a><a href="<?php echo $generator_information; ?>" class="button"><?php echo $button_generator_information; ?></a><a href="<?php echo $generator_news_categories; ?>" class="button"><?php echo $button_generator_news_categories; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_seo_manager; ?></a></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>