<?php echo $header; ?>
<div class="breadcrumb">
   <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
   <?php } ?>
</div>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <div class="main-content">
  <b><?php echo $text_critea; ?></b>
  <div class="content">
    <p><?php echo $entry_search; ?>
      <?php if ($search) { ?>
      <input type="text" name="search" value="<?php echo $search; ?>" />
      <?php } else { ?>
      <input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
      <?php } ?>
      <select name="news_category_id">
        <option value="0"><?php echo $text_news_category; ?></option>
        <?php foreach ($news_categories as $news_category_1) { ?>
        <?php if ($news_category_1['news_category_id'] == $news_category_id) { ?>
        <option value="<?php echo $news_category_1['news_category_id']; ?>" selected="selected"><?php echo $news_category_1['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $news_category_1['news_category_id']; ?>"><?php echo $news_category_1['name']; ?></option>
        <?php } ?>
        <?php foreach ($news_category_1['children'] as $news_category_2) { ?>
        <?php if ($news_category_2['news_category_id'] == $news_category_id) { ?>
        <option value="<?php echo $news_category_2['news_category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $news_category_2['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $news_category_2['news_category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $news_category_2['name']; ?></option>
        <?php } ?>
        <?php foreach ($news_category_2['children'] as $news_category_3) { ?>
        <?php if ($news_category_3['news_category_id'] == $news_category_id) { ?>
        <option value="<?php echo $news_category_3['news_category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $news_category_3['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $news_category_3['news_category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $news_category_3['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php } ?>
      </select>
      <?php if ($sub_news_category) { ?>
      <input type="checkbox" name="sub_news_category" value="1" id="sub_news_category" checked="checked" />
      <?php } else { ?>
      <input type="checkbox" name="sub_news_category" value="1" id="sub_news_category" />
      <?php } ?>
      <label for="sub_news_category"><?php echo $text_sub_news_category; ?></label>
    </p>
    <?php if ($description) { ?>
    <input type="checkbox" name="description" value="1" id="description" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="description" value="1" id="description" />
    <?php } ?>
    <label for="description"><?php echo $entry_description; ?></label>
  </div>
  <div class="buttons">
    <div class="right"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" /></div>
  </div>
  <h2><?php echo $text_search; ?></h2>
  <?php if ($news) { ?>
  <div class="product-filter">
    <div class="display"><?php echo $text_display; ?></div>
    <div class="limit"><?php echo $text_limit; ?>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <div class="product-list">
    <?php foreach ($news as $article) { ?>
    <div>
      <?php if ($article['thumb']) { ?>
        <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
      <?php } else { ?>
	    <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['no_image']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
	  <div class="description-list top"><?php echo $article['description_list']; ?></div>
	  <div class="description-grid"><?php echo $article['description_grid']; ?></div>
	  <div class="data-news"><a href="<?php echo $article['href']; ?>" class="poshytips button-more" title="<?php echo $button_more; ?>"></a><div class="info"><span class="date-available"><?php echo $article['date_available']; ?></span><span class="poshytips viewed" title="<?php echo $article['viewed']; ?>"></span><span class="poshytips comments" title="<?php echo $article['news_comments']; ?>"></span></div></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  </div>
  <div class="bottom"></div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'news_category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_news_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_news_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_news_category\']').removeAttr('disabled');
	}
});

$('select[name=\'news_category_id\']').trigger('change');

$('#button-search').on('click', function() {
	url = 'index.php?route=news/search';
	
	var search = $('#content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var news_category_id = $('#content select[name=\'news_category_id\']').attr('value');
	
	if (news_category_id > 0) {
		url += '&news_category_id=' + encodeURIComponent(news_category_id);
	}
	
	var sub_news_category = $('#content input[name=\'sub_news_category\']:checked').attr('value');
	
	if (sub_news_category) {
		url += '&sub_news_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '';			
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '  <div class="data-news" style="width: <?php echo $width; ?>px;">' + $(element).find('.data-news').html() + '</div>';
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description-list top">' + $(element).find('.description-list').html() + '</div>';
			html += '  <div class="description-grid">' + $(element).find('.description-grid').html() + '</div>';
						
			$(element).html(html);
		});	
		
		$('.poshytips').poshytip({
			className: 'tip-twitter',
			showTimeout: 1,
			alignTo: 'target',
			alignX: 'center',
			offsetY: 5,
			allowTipHover: false
		});
		
		$('.display').html('<?php echo $text_display; ?>&nbsp;<img align="absmiddle" src="catalog/view/theme/default/image/icon/list-icon-active.png">&nbsp;<a onclick="display(\'grid\');"><img align="absmiddle" src="catalog/view/theme/default/image/icon/grid-icon.png" title="<?php echo $text_grid; ?>"></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="data-news">' + $(element).find('.data-news').html() + '</div>';
			html += '  <div class="description-list top">' + $(element).find('.description-list').html() + '</div>';
			html += '  <div class="description-grid">' + $(element).find('.description-grid').html() + '</div>';
			
			$(element).html(html);
		});	
		
		$('.poshytips').poshytip({
			className: 'tip-twitter',
			showTimeout: 1,
			alignTo: 'target',
			alignX: 'center',
			offsetY: 5,
			allowTipHover: false
		});
					
		$('.display').html('<?php echo $text_display; ?>&nbsp;<a onclick="display(\'list\');"><img align="absmiddle" src="catalog/view/theme/default/image/icon/list-icon.png" title="<?php echo $text_list; ?>"></a>&nbsp;<img align="absmiddle" src="catalog/view/theme/default/image/icon/grid-icon-active.png">');

		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('list');
}
//--></script> 
<?php echo $footer; ?>