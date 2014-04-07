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
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="view/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/quick-edit.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link type="text/css" href="view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/jquery-tooltip/jquery.tooltip.min.js"></script>
<link type="text/css" href="view/javascript/jquery-tooltip/jquery.tooltip.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="view/javascript/placeholder.js"></script>
<script type="text/javascript" src="view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript">
//-----------------------------------------
// Confirm Actions (delete, uninstall)
//-----------------------------------------
$(document).ready(function(){
    // Confirm Delete
    $('#form').submit(function(){
        if ($(this).attr('action').indexOf('delete',1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
    	
    // Confirm Uninstall
    $('a').click(function(){
        if ($(this).attr('href') != null && $(this).attr('href').indexOf('uninstall', 1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
});
</script>
    <script type="text/javascript">
        $(document).ready(function(){
        //Striped table
        try {
            $(".list tbody tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
            $(".list tbody tr:even, .form tbody tr:even, .dashboard-content tbody tr:even").addClass("alt");
            }
          catch (err) {};
        });
    </script>
    <script type="text/javascript"> $(function(){ $.fn.scrollToTop=function(){ $(this).hide().removeAttr("href"); if($(window).scrollTop()!="0"){ $(this).fadeIn("fast") } var scrollDiv=$(this); $(window).scroll(function(){ if($(window).scrollTop()=="0"){ $(scrollDiv).fadeOut("slow") }else{ $(scrollDiv).fadeIn("fast") } }); $(this).click(function(){ $("html, body").animate({scrollTop:0},"slow") }) } }); $(function() { $("#toTop").scrollToTop(); }); $(document).ready(function(){ try { $("input, textarea, select").focus(function() { $(this).addClass("focus"); }); $("input, textarea, select").blur(function() { $(this).removeClass("focus"); }); $(".list tbody tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");}); $(".list tbody tr:even, .form tbody tr:even, .dashboard-content tbody tr:even").addClass("alt"); $("tbody td.right a").addClass('button'); $("tbody td.right").each(function () { $(this).html($(this).html().replace('[ ',' ').replace('[ ',' ').replace(' ]',' ').replace(' ]',' ')); }); $("a.button").each(function(){ <?php if( strpos( strtolower($_SERVER['REQUEST_URI']), 'insert' ) == false ) { ?> var onclick = $(this).attr('onclick'); if(typeof onclick != 'undefined' && onclick.indexOf('#form') != -1 && onclick.indexOf('.submit()') != -1 && $(this).text() == '<?php echo $this->language->get('button_save') ?>'){ var apply = '<a class="button apply" onclick="apply_form()"><?php echo $this->language->get('button_apply') ?></a>'; $(this).after(apply); } <?php } ?> if ($(this).text() == '<?php echo $this->language->get('button_insert') ?>' || $(this).text() == '<?php echo $this->language->get('button_save') ?>') {$(this).addClass('insert')} if ($(this).text() == '<?php echo $this->language->get('text_edit') ?>') {$(this).addClass('edit')} if ($(this).text() == '<?php echo $this->language->get('button_delete') ?>' || $(this).text() == '<?php echo $this->language->get('button_cancel') ?>') {$(this).addClass('delete')} if ($(this).text() == '<?php echo $this->language->get('button_install') ?>') {$(this).addClass('install')} }); } catch (err) {}; setTimeout(function(){$('.success,.warning,.attention').remove()},15000); $('.success,.warning,.attention').click(function() {$(this).remove();}); }); function apply_form(){ try { for (instance in CKEDITOR.instances) CKEDITOR.instances[instance].updateElement(); } catch(err) {}; $('.success,.warning,.attention').remove(); $.ajax({ type: 'POST', url: $('#form').attr('action'), data: $('#form').serialize(), dataType: 'text', success: function(data){ if($(data).find('.error').length > 0){ $("#form").submit(); }else{ $('#content .breadcrumb').after($(data).find('.success,.warning,.attention')); $('.success,.warning,.attention').click(function() {$(this).remove();}); setTimeout(function(){$('.success,.warning,.attention').remove()},15000); } } }); }; </script>
</head>
<body>
<div id="container">
<div id="header">
  <div class="div1">
    <?php if ($logged) { ?>
    <div class="div3"><?php echo $logged; ?></div>
    <?php } ?>
  </div>
  <?php if ($logged) { ?>
  <div id="menu">
    <ul class="left">
      <li id="dashboard"><a href="<?php echo $home; ?>" class="top dashboard-home"><img src="view/image/dashboard_home.png"></a></li>
      <li id="catalog"><a class="top"><?php echo $text_catalog; ?></a>
        <ul>
          <li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
          <li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>
          <li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li>
          <li><a class="parent"><?php echo $text_attribute; ?></a>
            <ul>
              <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
              <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
            </ul>
          </li>
          <li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
          <li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
          <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
        </ul>
      </li>
      <li id="extension"><a class="top"><?php echo $text_extension; ?></a>
        <ul>
          <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
          <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
          <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
          <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
          <li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          <li><a href="<?php echo $vk_export;?>" class="parent"><?php echo $text_vk_export;?></a><ul><li><a href="<?php echo $vk_export;?>"><?php echo $text_vk_export;?></a></li><li><a href="<?php echo $vk_export_albums;?>"><?php echo $text_vk_export_albums;?></a></li><li><a href="<?php echo $vk_export_setting;?>"><?php echo $text_vk_export_setting;?></a></li><li><a href="<?php echo $vk_export_report;?>"><?php echo $text_vk_export_cron_report;?></a></li></ul></li>
        </ul>
      </li>
      <li id="sale"><a class="top"><?php echo $text_sale; ?></a>
        <ul>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a class="parent"><?php echo $text_customer; ?></a>
            <ul>
              <li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
              <li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
              <li><a href="<?php echo $customer_ban_ip; ?>"><?php echo $text_customer_ban_ip; ?></a></li>
            </ul>
          </li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
          <li><a class="parent"><?php echo $text_voucher; ?></a>
            <ul>
              <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
              <li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
            </ul>
          </li>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
        </ul>
      </li>
      <li id="system"><a class="top"><?php echo $text_system; ?></a>
        <ul>
          <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
          <li><a class="parent"><?php echo $text_design; ?></a>
            <ul>
              <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
              <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_users; ?></a>
            <ul>
              <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
              <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_localisation; ?></a>
            <ul>
              <li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
              <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
              <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
              <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
              <li><a class="parent"><?php echo $text_return; ?></a>
                <ul>
                  <li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
                  <li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
                  <li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
                </ul>
              </li>
              <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
              <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
              <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
              <li><a class="parent"><?php echo $text_tax; ?></a>
                <ul>
                  <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
                  <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
                </ul>
              </li>
              <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
              <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
            </ul>
          </li>
		  <li><a href="<?php echo $control_unit ?>"><?php echo $text_control_unit; ?></a></li>
		  <li><a href="<?php echo $seo_manager ?>"><?php echo $text_seo_manager; ?></a></li>
          <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
          <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
          <li><a href="<?php echo $export; ?>"><?php echo $text_export; ?></a></li>
        </ul>
      </li>
      <li id="reports"><a class="top"><?php echo $text_reports; ?></a>
        <ul>
          <li><a class="parent"><?php echo $text_sale; ?></a>
            <ul>
              <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
              <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
              <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
              <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
              <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_product; ?></a>
            <ul>
              <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
              <li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_customer; ?></a>
            <ul>
              <li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
              <li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
              <li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
              <li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_affiliate; ?></a>
            <ul>
              <li><a href="<?php echo $report_affiliate_commission; ?>"><?php echo $text_report_affiliate_commission; ?></a></li>
            </ul>
          </li>
        </ul>
      </li>
	  <li id="news"><a class="top"><?php echo $text_news; ?></a>
        <ul>
          <li><a href="<?php echo $news_category; ?>"><?php echo $text_news_category; ?></a></li>
		  <li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
		  <li><a href="<?php echo $news_comment; ?>"><?php echo $text_news_comments; ?></a></li>
        </ul>
      </li>
	  <li id="clear-cache"><a class="top"><?php echo $text_clear_cache; ?></a>
        <ul>
		  <li><a href="<?php echo $clear_seo_cache ?>"><?php echo $text_clear_seo_cache; ?></a></li>
		  <li><a href="<?php echo $clear_all_cache ?>"><?php echo $text_clear_all_cache; ?></a></li>
		  <li><a href="<?php echo $clear_image_cache ?>"><?php echo $text_clear_image_cache; ?></a></li>
          <li><a href="<?php echo $clear_needlessimage ?>"><?php echo $text_clear_needlessimage; ?></a></li>
        </ul>
      </li>
    </ul>
    <ul class="right">
      <li id="store"><a href="<?php echo $store; ?>" target="_blank" class="top"><?php echo $text_front; ?></a>
        <ul>
          <?php foreach ($stores as $stores) { ?>
          <li><a href="<?php echo $stores['href']; ?>" target="_blank"><?php echo $stores['name']; ?></a></li>
          <?php } ?>
        </ul>
      </li>
      <li><a class="top" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
    </ul>
  </div>
  <?php } ?>
</div>