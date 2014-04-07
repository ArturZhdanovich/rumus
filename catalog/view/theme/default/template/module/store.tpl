<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-category">
      <div class="store"><?php echo $text_store; ?></div>
		<?php foreach ($stores as $store) { ?>
		  <?php if ($store['store_id'] == $store_id) { ?>
			<li><a href="<?php echo $store['url']; ?>"><b><?php echo $store['name']; ?></b></a>
		 <?php } else { ?>
			<li><a href="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></a>
		  <?php } ?>
		<?php } ?>
    </ul>
  </div>
</div>
