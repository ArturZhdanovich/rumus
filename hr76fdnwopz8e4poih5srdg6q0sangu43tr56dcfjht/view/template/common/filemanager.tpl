<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/lazyload/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="view/javascript/jquery/ui/external/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="view/javascript/jquery/jstree/jquery.tree.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script>
<script type="text/javascript" src="view/javascript/jquery/jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="view/javascript/jquery/jstree/plugins/jquery.tree.cookie.js"></script>
<style type="text/css">@import url(view/javascript/plupload/js/jquery.ui.plupload/css/jquery.ui.plupload.css);</style>
<script type="text/javascript" src="view/javascript/plupload/js/plupload.full.js"></script>
<script type="text/javascript" src="view/javascript/plupload/js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<script type="text/javascript" src="view/javascript/jquery-tooltip/jquery.tooltip.min.js"></script>
<link type="text/css" href="view/javascript/jquery-tooltip/jquery.tooltip.css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/filemanager.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/placeholder.js"></script>
</head>
<body>
<div id="container">
  <div id="menu">
    <div class="button-box-general"><a id="create" class="tooltip button-folder" title="<?php echo $button_folder; ?>"></a><a id="delete" class="button-delete tooltip" title="<?php echo $button_delete; ?>"></a></div>
	<div class="button-box-edit"><a id="move" class="button-move tooltip" title="<?php echo $button_move; ?>"></a><a id="copy" class="button-copy tooltip" title="<?php echo $button_copy; ?>"></a><a id="rename" class="button-rename tooltip" title="<?php echo $button_rename; ?>"></a></div>
	<div class="button-box-upload"><a id="upload" class="button-uploads tooltip" title="<?php echo $button_upload; ?>"></a><a id="uploadmulti" class="button-multiupload tooltip" title="<?php echo $button_multiupload; ?>"></a></div>
	<div class="button-box-update"><a id="refresh" class="button-update tooltip" title="<?php echo $button_refresh; ?>"></a><a id="updateImage" class="button-insert tooltip" title="<?php echo $button_insert; ?>"></a></div>
    <div class="search-box"><input type="text" id="search" name="search" placeholder="<?php echo $text_image_search; ?>" /></div>
  </div>
  <div id="column-left"></div>
  <div id="column-right"></div>
  <div id="toolset">
    <button id="btnExpand" class="btn"><?php echo $expand_tree; ?></button>
    <button id="btnCollapse"  class="btn"><?php echo $collapse_tree; ?></button>
    <button id="btnListView" class="btn"><?php echo $list_view; ?></button>
    <button id="btnThumbView" class="btn"><?php echo $thumb_view; ?></button>
    <button id="btnTextView" class="btn"><?php echo $text_views; ?></button>
  </div>
