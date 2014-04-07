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
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="contentes">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'nd.name') { ?>
                <a href="<?php echo $sort_news; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_news; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_news; ?>"><?php echo $column_news; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'c.author') { ?>
                <a href="<?php echo $sort_author; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_author; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_author; ?>"><?php echo $column_author; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'c.date_added') { ?>
                <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                <?php } ?></td>
			  <td class="left"><?php if ($sort == 'c.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($news_comments) { ?>
            <?php foreach ($news_comments as $news_comment) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($news_comment['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $news_comment['news_comment_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $news_comment['news_comment_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $news_comment['name']; ?></td>
              <td class="left"><?php echo $news_comment['author']; ?></td>
              <td class="left"><?php echo $news_comment['date_added']; ?></td>
			  <td align="center" width="100"><a class="ajax-status" id="status-<?php echo $news_comment['news_comment_id']; ?>"><?php echo $news_comment['status']; ?></a></td>
              <td class="center" width="60">
                <div class="button-action">
				  <a style="text-decoration: none;" href="<?php echo $link;?>&news_comment_edit&news_comment_id=<?php echo $news_comment['news_comment_id'];?>" class="news_comment_dialog button_edites tooltip" title="<?php echo $button_edit; ?>" /></a>
                </div>
			  </td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
		  <tfoot>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'nd.name') { ?>
                <a href="<?php echo $sort_news; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_news; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_news; ?>"><?php echo $column_news; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'c.author') { ?>
                <a href="<?php echo $sort_author; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_author; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_author; ?>"><?php echo $column_author; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'c.date_added') { ?>
                <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                <?php } ?></td>
			  <td class="left"><?php if ($sort == 'c.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </tfoot>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
	<div class="foot_heading">
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function getNews() {
	$('input[name=\'news\']').autocomplete({
		delay: 500,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/news/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {		
					response($.map(json, function(item) {
						return {
							label: item.name,
							value: item.news_id
						}
					}));
				}
			});
		},
		select: function(event, ui) {
			$('input[name=\'news\']').val(ui.item.label);
			$('input[name=\'news_id\']').val(ui.item.value);
			
			return false;
		},
		focus: function(event, ui) {
			return false;
		}
	});
}
//--></script> 
<script type="text/javascript"><!--
$('a.news_comment_dialog').live('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    $('<div id="open-dialog" class="hidden"></div>').appendTo('body')
    .load(link,null, function(){
        $(this).dialog({
			title: '<?php echo $text_news_cooment; ?>',
			modal: true,
			resizable: true,
			width: 900,
			height: 500,
			buttons: {
				'<?php echo $button_save; ?>': function() {
					$.post(link, $('#news-comment-form').serialize(), function(response){
					})
                $(this).dialog("close"); $(this).remove();
				},
				'<?php echo $button_cancel; ?>': function(){
					$(this).dialog("close"); $(this).remove();
				},
			},
			close: function(){
				$(this).remove();
			}
		});
    });
});
$('.ajax-status').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=catalog/news_comment/changeStatus&token=<?php echo $token; ?>',
		type: 'get',
		data: {object_id:object_id},
		dataType: 'html',
		success: function(html) {
			if(html!=''){				
				$('#'+object_id).html(html);
			}
		}
	});
});
$("span.tooltip, a.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script>
<?php echo $footer; ?>