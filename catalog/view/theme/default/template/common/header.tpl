<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $description; ?>" />
<?php } ?>
<meta name="mailru-domain" content="QkPCqbe0j6qCl64n" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/free_popup_cart.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/cloud-zoom.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/prettyPhoto/prettyPhoto.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/poshytip/src/tip-twitter/tip-twitter.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/free_popup_cart.js"></script>
<script type="text/javascript" src="catalog/view/javascript/scrolltopcontrol/scrolltopcontrol.js"></script>
<script type="text/javascript" src="catalog/view/javascript/cloud-zoom.1.0.2.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/prettyPhoto/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/poshytip/src/jquery.poshytip.min.js"></script>
<?php if ($quick_search) { ?>
<script type="text/javascript" src="catalog/view/javascript/quick_search.js"></script>
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="top-bg">
  <div id="container">
    <div id="header">
	  <div id="header-links">
      <div class="links">
	    <a href="http://rumus.by/informaciya-o-dostavke">Бесплатная доставка</a>
		<a href="http://rumus.by/oplata">Способы оплаты</a>
        <a href="http://rumus.by/buyer-protection">Защита покупателя</a>
	  </div>
	  <?php if ($informations) { ?>
	    <div id="information" class="dropdown"><a class="info-link"><span class="dropdown-link"><?php echo $text_information; ?></span></a>
		  <div class="dropdown-block">
			<?php foreach ($informations as $information) { ?>
			  <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
			<?php } ?>
		  </div>
		</div>
	  <?php } ?>
	  <?php if ($manufacturer_top_menu == 'top_menu') { ?>
		<div id="manufacturer" class="dropdown"><a class="info-link"><span class="dropdown-link"><?php echo $text_manufacturers; ?></span></a>
		  <div class="dropdown-block">
			<?php foreach ($manufacturers as $manufacturer) { ?>
			  <?php if ($manufacturer_image) { ?>
				<a class="manufacturer-image" href="<?php echo $manufacturer['href']; ?>"><img align="absmiddle" src="<?php echo $manufacturer['image']; ?>"><?php echo $manufacturer['name']; ?></a>
			  <?php } else { ?>
				<a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
			  <?php } ?>
			<?php } ?>
		  </div>
		</div>
	  <?php } ?>
      <?php if (($contacts_display == 'header') || ($contacts_display == 'header_footer')) { ?>
		<div id="contact" class="dropdown"><a class="info-link"><span class="dropdown-link"><?php echo $text_contact; ?></span></a>
          <div class="dropdown-block">
		    <?php if ($contacts_address) { ?>
			  <div class="contact"><?php echo $text_address; ?><span class="contact-data"><?php echo $contacts_address; ?></span></div>
			<?php } ?>
			<?php if ($contacts_email) { ?>
			  <div class="contact"><?php echo $text_email_address; ?><span class="contact-data"><?php echo $contacts_email; ?></span></div>
			<?php } ?>
			<?php if ($contacts_telephone) { ?>
			  <div class="contact"><?php echo $text_telephone; ?><span class="contact-data"><?php echo $contacts_telephone; ?></span></div>
			<?php } ?>
			<?php if ($contacts_mobile_telephone) { ?>
			  <div class="contact"><?php echo $text_mobile_telephone; ?><span class="contact-data"><?php echo $contacts_mobile_telephone; ?></span></div>
			<?php } ?>
			<?php if ($contacts_fax) { ?>
			  <div class="contact"><?php echo $text_fax; ?><span class="contact-data"> <a id="grupcontact" href="http://vk.com/odezhda_mira">odezhda_mira</a></span></div>
			<?php } ?>
		  </div>
		</div>
	  <?php } ?>
      </div>
      <?php if ($logo) { ?>
	    <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
	  <?php } ?>
	  <?php echo $cart; ?>
	  <div id="search">
		<div class="button-search"></div>
		<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
	  </div>
	  <div id="welcome">
		<?php if (!$logged) { ?>
		  <div class="dropdown-login"><span><?php echo $text_login; ?></span></div>
		  <div class="dropdown-box">
			<div class="header-login-box"><?php echo $text_welcome_user; ?></div>
			<div class="content-login-box">
			  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
				<input type="text" name="email" placeholder="<?php echo $text_email; ?>" value="<?php echo $email; ?>" />
				<input type="password" name="password"  placeholder="<?php echo $text_password; ?>" value="<?php echo $password; ?>" />
				<input type="submit" value="<?php echo $button_login; ?>" class="button" /><br /><br />
				<a class="forgotten" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
				<?php if ($redirect) { ?>
				  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
				<?php } ?>
			  </form>
			</div>
		  </div>
		  <div class="register"><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></div>
		<?php } else { ?>
		  <div class="dropdown">
		    <span class="dropdown-account"><?php echo $text_account; ?></span>
			<div class="dropdown-box">
			  <div class="content-account-box">
			    <ul>
				  <li><a class="welcome-user" href="<?php echo $account; ?>"><?php echo $text_logged_user; ?></a></li>
				  <li><a class="cart" href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
				  <li><a class="checkout" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
				  <li><a class="wishlist" href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
				  <li><a class="compare" href="<?php echo $compare; ?>" id="compare-total-header"><?php echo $text_compare; ?></a></li>
				  <li><a class="history" href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				  <li><a class="edit" href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
				 </ul>
			  </div>
			</div>
		  </div>
		  <div class="logout"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></div>
		<?php } ?>
	  </div>
    </div>
    <?php echo $supermenu; ?>
    <?php if ($categories) { ?>  
<?php if($we_menu_cache = $this->config->get('we_menu_cache')){ ?>
    <ul class="<?php echo $this->config->get('we_menu_class') ?>">
        <?php if(!empty($we_menu_cache)){ ?>
            <?php foreach($we_menu_cache as $item){
                $tpl = (strpos($_SERVER['REQUEST_URI'], $item['href']) !== false) && $_SERVER['REQUEST_URI'] != '/'  ? 'tpl_row_act' : 'tpl_row';
                echo str_replace('&', '&amp;', html_entity_decode($item[$tpl]));
                } ?>
        <?php } ?>
    </ul>
<?php } ?>
	<?php } ?>
	<div class="clear"></div>
	<div id="notification"></div>
	<div id="wrapper">