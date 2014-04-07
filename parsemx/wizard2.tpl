<?php
$donor = query("SELECT * FROM parsemx_donors WHERE donor_id=".$_GET['id'])->row;

$list = @$_GET['list'];

$start_marker = '//AUTO START';
$end_marker = '//AUTO END';
$product_marker = '[PRODUCT]';
$ins_file = $donor['host'] . '.txt';

if ($list) {
    $start_marker = '//AUTO LIST START';
    $end_marker = '//AUTO LIST END';
    $product_marker = '[LIST]';
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $attr_done = false;
    $opts_done = false;
    $entities=array();
    $_POST["_com"]="*";
    // ------ Generate instruction
    $instruction = $start_marker . " - сгенерировано автоматически\n";
    foreach ($_POST as $ind => $value)
        if ((substr($ind,-4)=='_com') and $value) {
            $entity = substr($ind,0,-4);
            if ($entity=='nextpages') $entity='nextpage';
            $entities[]=$entity;
            $value = html_entity_decode($value);
            if ($value=='Ошибка решения.') continue;

            // Attributes code
            if (in_array('attr_heads',$entities) and (substr($entity,0,5)=='attr_') )
                $value = str_replace(array('inside','tags_text'),array('pinside','tags_html'),$value);
            if (!$attr_done and in_array('attr_names',$entities) and (substr($entity,0,5)!='attr_')) {
                $attr_done=true;
                if (!in_array('attr_heads',$entities)) // No heads
                    if (!in_array('attr_values',$entities))
                        $instruction .= 'attributes["Характеристики"] = attr_names'."\n";
                    else $instruction .= 'attributes["Характеристики"] = shred_arrays attr_names, attr_values'."\n";
                    // Heads
                else if (!in_array('attr_values',$entities))
                    $instruction .= 'attributes = pgroup attr_heads, attr_names, "", "Характеристики"'."\n";
                    else $instruction .= 'attributes = pgroup attr_heads, attr_names, attr_values, "Характеристики"'."\n";
            }

            // Options code
            if (in_array('opts_names',$entities) and (substr($entity,0,5)=='opts_') )
                $value = str_replace(array('inside','tags_text'),array('pinside','tags_html'),$value);
            if (!$opts_done and in_array('opts_values',$entities) and (substr($entity,0,5)!='opts_')) {
                $opts_done=true;
                if (!in_array('opts_names',$entities)) // No heads
                    if (!in_array('opts_prices',$entities))
                        $instruction .= 'options["Выбор"] = opts_values'."\n";
                    else $instruction .= 'options["Выбор"] = shred_arrays opts_values, opts_prices'."\n";
                // Heads
                else if (!in_array('opts_prices',$entities))
                    $instruction .= 'options = pgroup opts_names, opts_values, "", "Выбор"'."\n";
                else $instruction .= 'options = pgroup opts_names, opts_values, opts_prices, "Выбор"'."\n";
            }

            if ($value!='*')
            if (strpos($value,'" + ')) {
                $instruction .= $entity." = ".substr($value,strpos($value,'" + ')+4)."\n";

                if (strpos($value,'insides')) {
                    $instruction .= "for (".$entity.") ";
                    $entity=substr($entity,0,-1);
                }

                $instruction .= $entity.' = "'.substr($value,1,strpos($value,'" + ')-1)."%".$entity.'"' . "\n";
            } else
            $instruction .= $entity." = ".$value . "\n";

            if (($entity=='name') and empty($_POST['manufacturer_com']))
                $instruction.="find_manufacturer\n";
        }
    if (!$list)
        $instruction .= "if (!price and !empty(noprice)) skip = true\n".$end_marker."\n";

    // ------ Save instruction update ----------------
    if (!file_exists($ins_file) or !trim(file_get_contents($ins_file))) {
        file_put_contents($ins_file,"[LIST]\n\n\n[PRODUCT]");
    }
    $issect=strpos(file_get_contents($ins_file),$start_marker);
    $pass=(strpos(file_get_contents($ins_file),"[PASS]")!==false);
    $result='';
    $f=file($ins_file,FILE_IGNORE_NEW_LINES);
    $state=true;
    foreach($f as $line) {
        if ($issect and (substr($line,0,strlen($start_marker))==$start_marker)) {
            $state=false;
            $result .= $instruction;
        }
        if ($state) $result.=$line."\n";
        if (!$issect and (substr($line,0,strlen($product_marker))==$product_marker)) $result .= $instruction;
        if (!$state and (substr($line,0,strlen($end_marker))==$end_marker)) $state=true;
    }
    if (!$pass) { // Write pass options
        $result.="\n";
        $result.="[PASS]\n";
        $result.="/* Опции прописаные Мастером Инструкций */\n";
        $result.="/**<h2 style='font-weight:normal'>Настройки парсинга</h2>**/\n";
        $result.="global description_images, site_language, noprice, update_price, update_name, update_description, update_images, update_attributes, update_options\n";
        $result.="description_images = false // Загружать изображения из описания (Изображения из описания будут загружены к вам на сервер)\n";
        $result.='site_language = "" // Язык сайта для перевода (Для автоматического перевода установите язык сайта<br/><b>Например:</b> EN - английский, RU - русский)'."\n";
        $result.="noprice = false // Пропускать товары без цены\n";
        $result.="update_price = true // Обновлять цену\n";
        $result.="update_description = false // Обновлять название и описание\n";
        $result.="update_images = false // Обновлять изображения\n";
        $result.="update_attributes = true // Обновлять характеристики\n";
        $result.="update_options = true // Обновлять опции\n";
    }
    file_put_contents($ins_file,$result);
    GenerateScripts($donor['host']);
    redirect('script&id='.$donor['donor_id']);
}

