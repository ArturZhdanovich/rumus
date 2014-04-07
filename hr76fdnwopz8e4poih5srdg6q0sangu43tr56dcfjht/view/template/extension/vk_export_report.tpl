<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>

<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
  </div>
  <div class="content">
    <div id="tabs" class="htabs">
        <a href="#tab1" style="display: inline;" class="selected">Экспорт</a>
        <a href="#tab2" style="display: inline;">Стена</a>
        <a href="#tab3" style="display: inline;">Обновление</a>
        </div>
    <div id="tab1">
        <pre><?php echo $export; ?></pre>
    </div>
    <div id="tab2" style="display:none;">
        <pre><?php echo $wall; ?></pre>
    </div>
    <div id="tab3" style="display:none;">
        <pre><?php echo $update; ?></pre>
    </div>
  </div>
</div> 

<script type="text/javascript"><!--
$('#tabs a').tabs(); 
//--></script> 

<?php echo $footer; ?>
