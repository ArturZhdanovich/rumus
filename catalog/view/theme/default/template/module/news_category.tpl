<?php if ($top_bottom) { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?>
    <?php if ($all_news_side_menu == 'top' || $all_news_side_menu == 'bottom') { ?>
	  &bull;&nbsp;<a href="<?php echo $all_news; ?>"><?php echo $text_all_news; ?></a>
	<?php } ?>
	<?php if ($search_news == 'top' || $search_news == 'bottom') { ?>
	  <div id="box-search-top">
	    <div class="button_search"></div>
        <input type="text" name="search" id="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
	  </div>
	<?php } ?>
  </div>
  <div class="box-content">
    <div class="box-category-top">
      <?php foreach ($news_categories as $news_category) { ?>
		<div style="width: <?php echo $width_top; ?>px;">
		  <?php if ($news_category['thumb']) { ?>
		  <div class="image"><a href="<?php echo $news_category['href']; ?>"><img src="<?php echo $news_category['thumb']; ?>" alt="<?php echo $news_category['name']; ?>" /></a></div>
		  <?php } else { ?>
		  <div class="image"><a href="<?php echo $news_category['href']; ?>"><img src="<?php echo $news_category['no_image']; ?>" alt="<?php echo $news_category['name']; ?>" /></a></div>
		  <?php } ?>
		  <?php if ($news_category['description']) { ?>
		  <div class="description-box"><?php echo $news_category['description']; ?></div>
		  <?php } else { ?>
		  <div class="description-box"><?php echo $text_no_description; ?></div>
		  <?php } ?>
		  <div class="name"><a href="<?php echo $news_category['href']; ?>"><?php echo $news_category['name']; ?></a></div>
		</div>
      <?php } ?>
    </div>
  </div>
</div>
<?php } ?>
<?php if ($side) { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <?php if ($search_news == 'top') { ?>
	  <div id="box-search">
	    <div class="button_search"></div>
        <input type="text" name="search" id="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" />
	  </div>
	<?php } ?>
    <ul class="box-category">
	  <?php if ($all_news_side_menu == 'top') { ?>
		 <li><a href="<?php echo $all_news; ?>"><?php echo $text_all_news; ?></a></li>
	  <?php } ?>
      <?php foreach ($news_categories as $news_category) { ?>
		<?php if ($news_category['news_category_id'] == $news_category_id) { ?>
		<li class="active"><a href="<?php echo $news_category['href']; ?>" class="active"><?php echo $news_category['name']; ?></a>
		<?php } else { ?>
		<li><a href="<?php echo $news_category['href']; ?>"><?php echo $news_category['name']; ?></a>
		<?php } ?>
		<?php if ($news_category['children']) { ?>
		  <a href="<?php echo $news_category['href']; ?>" class="category-button"></a>
		  <ul>
		  <?php if ($news_category['thumb']) { ?>
		  <li class="image"><a href="<?php echo $news_category['href']; ?>" title="<?php echo $news_category['name']; ?>"><img src="<?php echo $news_category['thumb']; ?>" alt="<?php echo $news_category['name']; ?>"></a>
		  <div class="description" style="width:<?php echo $width; ?>px;"><?php echo $news_category['description']; ?></div></li>
		  <?php } ?>
		  <?php foreach ($news_category['children'] as $child) { ?>
		  <?php if ($child['news_category_id'] == $child_id) { ?>
		  <li class="active"><a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
		  <?php } else { ?>
		  <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
		  <?php } ?>
		  <?php if($child['child2_id']){ ?>
			<a href="<?php echo $child['href']; ?>" class="category-button"></a>
			<ul>
			<?php if ($child['child_thumb']) { ?>
			<li class="image"><a href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>"><img src="<?php echo $child['child_thumb']; ?>" alt="<?php echo $child['name']; ?>"></a>
			<div class="description" style="width:<?php echo $width; ?>px;"><?php echo $child['child_description']; ?></div></li>
			<?php } ?>
			<?php foreach ($child['child2_id'] as $child2) { ?>
			<?php if ($child2['news_category_id'] == $child2_id) { ?>
			<li class="active"><a href="<?php echo $child2['href']; ?>" class="active"><?php echo $child2['name']; ?></a>
			<?php } else { ?>
			<li><a href="<?php echo $child2['href']; ?>"><?php echo $child2['name']; ?></a>
			<?php } ?>
			<?php if($child2['child3_id']){ ?>
			  <a href="<?php echo $child2['href']; ?>" class="category-button"></a>
			  <ul>
			  <?php if ($child2['child2_thumb']) { ?>
			  <li class="image"><a href="<?php echo $child2['href']; ?>" title="<?php echo $child2['name']; ?>"><img src="<?php echo $child2['child2_thumb']; ?>" alt="<?php echo $child2['name']; ?>"></a>
			  <div class="description" style="width:<?php echo $width; ?>px;"><?php echo $child2['child2_description']; ?></div></li>
			  <?php } ?>
			  <?php foreach ($child2['child3_id'] as $child3) { ?>
			  <?php if ($child3['news_category_id'] == $child3_id) { ?>
			  <li class="active"><a href="<?php echo $child3['href']; ?>" class="active"><?php echo $child3['name']; ?></a></li>
			  <?php } else { ?>
			  <li><a href="<?php echo $child3['href']; ?>"><?php echo $child3['name']; ?></a></li>
			  <?php } ?>
			  <?php } ?>
			  </ul>
			<?php } ?>
			</li>
			<?php } ?>
			</ul>
		  <?php } ?>
		  </li>
		  <?php } ?>
		  </ul>
		<?php } ?>
		</li>
	  <?php } ?>
	  <?php if ($all_news_side_menu == 'bottom') { ?>
		 <li><a href="<?php echo $all_news; ?>"><?php echo $text_all_news; ?></a></li>
	  <?php } ?>
    </ul>
	
  </div>
</div>
<?php } ?>
<script type="text/javascript">
$(document).ready(function(){
	$(".box-content #search").autocomplete("index.php?route=module/news_category/autocomplete", {
	    delay:10,
	    minChars:1
	});
});
</script> 
<script type="text/javascript"><!--
$('.box-content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('.button_search').trigger('click');
	}
});

$('.button_search').on('click', function() {
	url = 'index.php?route=news/search';
	
	var search = $('.box-content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	location = url;
});
//--></script> 