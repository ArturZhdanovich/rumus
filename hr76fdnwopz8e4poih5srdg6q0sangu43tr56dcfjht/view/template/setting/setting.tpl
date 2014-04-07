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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/setting.png" alt="" /> <?php echo $heading_title; ?><span class="storename"></span></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="contentes">
      <div id="vtabs" class="vtabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-store"><?php echo $tab_store; ?></a><a href="#tab-local"><?php echo $tab_local; ?></a><a href="#tab-option"><?php echo $tab_option; ?></a><a href="#tab-product"><?php echo $text_product; ?></a><a href="#tab-category"><?php echo $text_category; ?></a><a href="#tab-manufacturer"><?php echo $text_manufacturer; ?></a><a href="#tab-news"><?php echo $text_news; ?></a><a href="#tab-image"><?php echo $tab_image; ?></a><a href="#tab-ftp"><?php echo $tab_ftp; ?></a><a href="#tab-mail"><?php echo $tab_mail; ?></a><a href="#tab-fraud"><?php echo $tab_fraud; ?></a><a href="#tab-server"><?php echo $tab_server; ?></a><a href="#tab-other"><?php echo $tab_other; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general" class="vtabs-content">
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_name; ?></td>
              <td><input type="text" name="config_name" value="<?php echo $config_name; ?>" size="40" />
                <?php if ($error_name) { ?>
                <span class="error"><?php echo $error_name; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_owner; ?></td>
              <td><input type="text" name="config_owner" value="<?php echo $config_owner; ?>" size="40" />
                <?php if ($error_owner) { ?>
                <span class="error"><?php echo $error_owner; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_address; ?></td>
              <td><textarea name="config_address" cols="40" rows="5"><?php echo $config_address; ?></textarea></td>
            </tr>
            <tr>
              <td><?php echo $entry_email; ?></td>
              <td><input type="text" name="config_email" value="<?php echo $config_email; ?>" size="40" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_telephone; ?></td>
              <td><input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_mobile_telephone; ?></td>
              <td><input type="text" name="config_mobile_telephone" value="<?php echo $config_mobile_telephone; ?>" /></td>
            </tr>
			<tr>
              <td><?php echo $entry_fax; ?></td>
              <td><input type="text" name="config_fax" value="<?php echo $config_fax; ?>" /></td>
            </tr>
			<tr>
              <td><?php echo $entry_contacts_display; ?></td>
			  <td><select name="config_contacts_display">
                <?php if ($config_contacts_display == 'none') { ?>
                <option value="none" selected="selected"><?php echo $text_no_display; ?></option>
                <?php } else { ?>
                <option value="none"><?php echo $text_no_display; ?></option>
                <?php } ?>
				<?php if ($config_contacts_display == 'header') { ?>
                <option value="header" selected="selected"><?php echo $text_header; ?></option>
                <?php } else { ?>
                <option value="header"><?php echo $text_header; ?></option>
				<?php } ?>
				<?php if ($config_contacts_display == 'footer') { ?>
                <option value="footer" selected="selected"><?php echo $text_footer; ?></option>
                <?php } else { ?>
                <option value="footer"><?php echo $text_footer; ?></option>
				<?php } ?>
				<?php if ($config_contacts_display == 'header_footer') { ?>
                <option value="header_footer" selected="selected"><?php echo $text_header_footer; ?></option>
                <?php } else { ?>
                <option value="header_footer"><?php echo $text_header_footer; ?></option>
				<?php } ?>
              </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-store" class="vtabs-content">
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_title; ?></td>
              <td><input type="text" name="config_title" value="<?php echo $config_title; ?>" />
                <?php if ($error_title) { ?>
                <span class="error"><?php echo $error_title; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_meta_description; ?></td>
              <td><textarea name="config_meta_description" cols="40" rows="5"><?php echo $config_meta_description; ?></textarea></td>
            </tr>
            <tr>
              <td><?php echo $entry_template; ?></td>
              <td><select name="config_template" onchange="$('#template').load('index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value));">
                  <?php foreach ($templates as $template) { ?>
                  <?php if ($template == $config_template) { ?>
                  <option value="<?php echo $template; ?>" selected="selected"><?php echo $template; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $template; ?>"><?php echo $template; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td></td>
              <td id="template"></td>
            </tr>
            <tr>
              <td><?php echo $entry_layout; ?></td>
              <td><select name="config_layout_id">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $config_layout_id) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-local" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_country; ?></td>
              <td><select name="config_country_id">
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $config_country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_zone; ?></td>
              <td><select name="config_zone_id">
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_language; ?></td>
              <td><select name="config_language">
                  <?php foreach ($languages as $language) { ?>
                  <?php if ($language['code'] == $config_language) { ?>
                  <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_admin_language; ?></td>
              <td><select name="config_admin_language">
                  <?php foreach ($languages as $language) { ?>
                  <?php if ($language['code'] == $config_admin_language) { ?>
                  <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_currency; ?></td>
              <td><select name="config_currency">
                  <?php foreach ($currencies as $currency) { ?>
                  <?php if ($currency['code'] == $config_currency) { ?>
                  <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_currency_auto; ?></td>
              <td><?php if ($config_currency_auto) { ?>
                <input type="radio" name="config_currency_auto" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_currency_auto" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_currency_auto" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_currency_auto" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_length_class; ?></td>
              <td><select name="config_length_class_id">
                  <?php foreach ($length_classes as $length_class) { ?>
                  <?php if ($length_class['length_class_id'] == $config_length_class_id) { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_weight_class; ?></td>
              <td><select name="config_weight_class_id">
                  <?php foreach ($weight_classes as $weight_class) { ?>
                  <?php if ($weight_class['weight_class_id'] == $config_weight_class_id) { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-option" class="vtabs-content">
          <h2><?php echo $text_items; ?></h2>
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_catalog_limit; ?></td>
              <td><input type="text" name="config_catalog_limit" value="<?php echo $config_catalog_limit; ?>" size="3" />
                <?php if ($error_catalog_limit) { ?>
                <span class="error"><?php echo $error_catalog_limit; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_list_description_limit; ?></td>
              <td><input type="text" name="config_list_description_limit" value="<?php echo $config_list_description_limit; ?>" size="3" />
                <?php if ($error_list_description_limit) { ?>
                <span class="error"><?php echo $error_list_description_limit; ?></span>
                <?php } ?></td>
            </tr>
			<tr>
              <td><span class="required">*</span> <?php echo $entry_grid_description_limit; ?></td>
              <td><input type="text" name="config_grid_description_limit" value="<?php echo $config_grid_description_limit; ?>" size="3" />
                <?php if ($error_grid_description_limit) { ?>
                <span class="error"><?php echo $error_grid_description_limit; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_admin_limit; ?></td>
              <td><input type="text" name="config_admin_limit" value="<?php echo $config_admin_limit; ?>" size="3" />
                <?php if ($error_admin_limit) { ?>
                <span class="error"><?php echo $error_admin_limit; ?></span>
                <?php } ?></td>
            </tr>
          </table>
          <h2><?php echo $text_voucher; ?></h2>
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_voucher_min; ?></td>
              <td><input type="text" name="config_voucher_min" value="<?php echo $config_voucher_min; ?>" />
                <?php if ($error_voucher_min) { ?>
                <span class="error"><?php echo $error_voucher_min; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_voucher_max; ?></td>
              <td><input type="text" name="config_voucher_max" value="<?php echo $config_voucher_max; ?>" />
                <?php if ($error_voucher_max) { ?>
                <span class="error"><?php echo $error_voucher_max; ?></span>
                <?php } ?></td>
            </tr>
          </table>
          <h2><?php echo $text_tax; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_tax; ?></td>
              <td><?php if ($config_tax) { ?>
                <input type="radio" name="config_tax" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_tax" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_tax" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_tax" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_vat; ?></td>
              <td><?php if ($config_vat) { ?>
                <input type="radio" name="config_vat" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_vat" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_vat" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_vat" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_tax_default; ?></td>
              <td><select name="config_tax_default">
                  <option value=""><?php echo $text_none; ?></option>
                  <?php  if ($config_tax_default == 'shipping') { ?>
                  <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
                  <?php } else { ?>
                  <option value="shipping"><?php echo $text_shipping; ?></option>
                  <?php } ?>
                  <?php  if ($config_tax_default == 'payment') { ?>
                  <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
                  <?php } else { ?>
                  <option value="payment"><?php echo $text_payment; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_tax_customer; ?></td>
              <td><select name="config_tax_customer">
                  <option value=""><?php echo $text_none; ?></option>
                  <?php  if ($config_tax_customer == 'shipping') { ?>
                  <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
                  <?php } else { ?>
                  <option value="shipping"><?php echo $text_shipping; ?></option>
                  <?php } ?>
                  <?php  if ($config_tax_customer == 'payment') { ?>
                  <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
                  <?php } else { ?>
                  <option value="payment"><?php echo $text_payment; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <h2><?php echo $text_account; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_customer_online; ?></td>
              <td><?php if ($config_customer_online) { ?>
                <input type="radio" name="config_customer_online" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_customer_online" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_customer_online" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_customer_online" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer_group; ?></td>
              <td><select name="config_customer_group_id">
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer_group_display; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($customer_group['customer_group_id'], $config_customer_group_display)) { ?>
                    <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                    <?php echo $customer_group['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                    <?php echo $customer_group['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <?php if ($error_customer_group_display) { ?>
                <span class="error"><?php echo $error_customer_group_display; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer_price; ?></td>
              <td><?php if ($config_customer_price) { ?>
                <input type="radio" name="config_customer_price" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_customer_price" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_customer_price" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_customer_price" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_account; ?></td>
              <td><select name="config_account_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($informations as $information) { ?>
                  <?php if ($information['information_id'] == $config_account_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <h2><?php echo $text_checkout; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_cart_weight; ?></td>
              <td><?php if ($config_cart_weight) { ?>
                <input type="radio" name="config_cart_weight" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_cart_weight" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_cart_weight" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_cart_weight" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_guest_checkout; ?></td>
              <td><?php if ($config_guest_checkout) { ?>
                <input type="radio" name="config_guest_checkout" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_guest_checkout" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_guest_checkout" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_guest_checkout" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_checkout; ?></td>
              <td><select name="config_checkout_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($informations as $information) { ?>
                  <?php if ($information['information_id'] == $config_checkout_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_order_edit; ?></td>
              <td><input type="text" name="config_order_edit" value="<?php echo $config_order_edit; ?>" size="3" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_invoice_prefix; ?></td>
              <td><input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_order_status; ?></td>
              <td><select name="config_order_status_id">
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_complete_status; ?></td>
              <td><select name="config_complete_status_id">
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $config_complete_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <h2><?php echo $text_stock; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_stock_display; ?></td>
              <td><?php if ($config_stock_display) { ?>
                <input type="radio" name="config_stock_display" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_display" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_stock_display" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_display" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_stock_warning; ?></td>
              <td><?php if ($config_stock_warning) { ?>
                <input type="radio" name="config_stock_warning" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_warning" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_stock_warning" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_warning" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_stock_checkout; ?></td>
              <td><?php if ($config_stock_checkout) { ?>
                <input type="radio" name="config_stock_checkout" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_checkout" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_stock_checkout" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_checkout" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_stock_status; ?></td>
              <td><select name="config_stock_status_id">
                  <?php foreach ($stock_statuses as $stock_status) { ?>
                  <?php if ($stock_status['stock_status_id'] == $config_stock_status_id) { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <h2><?php echo $text_affiliate; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_affiliate; ?></td>
              <td><select name="config_affiliate_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($informations as $information) { ?>
                  <?php if ($information['information_id'] == $config_affiliate_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_commission; ?></td>
              <td><input type="text" name="config_commission" value="<?php echo $config_commission; ?>" size="3" /></td>
            </tr>
          </table>
          <h2><?php echo $text_return; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_return; ?></td>
              <td><select name="config_return_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($informations as $information) { ?>
                  <?php if ($information['information_id'] == $config_return_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_return_status; ?></td>
              <td><select name="config_return_status_id">
                  <?php foreach ($return_statuses as $return_status) { ?>
                  <?php if ($return_status['return_status_id'] == $config_return_status_id) { ?>
                  <option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
		<div id="tab-product" class="vtabs-content">
			<table class="form">
			  <tr>
				<td><?php echo $entry_product_quick_edit; ?></td>
				<td><?php if ($config_product_quick_edit) { ?>
				  <input type="radio" name="config_product_quick_edit" value="1" checked="checked" />
				  <?php echo $text_yes; ?>
				  <input type="radio" name="config_product_quick_edit" value="0" />
				  <?php echo $text_no; ?>
				  <?php } else { ?>
				  <input type="radio" name="config_product_quick_edit" value="1" />
				  <?php echo $text_yes; ?>
				  <input type="radio" name="config_product_quick_edit" value="0" checked="checked" />
				  <?php echo $text_no; ?>
				  <?php } ?></td>
			  </tr>
		      <tr>
                <td><?php echo $entry_review; ?></td>
                <td><?php if ($config_review_status) { ?>
                  <input type="radio" name="config_review_status" value="1" checked="checked" />
                  <?php echo $text_yes; ?>
                  <input type="radio" name="config_review_status" value="0" />
                  <?php echo $text_no; ?>
                  <?php } else { ?>
                  <input type="radio" name="config_review_status" value="1" />
                  <?php echo $text_yes; ?>
                  <input type="radio" name="config_review_status" value="0" checked="checked" />
                  <?php echo $text_no; ?>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $entry_guest_review; ?></td>
                <td><?php if ($config_guest_review) { ?>
                  <input type="radio" name="config_guest_review" value="1" checked="checked" />
                  <?php echo $text_yes; ?>
                  <input type="radio" name="config_guest_review" value="0" />
                  <?php echo $text_no; ?>
                  <?php } else { ?>
                  <input type="radio" name="config_guest_review" value="1" />
                  <?php echo $text_yes; ?>
                  <input type="radio" name="config_guest_review" value="0" checked="checked" />
                  <?php echo $text_no; ?>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $entry_download; ?></td>
                <td><?php if ($config_download) { ?>
                  <input type="radio" name="config_download" value="1" checked="checked" />
                  <?php echo $text_yes; ?>
                  <input type="radio" name="config_download" value="0" />
                  <?php echo $text_no; ?>
                  <?php } else { ?>
                  <input type="radio" name="config_download" value="1" />
                  <?php echo $text_yes; ?>
                  <input type="radio" name="config_download" value="0" checked="checked" />
                  <?php echo $text_no; ?>
                  <?php } ?></td>
              </tr>
			  <tr>
                <td><?php echo $entry_zoom; ?></td>
                <td><?php if ($config_zoom_images_product) { ?>
                  <input type="radio" name="config_zoom_images_product" value="1" checked="checked" />
                  <?php echo $text_yes; ?>
                  <input type="radio" name="config_zoom_images_product" value="0" />
                  <?php echo $text_no; ?>
                  <?php } else { ?>
                  <input type="radio" name="config_zoom_images_product" value="1" />
                  <?php echo $text_yes; ?>
                  <input type="radio" name="config_zoom_images_product" value="0" checked="checked" />
                  <?php echo $text_no; ?>
                  <?php } ?></td>
              </tr>
			  <tr>
				<td><?php echo $entry_display_weight; ?></td>
				<td><?php if ($config_display_weight) { ?>
				  <input type="radio" name="config_display_weight" value="1" checked="checked" />
				  <?php echo $text_yes; ?>
				  <input type="radio" name="config_display_weight" value="0" />
				  <?php echo $text_no; ?>
				  <?php } else { ?>
				  <input type="radio" name="config_display_weight" value="1" />
				  <?php echo $text_yes; ?>
				  <input type="radio" name="config_display_weight" value="0" checked="checked" />
				  <?php echo $text_no; ?>
				  <?php } ?></td>
			  </tr>
			</table>
			<table class="form">
			  <tr>
				<td colspan="3"><?php echo $text_product_info; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_all_buttons; ?></td>
				<td>
				  <?php if ($config_quick_all_buttons) { ?>
					<input type="checkbox" name="config_quick_all_buttons" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_all_buttons" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_all_buttons; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_general_data; ?></td>
				<td>
				  <?php if ($config_general_data) { ?>
					<input type="checkbox" name="config_general_data" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_general_data" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_general_data; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_categories; ?></td>
				<td>
				  <?php if ($config_manufacturer_categories) { ?>
					<input type="checkbox" name="config_manufacturer_categories" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_manufacturer_categories" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_categories; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_filter; ?></td>
				<td>
				  <?php if ($config_quick_filter) { ?>
					<input type="checkbox" name="config_quick_filter" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_filter" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_filter; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_related; ?></td>
				<td>
				  <?php if ($config_quick_related) { ?>
					<input type="checkbox" name="config_quick_related" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_related" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_related; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_code; ?></td>
				<td>
				  <?php if ($config_quick_code) { ?>
					<input type="checkbox" name="config_quick_code" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_code" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_code; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_tax_class; ?></td>
				<td>
				  <?php if ($config_quick_tax_class) { ?>
					<input type="checkbox" name="config_quick_tax_class" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_tax_class" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_tax_class; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_minimum; ?></td>
				<td>
				  <?php if ($config_quick_minimum) { ?>
					<input type="checkbox" name="config_quick_minimum" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_minimum" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_minimum; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_subtract; ?></td>
				<td>
				  <?php if ($config_quick_subtract) { ?>
					<input type="checkbox" name="config_quick_subtract" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_subtract" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_subtract; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_dimension; ?></td>
				<td>
				  <?php if ($config_quick_dimension) { ?>
					<input type="checkbox" name="config_quick_dimension" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_dimension" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_dimension; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_weight; ?></td>
				<td>
				  <?php if ($config_quick_weight) { ?>
					<input type="checkbox" name="config_quick_weight" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_weight" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_weight; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_date_sort; ?></td>
				<td>
				  <?php if ($config_quick_date_sort) { ?>
					<input type="checkbox" name="config_quick_date_sort" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_date_sort" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_date_sort; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_attribute; ?></td>
				<td>
				  <?php if ($config_quick_attribute) { ?>
					<input type="checkbox" name="config_quick_attribute" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_attribute" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_attribute; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_options; ?></td>
				<td>
				  <?php if ($config_quick_options) { ?>
					<input type="checkbox" name="config_quick_options" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_options" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_options; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_special; ?></td>
				<td>
				  <?php if ($config_quick_special) { ?>
					<input type="checkbox" name="config_quick_special" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_special" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_special; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_discount; ?></td>
				<td>
				  <?php if ($config_quick_discount) { ?>
					<input type="checkbox" name="config_quick_discount" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_discount" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_discount; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_images; ?></td>
				<td>
				  <?php if ($config_quick_images) { ?>
					<input type="checkbox" name="config_quick_images" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_images" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_images; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_stores; ?></td>
				<td>
				  <?php if ($config_quick_stores) { ?>
					<input type="checkbox" name="config_quick_stores" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_stores" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_stores; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_downloads; ?></td>
				<td>
				  <?php if ($config_quick_downloads) { ?>
					<input type="checkbox" name="config_quick_downloads" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_downloads" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_downloads; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_reward_points; ?></td>
				<td>
				  <?php if ($config_quick_reward_points) { ?>
					<input type="checkbox" name="config_quick_reward_points" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_reward_points" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_reward_points; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_design; ?></td>
				<td>
				  <?php if ($config_quick_design) { ?>
					<input type="checkbox" name="config_quick_design" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_quick_design" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_product_design; ?></td>
			  </tr>
			</table> 
		</div>
		<div id="tab-category" class="vtabs-content">
			<table class="form">
			  <tr>
				<td><?php echo $entry_category_quick_edit; ?></td>
				<td>
				  <?php if ($config_category_quick_edit) { ?>
					<input type="radio" name="config_category_quick_edit" value="1" checked="checked" />
				  <?php echo $text_yes; ?>
					<input type="radio" name="config_category_quick_edit" value="0" />
					<?php echo $text_no; ?>
				  <?php } else { ?>
					<input type="radio" name="config_category_quick_edit" value="1" />
					<?php echo $text_yes; ?>
					<input type="radio" name="config_category_quick_edit" value="0" checked="checked" />
					<?php echo $text_no; ?>
				  <?php } ?>
				</td>
			  </tr>
			  <tr>
				<td><?php echo $entry_product_count; ?></td>
				<td>
				  <?php if ($config_product_count) { ?>
				    <input type="radio" name="config_product_count" value="1" checked="checked" />
				  <?php echo $text_yes; ?>
					<input type="radio" name="config_product_count" value="0" />
					<?php echo $text_no; ?>
				  <?php } else { ?>
					<input type="radio" name="config_product_count" value="1" />
					<?php echo $text_yes; ?>
					<input type="radio" name="config_product_count" value="0" checked="checked" />
					<?php echo $text_no; ?>
				  <?php } ?>
				</td>
			  </tr>
			  <tr>
                <td><?php echo $entry_subcategories; ?></td>
			    <td><select name="config_view_subcategory">
				  <?php if ($config_view_subcategory == 'default') { ?>
                  <option value="default" selected="selected"><?php echo $text_subcategory_default; ?></option>
                  <?php } else { ?>
                  <option value="default"><?php echo $text_subcategory_default; ?></option>
				  <?php } ?>
				  <?php if ($config_view_subcategory == 'images') { ?>
                  <option value="images" selected="selected"><?php echo $text_subcategory_images; ?></option>
                  <?php } else { ?>
                  <option value="images"><?php echo $text_subcategory_images; ?></option>
				  <?php } ?>
                </select></td>
              </tr>
			  <tr>
			    <td><?php echo $entry_symbol_subcategory; ?></td>
                <td><input type="text" name="config_sub_category_description_limit" value="<?php echo $config_sub_category_description_limit; ?>" size="3" />
			  </tr>
			</table>
			<table class="form">
			  <tr>
				<td colspan="3"><?php echo $text_category_info; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_all_buttons; ?></td>
				<td>
				  <?php if ($config_category_quick_all_buttons) { ?>
					<input type="checkbox" name="config_category_quick_all_buttons" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_category_quick_all_buttons" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_category_all_buttons; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_general_data; ?></td>
			 	<td>
				  <?php if ($config_category_general_data) { ?>
					<input type="checkbox" name="config_category_general_data" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_category_general_data" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_category_general_data; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_category_parent; ?></td>
				<td>
				  <?php if ($config_category_parent) { ?>
					<input type="checkbox" name="config_category_parent" value="1" checked="checked" />
				  <?php } else { ?>
				 	<input type="checkbox" name="config_category_parent" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_category_parent; ?></td>
			  </tr>
			  <tr>
			    <td><?php echo $entry_category_filter; ?></td>
				<td>
				  <?php if ($config_category_filter) { ?>
					<input type="checkbox" name="config_category_filter" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_category_filter" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_category_filter; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_category_image; ?></td>
				<td>
				  <?php if ($config_category_image) { ?>
					<input type="checkbox" name="config_category_image" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_category_image" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_category_image; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_category_stores; ?></td>
				<td>
				  <?php if ($config_category_stores) { ?>
					<input type="checkbox" name="config_category_stores" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_category_stores" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_category_stores; ?></td>
			  </tr>
			  <tr>
				<td><?php echo $entry_category_design; ?></td>
				<td>
				  <?php if ($config_category_design) { ?>
					<input type="checkbox" name="config_category_design" value="1" checked="checked" />
				  <?php } else { ?>
					<input type="checkbox" name="config_category_design" value="1" />
				  <?php } ?>
				</td>
				<td><?php echo $info_category_design; ?></td>
			  </tr>
			</table>
		</div>
		<div id="tab-manufacturer" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_manufacturer_quick_edit; ?></td>
              <td><?php if ($config_manufacturer_quick_edit) { ?>
                <input type="radio" name="config_manufacturer_quick_edit" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_manufacturer_quick_edit" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_manufacturer_quick_edit" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_manufacturer_quick_edit" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_manufacturer_top_menu; ?></td>
			  <td><select name="config_manufacturer_top_menu">
                <?php if ($config_manufacturer_top_menu == 'none') { ?>
                <option value="none" selected="selected"><?php echo $text_none; ?></option>
                <?php } else { ?>
                <option value="none"><?php echo $text_none; ?></option>
                <?php } ?>
				<?php if ($config_manufacturer_top_menu == 'top_menu') { ?>
                <option value="top_menu" selected="selected"><?php echo $text_top_menu; ?></option>
                <?php } else { ?>
                <option value="top_menu"><?php echo $text_top_menu; ?></option>
                <?php } ?>
                <?php if ($config_manufacturer_top_menu == 'top_menu_categories') { ?>
                <option value="top_menu_categories" selected="selected"><?php echo $text_top_menu_categories; ?></option>
                <?php } else { ?>
                <option value="top_menu_categories"><?php echo $text_top_menu_categories; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
              <td><?php echo $entry_brands_image_top_menu; ?></td>
              <td><?php if ($config_manufacturer_image_top_menu) { ?>
                <input type="radio" name="config_manufacturer_image_top_menu" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_manufacturer_image_top_menu" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_manufacturer_image_top_menu" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_manufacturer_image_top_menu" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
          </table>
		</div>
		<div id="tab-news" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_news_sort_order; ?></td>
			  <td><select name="config_news_sort_order">
                <?php if ($config_news_sort_order == 'DESC') { ?>
                <option value="DESC" selected="selected"><?php echo $text_date_available_desc; ?></option>
                <?php } else { ?>
                <option value="DESC"><?php echo $text_date_available_desc; ?></option>
                <?php } ?>
                <?php if ($config_news_sort_order == 'ASC') { ?>
                <option value="ASC" selected="selected"><?php echo $text_date_available_asc; ?></option>
                <?php } else { ?>
                <option value="ASC"><?php echo $text_date_available_asc; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
              <td><?php echo $entry_news_top_menu; ?></td>
			  <td><select name="config_news_top_menu">
                <?php if ($config_news_top_menu == 'none') { ?>
                <option value="none" selected="selected"><?php echo $text_none; ?></option>
                <?php } else { ?>
                <option value="none"><?php echo $text_none; ?></option>
                <?php } ?>
                <?php if ($config_news_top_menu == 'top_left') { ?>
                <option value="top_left" selected="selected"><?php echo $text_top_menu_left; ?></option>
                <?php } else { ?>
                <option value="top_left"><?php echo $text_top_menu_left; ?></option>
				<?php } ?>
				<?php if ($config_news_top_menu == 'top_right') { ?>
                <option value="top_right" selected="selected"><?php echo $text_top_menu_right; ?></option>
                <?php } else { ?>
                <option value="top_right"><?php echo $text_top_menu_right; ?></option>
				<?php } ?>
				<?php if ($config_news_top_menu == 'child_top') { ?>
                <option value="child_top" selected="selected"><?php echo $text_child_top; ?></option>
                <?php } else { ?>
                <option value="child_top"><?php echo $text_child_top; ?></option>
				<?php } ?>
				<?php if ($config_news_top_menu == 'child_bottom') { ?>
                <option value="child_bottom" selected="selected"><?php echo $text_child_bottom; ?></option>
                <?php } else { ?>
                <option value="child_bottom"><?php echo $text_child_bottom; ?></option>
				<?php } ?>
              </select></td>
            </tr>
			<tr>
              <td><?php echo $entry_news_side_menu; ?></td>
			  <td><select name="config_news_side_menu">
                <?php if ($config_news_side_menu == 'none') { ?>
                <option value="none" selected="selected"><?php echo $text_none; ?></option>
                <?php } else { ?>
                <option value="none"><?php echo $text_none; ?></option>
                <?php } ?>
				<?php if ($config_news_side_menu == 'top') { ?>
                <option value="top" selected="selected"><?php echo $text_top; ?></option>
                <?php } else { ?>
                <option value="top"><?php echo $text_top; ?></option>
				<?php } ?>
				<?php if ($config_news_side_menu == 'bottom') { ?>
                <option value="bottom" selected="selected"><?php echo $text_bottom; ?></option>
                <?php } else { ?>
                <option value="bottom"><?php echo $text_bottom; ?></option>
				<?php } ?>
              </select></td>
            </tr>
			<tr>
              <td><?php echo $entry_subcategories_news; ?></td>
			  <td><select name="config_view_news_subcategory">
				<?php if ($config_view_news_subcategory == 'default') { ?>
                <option value="default" selected="selected"><?php echo $text_subcategory_default; ?></option>
                <?php } else { ?>
                <option value="default"><?php echo $text_subcategory_default; ?></option>
				<?php } ?>
				<?php if ($config_view_news_subcategory == 'images') { ?>
                <option value="images" selected="selected"><?php echo $text_subcategory_images; ?></option>
                <?php } else { ?>
                <option value="images"><?php echo $text_subcategory_images; ?></option>
				<?php } ?>
              </select></td>
            </tr>
			<tr>
              <td><?php echo $entry_search_news; ?></td>
			  <td><select name="config_search_news">
                <?php if ($config_search_news == 'none') { ?>
                <option value="none" selected="selected"><?php echo $text_none; ?></option>
                <?php } else { ?>
                <option value="none"><?php echo $text_none; ?></option>
                <?php } ?>
				<?php if ($config_search_news == 'top') { ?>
                <option value="top" selected="selected"><?php echo $text_top; ?></option>
                <?php } else { ?>
                <option value="top"><?php echo $text_top; ?></option>
				<?php } ?>
				<?php if ($config_search_news == 'bottom') { ?>
                <option value="bottom" selected="selected"><?php echo $text_bottom; ?></option>
                <?php } else { ?>
                <option value="bottom"><?php echo $text_bottom; ?></option>
				<?php } ?>
              </select></td>
            </tr>
			<tr>
              <td><?php echo $entry_news_description_limit; ?></td>
              <td><input type="text" name="config_news_description_limit" value="<?php echo $config_news_description_limit; ?>" size="3" /></td>
            </tr>
			<tr>
              <td><?php echo $entry_news_descr_limit_grid; ?></td>
              <td><input type="text" name="config_news_grid_description_limit" value="<?php echo $config_news_grid_description_limit; ?>" size="3" /></td>
            </tr>
			<tr>
              <td><?php echo $entry_symbol_news_subcat; ?></td>
              <td><input type="text" name="config_sub_news_category_description_limit" value="<?php echo $config_sub_news_category_description_limit; ?>" size="3" /></td>
            </tr>
			<tr>
              <td><?php echo $entry_news_count; ?></td>
              <td><?php if ($config_news_count) { ?>
                <input type="radio" name="config_news_count" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_news_count" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_news_count" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_news_count" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
              </tr>
			<tr>
              <td><?php echo $entry_guest_comment; ?></td>
              <td><?php if ($config_guest_news_comment) { ?>
                <input type="radio" name="config_guest_news_comment" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_guest_news_comment" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_guest_news_comment" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_guest_news_comment" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_news_comment_mail; ?></td>
              <td><?php if ($config_news_comments_mail) { ?>
                <input type="radio" name="config_news_comments_mail" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_news_comments_mail" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_news_comments_mail" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_news_comments_mail" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_limit_news_comments; ?></td>
			  <td><select name="config_limit_news_comments">
                <?php if ($config_limit_news_comments == '5') { ?>
                <option value="5" selected="selected">5</option>
                <?php } else { ?>
                <option value="5">5</option>
                <?php } ?>
                <?php if ($config_limit_news_comments == '10') { ?>
                <option value="10" selected="selected">10</option>
                <?php } else { ?>
                <option value="10">10</option>
				<?php } ?>
				<?php if ($config_limit_news_comments == '15') { ?>
                <option value="15" selected="selected">15</option>
                <?php } else { ?>
                <option value="15">15</option>
				<?php } ?>
				<?php if ($config_limit_news_comments == '20') { ?>
                <option value="20" selected="selected">20</option>
                <?php } else { ?>
                <option value="20">20</option>
				<?php } ?>
				<?php if ($config_limit_news_comments == '25') { ?>
                <option value="25" selected="selected">25</option>
                <?php } else { ?>
                <option value="25">25</option>
                <?php } ?>
              </select></td>
            </tr>
		  </table>
		  <table class="list">
		  <thead>
            <tr>
			  <td class="center" width=14%"><?php echo $entry_image_news_category; ?></td>
			  <td class="center" width=14%"><?php echo $entry_image_news_subcategory; ?></td>
              <td class="center" width=14%"><?php echo $entry_image_news_thumb; ?></td>
			  <td class="center" width=14%"><?php echo $entry_image_news_popup; ?></td>
			  <td class="center" width=14%"><?php echo $entry_image_news; ?></td>
			  <td class="center" width=14%"><?php echo $entry_image_news_related; ?></td>
			  <td class="center" width=14%"><?php echo $entry_image_news_additional; ?></td>
            </tr>
          </thead>
		  <tbody>
		    <tr>
              <td class="center"><?php echo $text_w; ?>
			    <input type="text" name="config_image_news_category_width" value="<?php echo $config_image_news_category_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_news_category_height" value="<?php echo $config_image_news_category_height; ?>" size="3" /><?php echo $text_h; ?>
              </td>
			  <td class="center"><?php echo $text_w; ?>
			    <input type="text" name="config_image_news_sub_category_width" value="<?php echo $config_image_news_sub_category_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_news_sub_category_height" value="<?php echo $config_image_news_sub_category_height; ?>" size="3" /><?php echo $text_h; ?>
              </td>
			  <td class="center"><?php echo $text_w; ?>
			    <input type="text" name="config_image_news_thumb_width" value="<?php echo $config_image_news_thumb_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_news_thumb_height" value="<?php echo $config_image_news_thumb_height; ?>" size="3" /><?php echo $text_h; ?>
              </td>
			  <td class="center"><?php echo $text_w; ?>
			    <input type="text" name="config_image_news_popup_width" value="<?php echo $config_image_news_popup_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_news_popup_height" value="<?php echo $config_image_news_popup_height; ?>" size="3" /><?php echo $text_h; ?>
              </td>
			  <td class="center"><?php echo $text_w; ?>
			    <input type="text" name="config_image_news_width" value="<?php echo $config_image_news_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_news_height" value="<?php echo $config_image_news_height; ?>" size="3" /><?php echo $text_h; ?>
              </td>
			  <td class="center"><?php echo $text_w; ?>
			    <input type="text" name="config_image_news_related_width" value="<?php echo $config_image_news_related_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_news_related_height" value="<?php echo $config_image_news_related_height; ?>" size="3" /><?php echo $text_h; ?>
              </td>
			  <td class="center"><?php echo $text_w; ?>
			    <input type="text" name="config_image_news_additional_width" value="<?php echo $config_image_news_additional_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_news_additional_height" value="<?php echo $config_image_news_additional_height; ?>" size="3" /><?php echo $text_h; ?>
              </td>
            </tr>			  
		  </tbody>
		  </table>
		  <table class="list">
		  <thead>
            <tr>
			  <td colspan="3" class="center" width=50%"><?php echo $column_setting_news; ?></td>
              <td colspan="3" class="center" width=50%"><?php echo $column_setting_news_category; ?></td>
            </tr>
          </thead>
		  <tbody>
		    <tr>
			  <td class="center" colspan="6"><?php echo $text_news_info; ?></td>
			</tr>
			<tr>
			  <td class="left" width="200"><?php echo $entry_all_buttons; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_all_buttons) { ?>
				  <input type="checkbox" name="config_news_all_buttons" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_all_buttons" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_category_all_buttons; ?></td>
			  <td class="left" width="200"><?php echo $entry_all_buttons; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_category_all_buttons) { ?>
				  <input type="checkbox" name="config_news_category_all_buttons" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_category_all_buttons" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_category_all_buttons; ?></td>
			</tr>
			<tr>
			  <td class="left"><?php echo $entry_general_data; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_general_data) { ?>
				  <input type="checkbox" name="config_news_general_data" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_general_data" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_general; ?></td>
			  <td class="left"><?php echo $entry_general_data; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_category_general_data) { ?>
				  <input type="checkbox" name="config_news_category_general_data" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_category_general_data" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_category_general; ?></td>
			</tr>
			<tr>
			  <td class="left"><?php echo $entry_news_category; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_category) { ?>
				  <input type="checkbox" name="config_news_category" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_category" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_category; ?></td>
			  <td class="left"><?php echo $entry_news_category_parent; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_category_parent) { ?>
				  <input type="checkbox" name="config_news_category_parent" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_category_parent" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_category_parent; ?></td>
			</tr>
			<tr>
			  <td class="left"><?php echo $entry_news_news_date_sort; ?></td>
			  <td class="center" width="20">
				<?php if ($config_quick_news_date_sort) { ?>
				  <input type="checkbox" name="config_quick_news_date_sort" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_quick_news_date_sort" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_news_date_sort; ?></td>
			  <td class="left"><?php echo $entry_category_image; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_category_image) { ?>
				  <input type="checkbox" name="config_news_category_image" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_category_image" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_category_image; ?></td>
			</tr>
			<tr>
			  <td class="left"><?php echo $entry_news_related; ?></td>
			  <td class="center" width="20">
				<?php if ($config_quick_news_related) { ?>
				  <input type="checkbox" name="config_quick_news_related" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_quick_news_related" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_related; ?></td>
			  <td class="left"><?php echo $entry_category_stores; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_category_stores) { ?>
				  <input type="checkbox" name="config_news_category_stores" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_category_stores" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_category_stores; ?></td>
			</tr>
			<tr>
			  <td class="left"><?php echo $entry_news_images; ?></td>
			  <td class="center" width="20">
				<?php if ($config_quick_news_images) { ?>
				  <input type="checkbox" name="config_quick_news_images" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_quick_news_images" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_images; ?></td>
			  <td class="left"><?php echo $entry_category_design; ?></td>
			  <td class="center" width="20">
				<?php if ($config_news_category_design) { ?>
				  <input type="checkbox" name="config_news_category_design" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_news_category_design" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_category_design; ?></td>
			</tr>
			<tr>
			  <td class="left"><?php echo $entry_product_stores; ?></td>
			  <td class="center" width="20">
				<?php if ($config_quick_news_stores) { ?>
				  <input type="checkbox" name="config_quick_news_stores" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_quick_news_stores" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_news_stores; ?></td>
			  <td></td>
			  <td></td>
			  <td></td>
			</tr>
			<tr>
			  <td class="left"><?php echo $entry_category_design; ?></td>
			  <td class="center" width="20">
				<?php if ($config_quick_news_design) { ?>
				  <input type="checkbox" name="config_quick_news_design" value="1" checked="checked" />
				<?php } else { ?>
				  <input type="checkbox" name="config_quick_news_design" value="1" />
				<?php } ?>
			  </td>
			  <td class="left"><?php echo $info_category_design; ?></td>
			  <td></td>
			  <td></td>
			  <td></td>
			</tr>
		  </tbody>
          </table>
		</div>
        <div id="tab-image" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_logo; ?></td>
              <td><div class="image"><img src="<?php echo $logo; ?>" alt="" id="thumb-logo" />
                  <input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="logo" />
                  <br />
                  <a onclick="image_upload('logo', 'thumb-logo');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-logo').attr('src', '<?php echo $no_image; ?>'); $('#logo').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_icon; ?></td>
              <td><div class="image"><img src="<?php echo $icon; ?>" alt="" id="thumb-icon" />
                  <input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="icon" />
                  <br />
                  <a onclick="image_upload('icon', 'thumb-icon');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-icon').attr('src', '<?php echo $no_image; ?>'); $('#icon').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_category; ?></td>
              <td><input type="text" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" size="3" />
                <?php if ($error_image_category) { ?>
                <span class="error"><?php echo $error_image_category; ?></span>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_image_subcategory; ?></td>
              <td><input type="text" name="config_image_subcategory_width" value="<?php echo $config_image_subcategory_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_subcategory_height" value="<?php echo $config_image_subcategory_height; ?>" size="3" />
              </td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_thumb; ?></td>
              <td><input type="text" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" size="3" />
                <?php if ($error_image_thumb) { ?>
                <span class="error"><?php echo $error_image_thumb; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_popup; ?></td>
              <td><input type="text" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" size="3" />
                <?php if ($error_image_popup) { ?>
                <span class="error"><?php echo $error_image_popup; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_product; ?></td>
              <td><input type="text" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" size="3" />
                <?php if ($error_image_product) { ?>
                <span class="error"><?php echo $error_image_product; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_additional; ?></td>
              <td><input type="text" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" size="3" />
                <?php if ($error_image_additional) { ?>
                <span class="error"><?php echo $error_image_additional; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_related; ?></td>
              <td><input type="text" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" size="3" />
                <?php if ($error_image_related) { ?>
                <span class="error"><?php echo $error_image_related; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_compare; ?></td>
              <td><input type="text" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" size="3" />
                <?php if ($error_image_compare) { ?>
                <span class="error"><?php echo $error_image_compare; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_wishlist; ?></td>
              <td><input type="text" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" size="3" />
                <?php if ($error_image_wishlist) { ?>
                <span class="error"><?php echo $error_image_wishlist; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_cart; ?></td>
              <td><input type="text" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" size="3" />
                x&nbsp;
                <input type="text" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" size="3" />
                <?php if ($error_image_cart) { ?>
                <span class="error"><?php echo $error_image_cart; ?></span>
                <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-ftp" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_ftp_host; ?></td>
              <td><input type="text" name="config_ftp_host" value="<?php echo $config_ftp_host; ?>" />
                <?php if ($error_ftp_host) { ?>
                <span class="error"><?php echo $error_ftp_host; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_port; ?></td>
              <td><input type="text" name="config_ftp_port" value="<?php echo $config_ftp_port; ?>" />
                <?php if ($error_ftp_port) { ?>
                <span class="error"><?php echo $error_ftp_port; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_username; ?></td>
              <td><input type="text" name="config_ftp_username" value="<?php echo $config_ftp_username; ?>" />
                <?php if ($error_ftp_username) { ?>
                <span class="error"><?php echo $error_ftp_username; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_password; ?></td>
              <td><input type="text" name="config_ftp_password" value="<?php echo $config_ftp_password; ?>" />
                <?php if ($error_ftp_password) { ?>
                <span class="error"><?php echo $error_ftp_password; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_root; ?></td>
              <td><input type="text" name="config_ftp_root" value="<?php echo $config_ftp_root; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_status; ?></td>
              <td><?php if ($config_ftp_status) { ?>
                <input type="radio" name="config_ftp_status" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_ftp_status" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_ftp_status" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_ftp_status" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-mail" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_mail_protocol; ?></td>
              <td><select name="config_mail_protocol">
                  <?php if ($config_mail_protocol == 'mail') { ?>
                  <option value="mail" selected="selected"><?php echo $text_mail; ?></option>
                  <?php } else { ?>
                  <option value="mail"><?php echo $text_mail; ?></option>
                  <?php } ?>
                  <?php if ($config_mail_protocol == 'smtp') { ?>
                  <option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
                  <?php } else { ?>
                  <option value="smtp"><?php echo $text_smtp; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_mail_parameter; ?></td>
              <td><input type="text" name="config_mail_parameter" value="<?php echo $config_mail_parameter; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_host; ?></td>
              <td><input type="text" name="config_smtp_host" value="<?php echo $config_smtp_host; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_username; ?></td>
              <td><input type="text" name="config_smtp_username" value="<?php echo $config_smtp_username; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_password; ?></td>
              <td><input type="text" name="config_smtp_password" value="<?php echo $config_smtp_password; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_port; ?></td>
              <td><input type="text" name="config_smtp_port" value="<?php echo $config_smtp_port; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_timeout; ?></td>
              <td><input type="text" name="config_smtp_timeout" value="<?php echo $config_smtp_timeout; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_alert_mail; ?></td>
              <td><?php if ($config_alert_mail) { ?>
                <input type="radio" name="config_alert_mail" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_alert_mail" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_alert_mail" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_alert_mail" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_account_mail; ?></td>
              <td><?php if ($config_account_mail) { ?>
                <input type="radio" name="config_account_mail" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_account_mail" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_account_mail" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_account_mail" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_review_mail; ?></td>
              <td><?php if ($config_review_mail) { ?>
                <input type="radio" name="config_review_mail" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_review_mail" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_review_mail" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_review_mail" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_alert_emails; ?></td>
              <td><textarea name="config_alert_emails" cols="40" rows="5"><?php echo $config_alert_emails; ?></textarea></td>
            </tr>
          </table>
        </div>
        <div id="tab-fraud" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_fraud_detection; ?></td>
              <td><?php if ($config_fraud_detection) { ?>
                <input type="radio" name="config_fraud_detection" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_fraud_detection" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_fraud_detection" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_fraud_detection" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_fraud_key; ?></td>
              <td><input type="text" name="config_fraud_key" value="<?php echo $config_fraud_key; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_fraud_score; ?></td>
              <td><input type="text" name="config_fraud_score" value="<?php echo $config_fraud_score; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_fraud_status; ?></td>
              <td><select name="config_fraud_status_id">
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $config_fraud_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-server" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_secure; ?></td>
              <td><?php if ($config_secure) { ?>
                <input type="radio" name="config_secure" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_secure" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_secure" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_secure" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_shared; ?></td>
              <td><?php if ($config_shared) { ?>
                <input type="radio" name="config_shared" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_shared" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_shared" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_shared" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_robots; ?></td>
              <td><textarea name="config_robots" cols="40" rows="5"><?php echo $config_robots; ?></textarea></td>
            </tr>                    
            <tr>
              <td><?php echo $entry_seo_url; ?></td>
              <td><?php if ($config_seo_url) { ?>
                <input type="radio" name="config_seo_url" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_seo_url" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_seo_url" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_seo_url" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_seo_url_type; ?></td>
              <td><select name="config_seo_url_type">
                <?php foreach ($seo_types as $seo_type) { ?>
                <?php if ($seo_type['type'] == $config_seo_url_type) { ?>
                <option value="<?php echo $seo_type['type']; ?>" selected="selected"><?php echo $seo_type['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $seo_type['type']; ?>"><?php echo $seo_type['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_seo_url_include_path; ?></td>
              <td><?php if ($config_seo_url_include_path) { ?>
                <input type="radio" name="config_seo_url_include_path" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_seo_url_include_path" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_seo_url_include_path" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_seo_url_include_path" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_seo_url_postfix; ?></td>
              <td><input type="text" name="config_seo_url_postfix" value="<?php echo $config_seo_url_postfix; ?>" size="3" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_image_file_size; ?></td>
              <td><input type="text" name="config_image_file_size" value="<?php echo $config_image_file_size; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_file_extension_allowed; ?></td>
              <td><textarea name="config_file_extension_allowed" cols="40" rows="5"><?php echo $config_file_extension_allowed; ?></textarea></td>
            </tr>
            <tr>
              <td><?php echo $entry_file_mime_allowed; ?></td>
              <td><textarea name="config_file_mime_allowed" cols="60" rows="5"><?php echo $config_file_mime_allowed; ?></textarea></td>
            </tr>              
            <tr>
              <td><?php echo $entry_maintenance; ?></td>
              <td><?php if ($config_maintenance) { ?>
                <input type="radio" name="config_maintenance" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_maintenance" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_maintenance" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_maintenance" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_password; ?></td>
              <td><?php if ($config_password) { ?>
                <input type="radio" name="config_password" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_password" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_password" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_password" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>            
            <tr>
              <td><?php echo $entry_encryption; ?></td>
              <td><input type="text" name="config_encryption" value="<?php echo $config_encryption; ?>" />
                <?php if ($error_encryption) { ?>
                <span class="error"><?php echo $error_encryption; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_compression; ?></td>
              <td><input type="text" name="config_compression" value="<?php echo $config_compression; ?>" size="3" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_error_display; ?></td>
              <td><?php if ($config_error_display) { ?>
                <input type="radio" name="config_error_display" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_error_display" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_error_display" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_error_display" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_error_log; ?></td>
              <td><?php if ($config_error_log) { ?>
                <input type="radio" name="config_error_log" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_error_log" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_error_log" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_error_log" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_error_filename; ?></td>
              <td><input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" />
                <?php if ($error_error_filename) { ?>
                <span class="error"><?php echo $error_error_filename; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_google_analytics; ?></td>
              <td><textarea name="config_google_analytics" cols="40" rows="5"><?php echo $config_google_analytics; ?></textarea></td>
            </tr>
          </table>
        </div>
		<div id="tab-other" class="vtabs-content">
          <table class="form">
		    <tr>
              <td><?php echo $entry_attributes_quick_edit; ?></td>
              <td><?php if ($config_attributes_quick_edit) { ?>
                <input type="radio" name="config_attributes_quick_edit" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_attributes_quick_edit" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_attributes_quick_edit" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_attributes_quick_edit" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_options_quick_edit; ?></td>
              <td><?php if ($config_options_quick_edit) { ?>
                <input type="radio" name="config_options_quick_edit" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_options_quick_edit" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_options_quick_edit" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_options_quick_edit" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_filter_quick_edit; ?></td>
              <td><?php if ($config_filter_quick_edit) { ?>
                <input type="radio" name="config_filter_quick_edit" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_filter_quick_edit" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_filter_quick_edit" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_filter_quick_edit" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_information_quick_edit; ?></td>
              <td><?php if ($config_information_quick_edit) { ?>
                <input type="radio" name="config_information_quick_edit" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_information_quick_edit" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_information_quick_edit" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_information_quick_edit" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
		    <tr>
              <td><?php echo $entry_review_quick_edit; ?></td>
              <td><?php if ($config_review_quick_edit) { ?>
                <input type="radio" name="config_review_quick_edit" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_review_quick_edit" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_review_quick_edit" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_review_quick_edit" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_clicking_image; ?></td>
              <td><?php if ($config_clicking_image) { ?>
                <input type="radio" name="config_clicking_image" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_clicking_image" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_clicking_image" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_clicking_image" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_buttons_apply; ?></td>
              <td><?php if ($config_buttons_apply) { ?>
                <input type="radio" name="config_buttons_apply" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_buttons_apply" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_buttons_apply" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_buttons_apply" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_quick_search; ?></td>
              <td><?php if ($config_quick_search) { ?>
                <input type="radio" name="config_quick_search" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_search" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_quick_search" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_quick_search" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_copyright; ?></td>
              <td><?php if ($config_copyright) { ?>
                <input type="radio" name="config_copyright" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_copyright" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_copyright" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_copyright" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
		  </table>
		</div>
      </form>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/setting.png" alt="" /> <?php echo $heading_title; ?><span class="storename"></span></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#template').load('index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent($('select[name=\'config_template\']').attr('value')));
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'config_country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=setting/setting/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},		
		complete: function() {
			$('.loading').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'config_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_country_id\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
$storename = $('input[name="config_name"]'); 
$title = $('.storename');

if ($storename.val() != '') {
	$title.html(' - ' + $storename.val()); 
}

$storename.keyup(function() {
	if ($storename.val() != '') {
		$title.html(' - ' + $storename.val()); 
	} else {
		$title.html('');
	}
});
$("a.tooltip, img.tooltip, div.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script> 
<?php echo $footer; ?>