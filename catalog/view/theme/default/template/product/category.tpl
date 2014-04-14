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
  <?php if ($thumb || $description) { ?>
  <div class="category-info">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($categories) { ?>
  <?php if ($view_subcategories == 'images') { ?>
    <div class="box-category">
	  <div class="box-heading-subcategory"><?php echo $text_refine; ?></div>
      <div class="box-subcategory">
	    <?php foreach ($categories as $category) { ?>
		  <div style="width: <?php echo $width; ?>px;">
		    <?php if ($category['thumb']) { ?>
			  <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" /></a></div>
		    <?php } else { ?>
			  <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['no_image']; ?>" alt="<?php echo $category['name']; ?>" /></a></div>
		    <?php } ?>
			<div class="description-box"><?php echo $category['description']; ?></div>
		    <div class="name"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
		  </div>
		<?php } ?>
	  </div>
    </div>
  <?php } ?>
  <?php if ($view_subcategories == 'default') { ?>
    <div class="category-list">
	  <div class="box-category">
	    <div class="box-heading-subcategory"><?php echo $text_refine; ?></div>
		<?php if (count($categories) <= 5) { ?>
		  <ul>
           <?php foreach ($categories as $category) { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
		  </ul>
	    <?php } else { ?>
		  <?php for ($i = 0; $i < count($categories);) { ?>
		    <ul>
			  <?php $j = $i + ceil(count($categories) / 4); ?>
			  <?php for (; $i < $j; $i++) { ?>
			    <?php if (isset($categories[$i])) { ?>
				  <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
			    <?php } ?>
			  <?php } ?>
		    </ul>
		  <?php } ?>
	    <?php } ?>
	  </div>
	</div>
  <?php } ?>
  <?php } ?>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"><?php echo $text_display; ?></div>
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <div class="product-list">
    <?php foreach ($products as $product) { ?>
    <div>
      <?php if ($product['thumb']) { ?>
           <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a><?php echo $product['sale']; ?><?php echo $product['new']; ?><?php echo $product['popular']; ?><?php echo $product['instock']; ?></div>
      <?php } else { ?>
	  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['no_image']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a><?php echo $product['sale']; ?><?php echo $product['new']; ?><?php echo $product['popular']; ?><?php echo $product['instock']; ?></div>
	  <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <div class="description-list"><?php echo $product['description_list']; ?></div>
	  <div class="description-grid"><?php echo $product['description_grid']; ?></div>
	  <?php if ($product['price']) { ?>
		<div class="price">
		  <?php if (!$product['special']) { ?>
		    <?php echo $product['price']; ?>
		  <?php } else { ?>
			<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
		  <?php } ?>
		  <?php if ($product['tax']) { ?>
			<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
		  <?php } ?>
		</div>
      <?php } ?>
	  <div class="cart-box">
        <div class="cart-button">
		  <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="poshytips button-wishlists" title="<?php echo $button_wishlist; ?>" /></a>
		  <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="poshytips button-carts" title="<?php echo $button_cart; ?>" /></a>
		  <?php if ($quick_view_categories) { ?>
		    <a href="index.php?route=module/quick_view/&product_id=<?php echo $product['product_id']; ?>" class="colorbox poshytips button-quick-view" title="<?php echo $button_quick_view; ?>" /></a>
	      <?php } ?>
		</div>
		<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
	  </div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  </div>
  <div class="bottom"></div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {	
			html  = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="cart-box">' + $(element).find('.cart-box').html() + '</div>';
			
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			html += '  <div class="description-list">' + $(element).find('.description-list').html() + '</div>';
			html += '  <div class="description-grid">' + $(element).find('.description-grid').html() + '</div>';
						
			$(element).html(html);
		});	
			
		$('.poshytips').poshytip({
			className: 'tip-twitter',
			showTimeout: 1,
			alignTo: 'target',
			alignX: 'center',
			offsetY: 5,
			allowTipHover: false
		});
		
		$('.colorbox').colorbox({
			overlayClose: true,
			opacity: 0.5,
			width:"1050px",
			height:"750px",
			fixed:true,
			rel: "colorbox"
		});
		
		$('.display').html('<?php echo $text_display; ?>&nbsp;<img align="absmiddle" src="catalog/view/theme/default/image/icon/list-icon-active.png">&nbsp;<a onclick="display(\'grid\');"><img align="absmiddle" src="catalog/view/theme/default/image/icon/grid-icon.png" title="<?php echo $text_grid; ?>"></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '  <div class="description-list">' + $(element).find('.description-list').html() + '</div>';
			html += '<div class="description-grid">' + $(element).find('.description-grid').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			

			html += '<div class="cart-box">' + $(element).find('.cart-box').html() + '</div>';
			
			$(element).html(html);
		});	
		
		$('.poshytips').poshytip({
			className: 'tip-twitter',
			showTimeout: 1,
			alignTo: 'target',
			alignX: 'center',
			offsetY: 5,
			allowTipHover: false
		});
		
		$('.colorbox').colorbox({
			overlayClose: true,
			opacity: 0.5,
			width:"1050px",
			height:"750px",
			fixed:true,
			rel: "colorbox"
		});
					
		$('.display').html('<?php echo $text_display; ?>&nbsp;<a onclick="display(\'list\');"><img align="absmiddle" src="catalog/view/theme/default/image/icon/list-icon.png" title="<?php echo $text_list; ?>"></a>&nbsp;<img align="absmiddle" src="catalog/view/theme/default/image/icon/grid-icon-active.png">');

		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 
<?php echo $footer; ?>