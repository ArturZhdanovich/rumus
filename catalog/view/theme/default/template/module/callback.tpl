<style type="text/css">
#callback-form {display:none;}#simplemodal-overlay {background-color:#000; cursor:wait;}#simplemodal-container {height:<?php if ($theme == 1 && $message == 1) {?>450<?php } elseif ($theme == 1 && $message == 0) { ?>330<?php } elseif ($theme == 0 && $message == 1) { ?>370<?php } else { ?>250<?php } ?>px; width:560px; color:#bbb; background-color:#333; border:4px solid #444; padding:12px;}#simplemodal-container .simplemodal-data{padding:8px}#simplemodal-container code{background:#141414;border-left:3px solid #65B43D;color:#bbb;display:block;font-size:12px;margin-bottom:12px;padding:4px 6px 6px}#simplemodal-container a{color:#ddd}#simplemodal-container a.modalCloseImg{background:url(catalog/view/javascript/jquery/simplemodal/x.png) no-repeat;width:25px;height:29px;display:inline;z-index:3200;position:absolute;top:-15px;right:-16px;cursor:pointer}.dialogContentText h2{color:#BBBBBB}.callbackForm{text-align: left;}.time-arrow{text-align:center;width:45px;margin-bottom:0}.time-arrow img{cursor:pointer}.time{color:#fff;font:14px "Franklin Gothic Book", "helvetica";height:18px;line-height:18px;text-align:center;width:45px;margin-bottom:0}.time-label{float:left;padding-right:17px;clear:both}.time-label label{line-height:50px}.time-dash{color:#fff;float:left;font:14px "Franklin Gothic Book", "helvetica";line-height:50px;padding:0 4px}p{font-size:14px}.rc5{border-radius:5px 5px 5px 5px}.cb-txt,.cb-txt-290,.cb-area{background:#fff;border:1px solid #b2b5b7;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;-khtml-border-radius:5px;color:#000;font-size:14px;height:24px;line-height:24px;padding:0 4px;width:180px}.fb-send{margin:0}.cb-txt-290{margin:0 14px 0 0;width:290px}.cb-area{margin:0 14px 0 0;width:480px;height:70px}.cb-send{background:#F57917;border:0;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;-khtml-border-radius:5px;color:#000;cursor:pointer;font-size:14px;height:24px;padding-bottom:3px;text-align:center;width:125px}.cb-send:hover{background:#F57917}
</style>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
     <div id="callback-click"><a href="#"><?php echo $text_link; ?></a>
     </div>
     <div id="callback-form">
     	<div class="dialogContentText">
     		<h2><?php echo $header; ?></h2>
     		<form method="post" action="<?php echo $action;?>" class="callbackForm">
     		 <input type="hidden" value="10" class="time-min">
     		 <input type="hidden" value="19" class="time-max">
     		 <input type="hidden" value="10" class="time-start" name="OrderCallTimeStart">
     		 <input type="hidden" value="18" class="time-end" name="OrderCallTimeEnd">
     		 <input type="hidden" value="<?php echo $uri;?>" name="uri">
     		 <p class="cb-schedule"><?php echo $text_main_text; ?></p>
     		 <table>
     		  <tbody>
     		  <?php if ($theme == 1) {?>
     		   <tr>
     		    <td colspan="2">
     		     <p><label><?php echo $text_theme; ?></label></p>
     		     <p><input type="text" id="OrderTheme" class="cb-txt-290 rc5" maxlength="200" name="OrderTheme"></p>
     		    </td>
     		   </tr>
     	      <? } ?>
     		   <tr>
     		    <td>
     		     <p><label><?php echo $text_name;?></label></p>
     		     <p><input type="text" id="OrderFirstName" class="cb-txt-290 rc5" maxlength="200" name="OrderFirstName" value="<?php echo $OrderFirstName;?>"></p>
     		    </td>
     		    <td>
     		     <p><label><?php echo $text_phone;?></label></p><p><input id="OrderPhoneMobile" type="text" class="cb-txt rc5" maxlength="200" name="OrderPhoneMobile"></p>
     		    </td>
     		   </tr>
     		  <?php if ($message == 1) {?>
     		   <tr>
     		    <td colspan="2">
     		     <p><label><?php echo $text_other;?></label></p>
     		     <p><textarea id="OrderMessage" class="cb-area" maxlength="200" name="OrderMessage"></textarea></p>
     		    </td>
     		   </tr>
     	      <? } ?>
     		   <tr>
     		    <td>
     		     <div class="time-label"><label><?php echo $text_time;?></label></div>
     		     <div style="float:left">
     		      <p class="time-arrow time-arrow-up"><img width="8" height="7" alt="Λ" src="catalog/view/javascript/jquery/simplemodal/arrow_up.png"></p>
     		      <p class="time"><span class="time-start">10</span>:00</p>
     		      <p class="time-arrow time-arrow-down"><img width="8" height="7" alt="V" src="catalog/view/javascript/jquery/simplemodal/arrow_down.png"></p>
     		     </div>
     		     <div class="time-dash">-</div>
     		     <div style="float:left">
     		      <p class="time-arrow time-arrow-up"><img width="8" height="7" alt="Λ" src="catalog/view/javascript/jquery/simplemodal/arrow_up.png"></p>
     		      <p class="time"><span class="time-end">18</span>:00</p>
     		      <p class="time-arrow time-arrow-down"><img width="8" height="7" alt="V" src="catalog/view/javascript/jquery/simplemodal/arrow_down.png"></p>
     		     </div>
     		    </td>
     		    <td style="text-align:right; vertical-align:middle">
     		     <p class="fb-send"><input type="submit" value="отправить" class="cb-send rc5"></p>
     		    </td>
     		   </tr>
     		  </tbody>
     		 </table>
     		</form>
        </div>
  </div>
  <!-- preload the images -->
  <div style='display:none'>
    <img src='catalog/view/javascript/jquery/simplemodal/x.png' alt='' />
    <img width="20" height="14" alt="Λ" src="catalog/view/javascript/jquery/simplemodal/arrow_up.png">
    <img width="20" height="14" alt="V" src="catalog/view/javascript/jquery/simplemodal/arrow_down.png">
  </div>

