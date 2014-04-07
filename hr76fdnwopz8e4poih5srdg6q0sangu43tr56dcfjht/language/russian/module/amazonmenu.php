<?php
//-----------------------------------------------------
// AmazonMenu II for Opencart v1.5.4   
// Created by villagedefrance                          
// contact@villagedefrance.net                                    
//-----------------------------------------------------

// Heading
$_['heading_title']    			= 'Amazon Menu II';

// Text
$_['text_module']      			= 'Modules';
$_['text_success']     			= 'Success: You have modified module Amazon Menu II!';
$_['text_column_left']    		= 'Column Left';
$_['text_column_right']    	= 'Column Right';
$_['text_image_manager'] 	= 'Image Manager';
$_['text_browse']            	= 'Browse Files';
$_['text_clear']             		= 'Clear Image';
$_['text_order']             	= 'Must match the corresponding Top Category sort order.';
$_['text_link']             		= 'Type "none" if a Link is not needed.';
$_['text_module_settings']  = 'Note: these settings will be applied to all the modules in the list below.';
$_['text_module_help']  		= '<b><u>Amazon Menu II Module Help:</u></b><br />
	Amazon Menu II displays up-to 3 levels of Categories.<br />
	<b>Category Sprites:</b><br />
	Sprites are displayed according to their Sort Order. Top Level Categories and Sprites Sort Orders Must match for the Images to show in the right Category.<br />
	Sprites Images are globally resizable and Size will be applied to all Sprites.<br />
	Sprites Links can be enable or disabled globally. If enabled but not specified, the default link will be Home page.<br />
	The use of PNG images with Alpha transparency is recommended for best effect, but JPEG and GIF formats are also supported.<br />
	<b>Category Keywords:</b><br />
	Keywords are retrieved from Top Categories and Level 1 Sub-categories when present in Categories.<br />
	If Sub-categories Level 2 exist, Keywords will be automatically hidden and Sub-categories Level 2 will be displayed.<br />
	Keywords can be turned On or Off for each layout and are limited in length to 70 Characters.';

// Column
$_['column_image']         	= 'Sprite';
$_['column_title']           	= 'Title';
$_['column_sort_order']  	= 'Sort Order';
$_['column_status']          	= 'Status';
$_['column_action']          	= 'Action';

// Tab
$_['tab_language']            	= 'Entries by Language';
$_['tab_setting']          		= 'Common Settings';
	
// Entry
$_['entry_titles']      			= 'Custom Title:<br /><span class="help">If empty and "Show Header" is set to yes, variable from the module will be shown.</span>'; 
$_['entry_header'] 			= 'Show Header:'; 
$_['entry_icon']   				= 'Show Icon:'; 
$_['entry_box']   				= 'Amazon Style Box:<br /><span class="help">If "No" is selected, the active template box style will be used.</span>'; 
$_['entry_yes']	       			= 'Yes'; 
$_['entry_no']	       			= 'No';

$_['entry_template']			= 'Active Template:';

$_['entry_sprite_thumb']	= 'Sprite Image Resize:';
$_['entry_sprite_links']		= 'Sprite URL Links:';
$_['entry_directory']			= 'Hide Directory Link:';

$_['entry_title']         			= 'Sprite Title:';
$_['entry_meta_description'] 	= 'Sprite Meta Description:<br /><span class="help">(Optional)</span>';
$_['entry_description']      	= 'Sprite Link:<br /><span class="help">A full URL is required.</span>';
$_['entry_store']            	= 'Sprite Stores:<br /><span class="help">Select Store(s) where this Image Sprite is to appear.</span>';
$_['entry_keyword']        	= 'Sprite SEO Keyword:<br /><span class="help">Must be globally unique.</span>';
$_['entry_image']            	= 'Sprite Image:<br /><span class="help">Select an image.</span>';

$_['entry_layout']        		= 'Layout:';
$_['entry_position']      		= 'Position:';
$_['entry_toplimit']         	= 'Top Section:';
$_['entry_botlimit']         	= 'Bottom Section:';
$_['entry_count']      	  		= 'Counts:';
$_['entry_metawords']    	= 'Keywords:';
$_['entry_status']        		= 'Status:';
$_['entry_sort_order']    	= 'Sort Order:';

// Buttons
$_['button_showhidehelp']	= 'Show/Hide Help';
$_['button_sprite']  			= 'Add/Edit Sprites';
$_['button_module']          	= 'Back To Module';
$_['button_remove']    		= 'Remove';

// Error
$_['error_permission'] 		= 'Warning: You do not have permission to modify module Amazon Menu II!';
$_['error_sprite_thumb']		= 'Image Sprite Size dimensions required!';
$_['error_title']            		= 'Title must be greater than 3 and less than 64 characters!';
$_['error_description']      	= 'URL must be greater than 3 characters!';
$_['error_numchars']      	= 'Warning: You must enter number of characters to display!';
?>