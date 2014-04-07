<div>
<table class="form">
  <tr>
	<td style="width: 50px;">
	  <?php if ($news_image['image']) { ?>
		<img src="<?php echo $news_image; ?>" />
	  <?php } else { ?>
		<img src="<?php echo $news_no_image; ?>" />
	  <?php } ?>
	</td>
    <td><b><?php echo $news_name; ?></b></td>
  </tr>
</table>
<form action="POST" id="related-form">
  <table class="form">
    <tr>
	  <td><?php echo $entry_related; ?></td>
      <td><input type="text" name="related" value="" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>
	    <div class="scrollbox" id="product-related">
          <?php $class = 'odd'; ?>
          <?php foreach ($news_related as $news_related) { ?>
            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
            <div id="product-related<?php echo $news_related['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $news_related['name']; ?><img src="view/image/delete.png" />
              <input type="hidden" name="news_related[]" value="<?php echo $news_related['product_id']; ?>" />
            </div>
          <?php } ?>
        </div>
	  </td>
	  <td></td>
	</tr>
	<tr>
	  <td><?php echo $entry_relateds_news; ?></td>
      <td>
	    <div class="scrollbox" style="height: 270px;">
          <?php $class = 'odd'; ?>
          <?php foreach ($relateds_news as $related_news) { ?>
            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
            <div class="<?php echo $class; ?>">
              <?php if (in_array($related_news['news_id'], $news_related_article)) { ?>
                <input type="checkbox" name="news_related_article[]" value="<?php echo $related_news['news_id']; ?>" checked="checked" />
                <?php echo $related_news['name']; ?>
              <?php } else { ?>
                <input type="checkbox" name="news_related_article[]" value="<?php echo $related_news['news_id']; ?>" />
                <?php echo $related_news['name']; ?>
              <?php } ?>
            </div>
          <?php } ?>
        </div>
		<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
	  </td>
	</tr>
  </table>
</form>
</div>
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});
// Related
$('input[name=\'related\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-related' + ui.item.value).remove();
		
		$('#product-related').append('<div id="product-related' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="news_related[]" value="' + ui.item.value + '" /></div>');

		$('#product-related div:odd').attr('class', 'odd');
		$('#product-related div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-related div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-related div:odd').attr('class', 'odd');
	$('#product-related div:even').attr('class', 'even');	
});
//--></script> 