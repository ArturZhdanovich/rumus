<?php

if (isset($_GET['clear'])) {
    if (file_exists('parsemx.log'))
        @unlink('parsemx.log');
        redirect('');
    }

require_once("header.tpl");
?>
<h2>Лог работы парсера</font></h2>
<?php
if (file_exists('parsemx.log')) {
@$f = fopen("parsemx.log", "r");
while (!@feof($f)) {
    $message = fgets($f);
    $color = 'black';
    if (!(strpos($message, 'WARNING') === false))
        $color = 'red';
    if (!(strpos($message, 'NOTICE') === false)){
        $color = 'green';
        $message = str_replace('NOTICE: ','',$message);
    }
    if (@$_GET['full'] or ($color!='black'))
        echo  '<font color="' . $color . '">' . $message . '</font><br/>';
}
}
?>
<a id="end"/>
<a data-transition="reverse" rel="external" data-role="button" data-icon="arrow-l" data-inline="true" href="<?php u() ?>">Назад</a>
    <?php if (!@$_GET['full']) { ?>
        <a data-transition="slideup" rel="external" data-role="button" data-icon="grid" data-inline="true" href="<?php u() ?>log&full=1">Расширенный</a>
    <?php } ?>
<a data-transition="slideup" data-role="button" rel="external" data-theme="b" data-icon="delete" data-inline="true" href="<?php u() ?>log&clear=1">Очистить</a>
<script type="text/javascript">
    $("html, body").animate({ scrollTop: $(document).height()+50000 }, "slow");
</script>