if ($list) $donor['host']=$donor['host'].'L';

$pfile = $donor['host'].'_wizpages.inf';
$wfile = $donor['host'].'_wizdata.inf';

if (file_exists($wfile)) $data = unserialize(file_get_contents($wfile));
else $data=array();

if ($list) {

    if (empty($data['products']))
        $data['products']=array(
            'type'=>'list',
            'caption'=>'Ccылки на товары',
        );

    if (empty($data['nextpage']))
        $data['nextpage']=array(
            'type'=>'text',
            'caption'=>'Ссылка на следующую страницу',
        );

    if (empty($data['nextpages']))
        $data['nextpages']=array(
            'group'=>'Проблемы со следующей страницей?',
            'type'=>'list',
            'caption'=>'Укажите ссылки на все страницы в списке',
        );

    if (empty($data['category_name']))
        $data['category_name']=array(
            'group'=>'Структура категорий',
            'type'=>'text',
            'caption'=>'Название категории',
        );

    if (empty($data['description']))
        $data['description']=array(
            'type'=>'html',
            'caption'=>'Описание категории',
        );

    if (empty($data['category_image']))
        $data['category_image']=array(
            'type'=>'text',
            'caption'=>'URL фото категории',
        );

    if (empty($data['subcategories']))
        $data['subcategories']=array(
            'type'=>'list',
            'caption'=>'URL подкатегорий',
        );

    if (empty($data['subcategories_images']))
        $data['subcategories_images']=array(
            'type'=>'list',
            'caption'=>'URL фото подкатегорий',
        );

} else {

    if (empty($data['name']))
        $data['name']=array(
            'type'=>'text',
            'caption'=>'Название товара',
            'command'=>'tag_text "h1"'
        );

    if (empty($data['price']))
        $data['price']=array(
            'type'=>'text',
            'caption'=>'Цена',
        );

    if (empty($data['description']))
        $data['description']=array(
            'type'=>'html',
            'caption'=>'Описание (HTML)',
        );

    if (empty($data['model']))
        $data['model']=array(
            'type'=>'text',
            'caption'=>'Модель',
            'group'=>'Модель и производитель'
        );

    if (empty($data['manufacturer']))
        $data['manufacturer']=array(
            'type'=>'text',
            'caption'=>'Производитель',
        );

    if (empty($data['main_image']))
        $data['main_image']=array(
            'type'=>'text',
            'caption'=>'URL главного фото',
            'group'=>'Фото',
        );

    if (empty($data['images']))
        $data['images']=array(
            'type'=>'list',
            'caption'=>'URL дополнительных фото',
        );

    if (empty($data['attr_heads']))
        $data['attr_heads']=array(
            'type'=>'list',
            'caption'=>'Заголовки груп атрибутов',
            'group'=>'Атрибуты',
        );

    if (empty($data['attr_names']))
        $data['attr_names']=array(
            'type'=>'list',
            'caption'=>'Названия атрибутов',
        );

    if (empty($data['attr_values']))
        $data['attr_values']=array(
            'type'=>'list',
            'caption'=>'Значения атрибутов',
        );

    if (empty($data['opts_names']))
        $data['opts_names']=array(
            'type'=>'list',
            'caption'=>'Названия опций',
            'group'=>'Опции',
        );

    if (empty($data['opts_values']))
        $data['opts_values']=array(
            'type'=>'list',
            'caption'=>'Значения опций',
        );

    if (empty($data['opts_prices']))
        $data['opts_prices']=array(
            'type'=>'list',
            'caption'=>'Цены опций',
        );
}

