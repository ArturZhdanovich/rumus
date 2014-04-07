<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-news">
      <?php foreach ($news as $article) { ?>
      <div>
	    <?php if ($image_preview) { ?>
          <?php if ($article['thumb']) { ?>
          <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
          <?php } else { ?>
	      <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['no_image']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
          <?php } ?>
		  <div class="description-image"><?php echo $article['description']; ?></div>
		<?php } else { ?>
		<div class="description"><?php echo $article['description']; ?></div>
		<?php } ?>
		<div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
        <div class="data-news"><a href="<?php echo $article['href']; ?>" class="poshytips button-more" title="<?php echo $button_more; ?>"></a><div class="info"><span class="date-available"><?php echo $article['date_available']; ?></span><span class="poshytips viewed" title="<?php echo $article['viewed']; ?>"></span><span class="poshytips comments" title="<?php echo $article['news_comments']; ?>"></span></div></div>
      </div>
      <?php } ?>
	</div>
  </div>
</div>