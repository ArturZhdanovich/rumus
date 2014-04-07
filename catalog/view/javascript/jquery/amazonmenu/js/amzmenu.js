/*-----------------------------------------------------
//	AmazonMenu II for Opencart v1.5.4   
// Created by villagedefrance                          
// contact@villagedefrance.net                                                                      
//-----------------------------------------------------
*/

(function($){
	$.fn.amzmenu = function(settings){
	var element = $(this);
	var settings = $.extend({}, $.fn.amzmenu.defaults, settings);

	function _build(){
		element.children('li').mouseenter(function(){
			if($(this).hasClass('hover')){ return; }
            _hideAllSubLevels();
			if(!_subLevelExists($(this))){ return; }
            var subLevel = $(this).children('ul');
            _showHideSubLevel(subLevel, true);	
            if(!$(this).hasClass('active')){
            	var initWidth = $(this).children('a').attr('init-width');
            	$(this).children('a').animate({width: initWidth},'fast');
           	}
		}); 
		element.children('li').mouseleave(function(){
			var subLevel = $(this).children('ul');
			_showHideSubLevel(subLevel, false);
			if(!$(this).hasClass('active')){
				$(this).children('a').animate({width: 168},'fast');
			}
		});
	};
	
	function _hideAllSubLevels(){
		element.children('li').children('ul').each(function(){
			$(this).hide();
			$(this).parent().removeClass('hover');
		});
	};
	
	function _showHideSubLevel(subLevel, isShow){
		if(isShow){
			subLevel.parent().addClass('hover');
			if(settings.showSpeed != ''){ subLevel.fadeIn( settings.showSpeed ); } 
			else { subLevel.show(); }
		} else {
			subLevel.parent().removeClass('hover');
			if(settings.hideSpeed != ''){ subLevel.fadeOut( settings.hideSpeed ); } 
			else { subLevel.hide(); }
		}
	};
	
	function _subLevelExists(obj){
		return obj.children('ul').length > 0;
	};
	
	_build();
};

$.fn.amzmenu.defaults = {
	showSpeed:	'fast',
	hideSpeed:  	'fast'
};
})(jQuery);