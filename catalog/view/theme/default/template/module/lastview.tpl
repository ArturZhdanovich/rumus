<?php 
if (isset($products) && count($products)) { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
        <?php 
        $j=0;
      	for ($i=count($products); $i>=0; $i--) {
      		if (isset($products[$i]['image'])) {
                ?> 
                <div>
                <?php if ($products[$i]['image']) { ?>
                <div class="image"><a href="<?php echo $products[$i]['href']; ?>"><img src="<?php echo $products[$i]['image']; ?>" alt="<?php echo $products[$i]['name']; ?>" /></a></div>
                <?php } ?>
                <div class="name"><a href="<?php echo $products[$i]['href']; ?>"><?php echo $products[$i]['name']; ?></a></div>
                <?php if ($products[$i]['price']) { ?>
                <div class="price">
                  <?php if (!$products[$i]['special']) { ?>
                  <?php echo $products[$i]['price']; ?>
                  <?php } else { ?>
                  <span class="price-old"><?php echo $products[$i]['price']; ?></span> <span class="price-new"><?php echo $products[$i]['special']; ?></span>
                  <?php } ?>
                </div>
                <?php } ?>
                <div class="cart"><a onclick="addToCart('<?php echo $products[$i]['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
              </div>
          <?php } ?>
          <?php 
            if ($j == $limit) {
              	break;
            }
            $j++;          
          ?>
      <?php } ?>
    </div>
  </div>
</div>
<?php } ?>
