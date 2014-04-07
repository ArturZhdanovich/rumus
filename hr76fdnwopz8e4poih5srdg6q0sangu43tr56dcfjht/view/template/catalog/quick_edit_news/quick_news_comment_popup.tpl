<div>
  <form action="POST" id="news-comment-form">
    <table class="form">
      <tr>
        <td><span class="required">*</span> <?php echo $entry_author; ?></td>
        <td><input type="text" name="author" value="<?php echo $author; ?>" />
            <?php if ($error_author) { ?>
            <span class="error"><?php echo $error_author; ?></span>
            <?php } ?></td>
      </tr>
      <tr>
        <td><?php echo $entry_news; ?></td>
        <td><input type="text" name="news" value="<?php echo $news; ?>" />
          <input type="hidden" name="news_id" value="<?php echo $news_id; ?>" />
          <?php if ($error_news) { ?>
          <span class="error"><?php echo $error_news; ?></span>
          <?php } ?></td>
      </tr>
      <tr>
        <td><span class="required">*</span> <?php echo $entry_text; ?></td>
        <td><textarea name="text" cols="60" rows="8"><?php echo $text; ?></textarea>
          <?php if ($error_text) { ?>
          <span class="error"><?php echo $error_text; ?></span>
          <?php } ?></td>
      </tr>
      <tr>
        <td><?php echo $entry_status; ?></td>
        <td><select name="status">
            <?php if ($status) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript">
$(document).ready(function() {
	getNews();
});
//--></script> 