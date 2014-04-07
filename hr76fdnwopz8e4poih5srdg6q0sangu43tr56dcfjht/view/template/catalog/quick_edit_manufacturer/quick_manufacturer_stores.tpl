<div>
<table class="form">
  <tr>
	<td style="width: 50px;">
	  <?php if ($manufacturer_image['image']) { ?>
		<img src="<?php echo $manufacturer_image; ?>" />
	  <?php } else { ?>
		<img src="<?php echo $manufacturer_no_image; ?>" />
	  <?php } ?>
	</td>
    <td><b><?php echo $name; ?></b></td>
  </tr>
</table>
<form action="POST" id="stores-form">
  <table class="form">
	<tr>
      <td><?php echo $entry_store; ?></td>
      <td>
		<div class="scrollbox">
          <?php $class = 'even'; ?>
          <div class="<?php echo $class; ?>">
            <?php if (in_array(0, $manufacturer_store)) { ?>
              <input type="checkbox" name="manufacturer_store[]" value="0" checked="checked" />
              <?php echo $text_default; ?>
            <?php } else { ?>
              <input type="checkbox" name="manufacturer_store[]" value="0" />
              <?php echo $text_default; ?>
            <?php } ?>
          </div>
          <?php foreach ($stores as $store) { ?>
            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
            <div class="<?php echo $class; ?>">
              <?php if (in_array($store['store_id'], $manufacturer_store)) { ?>
                <input type="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                <?php echo $store['name']; ?>
              <?php } else { ?>
                <input type="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" />
                <?php echo $store['name']; ?>
              <?php } ?>
            </div>
          <?php } ?>
        </div>
	  </td>
    </tr>
  </table>
</form>
</div>
