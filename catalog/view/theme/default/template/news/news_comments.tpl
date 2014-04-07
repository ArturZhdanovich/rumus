<?php if ($news_comments) { ?>
<?php foreach ($news_comments as $news_comment) { ?>
<div class="review-list">
  <div class="author"><b><?php echo $news_comment['author']; ?></b> <?php echo $text_on; ?> <?php echo $news_comment['date_added']; ?></div>
  <div class="text"><?php echo $news_comment['text']; ?></div>
</div>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_comments; ?></div>
<?php } ?>