<script type="text/javascript"><!--
$(document).ready(function() { 

	$('#toolset button:first').button({
            icons: {
                primary: "ui-icon-plus"
            }}).next().button({
            icons: {
                primary: "ui-icon-minus"
            }}).next().button({
            icons: {
                primary: "ui-icon-grip-dotted-horizontal"
            }}).next().button({
            icons: {
                primary: "ui-icon-image"
            }}).next().button({
            icons: {
                primary: "ui-icon-pencil"
            }})
			
	$('input#search').focus();

	function truncate(name, len) {
    var ext = name.substring(name.lastIndexOf(".") + 1, name.length).toLowerCase();
    var filename = name.replace('.' + ext,'');
    if(filename.length <= len) {
        return name;
    }
    filename = filename.substr(0, len) + (name.length > len ? '<span style="color: red;">&laquo;</span>' : '');
    return filename + '.' + ext;
	};
	
	function feedback(message, color) {
	
	$('#visualFeedback').stop().remove();
	html = '<div id="visualFeedback" class="draggable"></div>';
	$('#container').prepend(html);
	$( ".draggable" ).draggable({cursor : "move", revert : true});
	var box = $('#visualFeedback');
	box.css('background-color', ''+color+'').html('<span>'+message+'</span>').fadeIn(400).delay(2000).fadeOut(1500);
	box.hover(function() {
		$(this).stop(true, true).fadeIn();
		}, function() {
		$(this).fadeOut(1000);
		});
	};
	
	$('#column-left').tree({
		plugins : {
			cookie : {}
				},	
		data: { 
			type: 'json',
			async: true, 
			opts: { 
				method: 'post', 
				url: 'index.php?route=common/filemanager/directory&token=<?php echo $token; ?>'
			} 
		},
		selected: 'top',
		ui: {		
			theme_name: 'classic',
			animation: 50
		},	
		types: { 
			'default': {
				clickable: true,
				creatable: false,
				renameable: false,
				deletable: false,
				draggable: false,
				max_children: -1,
				max_depth: -1,
				valid_children: 'all'
			}
		},
		callback: {
			beforedata: function(NODE, TREE_OBJ) { 
				if (NODE == false) {
					TREE_OBJ.settings.data.opts.static = [ 
						{
							data: 'image',
							attributes: { 
								'id': 'top',
								'directory': ''
							}, 
							state: 'closed'
						}
					];
					
					return { 'directory': '' } 
					$('#column-left a.clicked').prepend('(' + json.length + ')');
				} else {
					TREE_OBJ.settings.data.opts.static = false;  
					
					return { 'directory': $(NODE).attr('directory') } 
				}
			},		
			onselect: function (NODE, TREE_OBJ) {
				var dr;
				var tree = $.tree.reference('#column-left a');
				window.dr = $(tree.selected).attr('directory');
				feedback('<img src="view/image/loading.gif" class="loading" style="" /><span style="padding-left: 10px; display: inline;"><?php echo $loading; ?></span>', 'red');
				
				$.ajax({
					url: 'index.php?route=common/filemanager/files&token=<?php echo $token; ?>',
					type: 'post',
					data: 'directory=' + encodeURIComponent($(NODE).attr('directory')),
					dataType: 'json',
					success: function(json) {
						html = '<div>';
						
						if (json.length == 0) {
						
							feedback('<?php echo $no_files_found; ?>', 'red');
							} else {
							feedback("<?php echo $files_found; ?>" + json.length + "<?php echo $files_count; ?>", 'green');
							for (i = 0; i < json.length; i++) {
								name = '';
								filename = json[i]['filename'];
								name += truncate(filename, 20);
								size = json[i]['size']; 
								html += '<a  file="' + json[i]['file'] + '" style="display: none; float: left;" title="' + filename +'"><span class="fileName">' + name + '</span><span class="fileSize">' + size + '</span><input type="hidden" name="image" value="' + json[i]['file'] + '" /></a>';
							}			
						}
						
						html += '</div>';
						
						$('#column-right').html(html);
												
						$('#column-right a').each(function(index, element) {
							$.ajax({
								url: 'index.php?route=common/filemanager/image_manager&token=<?php echo $token; ?>&image=' + encodeURIComponent('data/' + $(element).find('input[name=\'image\']').attr('value')),
								dataType: 'html',
								success: function(html) {
									$(element).prepend('<img src="' + html + '" title="" style="" /><br />');
									
									$(element).fadeIn();
								}
							});
						}); 


					},
					
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				}); 
			},
				onopen: function(NODE, TREE_OBJ) {
				var tr = $('#column-left li#top li[directory]');
				tr.each(function(index, domEle) {
				dd = $(domEle).attr('directory');
				dd = dd.replace(/\//g, ""); 
				dd = dd.replace(" ", ""); 
				$(domEle).attr('id', dd);
				});
				var myTree = $.tree.reference('#column-left');
				var cc = $.cookie('selected');
				var bb = '#' + cc;
				myTree.select_branch(bb);
				
				} //end onopen
		}
	});	
	
	$('input#search').click(function() {
	var x = $('#column-right span.fileName');
	x.each(function() {
		$(this).parent().css('display', '');
		$(this).parent().css('display', '');
		$(this).parent().next().css('display', '');
	});
	search.value = "";
	});
	
$('input#search').keyup(function(event) {
		$('input#search').focus();
		var search_text = $('input#search').val();
		var rg = new RegExp(search_text,'i');
		$('#column-right span.fileName').each(function(){
 			if($.trim($(this).html()).search(rg) == -1) {
				$(this).parent().css('display', 'none');
				$(this).parent().next().css('display', 'none');
				$(this).parent().next().next().css('display', 'none');
			}	
			else {
				$(this).parent().css('display', '');
				$(this).parent().next().css('display', '');
				$(this).parent().next().next().css('display', '');
			}
		});
	});

	$('#btnExpand').click( function() {
		var myTree= $.tree.focused();
        myTree.open_all('#top');
		myTree.refresh(myTree.selected);
	});
	
	$('#btnCollapse').click( function() {
		var myTree= $.tree.focused();
        myTree.close_all('#top');
		myTree.refresh(myTree.selected);
	});

	$('#btnTextView').click( function() {
		$('#column-right a img').hide();
		
	$('#column-right a').each(function(index, e2) {
			$('span.fileSize').hide();
			$(e2).css({
			'width' : '30%',
			'height' : '20px',
			'padding' : '0',
			'float' : 'left',
			'text-align' : 'left'
			});
			$('span.fileName').css({
			'margin-top' : '-10px',
			'margin-left' : '15px',
			});
		});

	});	
	
	$('#btnListView').click( function() {
		$('#column-right a img').show();
		$('#column-right a img').each(function(index, e1) {
			$(e1).css({
			'width' : '35px',
			'height' : '35px',
			'float' : 'left',
			'padding' : '3px',
			'text-align' : 'center'
			});
		});
		
	$('#column-right a').each(function(index, e2) {
			$('span.fileSize').hide();
			$(e2).css({
			'width' : '30%',
			'height' : '40px',
			'padding' : '0',
			'float' : 'left',
			'text-align' : 'center'
			});
			$('span.fileName').css({
			'margin-top' : '',
			'margin-left' : '',
			});
		});
	
		
	});
	
	$('#btnThumbView').click( function() {
		$('#column-right a img').show();
		$('#column-right a img').each(function(index, e1) {
			$(e1).css({
			'width' : '50px',
			'height' : '50px',
			'float' : 'none',
			'padding' : '0px',
			});
		});
		
	$('#column-right a').each(function(index, e2) {
			$('span.fileSize').show();
			$(e2).css({
			'width' : 'auto',
			'height' : 'auto',
			'padding' : '5px',
			'margin' : '5px',
			'float' : 'left',
			'text-align' : 'center'
			});
			$('span.fileName').css({
			'margin-top' : '',
			'margin-left' : '',
			});
		});
	});

	$('#column-right a').live('click', function() {
		if ($(this).attr('class') == 'selected') {
			$(this).removeAttr('class');
		} else {
			$('#column-right a').removeAttr('class');
			
			$(this).attr('class', 'selected');
			$('#updateImage').attr('file', $(this).attr('file'));
		}
	});
	
	$('#column-right a').live('dblclick', function() {
		<?php if ($fckeditor) { ?>
		window.opener.CKEDITOR.tools.callFunction(<?php echo $fckeditor; ?>, '<?php echo $directory; ?>' + $(this).find('input[name=\'image\']').attr('value'));

		
		self.close();	
		<?php } else { ?>
		parent.$('#<?php echo $field; ?>').attr('value', 'data/' + $(this).find('input[name=\'image\']').attr('value'));

		parent.$('#dialog').dialog('close');
		
		parent.$('#dialog').remove();	
		<?php } ?>
	});		
						
	$('#create').bind('click', function() {
		var tree = $.tree.focused();
		
		if (tree.selected) {
			$('#dialog').remove();
			
			html  = '<div id="dialog">';
			html += '<?php echo $entry_folder; ?> <input type="text" name="name" value="" /> <input type="button" value="<?php echo $button_submit; ?>" />';
			html += '</div>';
			
			$('#column-right').prepend(html);
			
			$('#dialog').dialog({
				title: '<?php echo $button_folder; ?>',
				resizable: false
			});	
			
			$('#dialog input[type=\'button\']').bind('click', function() {
				$.ajax({
					url: 'index.php?route=common/filemanager/create&token=<?php echo $token; ?>',
					type: 'post',
					data: 'directory=' + encodeURIComponent($(tree.selected).attr('directory')) + '&name=' + encodeURIComponent($('#dialog input[name=\'name\']').val()),
					dataType: 'json',
					success: function(json) {
						if (json.success) {
							$('#dialog').remove();
							
							tree.refresh(tree.selected);
							
							feedback(json.success, 'green');

						} else {
							feedback(json.error, 'red');

						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			});
		} else {
			alert('<?php echo $error_directory; ?>');	
		}
	});


		$('#delete').bind('click', function () {
		var path = $('#column-right a.selected').attr('file');
		var fldr = $('#column-left a.clicked').html();
		fldr = fldr.replace("<ins>&nbsp;</ins>", "");

		if(path==undefined){
         $('#dialog').remove();
		
		html  = '<div id="dialog">';
		html += '<p><?php echo $text_warning; ?>' + '<span style="font-weight: bold;"> "' + fldr + '"' +'</span><br />';
		html += '<?php echo $text_warning_conf; ?></p>';
		html += '</div>';

		$('#column-right').prepend(html);
		
		$( "#dialog" ).dialog({
			resizable: false,
			height:165,
			width: 380,
			modal: true,
			title: '<?php echo $title_folder_delete; ?>',
			buttons: {
				<?php echo $button_delete; ?>: function() {

			var tree = $.tree.focused();
			
			if (tree.selected) {
				$.ajax({
					url: 'index.php?route=common/filemanager/delete&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'path=' + encodeURIComponent($(tree.selected).attr('directory')),
					dataType: 'json',
					success: function(json) {
						if (json.success) {
							var tt = tree.prev(tree.selected);
							tree.refresh(tree.parent(tree.selected));

							tree.select_branch(tt);

							feedback(json.success, 'green');

						} 
						
						if (json.error) {
							feedback(json.error, 'red');

						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}

				});			
			} 
			
			$( this ).dialog( "close" );
				},
				<?php echo $button_cancel; ?>: function() {
					$( this ).dialog( "close" );
				}
			}
		});

		}
		else if (path) {
		var file = path.substring(path.lastIndexOf('/') + 1).toLowerCase();
		
		$('#dialog').remove();
		
		html  = '<div id="dialog">';
		html += '<p><?php echo $file_delete; ?>' + '<span style="font-weight: bold;"> "' + file + '"' +'</span></p>';
		html += '</div>';

		$('#column-right').prepend(html);
		
		$( "#dialog" ).dialog({
			resizable: false,
			height: 150,
			width: 420,
			modal: true,
			title: '<?php echo $title_file_delete; ?>',
			buttons: {
				<?php echo $button_delete; ?>: function() {
					var tree = $.tree.focused();
			
			$.ajax({
				url: 'index.php?route=common/filemanager/delete&token=<?php echo $token; ?>',
				type: 'POST',
				data: 'path=' + path,
				dataType: 'json',
				success: function(json) {
					if (json.success) {
						var tree = $.tree.focused();
					
						tree.select_branch(tree.selected);

						feedback(json.success, 'green');
					}
					
					if (json.error) {
						feedback(json.error, 'red');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});	
			
			$( this ).dialog( "close" );
				},
				<?php echo $button_cancel; ?>: function() {
					$( this ).dialog( "close" );
				}
			}
		});
	} 
	});
	
	$('#move').bind('click', function() {
		$('#dialog').remove();
		
		html  = '<div id="dialog">';
		html += '<?php echo $entry_move; ?> <select name="to"></select> <input type="button" value="<?php echo $button_submit; ?>" />';
		html += '</div>';

		$('#column-right').prepend(html);
		
		$('#dialog').dialog({
			title: '<?php echo $button_move; ?>',
			resizable: false
		});

		$('#dialog select[name=\'to\']').load('index.php?route=common/filemanager/folders&token=<?php echo $token; ?>');
		
		$('#dialog input[type=\'button\']').bind('click', function() {
			path = $('#column-right a.selected').find('input[name=\'image\']').attr('value');
							 
			if (path) {																
				$.ajax({
					url: 'index.php?route=common/filemanager/move&token=<?php echo $token; ?>',
					type: 'post',
					data: 'from=' + encodeURIComponent(path) + '&to=' + encodeURIComponent($('#dialog select[name=\'to\']').val()),
					dataType: 'json',
					success: function(json) {
						if (json.success) {
							$('#dialog').remove();
							
							var tree = $.tree.focused();
							
							tree.select_branch(tree.selected);
							
							feedback(json.success, 'green');

						}
						
						if (json.error) {
							feedback(json.error, 'red');

						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			} else {
				var tree = $.tree.focused();
				
				$.ajax({
					url: 'index.php?route=common/filemanager/move&token=<?php echo $token; ?>',
					type: 'post',
					data: 'from=' + encodeURIComponent($(tree.selected).attr('directory')) + '&to=' + encodeURIComponent($('#dialog select[name=\'to\']').val()),
					dataType: 'json',
					success: function(json) {
						if (json.success) {
							$('#dialog').remove();
							
							tree.select_branch('#top');
								
							tree.refresh(tree.selected);
							
							feedback(json.success, 'green');

						}						
						
						if (json.error) {
							feedback(json.error, 'red');

						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}
		});
	});

		$('#updateImage').bind('click', function () { 
		
		if ($(this).attr('file') == "") {
		
		$('#dialog').remove();
		
		html  = '<div id="dialog">';
		html += '<p><?php echo $no_image_selected; ?>';
		html += '</p>';
		html += '</div>';

		$('#column-right').prepend(html);
		
		$( "#dialog" ).dialog({
			resizable: false,
			height: 130,
			width: 380,
			modal: true,
			title: '<?php echo $title_no_image_selected; ?>',
			buttons: {
				<?php echo $text_ok; ?>: function() {
					$('#dialog').remove();
					}
					}
					})
					}
					 else {
	
		<?php if ($fckeditor) { ?>
		window.opener.CKEDITOR.tools.callFunction(<?php echo $fckeditor; ?>, '<?php echo $directory; ?>' + $(this).attr('file'));
		
		self.close();	
		<?php } else { ?>
		//parent.$('#<?php echo $field; ?>').attr('value', 'data/' + $(this).find('input[name=\'image\']').attr('value'));
		parent.$('#<?php echo $field; ?>').attr('value', 'data/' + $(this).attr('file'));
		parent.$('#dialog').dialog('close');
		
		parent.$('#dialog').remove();	
		<?php } ?>
	};
	
	});
	
	$('#copy').bind('click', function() {
		$('#dialog').remove();
		
		html  = '<div id="dialog">';
		html += '<?php echo $entry_copy; ?> <input type="text" name="name" value="" /> <input type="button" value="<?php echo $button_submit; ?>" />';
		html += '</div>';

		$('#column-right').prepend(html);
		
		$('#dialog').dialog({
			title: '<?php echo $button_copy; ?>',
			resizable: false
		});
		
		$('#dialog select[name=\'to\']').load('index.php?route=common/filemanager/folders&token=<?php echo $token; ?>');
		
		$('#dialog input[type=\'button\']').bind('click', function() {
			path = $('#column-right a.selected').find('input[name=\'image\']').attr('value');
							 
			if (path) {																
				$.ajax({
					url: 'index.php?route=common/filemanager/copy&token=<?php echo $token; ?>',
					type: 'post',
					data: 'path=' + encodeURIComponent(path) + '&name=' + encodeURIComponent($('#dialog input[name=\'name\']').val()),
					dataType: 'json',
					success: function(json) {
						if (json.success) {
							$('#dialog').remove();
							
							var tree = $.tree.focused();
							
							tree.select_branch(tree.selected);
							
							feedback(json.success, 'green');

						}						
						
						if (json.error) {
							feedback(json.error, 'red');

						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			} else {
				var tree = $.tree.focused();
				
				$.ajax({
					url: 'index.php?route=common/filemanager/copy&token=<?php echo $token; ?>',
					type: 'post',
					data: 'path=' + encodeURIComponent($(tree.selected).attr('directory')) + '&name=' + encodeURIComponent($('#dialog input[name=\'name\']').val()),
					dataType: 'json',
					success: function(json) {
						if (json.success) {
							$('#dialog').remove();
							
							tree.select_branch(tree.parent(tree.selected));
							
							tree.refresh(tree.selected);
							
							feedback(json.success, 'green');

						} 						
						
						if (json.error) {
							feedback(json.error, 'red');

						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}
		});	
	});
	
	$('#rename').bind('click', function() {
		$('#dialog').remove();
		
		html  = '<div id="dialog">';
		html += '<?php echo $entry_rename; ?> <input type="text" name="name" value="" /> <input type="button" value="<?php echo $button_submit; ?>" />';
		html += '</div>';

		$('#column-right').prepend(html);
		
		$('#dialog').dialog({
			title: '<?php echo $button_rename; ?>',
			resizable: false
		});
		
		$('#dialog input[type=\'button\']').bind('click', function() {
			path = $('#column-right a.selected').find('input[name=\'image\']').attr('value');
							 
			if (path) {		
				$.ajax({
					url: 'index.php?route=common/filemanager/rename&token=<?php echo $token; ?>',
					type: 'post',
					data: 'path=' + encodeURIComponent(path) + '&name=' + encodeURIComponent($('#dialog input[name=\'name\']').val()),
					dataType: 'json',
					success: function(json) {
						if (json.success) {
							$('#dialog').remove();
							
							var tree = $.tree.focused();
					
							tree.select_branch(tree.selected);
							
							feedback(json.success, 'green');

						} 
						
						if (json.error) {
							feedback(json.error, 'red');

						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});			
			} else {
				var tree = $.tree.focused();
				
				$.ajax({ 
					url: 'index.php?route=common/filemanager/rename&token=<?php echo $token; ?>',
					type: 'post',
					data: 'path=' + encodeURIComponent($(tree.selected).attr('directory')) + '&name=' + encodeURIComponent($('#dialog input[name=\'name\']').val()),
					dataType: 'json',
					success: function(json) {
						if (json.success) {
							$('#dialog').remove();
								
							tree.select_branch(tree.parent(tree.selected));
							
							tree.refresh(tree.selected);
							
							feedback(json.success, 'green');

						} 
						
						if (json.error) {
							feedback(json.error, 'red');

						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		});		
	});
	
	new AjaxUpload('#upload', {
		action: 'index.php?route=common/filemanager/upload&token=<?php echo $token; ?>',
		name: 'image',
		autoSubmit: false,
		responseType: 'json',
		onChange: function(file, extension) {
			var tree = $.tree.focused();
			
			if (tree.selected) {
				this.setData({'directory': $(tree.selected).attr('directory')});
			} else {
				this.setData({'directory': ''});
			}
			
			this.submit();
		},
		onSubmit: function(file, extension) {
			$('#upload').append('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},
		onComplete: function(file, json) {
			if (json.success) {
				var tree = $.tree.focused();
					
				tree.select_branch(tree.selected);
				
				feedback(json.success, 'green');
			}
			
			if (json.error) {
				feedback(json.error, 'red');
			}
			
			$('.loading').remove();	
		}
	});
	
	$('#refresh').bind('click', function() {
		var tree = $.tree.focused();
		
		tree.refresh(tree.selected);
	});	
	
				var dr;
				var tree = $.tree.reference('#column-left a');
				$('#column-left a').live('click', function() {
				window.dr = $(tree.selected).attr('directory');
				})
				
	$('#uploadmulti').click(function() { 
		
			html  = '<div id="uploadMulti" title="<?php echo $multiple_upload; ?>">';
			html += '<div id="uploader"></div>';
			html += '</div>';
			
			$('#column-left').prepend(html);
		
		$('#uploadMulti').dialog({ 
		height: '355', 
		width: '760', 
		modal: true,
		resizable: false,
		create: function(event, ui) {
		
		var tree = $.tree.focused();
		
		$("#uploader").plupload({
		
		runtimes : 'flash,html5',
		url : 'index.php?route=common/filemanager/multi&token=<?php echo $token; ?>&directory=' + window.dr,
		max_file_size : '5mb', // allowed by OC '300kb', 
		chunk_size : '1mb',
		unique_names : false,

		resize : {width : 800, height : 600, quality : 90},
		
		filters : [
			{title : "<?php echo $allowed_files; ?>", extensions : "jpg,gif,png,pdf,zip,swf"} //,
		],

		flash_swf_url : 'view/javascript/plupload/js/plupload.flash.swf',
		silverlight_xap_url : 'view/javascript/plupload/js/plupload.silverlight.xap'
	});

	$('form').submit(function(e) {
        var uploader = $('#uploader').plupload('getUploader');
		var tree = $.tree.reference('#column-left');
		
        if (uploader.files.length > 0) {
            
            uploader.bind('StateChanged', function() {
                if (uploader.files.length === (uploader.total.uploaded + uploader.total.failed)) {
                    $('form')[0].submit();
                }
            });
			                
            uploader.start();

        } else
            alert('<?php echo $upload_one_file; ?>');

        return false;

		});
			},
			
			close: function(event, ui) {
				var tree = $.tree.reference('#column-left');
				//tree.refresh(tree.selected); // doesnt work at times 
				tree.refresh(); // works all the time but takes time to refresh the whole tree
				var uploader = $('#uploader').plupload('getUploader');
				
				$('#uploadMulti').remove();
				
			}
			
			})
				
		})

		// end Upload+ main code
});
//--></script>
<script type="text/javascript"><!--
$("a.tooltip, img.tooltip, div.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script>
</body>
</html>