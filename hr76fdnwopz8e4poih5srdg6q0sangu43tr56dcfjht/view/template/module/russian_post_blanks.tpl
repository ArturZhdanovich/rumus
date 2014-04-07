<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } else if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
       <div id="tab-general">
       <h2>Данные отправителя</h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_name; ?></td>
            <td>
              <input type="text" name="rpb_from_name" value="<?php echo $rpb_from_name; ?>" size="60" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_address_1; ?></td>
            <td>
              <input type="text" name="rpb_from_address_1" value="<?php echo $rpb_from_address_1; ?>" size="60" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_address_2; ?></td>
            <td>
              <input type="text" name="rpb_from_address_2" value="<?php echo $rpb_from_address_2; ?>" size="60" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_postindex; ?></td>
            <td>
              <input type="text" name="rpb_postindex" value="<?php echo $rpb_postindex; ?>" size="10" />
            </td>
          </tr>
        </table>
        <h2>Предъявленный документ</h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_doc_type; ?></td>
            <td>
              <input type="text" name="rpb_doc_type" value="<?php echo $rpb_doc_type; ?>" size="30" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_doc_serial; ?></td>
            <td>
              <input type="text" name="rpb_doc_serial" value="<?php echo $rpb_doc_serial; ?>" size="10" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_doc_num; ?></td>
            <td>
              <input type="text" name="rpb_doc_num" value="<?php echo $rpb_doc_num; ?>" size="10" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_doc_date; ?></td>
            <td>
              <input type="text" name="rpb_doc_date" value="<?php echo $rpb_doc_date; ?>" size="10" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_doc_received_by; ?></td>
            <td>
              <input type="text" name="rpb_doc_received_by" value="<?php echo $rpb_doc_received_by; ?>" size="50" />
            </td>
          </tr>
        </table>
        
        <h2>Наложка в адрес юр лица</h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_inn; ?></td>
            <td>
              <input type="text" name="rpb_inn" value="<?php echo $rpb_inn; ?>" size="30" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_bik; ?></td>
            <td>
              <input type="text" name="rpb_bik" value="<?php echo $rpb_bik; ?>" size="10" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_correspondent_account; ?></td>
            <td>
              <input type="text" name="rpb_correspondent_account" value="<?php echo $rpb_correspondent_account; ?>" size="50" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_current_account; ?></td>
            <td>
              <input type="text" name="rpb_current_account" value="<?php echo $rpb_current_account; ?>" size="50" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_bank_name; ?></td>
            <td>
              <input type="text" name="rpb_bank_name" value="<?php echo $rpb_bank_name; ?>" size="50" />
            </td>
          </tr>
        </table>

        
       </div>
     </form>
    </div>
  </div>
</div>
<div id="legal_text" style="display:none"></div>
<div id="help_text" style="display:none"></div>
<script type="text/javascript"><!--
$('#tabs a').tabs();
$("#legal_notice").click(function(e) {
    e.preventDefault();
    $("#legal_text").load(this.href, function() {
        $(this).dialog({
            title: '<?php echo $text_terms; ?>',
            width:  800,
            height:  600,
            minWidth:  500,
            minHeight:  400,
            modal: true,
        });
    });
    return false;
});
$("#help_notice").click(function(e) {
    e.preventDefault();
    $("#help_text").load(this.href, function() {
        $(this).dialog({
            title: '<?php echo $text_help_request; ?>',
            width:  800,
            height:  600,
            minWidth:  500,
            minHeight:  400,
            modal: true,
        });
    });
    return false;
});
//--></script>
<?php echo $footer; ?>