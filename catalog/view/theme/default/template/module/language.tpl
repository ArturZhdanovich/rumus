<?php if (count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language-form">
  <div id="language" class="dropdown">
	<?php foreach ($languages as $language) { ?>
	  <?php if ($language['code'] == $language_code) { ?>
      <a class="info-link"><img align="absmiddle" src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" />&nbsp;&nbsp;<span class="dropdown-link"><?php echo $text_language; ?></span></a>
      <?php } ?>
	<?php } ?>
	<div class="dropdown-block">
      <?php foreach ($languages as $language) { ?>
        <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language-form').submit();"><img align="absmiddle" src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
      <?php } ?>
      <input type="hidden" name="language_code" value="" />
      <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</div>
  </div>
</form>
<?php } ?>