$purls = array();
if (file_exists($pfile)) $purls=file($pfile,FILE_IGNORE_NEW_LINES);
// Create the list of active products
$prods=array();
foreach ($purls as $i=>$purl) {
    $fname = $donor['host'].'_data'.$i.'.tmp';
    if (($purl!='') && file_exists($fname)) $prods[]=$i;
}

require_once("scripter.php");

// ========== Propagate schema
// Read all pages into one
$html = "";
foreach ($prods as $i=>$prod)
    $html.= file_get_contents( $donor['host'].'_data'.$i.'.tmp' );
// Prepare info
$html = replace("'",'');
$html = replace('"','');
$html = replace(' ','');
$html = strtolower($html);
if ($list) {
    $schems=array();
} else {
    $schems['name'] = 'tag_attr "[property=og:title]", "content"';
    $schems['images'] = 'tags_image "[itemprop=image]"';
    $schems['main_image'] = 'tag_attr "[property=og:image]", "content"';
    $schems['description'] = 'tag_attr "[property=og:description]", "content"';

    $schems['name'] = 'tag_text "[itemprop=name]"';
    $schems['price'] = 'tag_text "[itemprop=price]"';
    //$schems['skip'] = 'tag_text "[itemprop=availability]" -> strtolower -> replace "only", "instock" -> !find "instock"';
    $schems['description'] = 'tag_html "[itemprop=description]"';

}

// Read instruction auto part and propagate it
$f=@file($ins_file,FILE_IGNORE_NEW_LINES);
if (!$f) $f = array();
$state = false;
// Check if there is auto section
//foreach($f as $line)
//    if (substr($line,0,strlen($start_marker))==$start_marker) { $state=true; break; }
//if (!$state) $start_marker = "[PRODUCT]";
//    else $state = false;
// Read instruction
foreach($f as $line) {
    if (substr($line,0,strlen($start_marker))==$start_marker) { $state=true; continue; }
    if ((substr($line,0,strlen($end_marker))==$end_marker) or (substr($line,0,1)=="[")) $state=false;
    if (!$state) continue;
    $line = replace("tags_html","tags_text",$line); // turn back pgroup data
    $var = trim(inside("","=",$line));
    if (!empty($data[$var])) $data[$var]['command'] = trim(inside("=","",$line));
}

$detected = false;
$detected_images = false;
foreach ($schems as $i=> $schem)
    if (find(inside('[',']',$schem)) and empty($data[$i]["command"])) {
        // Lets skip small image
        if (($i=="main_image") and !empty($data["images"]["command"])) continue;

        $data[$i]["command"] = $schem;
        xlog($schem);
        $detected = true;
        if ($i=='main_image') $detected_images = true;
    }

require_once("header.tpl");
?>
<h2>Мастер инструкций <font color="grey">для <?php if ($list) echo substr($donor['host'],0,-1); else echo $donor['host'] ?></font></h2>

        <?php if ($detected) { ?>
            Поздравляем, некоторые данные удалось определить автоматически.

            <?php if ($detected_images) { ?>
                <br/>Имейте ввиду, что скорее всего были определены маленькие изображания товаров. Проверьте и переопределите их при необходимости.
            <?php } ?>
            <br/><br/>
        <?php } ?>

        <?php if ($list) { ?>
            Нажимайте <a type="button" data-theme="e" data-role="button" data-icon="lightning" data-mini="true" data-inline="true" data-iconpos="notext" title="Выбрать елемент"></a>
            и выбирайте нужные елементы.
        <?php } else { ?>
        Нажимайте <a type="button" data-theme="e" data-role="button" data-icon="lightning" data-mini="true" data-inline="true" data-iconpos="notext" title="Выбрать елемент"></a>
        и выбирайте нужные елементы на страницах товаров.
        <br/>
        Если выбор елементов не подходит, воспользуйтесь <a style="cursor:pointer; font-weight: normal; text-decoration: none" onclick="$('.handmode').toggle(500)">ручным режимом</a>.
        <div class="handmode" style="display:none">
            <h3>Работа в ручном режиме</h3>
            <b>1.</b> Очистите поля, если в них что-то есть. <br/>
            <b>2.</b> Скопируйте нужное значение со страницы первого товара. <br/>
            <b>3.</b> Нажмите галочку
            <input type="button" data-theme="b" data-role="button" data-icon="check" data-mini="true" data-inline="true" data-iconpos="notext" value="Решить">
            <br/>
            <b>4.</b> Проверьте, корректно ли оно определились для остальных товаров. <br/>
            <b>5.</b> Если нет, то задайте и для них правильный текст и снова нажмите галочку.
        </div>
        <?php } ?>


