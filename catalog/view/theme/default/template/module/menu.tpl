<?php if ($news_categories) { ?>
  <?php foreach ($news_categories as $news_category) { ?>
	<li class="dropdown"><a href="<?php echo $news_category['href']; ?>"><?php echo $news_category['name']; ?></a>
	<?php if ($news_category['children']) { ?>
	  <div class="dropdown-block table-none">
		<?php for ($i = 0; $i < count($news_category['children']);) { ?>
		  <ul>
			<?php if ($all_news_top_menu == 'child_top') { ?>
			  <li><a href="<?php echo $all_news; ?>"><?php echo $text_all_news; ?></a></li>
			<?php } ?>
			<?php $j = $i + ceil(count($news_category['children']) / $news_category['column']); ?>
			<?php for (; $i < $j; $i++) { ?>
			  <?php if (isset($news_category['children'][$i])) { ?>
			    <li><a href="<?php echo $news_category['children'][$i]['href']; ?>"><?php echo $news_category['children'][$i]['name']; ?></a></li>
			  <?php } ?>
			<?php } ?>
			<?php if ($all_news_top_menu == 'child_bottom') { ?>
			  <li><a href="<?php echo $all_news; ?>"><?php echo $text_all_news; ?></a></li>
			<?php } ?>
		  </ul>
		<?php } ?>
	  </div>
	  <?php } else { ?>
	    <?php if (($all_news_top_menu == 'child_top') || ($all_news_top_menu == 'child_bottom')) { ?>
		  <div>
			<ul>
			  <li><a href="<?php echo $all_news; ?>"><?php echo $text_all_news; ?></a></li>
			</ul>
		  </div>
		<?php } ?>
	  <?php } ?>
	</li>
  <?php } ?>
<?php } ?>
<?php if ($manufacturer_top_menu == 'top_menu_categories') { ?>
  <li class="dropdown"><a><?php echo $text_manufacturers; ?></a>
	<div class="dropdown-block">
	  <ul>
		<?php foreach ($manufacturers as $manufacturer) { ?>
		  <?php if ($manufacturer_image) { ?>
		    <li class="manufacturer-image"><a href="<?php echo $manufacturer['href']; ?>"><img align="absmiddle" src="<?php echo $manufacturer['image']; ?>"><?php echo $manufacturer['name']; ?></a></li>
		  <?php } else { ?>
		    <li><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></li>
		  <?php } ?>
		<?php } ?>
	  </ul>
	</div>
  </li>
<?php } ?>