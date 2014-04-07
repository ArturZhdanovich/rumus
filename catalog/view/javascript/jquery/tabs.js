$.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		obj.click(function() {
			$(selector).removeClass('selected');
			
			$(this).addClass('selected');
			
			$($(this).attr('href')).fadeIn();
			
			$(selector).not(this).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};

$(document).ready(function(){
	$("a[data-gal^='prettyPhoto']").prettyPhoto({
        animation_speed: 'fast',
        autoplay_slideshow: true,
        slideshow: 4000,
        opacity: 0.5,
        show_title: false,
        theme: 'facebook',
        modal: false
    });
});