<?php


$donor = query("SELECT * FROM parsemx_donors WHERE donor_id=" . $_GET['id'])->row;

$code = @file_get_contents($donor['host'] . '.txt');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require_once("scripter.php");
    foreach ($_POST as $var=>$val) {
        if ( ($in = inside($var." = "," //",$code))!=="" ) {
            if (strpos($in,"\n")) continue;
            if (find('"',$in)) $val = '"'.$val.'"';
            if (($in=="true") or ($in=="false"))
                if ($val) $val = "true"; else $val = "false";
            $code = replace_inside("","",$var." = "," //",$code);
            $code = replace($var." =  //",$var." = $val //",$code);
        } }
    file_put_contents($donor['host'] . '.txt',$code);
    GenerateScripts($donor['host']);
    redirect('script&id='.$_GET['id']);
}



require_once("header.tpl");
require_once("scripter.php");
$pass = inside ("[PASS]","",$code);
$pass = if_inside("","\n[",$pass);
$lines = explode("\n",$pass);
$vars = array();
?>

<style type="text/css">
    h4 {
        margin-bottom: -10px;
    }
    p {
        font-size: 12px;
        margin-top: 3px;
        margin-bottom: 0px;
    }
    .str {
        width: 82px !important;
        display: inline !important;
    }
    .int {
        width: 82px !important;
        display: inline !important;
    }
</style>

<form data-direction="reverse" rel="external" data-ajax="false" action="<?php u() ?>script_settings&id=<?php echo @$_GET['id'] ?>" method="post">
    <?php

    foreach ($lines as $line) {
        $html = $line;
        if (find("/**")) echo inside("/**","**/",$line);
        if (find("// ")) {
            $name = trim(inside("","="));
            $text = inside("//");
            $subtext = inside("(",")",$text);
            $text = trim(replace("(*)","", $text));
            $val = trim(inside("=","//"));
            $type = "str";
            if (is_numeric($val)) $type = "int";
            if (($val=="true") or ($val=="false")) $type = "bool";
            if ($type=="str") $val = substr($val,1,-1);

            echo "<span style='width:90px; display:inline-block; vertical-align:top'>";
            if (($type=="str") or ($type=="int")) echo "<input type='text' data-inline='true' data-mini='true' class='$type' name='$name' value='$val' />";
            if (($type=="bool")) {
                echo "<select data-inline='true' data-mini='true' data-role='slider' name='$name'><option value='0'>Нет</option><option value='1' ";
                if ($val=="true") echo "selected='true'";
                echo ">Да</option></select>";
            }
            echo "</span>&nbsp;&nbsp;<span style='padding-top:8px; padding-bottom:17px; display:inline-block; vertical-align:top'><b>$text</b><p>$subtext</p></span><br/>";

        }
    }

    ?>
        <br/>
        <a data-role="button" rel="external" data-direction="reverse" data-inline="true" data-icon="arrow-l" href="<?php u() ?>script&id=<?php echo $donor['donor_id'] ?>">Отмена</a>
        <input type="submit" data-direction="reverse" data-inline="true" data-icon="check" data-theme="b" value="Готово"/>



</form>