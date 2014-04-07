<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <div class="main-content">
  <h2><?php echo $text_my_account; ?></h2>
  <div class="content">
    <ul>
      <li><a class="edit" href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><a class="password" href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><a class="address" href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
      <li><a class="wishlist" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
    </ul>
  </div>
  <h2><?php echo $text_my_orders; ?></h2>
  <div class="content">
    <ul>
      <li><a class="order" href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <?php if ($reward) { ?>
      <li><a class="payment" href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
      <?php } ?>
      <li><a class="return" href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a class="transaction" href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
    </ul>
  </div>
  <h2><?php echo $text_my_newsletter; ?></h2>
  <div class="content">
    <ul>
      <li><a class="newsletter" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  </div>
  <div class="bottom"></div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?> 