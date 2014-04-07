<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Корректировка вводимых данных ф. ПС112</title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
</head>
<body>
<h1>Печать бланка ф. ПС112 (Наложка)</h1>
<fieldset>
<form id="edit_front_form" enctype="multipart/form-data" action="http://rumus.by/system/printpdf/ps_112.php" method="POST">
<table cellpadding="5">
	<tr>
		<td>Сумма наложенного платежа:</td>
		<td><input size="10" type="text" name="order_price" value="<?php echo $total;?>" />руб. <small>если нет, оставьте пустым</small></td>
	</tr>
	<tr>
		<td>Получатель заказа:</td>
		<td><input  size="80" type="text" name="to_name" value="<?php echo $shipping_name;?>" /></td>
	</tr>
	<tr>
		<td>Адрес (строка 1):</td>
		<td><input size="80" type="text" name="to_address_1" value="<?php echo $shipping_address_1;?>" /></td>
	</tr>
	<tr>
		<td>Адрес (строка 2):</td>
		<td><input size="80" type="text" name="to_address_2" value="<?php echo $shipping_address_2;?>" /></td>
	</tr>
	<tr>
		<td>Почтовый индекс:</td>
		<td><input size="10" type="text" name="to_zip" value="<?php echo $shipping_postcode;?>" /></td>
	</tr>
</table>

<!-- from -->
<input type="hidden" name="from_name" value="<?php echo $this->config->get('rpb_from_name');?>" />
<input type="hidden" name="from_address_1" value="<?php echo $this->config->get('rpb_from_address_1');?>" />
<input type="hidden" name="from_address_2" value="<?php echo $this->config->get('rpb_from_address_2');?>" />
<input type="hidden" name="from_zip" value="<?php echo $this->config->get('rpb_postindex');?>" />
<!-- legal -->
<input type="hidden" name="inn" value="<?php echo $this->config->get('rpb_inn');?>" />
<input type="hidden" name="bik" value="<?php echo $this->config->get('rpb_bik');?>" />
<input type="hidden" name="correspondent_account" value="<?php echo $this->config->get('rpb_correspondent_account');?>" />
<input type="hidden" name="current_account" value="<?php echo $this->config->get('rpb_current_account');?>" />
<input type="hidden" name="bank_name" value="<?php echo $this->config->get('rpb_bank_name');?>" />
</fieldset><br>
<input id="print" type="submit"  value="Распечать ф. ПС112" />
</form>

</body>
</html>