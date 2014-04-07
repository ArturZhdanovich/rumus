<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><?php if ($config_quick_registration_checkout) { ?>
              <input type="radio" name="config_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_yes; ?>
              <input type="radio" name="config_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_quick_registration_checkout" value="1" />
              <?php echo $text_yes; ?>
              <input type="radio" name="config_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_customer_groups; ?></td>
            <td><?php if ($config_customer_groups_quick_registration_checkout) { ?>
              <input type="radio" name="config_customer_groups_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_customer_groups_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_customer_groups_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_customer_groups_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_first_name; ?></td>
            <td><?php if ($config_first_quick_registration_checkout) { ?>
              <input type="radio" name="config_first_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_first_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_first_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_first_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_last_name; ?></td>
            <td><?php if ($config_last_quick_registration_checkout) { ?>
              <input type="radio" name="config_last_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_last_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_last_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_last_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_telephone; ?></td>
            <td><?php if ($config_telephone_quick_registration_checkout) { ?>
              <input type="radio" name="config_telephone_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_telephone_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_telephone_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_telephone_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_fax; ?></td>
            <td><?php if ($config_fax_quick_registration_checkout) { ?>
              <input type="radio" name="config_fax_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_fax_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_fax_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_fax_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_company; ?></td>
            <td><?php if ($config_company_quick_registration_checkout) { ?>
              <input type="radio" name="config_company_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_company_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_company_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_company_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_address_1; ?></td>
            <td><?php if ($config_address_1_quick_registration_checkout) { ?>
              <input type="radio" name="config_address_1_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_address_1_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_address_1_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_address_1_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_address_2; ?></td>
            <td><?php if ($config_address_2_quick_registration_checkout) { ?>
              <input type="radio" name="config_address_2_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_address_2_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_address_2_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_address_2_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_city; ?></td>
            <td><?php if ($config_city_quick_registration_checkout) { ?>
              <input type="radio" name="config_city_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_city_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_city_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_city_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_post_code; ?></td>
            <td><?php if ($config_post_code_quick_registration_checkout) { ?>
              <input type="radio" name="config_post_code_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_post_code_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_post_code_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_post_code_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_country; ?></td>
            <td><?php if ($config_country_quick_registration_checkout) { ?>
              <input type="radio" name="config_country_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_country_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_country_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_country_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
		  <tr>
            <td><?php echo $entry_subscribe; ?></td>
            <td><?php if ($config_subscribe_quick_registration_checkout) { ?>
              <input type="radio" name="config_subscribe_quick_registration_checkout" value="1" checked="checked" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_subscribe_quick_registration_checkout" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="config_subscribe_quick_registration_checkout" value="1" />
              <?php echo $text_required; ?>
              <input type="radio" name="config_subscribe_quick_registration_checkout" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>