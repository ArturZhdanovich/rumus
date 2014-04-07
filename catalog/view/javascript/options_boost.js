/* configurable settings */
//(useSwatch NOT YET IMPLEMENTED yet. Leave false for now. WIll be updated in next release)
var useSwatch = false; // Set to true if you want to use smaller image for option image swapping. False to swap main image.

/* Theme Settings */
var img = '#image'; // The main image id

var origSrc 	= '';
var origTitle 	= '';
var origAlt 	= '';
var origPopup 	= '';

$(document).ready(function(){
	// Store original image source
	origSrc 	= $(img).attr('src');
	origTitle 	= $(img).attr('title');
	origAlt 	= $(img).attr('alt');
	origPopup 	= $(img).parent().attr('href');

	$(':input[name^="option"]').change(function(){
		obUpdate($(this), useSwatch);
	});
});


function obUpdate($this, $swatch) {

	// Set default
	$swatch = typeof($swatch) != 'undefined' ? $swatch : false;

	// Get Type for determining checked/unchecked for checkbox
	$checked = true;
	if ($this.is('input:checkbox') && !$this.is(':checked')) {
		$checked = false;
	}
	
	// Set variables...
	var option_id	= $this.attr('id');
	var option_name	= $this.attr('name');
	var option_val	= $this.val();

	// Remove existing option info
	$('#option_info').remove();
	$('.ob_ajax_error').remove();

	//if ($(option).val()) {
	if (option_val && $checked) {

		// ajax lookup
		$.ajax({
			type: 'post',
			url: 'index.php?route=product/product/updateImage',
			dataType: 'json',
			data: $(':input[name^="option"][type=\'checkbox\']:checked, :input[type=\'hidden\'], :input[name^="option"][type=\'radio\']:checked, select[name^="option"]').serialize() + '&option_value_id='+option_val,
			beforeSend: function() {
				if (!useSwatch) {
					$this.after('<img class="ob_loading" src="catalog/view/javascript/ajax_load_sm.gif" alt=""/>');
				}
			},
			success: function (data) {

				// Update the main image with the new image.
				var swatch 		= data.swatch;
				var thumb 		= data.thumb;
				var popup 		= data.popup;
				var info 		= data.ob_info;
				var stock       = data.quantity;
				var name	    = data.name;
                
				// Swap Image if exists...
				if (swatch && useSwatch) {
					// Remove existing image
					$('#option_image_'+select_id).parent().parent().remove();
					$(option).parent().parent().after('<td><a title="'+title+'" href="'+popup+'" id="zoom2" class = "cloud-zoom" rel="useZoom: "zoom1", smallImage: '+thumb+' " ><img id="option_image_'+select_id+'" src="'+swatch+'" alt="'+alt+'" title="'+title+'" /></a></td>');
					tb_init('.thickbox_option');
				} else if (thumb) {
					$(img).attr('src', thumb);
					$(img).attr('title', name);
					$(img).attr('alt', name);
					$(img).parent().attr('href', popup);
				}

				// Add under main image or popup
				if (info) {
					xinfo = info.replace("~~", "");
					if (info.indexOf("~~") != -1) { alert(xinfo); }
					$(img).parent().after('<p id="option_info">'+xinfo+'</p>');
					
				}

			},
			error: function (html) {
				// Create an error element that gets shown only on error, removed on success
				$('body').append('<span class="ob_ajax_error" style="font-size:8px;">Ajax Lookup Error. Please try again.</span>');
			},
			complete: function() {
				$('.ob_loading').remove();
			}
		});

	} else {
		$(img).attr('src', origSrc);
		$(img).attr('title', origTitle);
		$(img).attr('title', origAlt);
		$(img).parent().attr('href', origPopup);
	}
}