<form data-transition="flip" data-ajax="false" action="<?php u() ?>wizard2&id=<?php echo $donor['donor_id'] ?>&list=<?php echo $list ?>" method="post">



    <?php
    $groups=array();
    $closed_group = false;
    foreach ($data as $name=>$info) {
        if (empty($info["caption"])) continue;
        if (isset($info['group'])) {
            $closed_group = true;
            if ($groups) echo '</div><a name="group'.(count($groups)-1).'">';
            $groups[] = $info['group'];
        ?> </a><div id="group<?php echo count($groups)-1 ?>" style="display:none">
            <h2 style="color:grey; margin-top:30px; margin-bottom:-20px"><?php echo $info['group'] ?></h2>
           <?php }
        if (@$info['command'] and $closed_group) {
            $closed_group = false;
            echo "<script type='text/javascript'>$('#group".(count($groups)-1)."').show(500);</script>";
            $groups[count($groups)-1] = '';
        } ?>

    <h3 data-role="fieldcontain" style="margin-top:40px"><span onclick="$('#<?php echo $name ?>_comspan').show()"><?php echo $info['caption'] ?></span>
        <span id="<?php echo $name ?>_comspan" style="float:right; display:none">
        <a style="cursor:pointer; font-size:12px; font-weight: normal; text-decoration: none"
           onclick="
               $('#<?php echo $name ?>_com').val('\'\'');
               $('#<?php echo $name ?>_comspan').hide();
               FindSolution('<?php echo $name ?>','<?php echo $info['type'] ?>');
               ">Очистить</a>
        <input data-theme="e" style="width:400px" data-inline="true" data-mini="true" type="text" name="<?php echo $name ?>_com" id="<?php echo $name ?>_com" oninput="$('#<?php echo $name ?>go').show(300);" onkeypress="if ( event.keyCode == 13 ) {FindSolution('<?php echo $name ?>','<?php echo $info['type'] ?>'); return false;}" value="<?php echo @htmlspecialchars($info['command']) ?>">
        </span>
    </h3>
    <?php if ($info['type']=='list') { ?>
        <div style="color:grey;font-size:11px; margin:-15px 125px -15px 165px">Первый елемент<span style="float:right">Последний елемент</span></div>
        <?php } ?>
        <?php foreach ($prods as $i=>$prod) { ?>
            <div data-role="fieldcontain" class="p<?php echo $name ?>" <?php if ($prod and @!$info['values'][$prod]) echo 'style="display:none;"' ?>  >
            <label>

                <a type="button" data-theme="e" data-role="button"
                   data-icon="<?php if ($info['type']=='list') echo 'android'; else echo 'lightning' ?>"
                   data-mini="true" data-inline="true" data-iconpos="notext"
                   title="Выбрать елемент<?php if ($info['type']=='list') echo 'ы' ?>"
                       onclick='
                           gsName = "<?php echo $name ?>";
                           gsType = "<?php echo $info['type'] ?>";
                           gsSel = $("#<?php echo $name ?>_com").val().match(/".*"/g);
                           if (gsSel) gsSel = gsSel[0].replace("\"","").replace("\"","");
                           else gsSel = "";
                           GetSelector("<?php echo $purls[$prod]."@".$i; if ($list) echo "L" ?>", gsSel,<?php if ($info['type']=='list') echo '0'; else echo '1' ?> );'></a>

                <a target="_blank" href="<?php echo $purls[$prod] ?>"><?php if ($list) echo "Категория "; else echo "Товар "; echo $prod+1 ?></a>

            <?php if ($info['type']=='html') { ?>
                <textarea data-inline="true" data-mini="true" id="<?php echo $name.$prod ?>" name="<?php echo $name.$prod ?>"
                          oninput=" $('#<?php echo $name ?>go').show(300);
                                    $('#<?php echo $name.$prod ?>resh').html($(this).val());
                                    $('#<?php echo $name.$prod ?>resh').show(300);
                                    $('#<?php echo $name ?>_com').hide(300).val('');"
                        ></textarea>
            <?php } else { ?>
                <input <?php if ($info['type']=='list') echo 'style="width:260px"' ?> data-inline="true" data-mini="true" type="text" id="<?php echo $name.$prod ?>" name="<?php echo $name.$prod ?>"
                   value="<?php echo @$info['values'][$prod] ?>"
                   onkeypress="if ( event.keyCode == 13 ) {FindSolution('<?php echo $name ?>','<?php echo $info['type'] ?>'); return false;}"
                   oninput="$('#<?php echo $name ?>go').show(300);
                       $('#<?php echo $name ?>_comspan').hide().val('');
                       $('#<?php echo $name ?>_com').val('');
                       Preview('<?php echo $name.$prod ?>');"
                >
            <?php } ?>

            </label>
                <?php if ($info['type']=='list') { ?>
                <input style="width:260px" data-inline="true" data-mini="true" type="text" id="<?php echo $name.$prod ?>e" name="<?php echo $name.$prod ?>e"
                       value="<?php echo @$info['values'][$prod] ?>"
                       onkeypress="if ( event.keyCode == 13 ) {FindSolution('<?php echo $name ?>','<?php echo $info['type'] ?>'); return false;}"
                       oninput="$('#<?php echo $name ?>go').show(300);
                           $('#<?php echo $name ?>_comspan').hide().val('');
                           $('#<?php echo $name ?>_com').val('');
                           Preview('<?php echo $name.$prod ?>e');"
                        >
                <?php } ?>

                <?php if (!$i) { ?>
                <span id="<?php echo $name ?>go" style="display:none">
                    <input type="button" data-theme="b" data-role="button" data-icon="check" data-mini="true" data-inline="true" data-iconpos="notext" onclick="FindSolution('<?php echo $name ?>','<?php echo $info['type'] ?>')" value="Решить">
                </span>
                <img id="<?php echo $name ?>wait" style="display:none" src="loading.gif">
                <?php } ?>
            <br/>

                <span style="color:red; display: none" id="<?php echo $name.$prod ?>warn">Текст не найден.
                <a id="<?php echo $name.$prod ?>warnf" data-role="button" data-icon="search" data-theme="c" data-mini="true" data-inline="true"
                   onclick="$('#<?php echo $name ?>go').show(300);FindLike('<?php echo $name.$prod ?>')">Найти похожий</a>
                <img id="<?php echo $name.$prod ?>warnw" style="display:none" src="loading.gif">
                </span>
                <?php if ($info['type']=='list') { ?>
                <span style="float:right; color:red; display: none" id="<?php echo $name.$prod ?>ewarn">
                    Текст не найден.
                <a data-role="button" data-icon="search" data-theme="c" data-mini="true" data-inline="true"
                   onclick="$('#<?php echo $name ?>go').show(300);FindLike('<?php echo $name.$prod ?>e')">Найти похожий</a></span>
                <?php } ?>

                <table style="margin-left:65px; <?php if ($info['type']=='list') echo "display:none" ?>"><tr>
                    <td style="white-space:nowrap">
                        <a id="<?php echo $name.$prod ?>imgl" target="_blank"><img id="<?php echo $name.$prod ?>img" style="padding-right:5px; padding-top:5px; display:none; height:70px; width:auto;"></a><a id="<?php echo $name.$prod ?>eimgl" target="_blank"><img id="<?php echo $name.$prod ?>eimg" style="padding-right:5px; padding-top:5px; display:none; height:70px; width:auto;"></a>
                    </td>
                    <td style="white-space:nowrap">
                        <a id="<?php echo $name.$prod ?>link" style="font-size:12px" target="_blank"></a>
                        <div><a id="<?php echo $name.$prod ?>elink" style="font-size:12px" target="_blank"></a></div>
                    </td>
                </tr></table>
            <?php if ($info['type']=='html') { ?>
                <div style="overflow:hidden; background:#fffbc0; padding: 5px; margin:5px 40px 5px 65px; font-size:12px; display: none" id="<?php echo $name.$prod ?>resh"></div>
            <?php } ?>
                <div style="overflow:hidden; background:#fffbc0; padding: 5px; margin:5px 40px 5px 65px; font-size:12px; display: none" id="<?php echo $name.$prod ?>res"></div>
            </div>
        <?php } ?>

        <?php if (@$info["command"]) { ?>
            <script type="text/javascript">
                $(document).ready(function() {
                FindSolution('<?php echo $name ?>','<?php echo $info['type'] ?>');
                });
            </script>
        <?php } ?>

    <?php } ?>

    <?php echo '</div><a name="group'.(count($groups)-1).'">'; ?>
    <br/>
    <?php foreach ($groups as $i=>$group)
        if ($group) { ?>
    <a data-role="button" data-icon="plus" data-theme="a" data-mini="true" data-inline="true"
       onclick="$(this).hide(); $('#group<?php echo $i ?>').show(500);"><?php echo $group ?></a>
    <?php } ?>
    <br/>

    <br />
    <a data-transition="reverse" rel="external" data-role="button" data-icon="arrow-l" data-inline="true" href="<?php u() ?>script&id=<?php echo $donor['donor_id'] ?>">Выход</a>
    <input type="submit" data-inline="true" data-icon="check" data-theme="b"
           value="Создать скрипт"/>

