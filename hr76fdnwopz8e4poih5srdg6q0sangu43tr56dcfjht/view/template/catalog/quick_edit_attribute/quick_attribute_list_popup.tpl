<div>
  <form action="POST" id="attribute-form">
    <table class="form">
	  <tr>
        <td><span class="required">*</span> <?php echo $entry_name; ?></td>
        <td>
		  <?php foreach ($languages as $language) { ?>
            <input type="text" name="attribute_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($attribute_description[$language['language_id']]) ? $attribute_description[$language['language_id']]['name'] : ''; ?>" />
            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
            <?php if (isset($error_name[$language['language_id']])) { ?>
              <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
            <?php } ?>
          <?php } ?>
		</td>
      </tr>
      <tr>
        <td><?php echo $entry_attribute_group; ?></td>
        <td>
		  <select name="attribute_group_id">
            <?php foreach ($attribute_groups as $attribute_group) { ?>
              <?php if ($attribute_group['attribute_group_id'] == $attribute_group_id) { ?>
                <option value="<?php echo $attribute_group['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_group['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $attribute_group['attribute_group_id']; ?>"><?php echo $attribute_group['name']; ?></option>
              <?php } ?>
            <?php } ?>
          </select>
		</td>
      </tr>
      <tr>
        <td><?php echo $entry_sort_order; ?></td>
        <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
      </tr>
	</table>
  </form>
</div>