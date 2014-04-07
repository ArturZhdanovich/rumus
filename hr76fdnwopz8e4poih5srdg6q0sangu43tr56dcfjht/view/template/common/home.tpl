<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb hidden">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_install) { ?>
  <div class="warning"><?php echo $error_install; ?></div>
  <?php } ?>
  <?php if ($error_image) { ?>
  <div class="warning"><?php echo $error_image; ?></div>
  <?php } ?>
  <?php if ($error_image_cache) { ?>
  <div class="warning"><?php echo $error_image_cache; ?></div>
  <?php } ?>
  <?php if ($error_cache) { ?>
  <div class="warning"><?php echo $error_cache; ?></div>
  <?php } ?>
  <?php if ($error_download) { ?>
  <div class="warning"><?php echo $error_download; ?></div>
  <?php } ?>
  <?php if ($error_logs) { ?>
  <div class="warning"><?php echo $error_logs; ?></div>
  <?php } ?>
  <?php if ($success_all_cache) { ?>
  <div class="success"><?php echo $success_all_cache; ?></div>
  <?php } ?>
  <?php if ($success_image_cache) { ?>
  <div class="success"><?php echo $success_image_cache; ?></div>
  <?php } ?>
  <?php if ($success_seo_cache) { ?>
  <div class="success"><?php echo $success_seo_cache; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/home.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
	  <?php if ($items) { ?>
      <div class="control-unit">
        <div class="dashboard-heading head"><?php echo $text_control_unit; ?><a class="edit-control tooltip" href="<?php echo $control_unit; ?>" title="<?php echo $text_edit_items; ?>"></a></div>
        <div class="dashboard-content" style="min-height: 103px; overflow: auto;">
		  <ul>
		    <?php foreach ($items as $item) { ?>
			  <?php if (($item['status']) == 1) { ?>
                <li><a href="<?php echo $item['href']; ?>"><img src="<?php echo $item['thumb']; ?>" /><h6><?php echo $item['name']; ?></h6></a></li>
			  <?php } ?>
            <?php } ?>
		  </ul>
        </div>
      </div>
	  <div class="clear"></div>
      <?php } ?>
      <div class="overview">
        <div class="dashboard-heading"><?php echo $text_overview; ?></div>
        <div class="dashboard-content">
          <table>
            <tr>
              <td><?php echo $text_total_sale; ?></td>
              <td><?php echo $total_sale; ?></td>
            </tr>
            <tr>
              <td><?php echo $text_total_sale_year; ?></td>
              <td><?php echo $total_sale_year; ?></td>
            </tr>
			<tr>
              <td><?php echo $text_total_sale_month; ?></td>
              <td><?php echo $total_sale_month; ?></td>
            </tr>
			<tr>
              <td><?php echo $text_total_sale_day; ?></td>
              <td><?php echo $total_sale_day; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_total_product; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_product; ?></td>
              <td align="right"><?php echo $total_product; ?></td>
            </tr>
            <tr>
              <td><a class="view tooltip" href="<?php echo $view_order; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_order; ?></td>
              <td><?php echo $total_order; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_abandoned_orders; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_abandoned_orders; ?></td>
              <td><?php echo $total_abandoned_orders; ?></td>
            </tr>
          </table>
        </div>
      </div>
	  <div class="customer">
        <div class="dashboard-heading"><?php echo $text_customers; ?></div>
        <div class="dashboard-content">
          <table>
            <tr>
              <td><a class="view tooltip" href="<?php echo $view_users; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_administrators; ?></td>
              <td><?php echo $total_admin; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_users; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_users; ?></td>
              <td><?php echo $total_users; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_customer; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_customer; ?></td>
              <td><?php echo $total_customer; ?></td>
            </tr>
            <tr>
              <td><a class="view tooltip" href="<?php echo $view_customer; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_customer_approval; ?></td>
              <td><?php echo $total_customer_approval; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_banned_ip; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_banned_ip; ?></td>
              <td><?php echo $total_banned_ip; ?></td>
            </tr>
            <tr>
              <td><a class="view tooltip" href="<?php echo $view_affiliate; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_affiliate; ?></td>
              <td><?php echo $total_affiliate; ?></td>
            </tr>
            <tr>
              <td><a class="view tooltip" href="<?php echo $view_affiliate; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_affiliate_approval; ?></td>
              <td><?php echo $total_affiliate_approval; ?></td>
            </tr>

          </table>
        </div>
      </div>
	  <div class="overview-news">
        <div class="dashboard-heading"><?php echo $text_other; ?></div>
        <div class="dashboard-content">
          <table>
            <tr>
              <td><a class="view tooltip" href="<?php echo $view_total_news; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_news; ?></td>
              <td><?php echo $total_news; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_total_news_comments; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_news_comments; ?></td>
              <td><?php echo $total_news_comments; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_total_news_comments; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_news_comments_approval; ?></td>
              <td><?php echo $total_news_comments_approval; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_review; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_review_approval; ?></td>
              <td><?php echo $total_review_approval; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_total_informations; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_informations; ?></td>
              <td><?php echo $total_informations; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_total_manufacturers; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_manufacturers; ?></td>
              <td><?php echo $total_manufacturers; ?></td>
            </tr>
			<tr>
              <td><a class="view tooltip" href="<?php echo $view_total_returns; ?>" title="<?php echo $text_view; ?>"></a><?php echo $text_total_returns; ?></td>
              <td><?php echo $total_returns; ?></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="statistic">
        <div class="range"><?php echo $entry_range; ?>
          <select id="range" onchange="getSalesChart(this.value)">
            <option value="day"><?php echo $text_day; ?></option>
            <option value="week"><?php echo $text_week; ?></option>
            <option value="month"><?php echo $text_month; ?></option>
            <option value="year"><?php echo $text_year; ?></option>
          </select>
        </div>
        <div class="dashboard-heading"><?php echo $text_statistics; ?></div>
        <div class="dashboard-content">
          <div id="report" style="width: 390px; height: 170px; margin: auto;"></div>
        </div>
      </div>
      <div class="latest">
        <div class="dashboard-heading"><?php echo $text_latest_10_orders; ?></div>
        <div class="dashboard-content">
          <table class="list">
            <thead>
              <tr>
                <td class="right"><?php echo $column_order; ?></td>
                <td class="left"><?php echo $column_customer; ?></td>
                <td class="left"><?php echo $column_status; ?></td>
                <td class="left"><?php echo $column_date_added; ?></td>
                <td class="right"><?php echo $column_total; ?></td>
                <td class="right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($orders) { ?>
              <?php foreach ($orders as $order) { ?>
              <tr>
                <td class="right"><?php echo $order['order_id']; ?></td>
                <td class="left"><?php echo $order['customer']; ?></td>
                <td class="left"><?php echo $order['status']; ?></td>
                <td class="left"><?php echo $order['date_added']; ?></td>
                <td class="right"><?php echo $order['total']; ?></td>
                <td class="right">
				  <?php foreach ($order['action'] as $action) { ?>
				    <?php if ($this->config->get('config_buttons_apply') == 0) { ?>
					  [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
				    <?php } else { ?>
					  <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a>
					<?php } ?>
                  <?php } ?>
				</td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<!--[if IE]>
<script type="text/javascript" src="view/javascript/jquery/flot/excanvas.js"></script>
<![endif]--> 
<script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.js"></script> 
<script type="text/javascript"><!--
function getSalesChart(range) {
	$.ajax({
		type: 'get',
		url: 'index.php?route=common/home/chart&token=<?php echo $token; ?>&range=' + range,
		dataType: 'json',
		async: false,
		success: function(json) {
			var option = {	
				shadowSize: 0,
				lines: { 
					show: true,
					fill: true,
					lineWidth: 1
				},
				grid: {
					backgroundColor: '#FFFFFF'
				},	
				xaxis: {
            		ticks: json.xaxis
				}
			}

			$.plot($('#report'), [json.order, json.customer], option);
		}
	});
}

getSalesChart($('#range').val());
//--></script> 
<script type="text/javascript"><!--
$("a.tooltip, span.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script>
<?php echo $footer; ?>