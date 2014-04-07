$(document).ready(function() {
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
	
	$('.dropdown').hover(function() {
		$(this).find('.dropdown-block').stop(true, true).slideDown(300);
	},function() {
		$(this).find('.dropdown-block').stop(true, true).slideUp(100);
	});
	
	$('.dropdown').hover(function() {
		$(this).find('.dropdown-box').stop(true, true).slideDown(300);
	},function() {
		$(this).find('.dropdown-box').stop(true, true).slideUp(100);
	});
	
	$('.dropdown-level').hover(function() {
		$(this).find('.dropdown-block-level').stop(true, true).slideDown(300);
	},function() {
		$(this).find('.dropdown-block-level').stop(true, true).slideUp(100);
	});
	
	$('.poshytips').poshytip({
		className: 'tip-twitter',
		showTimeout: 1,
		alignTo: 'target',
		alignX: 'center',
		offsetY: 5,
		allowTipHover: false
	});
	
	$('.poshytips-bottom').poshytip({
		className: 'tip-twitter',
		showTimeout: 1,
		alignTo: 'target',
		alignX: 'center',
		alignY:	'bottom',
		offsetX: 5,
		allowTipHover: false
	});
	
	$('.poshytips-left').poshytip({
		className: 'tip-twitter',
		showTimeout: 1,
		alignTo: 'target',
		alignX: 'left',
		alignY:	'center',
		offsetX: 5,
		allowTipHover: false
	});
	
	$('.poshytips-right').poshytip({
		className: 'tip-twitter',
		showTimeout: 1,
		alignTo: 'target',
		alignX: 'right',
		alignY:	'center',
		offsetX: 5,
		allowTipHover: false
	});
	
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		width:"1050px",
		height:"750px",
		fixed:true,
		rel: "colorbox"
	});
	
	$('li.active > a.category-button').addClass('detailed');
	$('ul.box-category .category-button').removeAttr('href');
	$('ul.box-category li.active > ul').slideToggle(200);

	$('ul.box-category a.category-button').click(function() {
		$(this).toggleClass('detailed').closest('li').find('> ul').slideToggle(200);
		$(this).closest('ul').find('.detailed').not(this).toggleClass('detailed').closest('li').find('> ul').slideToggle(200);
	});
	
	$('ul.box-filter a.category-button').click(function() {
		$(this).closest('li').find('> ul').slideToggle(200);
	});

});

function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}
function addToCartQuick(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.message-success, .message-warning, .message-attention, .message-information, .message-error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}	
			
			if (json['success']) {
				$('#message-success').after('<div class="message-success" style="display: none;">' + json['success'] + '</div>');
				
				$('.message-success').fadeIn(500).delay(4000).fadeOut(1000);

				$('#cart-total').html(json['total']);
			}	
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}
function addToWishListQuick(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.message-success, .message-warning, .message-attention, .message-information').remove();

			if (json['success']) {
				$('#message-success').after('<div class="message-success" style="display: none;">' + json['success'] + '</div>');
				
				$('.message-success').fadeIn(500).delay(4000).fadeOut(1000);

				$('#wishlist-total').html(json['total']);
			}	
		}
	});
}
function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				$('#compare-total-header').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}
function addToCompareQuick(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.message-success, .message-warning, .message-attention, .message-information').remove();

			if (json['success']) {
				$('#message-success').after('<div class="message-success" style="display: none;">' + json['success'] + '</div>');
				
				$('.message-success').fadeIn(500).delay(4000).fadeOut(1000);

				$('#compare-total').html(json['total']);
				$('#compare-total-header').html(json['total']);
			}				
		}
	});
}