</form>

<script type="text/javascript">

    var gsName;
    var gsType;
    var gsSel;

    function SetSelector(selector) {
        if (!selector) return;
        $('#'+gsName+'_com').val('~'+selector).show(300);
        $('#'+gsName+'_comspan').show();
        FindSolution(gsName,gsType);
    }

    function FindLike(name) {
        //$('#'+name+'warnf').hide(300);
        $('#'+name+'warnw').show();
        var info = {"name": name, "text": $('#'+name).val(),"host": "<?php echo $donor['host'] ?>"};
        $.post('wizlive.php?like=1',info, function(data) {
            //$('#'+name+'warnf').show();
            $('#'+name+'warnw').hide();
          if (data) {
              $('#'+name).val(data);
              $('#'+name+'warn').hide(300);
              Preview(name);
          };

        },"json").error(function() {
                    $('#'+name+'warnf').show();
                    $('#'+name+'warnw').hide();
                });

    }

    function Preview(name) {
        link = $('#'+name).val();
        $('#'+name+'resh').show(300);
        $('#'+name+'resh').html(link);
        if (!link) link='';
        ext=link.split('.').pop();
        if ((ext=='jpg') || (ext=='png') || (ext=='gif')) {
            $('#'+name+'img').attr('src',link);
            $('#'+name+'imgl').attr('href',link);
            $('#'+name+'img').show(300);
        }
        else $('#'+name+'img').hide(300);
        if (link.substr(0,4)=='http') {
            $('#'+name+'link').attr('href',link);
            $('#'+name+'link').html(link);
        } else $('#'+name+'link').html('');
    }

    function FindSolution(name, type)
    {
        $('#'+name+'go').hide();
        $('#'+name+'wait').show();
        var values = {};
        <?php foreach ($prods as $prod) { ?>
        var txt = {};
        txt[0]=$('#'+name+'<?php echo $prod ?>').val();
        txt[1]=$('#'+name+'<?php echo $prod ?>e').val();
        values[<?php echo $prod ?>]=txt;
        <?php } ?>
        var info = {"name": name, "type": type, "com": $('#'+name+'_com').val(),"donor_id": "<?php echo $donor['donor_id'] ?>",
            "host": "<?php echo $donor['host'] ?>", "values": values};

        $.post('wizlive.php',info, function(data) {
            // Make change for lists
            if (type=='list') $('#'+name+'_com').val(data['result_list']);
            else $('#'+name+'_com').val(data['result']);

            $('.p'+name).show(300);
            if (!data['result']) $('#'+name+'_comspan').hide(); else $('#'+name+'_comspan').show();
            //$('#'+name+'go').show();
            $('#'+name+'wait').hide();
            $.each(data['values'], function(index, value) {
                if (value[0]=='**') $('#'+name+index+'warn').show(200);
                else {
                    $('#'+name+index).val(value[0]);
                    Preview(name+index);
                    $('#'+name+index+'warn').hide();
                }
                if (value[1]=='**') $('#'+name+index+'ewarn').show(200);
                else {
                    $('#'+name+index+'e').val(value[1]);
                    Preview(name+index+'e');
                    $('#'+name+index+'ewarn').hide();
                }
                if (type=='list')
                if (value[2]) {
                    $('#'+name+index+'res').html(value[2]);
                    $('#'+name+index+'res').show(300);
                } else $('#'+name+index+'res').hide(300);
            });
        },"json").error(function() {
                    $('#'+name+'_com').val("Ошибка решения.");
                    $('#'+name+'_comspan').show();
                    //$('#'+name+'go').show();
                    $('#'+name+'wait').hide();
        });
    }

    //$(document).ready(function(){UpdateDonors()})
</script>