<div>
<table class="form">
  <tr>
	<td style="width: 50px;">
	  <?php if ($news_image['image']) { ?>
		<img src="<?php echo $news_image; ?>" />
	  <?php } else { ?>
		<img src="<?php echo $news_no_image; ?>" />
	  <?php } ?>
	</td>
    <td><b><?php echo $news_name; ?></b></td>
  </tr>
</table>
<form action="POST" id="date-sort-form">
  <table class="form">
	<tr>
      <td><?php echo $entry_sort_order; ?></td>
      <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>
    </tr>
	<tr>
      <td><?php echo $entry_date_added; ?></td>
      <td><input type="text" name="date_available" value="<?php echo $date_available; ?>" size="25" class="date" /></td>
    </tr>
  </table>
</form>
</div>
<script type="text/javascript"><!--
$('#date-sort-form .date').datepicker({dateFormat: 'yy-mm-dd'});
//--></script> 