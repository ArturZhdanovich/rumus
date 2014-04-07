<div>
<table class="form">
  <tr>
	<td style="width: 50px;">
	  <?php if ($news_category_image['image']) { ?>
		<img src="<?php echo $news_category_image; ?>" />
	  <?php } else { ?>
		<img src="<?php echo $news_category_no_image; ?>" />
	  <?php } ?>
	</td>
    <td><b><?php echo $news_category_name; ?></b></td>
  </tr>
</table>
<form action="POST" id="category-form">
  <table class="form">
	<tr>
      <td><?php echo $entry_parent; ?></td>
      <td>
		<select name="parent_id" style="max-width: 450px;">
          <option value="0"><?php echo $text_none; ?></option>
          <?php foreach ($news_categories as $news_category) { ?>
          <?php if ($news_category['news_category_id'] == $parent_id) { ?>
          <option value="<?php echo $news_category['news_category_id']; ?>" selected="selected"><?php echo $news_category['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $news_category['news_category_id']; ?>"><?php echo $news_category['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
	  </td>
    </tr>
  </table>
</form>
</div>
