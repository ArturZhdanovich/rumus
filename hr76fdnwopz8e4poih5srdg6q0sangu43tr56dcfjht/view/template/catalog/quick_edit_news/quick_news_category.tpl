<div>
<table class="form">
  <tr>
	<td style="width: 50px;">
	  <?php if ($news_image['image']) { ?>
		<img src="<?php echo $news_image; ?>" />
	  <?php } else { ?>
		<img src="<?php echo $news_no_image; ?>" />
	  <?php } ?>
	</td>
    <td><b><?php echo $news_name; ?></b></td>
  </tr>
</table>
<form action="POST" id="category-form">
  <table class="form">
    <tr>
      <td><?php echo $entry_main_category; ?></td>
      <td><select name="main_category_id" style="max-width: 350px;">
        <option value="0" selected="selected"><?php echo $text_none; ?></option>
        <?php foreach ($news_categories as $news_category) { ?>
          <?php if ($news_category['news_category_id'] == $main_category_id) { ?>
            <option value="<?php echo $news_category['news_category_id']; ?>" selected="selected"><?php echo $news_category['name']; ?></option>
          <?php } else { ?>
            <option value="<?php echo $news_category['news_category_id']; ?>"><?php echo $news_category['name']; ?></option>
          <?php } ?>
        <?php } ?>
      </select></td>
    </tr>
    <tr>
      <td><?php echo $entry_categories; ?></td>
      <td>
	    <div class="scrollbox" style="height: 300px;">
          <?php $class = 'odd'; ?>
          <?php foreach ($news_categories as $news_category) { ?>
            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
            <div class="<?php echo $class; ?>">
              <?php if (in_array($news_category['news_category_id'], $news_news_category)) { ?>
                <input type="checkbox" name="news_news_category[]" value="<?php echo $news_category['news_category_id']; ?>" checked="checked" />
                <?php echo $news_category['name']; ?>
              <?php } else { ?>
                <input type="checkbox" name="news_news_category[]" value="<?php echo $news_category['news_category_id']; ?>" />
                <?php echo $news_category['name']; ?>
              <?php } ?>
            </div>
          <?php } ?>
        </div>
        <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
	  </td>
	</tr>        
  </table>
</form>
</div>