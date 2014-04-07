<?php echo $header; ?>
<div id="content">
  <div class="login_warning">
	<?php if ($success) { ?>
      <div class="success"><?php echo $success; ?></div>
      <?php } ?>
      <?php if ($error_warning) { ?>
      <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
  </div>
  <div class="login">
    <div class="heading">
      <h1><?php echo $text_login; ?></h1>
    </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	    <div class="input_fields">
		  <input type="text" name="username" value="<?php echo $username; ?>" class="user_name" placeholder="<?php echo $entry_username; ?>" />
		  <input type="password" name="password" value="<?php echo $password; ?>" class="user_password" placeholder="<?php echo $entry_password; ?>" />
		</div>
		<div class="button_login">
		  <a onclick="$('#form').submit();"><?php echo $button_login; ?></a>
		</div>
		<div class="forgotten">
		  <?php if ($forgotten) { ?>
            <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
          <?php } ?>
		</div>
        <?php if ($redirect) { ?>
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        <?php } ?>
      </form>
  </div>
</div>
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#form').submit();
	}
});
//--></script> 
<?php echo $footer; ?>