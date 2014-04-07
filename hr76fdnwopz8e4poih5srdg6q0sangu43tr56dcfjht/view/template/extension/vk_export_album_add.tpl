<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  <div id="loading_info" class="loading_info" style="display:none;"><img src="view/image/loading.gif">&nbsp;&nbsp;<span id="action_message"></span><div id="progressbar_wrapper"><br><div style="width:500px;" id="progressbar"></div></div></div>
  <?php if ($warning) { ?>
  <div class="warning"><?php echo $warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  
  <div class="box" id="products_table">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
          <a class="button" onclick="$('#form').submit();">Сохранить</a>
          <a href="<?php echo $cancel; ?>" class="button">Отменить</a>
          </div>
    </div>
    <div class="content">
    <form method="post" id="form" action="">
      <table class="form">
              <tr>
                <td><?php echo $entry_category; ?></td>
                <td><?php echo $category_select?></td>
              </tr>
              <tr>
                <td><?php echo $entry_export_to_album; ?></td>
                <td><input type="text" name="vk_album_id" maxlength="255" size="50" value="<?php echo (isset($this->request->post['vk_album_id']) ? htmlentities($this->request->post['vk_album_id']) : '' ); ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_owner_type; ?></td>
                <td><?php echo $mode_select?></td>
              </tr>
            </table>
        </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>

