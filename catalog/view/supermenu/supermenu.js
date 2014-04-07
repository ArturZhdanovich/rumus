$(document).ready(function() {
    
	$('#supermenu ul > li > a + div').each(function(index, element) {	
		
		var supermenu = $('#supermenu').offset();
		var ddown = $(this).parent().offset();
		
		i = (ddown.left + $(this).outerWidth()) - (supermenu.left + $('#supermenu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});
});