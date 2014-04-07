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
      <div class="buttons"><a href="<?php echo $generator_categories; ?>" class="button"><?php echo $button_generator_categories; ?></a><a href="<?php echo $generator_products; ?>" class="button"><?php echo $button_generator_products; ?></a><a href="<?php echo $generator_manufacturers; ?>" class="button"><?php echo $button_generator_manufacturers; ?></a><a href="<?php echo $generator_news_categories; ?>" class="button"><?php echo $button_generator_news_categories; ?></a><a href="<?php echo $generator_news; ?>" class="button"><?php echo $button_generator_news; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_seo_manager; ?></a></div>
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
            <div class="buttons"><button type="submit" name="informations" value="informations"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_informations" value="save_templates_informations"><?php echo $button_save_templates; ?></button></div>
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
					<input type="text" id="template_seo_url_informations" name="template_seo_url_informations" value="<?php echo $template_seo_url_informations; ?>" size="100">
					<span class="help"><?php echo $text_informations_tags; ?></span>
				  </td>
				  <td class="left">
					<select name="overwrite_informations">
					  <option value="dont_overwrite"><?php echo $text_no_overwrite; ?></option>
					  <option value="overwrite"><?php echo $text_overwrite; ?></option>
					</select>
					<span class="help"><?php echo $text_warning_overwrite; ?></span>
				  </td>
				  <td class="left" width="20%">
				    <input type="text" id="informations_suffix" name="informations_suffix" value="<?php echo $informations_suffix;?>" size="10">
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
            <div class="buttons"><button type="submit" name="meta_h1_informations_delete" value="meta_h1_informations_delete"><?php echo $button_delete; ?></button><button type="submit" name="meta_h1_informations" value="meta_h1_informations"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_informations" value="save_templates_informations"><?php echo $button_save_templates; ?></button></div>
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
					<input type="text" id="template_meta_h1_informations" name="template_meta_h1_informations" value="<?php echo $template_meta_h1_informations;?>" size="100">
					<span class="help"><?php echo $text_meta_h1_informations_tags; ?></span>
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
            <div class="buttons"><button type="submit" name="meta_title_informations_delete" value="meta_title_informations_delete"><?php echo $button_delete; ?></button><button type="submit" name="meta_title_informations" value="meta_title_informations"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_informations" value="save_templates_informations"><?php echo $button_save_templates; ?></button></div>
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
					<input type="text" id="template_meta_title_informations" name="template_meta_title_informations" value="<?php echo $template_meta_title_informations; ?>" size="100">
					<span class="help"><?php echo $text_meta_title_informations_tags; ?></span>
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
            <div class="buttons"><button type="submit" name="meta_keywords_informations_delete" value="meta_keywords_informations_delete"><?php echo $button_delete; ?></button><button type="submit" name="meta_keywords_informations" value="meta_keywords_informations"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_informations" value="save_templates_informations"><?php echo $button_save_templates; ?></button></div>
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
					<input type="text" id="template_meta_keywords_informations" name="template_meta_keywords_informations" value="<?php echo $template_meta_keywords_informations; ?>" size="100">
					<span class="help"><?php echo $text_meta_key_informations_tags; ?></span>
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
		    <h1><?php echo $heading_meta_description; ?></h1>
            <div class="buttons"><button type="submit" name="meta_description_informations_delete" value="meta_description_informations_delete"><?php echo $button_delete; ?></button><button type="submit" name="meta_description_informations" value="meta_description_informations"><?php echo $button_generate; ?></button><button type="submit" name="save_templates_informations" value="save_templates_informations"><?php echo $button_save_templates; ?></button></div>
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
					<input type="text" id="template_meta_description_informations" name="template_meta_description_informations" value="<?php echo $template_meta_description_informations; ?>" size="100">
					<span class="help"><?php echo $text_informations_meta_descr; ?></span>
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
      <div class="buttons"><a href="<?php echo $generator_categories; ?>" class="button"><?php echo $button_generator_categories; ?></a><a href="<?php echo $generator_products; ?>" class="button"><?php echo $button_generator_products; ?></a><a href="<?php echo $generator_manufacturers; ?>" class="button"><?php echo $button_generator_manufacturers; ?></a><a href="<?php echo $generator_news_categories; ?>" class="button"><?php echo $button_generator_news_categories; ?></a><a href="<?php echo $generator_news; ?>" class="button"><?php echo $button_generator_news; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_seo_manager; ?></a></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>