<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-module">
      <ul>
        <?php if (!$logged) { ?>
		  <li><a class="login" href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
		  <li><a class="register" href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
		  <li><a class="forgotten" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
        <?php } ?>
		<li><a class="account" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
		<?php if ($logged) { ?>
		  <li><a class="edit" href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
		  <li><a class="login" href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
		<?php } ?>
		<li><a class="payment" href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
		<li><a class="tracking" href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
		<li><a class="transaction" href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
		<?php if ($logged) { ?>
		  <li><a class="logout" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
		<?php } ?>
      </ul>
    </div>
  </div>
</div>