</div>
  <script type='text/javascript' src='catalog/view/javascript/jquery/simplemodal/simplemodal.js'></script>
  <script type='text/javascript'>
$('.time-arrow-down img').click(function(){var $inputLink=$(this).closest('div').find('p.time span');if($inputLink){var inputLinkNumber=parseInt($inputLink.html())-1;if($inputLink.hasClass('time-start')){var inputLinkNumberMin=parseInt($(this).closest('form').find('input.time-min').val());if(inputLinkNumber<inputLinkNumberMin){inputLinkNumber=inputLinkNumberMin}$(this).closest('form').find('input.time-start').val(inputLinkNumber)}else if($inputLink.hasClass('time-end')){var inputLinkNumberMin=parseInt($(this).closest('form').find('span.time-start').html());if(inputLinkNumber<=inputLinkNumberMin){inputLinkNumber=inputLinkNumberMin+1}$(this).closest('form').find('input.time-end').val(inputLinkNumber)}$inputLink.html(inputLinkNumber)}});$('.time-arrow-up img').click(function(){var $inputLink=$(this).closest('div').find('p.time span');if($inputLink){var inputLinkNumber=parseInt($inputLink.html())+1;if($inputLink.hasClass('time-end')){var inputLinkNumberMax=parseInt($(this).closest('form').find('input.time-max').val());if(inputLinkNumber>inputLinkNumberMax){inputLinkNumber=inputLinkNumberMax}$(this).closest('form').find('input.time-end').val(inputLinkNumber)}else if($inputLink.hasClass('time-start')){var inputLinkNumberMax=parseInt($(this).closest('form').find('span.time-end').html());if(inputLinkNumber>=inputLinkNumberMax){inputLinkNumber=inputLinkNumberMax-1}$(this).closest('form').find('input.time-start').val(inputLinkNumber)}$inputLink.html(inputLinkNumber)}});$('span.time-start').each(function(){$(this).closest('form').find('input.time-start').val($(this).html())});$('span.time-end').each(function(){$(this).closest('form').find('input.time-end').val($(this).html())});
$("#OrderPhoneMobile").inputmask("mask", {"mask": "<?php echo $phone_mask;?>", clearIncomplete: true });
$.extend($.inputmask.defaults.definitions, {'a': {"validator": "[A-Za-zА-Яа-я ]","cardinality": 1,"prevalidator": null}});
$("#OrderFirstName").inputmask({"mask": "a", "repeat": 40, "greedy": false});
<?php if ($theme == 1) {?>$.extend($.inputmask.defaults.definitions, {'f': {"validator": "[A-Za-zА-Яа-я 0-9]","cardinality": 1,"prevalidator": null}});$("#OrderTheme").inputmask({"mask": "f", "repeat": 50, "greedy": false});<? }?>
 </script>
  </div>
</div>