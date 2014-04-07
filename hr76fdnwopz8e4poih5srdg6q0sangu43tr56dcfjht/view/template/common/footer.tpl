</div>
<div id="footer"><?php echo $text_footer; ?></div>
<?php if ($this->config->get('config_clicking_image') == 1) { ?>
<script type="text/javascript"><!--
$('.image').click(function(){
	var job = $(this).find("a:contains('<?php echo $this->language->get('text_browse'); ?>')").attr('onclick');
	if (job.length != 0) eval(job);
});
$('.image').hover(function(){
	var link = $(this).find("a:contains('<?php echo $this->language->get('text_browse'); ?>')");
	if (link.length != 0) {
		$(this).css('cursor', 'pointer');
	}
});
//--></script>
<?php } ?>
<a href="#" id="toTop" style="display: none;"><?php echo $this->language->get('button_up'); ?></a>
</body></html>