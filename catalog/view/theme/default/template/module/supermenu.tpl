<?php if ($mitems) { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/supermenu/supermenu.css" />
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/supermenu/supermenuie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/supermenu/supermenuie6.css" />
<![endif]-->
<?php if ($supermenu_settings_status) { ?>
<style type="text/css">
<?php if ($supermenu_settings['bg']) { ?>
   #supermenu {
   background-color: <?php echo $supermenu_settings['bg']; ?>;
   }
   #supermenu ul li a.tll {
	text-shadow: 0 0 1px <?php echo $supermenu_settings['bg']; ?>;
	}
<?php } ?>
<?php if ($supermenu_settings['tlc']) { ?>
   #supermenu ul li a.tll {
   color: <?php echo $supermenu_settings['tlc']; ?>;
   }
<?php } ?>
<?php if ($supermenu_settings['dbg']) { ?>
   #supermenu ul li.tlli:hover a.tll {
   background: <?php echo $supermenu_settings['dbg']; ?>;
   }
   #supermenu ul li div.bigdiv {
    background: <?php echo $supermenu_settings['dbg']; ?>;
   }
<?php } ?>
<?php if ($supermenu_settings['slc']) { ?>
   #supermenu  ul  li  div  .withchild a.theparent, #supermenu  ul  li  div .withimage .name a {
   color: <?php echo $supermenu_settings['slc']; ?>;
   }
<?php } ?>
<?php if ($supermenu_settings['slbg']) { ?>
   #supermenu  ul  li  div  .withchild a.theparent {
   background: <?php echo $supermenu_settings['slbg']; ?>;
   border-bottom: none;
   }
   #supermenu  ul  li  div .withimage .image img {
    border: 4px solid <?php echo $supermenu_settings['slbg']; ?>;
   }
<?php } ?