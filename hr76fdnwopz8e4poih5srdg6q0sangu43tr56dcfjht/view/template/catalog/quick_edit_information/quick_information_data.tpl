<div>
<table class="form">
  <tr>
    <td><b><?php echo $information_title; ?></b></td>
  </tr>
</table>
<form action="POST" id="data-form">
  <table class="form">
    <tr>
      <td><?php echo $entry_store; ?></td>
      <td>
	    <div class="scrollbox">
          <?php $class = 'even'; ?>
          <div class="<?php echo $class; ?>">
            <?php if (in_array(0, $information_store)) { ?>
              <input type="checkbox" name="information_store[]" value="0" checked="checked" />
              <?php echo $text_default; ?>
            <?php } else { ?>
              <input type="checkbox" name="information_store[]" value="0" />
              <?php echo $text_default; ?>
            <?php } ?>
          </div>
          <?php foreach ($stores as $store) { ?>
            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
            <div class="<?php echo $class; ?>">
              <?php if (in_array($store['store_id'], $information_store)) { ?>
                <input type="checkbox" name="information_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                <?php echo $store['name']; ?>
              <?php } else { ?>
                <input type="checkbox" name="information_store[]" value="<?php echo $store['store_id']; ?>" />
                <?php echo $store['name']; ?>
              <?php } ?>
            </div>
          <?php } ?>
        </div>
	  </td>
    </tr>
	<tr>
      <td><?php echo $entry_top; ?></td>
      <td><?php if ($top) { ?>
        <input type="checkbox" name="top" value="1" checked="checked" />
        <?php } else { ?>
          <input type="checkbox" name="top" value="1" />
        <?php } ?>
	  </td>
    </tr>  
    <tr>
      <td><?php echo $entry_bottom; ?></td>
      <td>
	    <?php if ($bottom) { ?>
          <input type="checkbox" name="bottom" value="1" checked="checked" />
        <?php } else { ?>
          <input type="checkbox" name="bottom" value="1" />
        <?php } ?>
	  </td>
    </tr>            
  </table>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $entry_store; ?></td>
        <td class="left"><?php echo $entry_layout; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left"><?php echo $text_default; ?></td>
        <td class="left">
		  <select name="information_layout[0][layout_id]">
            <option value=""></option>
            <?php foreach ($layouts as $layout) { ?>
              <?php if (isset($information_layout[0]) && $information_layout[0] == $layout['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
              <?php } ?>
            <?php } ?>
          </select>
		</td>
      </tr>
    </tbody>
    <?php foreach ($stores as $store) { ?>
      <tbody>
        <tr>
          <td class="left"><?php echo $store['name']; ?></td>
          <td class="left">
		    <select name="information_layout[<?php echo $store['store_id']; ?>][layout_id]">
              <option value=""></option>
              <?php foreach ($layouts as $layout) { ?>
                <?php if (isset($information_layout[$store['store_id']]) && $information_layout[$store['store_id']] == $layout['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
		  </td>
        </tr>
      </tbody>
    <?php } ?>
  </table>
</form>
</div>