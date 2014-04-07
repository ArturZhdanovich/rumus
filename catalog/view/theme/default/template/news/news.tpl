<?php echo $header; ?>
<div class="breadcrumb">
   <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
   <?php } ?>
</div>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <div class="main-content">
  <div class="news-info">
    <div class="left">
	  <?php if ($thumb) { ?>
		<div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" data-gal="prettyPhoto[gallery]"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
	  <?php } ?>
	  <div class="data-news">
		<div class="info-news"><span class="poshytips comments" title="<?php echo $news_comments; ?>"></span><span class="poshytips viewed" title="<?php echo $viewed; ?>"></span><span class="date-available"><?php echo $date_available; ?></span></div>
	  </div>
	</div>
	<div class="right">
	  <div class="description">
		<?php echo $description; ?>
		
	  </div>
	</div>
  </div>
  <div id="tabs" class="htabs">
    <?php if ($products) { ?>
      <a href="#tab-related-products"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
    <?php } ?>
	<?php if ($related_news) { ?>
	  <a href="#tab-related-news"><?php echo $tab_related_news; ?> (<?php echo count($related_news); ?>)</a>
	<?php } ?>
	<?php if ($this->config->get('news_comments') == 0) { ?>
      <a href="#tab-news-comments"><?php echo $tab_news_comments; ?></a>
    <?php } ?>
	<?php if ($images) { ?>
	  <a href="#tab-news-images"><?php echo $tab_images; ?> (<?php echo count($images); ?>)</a>
	<?php } ?>
  </div>
  <?php if ($products) { ?>
  <div id="tab-related-products" class="tab-content">
    <div class="related-box-product">
	  <?php foreach ($products as $product) { ?>
		<div>
		  <?php if ($product['thumb']) { ?>
			<div class="image-related"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a><?php echo $product['sale']; ?><?php echo $product['new']; ?><?php echo $product['popular']; ?></div>
		  <?php } else { ?>
			<div class="image-related"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['no_image']; ?>" alt="<?php echo $product['name']; ?>" /></a><?php echo $product['sale']; ?><?php echo $product['new']; ?><?php echo $product['popular']; ?></div>
		  <?php } ?>
		  <div class="name-related"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		  <?php if ($product['price']) { ?>
			<div class="price-related">
			  <?php if (!$product['special']) { ?>
			  <?php echo $product['price']; ?>
			  <?php } else { ?>
			  <span class="price-old-related"><?php echo $product['price']; ?></span> <span class="price-new-related"><?php echo $product['special']; ?></span>
			  <?php } ?>
			</div>
		  <?php } ?>
		  <div class="cart-related">
			<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
		  </div>
		</div>
	  <?php } ?>
	</div>
  </div>
  <?php } ?>
  <?php if ($related_news) { ?>
  <div id="tab-related-news" class="tab-content">
    <div class="related-box-product">
	  <?php foreach ($related_news as $related_article) { ?>
	    <div>
          <?php if ($related_article['thumb']) { ?>
          <div class="image-related"><a href="<?php echo $related_article['href']; ?>"><img src="<?php echo $related_article['thumb']; ?>" alt="<?php echo $related_article['name']; ?>" /></a></div>
          <?php } else { ?>
		  <div class="image-related"><a href="<?php echo $related_article['href']; ?>"><img src="<?php echo $related_article['no_image']; ?>" alt="<?php echo $related_article['name']; ?>" /></a></div>
		  <?php } ?>
          <div class="name-related"><a href="<?php echo $related_article['href']; ?>"><?php echo $related_article['name']; ?></a></div>
	      <div class="cart-related">
			<a href="<?php echo $related_article['href']; ?>" class="button"><?php echo $button_more; ?></a>
		  </div>
		</div>
	  <?php } ?>
    </div>
  </div>
  <?php } ?>
  <?php if ($this->config->get('news_comments') == 0) { ?>
    <?php if ($news_comments) { ?>
      <div id="tab-news-comments" class="tab-content">
		<div id="news-comment"></div>
		<h2 id="news-comment-title"><?php echo $text_write; ?></h2>
		<?php if ($guest_news_comment) { ?>
		  <b><?php echo $entry_name; ?></b><br />
		  <input type="text" name="name" value="<?php echo $customer_name; ?>" />
		  <br />
		  <br />
		  <b><?php echo $entry_comment; ?></b>
		  <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
		  <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
		  <br />
		  <b><?php echo $entry_captcha; ?></b><br />
		  <img src="index.php?route=product/product/captcha" alt="" id="captcha" />
		  <br />
		  <input type="text" name="captcha" value="" /><br />
		  <br />
		  <div class="buttons">
			<div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
		  </div>
		<?php } else { ?>
 		  <?php echo $text_login_write; ?>
		<?php } ?>
	  </div>
    <?php } ?>
  <?php } ?>
  <?php if ($images) { ?>
  <div id="tab-news-images" class="tab-content">
    <div class="box-news-images">
	  <?php foreach ($images as $image) { ?>
	    <div>
          <div class="image"><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" data-gal="prettyPhoto[gallery]"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
        </div>
	  <?php } ?>
    </div>
  </div>
  <?php } ?>
  <?php if ($tags) { ?>
  <div class="tags"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  </div>
  <div class="bottom"></div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#news-comment .pagination a').live('click', function() {
	$('#news-comment').fadeOut('slow');
		
	$('#news-comment').load(this.href);
	
	$('#news-comment').fadeIn('slow');
	
	return false;
});			

$('#news-comment').load('index.php?route=news/news/news_comments&news_id=<?php echo $news_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=news/news/write&news_id=<?php echo $news_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#news-comment-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#news-comment-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#news-comment-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'captcha\']').val('');
                var img_src = $("img#captcha").attr("src").replace(/\&rnd=\d*/gi,"");
                var d = Math.floor((Math.random()*10000)+1);
                $("img#captcha").attr("src", img_src+"&rnd="+d);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<?php echo $footer; ?>