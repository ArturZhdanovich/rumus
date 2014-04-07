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
        $.colorbox({width: '500px',  transition: 'elastic', html: "<div class='free_popup_cart'>" + json['success'] + "<br /><a class='button' href='index.php?route=checkout/checkout'>Оформить заказ</a></div>", title:"" });
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
        $.colorbox({width: '500px',  transition: 'elastic', html: "<div class='free_popup_cart'>" + json['success'] + "<br /><a class='button' href='index.php?route=account/wishlist'>Открыть закладки</a></div>", title:"" });
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
        $.colorbox({width: '500px',  transition: 'elastic', html: "<div class='free_popup_cart'>" + json['success'] + "<br /><a class='button' href='index.php?route=product/compare'>Открыть сравнения</a></div>", title:"" });
        $('#compare-total').html(json['total']);
      }
		}
	});
}