<div id="footer">
  <?php if ($informations) { ?>
  <div class="column" style="<?php echo $width_info; ?>">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a class="info" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column" style="<?php echo $width; ?>">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a class="contacts" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a class="return" href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a class="sitemap" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column" style="<?php echo $width; ?>">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a class="manufacturer" href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
	  <li><a class="special" href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
      <li><a class="voucher" href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a class="affiliate" href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
    </ul>
  </div>
  <div class="column" style="<?php echo $width; ?>">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a class="account" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a class="order" href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a class="wishlist" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a class="newsletter" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  <?php if ($contact_display) { ?>
  <div class="column" style="<?php echo $width_address; ?>">
    <h3><?php echo $text_address; ?></h3>
	<div class="address-box">
	  <?php if ($contact_address) { ?>
	    <div class="address"><?php echo $contact_address; ?></div>
	  <?php } ?>
	  <?php if ($contact_email) { ?>
	    <div class="email-address"><?php echo $contact_email; ?></div>
	  <?php } ?>
	  <?php if ($contact_telephone) { ?>
	    <div class="phone"><?php echo $contact_telephone; ?></div>
	  <?php } ?>
	  <?php if ($contact_mobile_telephone) { ?>
	    <div class="mobile"><?php echo $contact_mobile_telephone; ?></div>
	  <?php } ?>
	  <?php if ($contact_fax) { ?>
	    <div class="fax"><?php echo $contact_fax; ?></div>
	  <?php } ?>
	</div>
  </div>
  <?php } ?>
</div>
<div id="footer-bottom">
  <div class="<?php echo $powered_copyright; ?>"><?php echo $powered; ?></div>
</div>
</div>
</div>
</div>
<script type="text/javascript"><!--
$('.dropdown-login').click(function(){
$(this).next('.dropdown-box').slideToggle(300);
$(this).toggleClass('active');                                  
if ($(this).hasClass('active')) $(this).find('span').html('<?php echo $text_cancel; ?>')
else $(this).find('span').html('<?php echo $text_login; ?>')
});
//--></script>
</body></html>