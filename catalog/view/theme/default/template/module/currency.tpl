<?php if (count($currencies) > 1) { ?>
<div id="currency" class="dropdown">
  <a class="info-link"><span class="dropdown-link"><?php echo $text_currency; ?>: <?php echo $currency_code; ?></span></a>
  <div class="dropdown-block">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency-form">
	  <?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['code'] == $currency_code) { ?>
		  <?php if ($currency['symbol_left']) { ?>
			<a title="<?php echo $currency['title']; ?>"><b><?php echo $currency['symbol_left']; ?> - <?php echo $currency['title']; ?></b></a>
		  <?php } else { ?>
			<a title="<?php echo $currency['title']; ?>"><b><?php echo $currency['symbol_right']; ?> - <?php echo $currency['title']; ?></b></a>
		  <?php } ?>
		<?php } else { ?>
		  <?php if ($currency['symbol_left']) { ?>
			<a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency-form').submit();"><?php echo $currency['symbol_left']; ?> - <?php echo $currency['title']; ?></a>
		  <?php } else { ?>
			<a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency-form').submit();"><?php echo $currency['symbol_right']; ?> - <?php echo $currency['title']; ?></a>
		  <?php } ?>
		<?php } ?>
	  <?php } ?>
	  <input type="hidden" name="currency_code" value="" />
	  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</form>
  </div>
</div>
<?php } ?>
