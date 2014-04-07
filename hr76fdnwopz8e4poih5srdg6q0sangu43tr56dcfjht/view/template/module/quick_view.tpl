<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><?php echo $entry_quick_view_bestseller; ?></td>
			<td>
			  <?php if ($config_quick_view_bestseller) { ?>
                <input type="radio" name="config_quick_view_bestseller" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_bestseller" value="0" />
                <?php echo $text_no; ?>
              <?php } else { ?>
                <input type="radio" name="config_quick_view_bestseller" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_bestseller" value="0" checked="checked" />
                <?php echo $text_no; ?>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><?php echo $entry_quick_view_featured; ?></td>
			<td>
			  <?php if ($config_quick_view_featured) { ?>
                <input type="radio" name="config_quick_view_featured" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_featured" value="0" />
                <?php echo $text_no; ?>
              <?php } else { ?>
                <input type="radio" name="config_quick_view_featured" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_featured" value="0" checked="checked" />
                <?php echo $text_no; ?>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><?php echo $entry_quick_view_latest; ?></td>
			<td>
			  <?php if ($config_quick_view_latest) { ?>
                <input type="radio" name="config_quick_view_latest" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_latest" value="0" />
                <?php echo $text_no; ?>
              <?php } else { ?>
                <input type="radio" name="config_quick_view_latest" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_latest" value="0" checked="checked" />
                <?php echo $text_no; ?>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><?php echo $entry_quick_view_special; ?></td>
			<td>
			  <?php if ($config_quick_view_special) { ?>
                <input type="radio" name="config_quick_view_special" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_special" value="0" />
                <?php echo $text_no; ?>
              <?php } else { ?>
                <input type="radio" name="config_quick_view_special" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_special" value="0" checked="checked" />
                <?php echo $text_no; ?>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><?php echo $entry_quick_view_categories; ?></td>
			<td>
			  <?php if ($config_quick_view_categories) { ?>
                <input type="radio" name="config_quick_view_categories" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_categories" value="0" />
                <?php echo $text_no; ?>
              <?php } else { ?>
                <input type="radio" name="config_quick_view_categories" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_categories" value="0" checked="checked" />
                <?php echo $text_no; ?>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><?php echo $entry_quick_view_manufacturers; ?></td>
			<td>
			  <?php if ($config_quick_view_manufacturers) { ?>
                <input type="radio" name="config_quick_view_manufacturers" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_manufacturers" value="0" />
                <?php echo $text_no; ?>
              <?php } else { ?>
                <input type="radio" name="config_quick_view_manufacturers" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_manufacturers" value="0" checked="checked" />
                <?php echo $text_no; ?>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><?php echo $entry_quick_view_search; ?></td>
			<td>
			  <?php if ($config_quick_view_search) { ?>
                <input type="radio" name="config_quick_view_search" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_search" value="0" />
                <?php echo $text_no; ?>
              <?php } else { ?>
                <input type="radio" name="config_quick_view_search" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_search" value="0" checked="checked" />
                <?php echo $text_no; ?>
              <?php } ?>
			</td>
          </tr>
		  <tr>
            <td><?php echo $entry_quick_view_list_special; ?></td>
			<td>
			  <?php if ($config_quick_view_list_special) { ?>
                <input type="radio" name="config_quick_view_list_special" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_list_special" value="0" />
                <?php echo $text_no; ?>
              <?php } else { ?>
                <input type="radio" name="config_quick_view_list_special" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_view_list_special" value="0" checked="checked" />
                <?php echo $text_no; ?>
              <?php } ?>
			</td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>