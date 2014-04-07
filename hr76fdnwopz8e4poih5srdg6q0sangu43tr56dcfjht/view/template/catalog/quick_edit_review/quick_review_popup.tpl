<div>
  <form action="POST" id="review-form">
    <table class="form">
      <tr>
        <td><span class="required">*</span> <?php echo $entry_author; ?></td>
        <td>
		  <input type="text" name="author" value="<?php echo $author; ?>" size="103" />
          <?php if ($error_author) { ?>
            <span class="error"><?php echo $error_author; ?></span>
          <?php } ?>
		</td>
      </tr>
      <tr>
        <td><?php echo $entry_product; ?></td>
        <td>
		  <input type="text" name="product" value="<?php echo $product; ?>" size="103" />
          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
          <?php if ($error_product) { ?>
            <span class="error"><?php echo $error_product; ?></span>
          <?php } ?>
		</td>
      </tr>
      <tr>
        <td><span class="required">*</span> <?php echo $entry_text; ?></td>
        <td>
		  <textarea name="text" cols="100" rows="8"><?php echo $text; ?></textarea>
          <?php if ($error_text) { ?>
            <span class="error"><?php echo $error_text; ?></span>
          <?php } ?>
		</td>
      </tr>
      <tr>
        <td><?php echo $entry_rating; ?></td>
        <td>
		  <b class="rating"><?php echo $entry_bad; ?></b>&nbsp;
          <?php if ($rating == 1) { ?>
            <input type="radio" name="rating" value="1" checked />
          <?php } else { ?>
            <input type="radio" name="rating" value="1" />
          <?php } ?>
          &nbsp;
          <?php if ($rating == 2) { ?>
            <input type="radio" name="rating" value="2" checked />
          <?php } else { ?>
            <input type="radio" name="rating" value="2" />
          <?php } ?>
          &nbsp;
          <?php if ($rating == 3) { ?>
            <input type="radio" name="rating" value="3" checked />
          <?php } else { ?>
            <input type="radio" name="rating" value="3" />
          <?php } ?>
          &nbsp;
          <?php if ($rating == 4) { ?>
            <input type="radio" name="rating" value="4" checked />
          <?php } else { ?>
            <input type="radio" name="rating" value="4" />
          <?php } ?>
          &nbsp;
          <?php if ($rating == 5) { ?>
            <input type="radio" name="rating" value="5" checked />
          <?php } else { ?>
            <input type="radio" name="rating" value="5" />
          <?php } ?>
          &nbsp; 
		  <b class="rating"><?php echo $entry_good; ?></b>
          <?php if ($error_rating) { ?>
            <span class="error"><?php echo $error_rating; ?></span>
          <?php } ?>
		</td>
      </tr>
      <tr>
        <td><?php echo $entry_status; ?></td>
        <td>
		  <select name="status">
            <?php if ($status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select>
		</td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript">
$(document).ready(function() {
	getProducts();
});
//--></script> 