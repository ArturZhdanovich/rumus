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
          <a href="<?php echo $add ?>" class="button">Добавить</a>
          <a onclick="if (!confirm('Действительно удалить отмеченные альбомы?')) return false; else $('#form').submit()" onclick="" class="button">Удалить отмеченные</a>
          <a href="<?php echo $delete_all ?>" class="button" onclick="if (!confirm('Действительно удалить все альбомы?')) return false;">Удалить все</a>
          </div>
    </div>
    <div class="content">
      <form action="" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
          <thead>
            <tr>
              <td width="20"></td>
              <td class="left"><?php echo $entry_category; ?></td>
              <td class="left" width="300"><?php echo $entry_export_to_album; ?></td>
              <td width="150"><?php echo $entry_owner_type; ?></td>
              <td width="150" align="center">Действие</td>
            </tr>
          </thead>
          <?php foreach ($albums as $key => $album) { ?>
          <tbody id="module-row">
            <tr>
              <td><input type="checkbox" name="delete_albums[<?php echo $key ?>]" value="<?php echo $album['category_id'] ?>"></td>
              <td class="left"><?php echo $album['category'] ?></td>
              <td class="left"><a href="http://vk.com/album<?php echo $album['vk_album_id'] ?>" target="_blank" title="Просмотр альбома">http://vk.com/album<?php echo $album['vk_album_id'] ?></a>
                <input type="hidden" name="vk_album_id[<?php echo $key ?>]" value="<?php echo $album['vk_album_id'] ?>">
              </td>
              <td class="left"><?php echo $album['mode_name'] ?><input type="hidden" name="mode[<?php echo $key ?>]" value="<?php echo $album['mode'] ?>"></td>
              <td align="center">[ <a href="<?php echo $album['edit'] ?>">Изменить</a> ]</td>
            </tr>
          </tbody>
          <?php } ?>
          <tfoot>
          </tfoot>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>

