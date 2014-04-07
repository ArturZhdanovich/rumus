<?php

$donor = query("SELECT * FROM parsemx_donors WHERE donor_id=" . $_GET['id'])->row;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    @file_put_contents($donor['host'] . '.txt', str_replace('\"','"',@html_entity_decode(($_POST['code']))));
    $url = $_POST['url'];
    query("UPDATE parsemx_donors SET check_url='$url' WHERE donor_id=" . $_GET['id']);
    $donor['check_url'] = $url;
    GenerateScripts($donor['host']);
}

$code = @file_get_contents($donor['host'] . '.txt');

// Get first instruction of this donor
@$ins = query("SELECT * FROM parsemx_ins WHERE donor_id=" . $_GET['id'] . " LIMIT 1")->row['ins_id'];

$go_url = $donor['check_url'];
$go_url = str_replace('/','_sxs_',$go_url );
$go_url = str_replace(':','_dxd_',$go_url );

// ---------- READ MANUAL -----------------
require_once('scripter.php');
$lines = file('manual.dox', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
foreach ($lines as $i=>$line)
    $lines[$i] = str_replace('{',"<span class='man_keyw'>",str_replace('}','</span>',str_replace('->','-&gt;',$line)));
$man=array();
$sect='Common';
$i=-1;
while (++$i<count($lines)) {
    $line = $lines [$i];
    if ($line[0]=='[') {
        $sect = inside('[',']',$line);
        continue;
    }
    $p=$i+3;
    $desc='';
    while ($lines[$p][0]!='#') {$desc.=$lines[$p].'<br/>'; $p++;}
    $sample = $lines[$i+1];
    $insert = $sample;
    if (strpos($sample,"|")) {
        $insert = substr($sample,0, strpos($sample,'|'));
        $sample = str_replace("|","<span class='man_optional'>",$sample)."</span>";
    }
    $man[$sect][] = array (
        'sort'=>strtolower($line),
        'name'=>$line,
        'sample'=>$sample,
        'insert'=>$insert,
        'short'=>$lines[$i+2],
        'desc'=>$desc
        );
    $i=$p;
}

$man['LIST'] = array_merge($man['LIST'], $man['COMMON']);
$man['PRODUCT'] = array_merge($man['PRODUCT'], $man['COMMON']);
unset($man['COMMON']);

foreach ($man as $i=>$mm) sort($man[$i]);
// ----------------------------------------

require_once("header.tpl");

?>
<h3 style="margin-top:0px;margin-bottom:15px">Скрипт <font color="grey">для <?php echo $donor['host'] ?></font>
    <?php if (strpos($code, "/**")) { ?>
        <a style = "float:right;margin-top:-5px" data-role="button" data-inline="true" data-mini="true" data-icon="gear" data-theme="c" href="<?php u() ?>script_settings&id=<?php echo $donor['donor_id'] ?>">Настройки инструкции</a>
    <?php } ?>
</h3>

<style type="text/css">
    #manual {
        position:absolute;
        padding:7px;
        left:-320px;
        top: 43px;
        width:280px;
        height:600px;
        text-shadow: none;
        font-size: 10px;
        color:#ddd;
        overflow:auto;
    }

    .man {
        text-shadow: none;
        background-color:#EEE;
        border-color: grey;
        font-size: 14px;
        font-weight: bold;
        color: #4169e1;
        margin-top:3px;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
        cursor:pointer;
    }

    .man:hover {
        background-color:white;
    }

    .man_tag {
        font-size: 10px;
        font-weight: normal;
        color: grey;
        float: right;
    }

    .man_sample {
        margin-top:5px;
        font-size: 10px;
        font-weight: normal;
        background-color: #EEE;
        color: green;
        display:none;
    }

    .man_optional {
        color: grey;
    }

    .man_keyw {
        color: #4169e1;
        font-weight: bold;
    }

    .man_desc {
        margin-top:5px;
        margin-bottom:5px;
        font-size: 10px;
        color: black;
        font-weight: normal;
        display:none;
    }

    .man:hover .man_sample {
        display:block;
    }

    .man:hover .man_desc {
        display:block;
    }

</style>

<div id="manual">
    <div data-role="navbar" style="font-size:10px">
        <ul>
            <li>
                <a id="tabb-LIST" class="man_t" onclick="activate_tab('LIST')">[LIST]</a>
            </li>
            <li>
                <a id="tabb-PRODUCT" class="man_t" onclick="activate_tab('PRODUCT')">[PRODUCT]</a>
            </li>
        </ul>
        <ul>
            <li>
                <a id="tabb-Functions" class="man_t" style="" onclick="activate_tab('Functions')">Functions</a>
            </li>
            <li>
                <a id="tabb-Commands" class="man_t" onclick="activate_tab('Commands')">Commands</a>
            </li>
        </ul>
    </div><!-- /navbar -->

    <script type="text/javascript">
        function activate_tab(tab) {
            $('.man_tab').hide(200);
            $('#tab-'+tab).show(200);
            $('.man_t').removeClass('ui-btn-active');
            $('#tabb-'+tab).addClass('ui-btn-active');
        }
        function tab_search(search) {
            search = search.toLowerCase();
            $('.man').each(function() {
                if (!search || ($(this).attr('data-search').toLowerCase().indexOf(search)!=-1))
                    $(this).show(); else $(this).hide();
            });
        }

        function is_letter(word) {
            return (word.toLowerCase()!=word.toUpperCase());
        }

        function einsert(text) {
            var sel = editor.getSelectionRange();
            sel.setStart(sel.start.row,0);
            var line = editor.session.getTextRange(sel);
            // Find the last word
            p = line.length-1;
            var word = '';
            while (is_letter(line.charAt(p))) {
                word = line.charAt(p) + word;
                p--; if (p<0) break;
            }
            if (word!='') editor.removeWordLeft();
            sel = editor.getSelectionRange();
            sel.setStart(sel.start.row,0);
            line = editor.session.getTextRange(sel);
            if (line.indexOf('=')!=-1)
             if (text.indexOf('->')!=-1) {
                    text = text.substr(text.indexOf('->')+3);
                    if ((line.substr(-4).indexOf('->')<0) && is_letter(line.substr(line.indexOf('=')))) text = ' -> '+text;
                }
            editor.insert(text);
            editor.focus();
        }
    </script>


    <?php foreach ($man as $i=>$sect) { ?>
    <div id="tab-<?php echo $i ?>" class="man_tab" style="display:none">
        <?php foreach ($sect as $j=>$comm) { ?>
        <div class="man" onclick="einsert($(this).attr('data-ins'))" data-ins='<?php echo $comm['insert'] ?>' data-search='<?php echo $comm['name'] ?>'>
            <?php echo $comm['name'] ?>
            <span class="man_tag"><?php echo $comm['short'] ?></span>
            <div class="man_sample"><span style="color:grey">Sample:</span> <b><?php echo $comm['sample'] ?></b></div>
            <div class="man_desc"><?php echo $comm['desc'] ?></div>
        </div>
        <?php } ?>

    </div>
    <?php } ?>

</div>

<form id="form" rel="external" data-ajax="false" data-transition="flip" action="<?php u() ?>script&id=<?php echo @$donor['donor_id'] ?>" method="post">
    <div style="width:670px; height:400px; border: 1px solid blue;">
    <div id="editor" style="width:670px; height:400px; font-size: 12px"><?php echo htmlspecialchars($code) ?></div>
    </div>
    <script src="lib/ace.js" type="text/javascript" charset="utf-8"></script>
    <script>
        var editor = ace.edit("editor");
        editor.resize();
        editor.setTheme("ace/theme/dreamweaver");
        editor.getSession().setMode("ace/mode/php");
        editor.getSession().setUseWrapMode(true);
        editor.setBehavioursEnabled(false);
        editor.setAnimatedScroll(true);
        editor.renderer.setShowGutter(false);
        var asect='';

        editor.getSession().selection.on('changeCursor', function(e) {
            // Autocomplete section detection
            var sect = asect;
            var sel = editor.getSelectionRange();
            sel.setStart(sel.start.row,0);
            var line = editor.session.getTextRange(sel);
            // Find the last word
            p = line.length-1;
            var word = '';
            while (is_letter(line.charAt(p))) {
                word = line.charAt(p) + word;
                p--; if (p<0) break;
            }
            tab_search(word);

            if (line.indexOf('=')<0 ) {
                sel.setStart(0,0);
                var before = editor.session.getTextRange(sel);
                if ((before.indexOf('[LIST]')>=0) && (before.indexOf('[PRODUCT]')<0))
                    sect='LIST'; else sect='PRODUCT';
            } else sect='Functions';
            if (sect!=asect) {
                asect=sect;
                activate_tab(asect);
            }

        });
        editor.getSession().on('change',function(e) {$('#xback').hide(1000); $('#test').hide(1000); $('#warn').show(1000);});
    </script>

        <textarea style="display:none" id="code" name="code" oninput="$('#xback').hide(1000); $('#test').hide(1000); $('#warn').show(1000)"><?php echo htmlspecialchars($code) ?></textarea></p>

    <p>
        Тестовая URL <span class="remark">
           (ссылка на товар, на котором будет проверен скрипт)
        </span>

        <?php if ($donor['check_url'] ) { ?> &nbsp;&nbsp;
        <a type="button" data-theme="e" data-role="button" data-icon="lightning" data-mini="true" data-inline="true" data-iconpos="notext" value="Выбрать елемент"
               onclick='
        // Get line and pos
        editor.focus();
        var sel = editor.getSelectionRange();
        if (sel.start.column==sel.end.column) {
            var pos = sel.start.column;
            sel.setStart(sel.start.row,0);
            sel.setEnd(sel.start.row+1,0);
            var line = editor.session.getTextRange(sel);
            //alert(line+" : "+pos);
            var m = [];
            var quo = 0;
            var doit = false;
            for (var i=0;i<line.length;i++)
                if (line[i]=="\"") {
                    doit = true;
                    quo = 1-quo;
                    m[i]=quo+2;
                   }
                else m[i] = quo;
        }
        if (doit) {
            if (!m[pos]) // Find it near
                for (i=0;i<line.length;i++)
                    if (m[i] && (Math.abs(pos-i) <5))   pos = i;

            if (m[pos]) while (m[pos]!=3) pos--;
            else doit = false;
            if (doit) {
                sel = editor.getSelectionRange();
                sel.start.column = pos;
                while (m[pos]!=2) pos++;
                sel.end.column = pos+1;
                editor.getSelection().setSelectionRange(sel);
            }
        }

        GetSelector($("[name=url]").val(),editor.session.getTextRange(editor.getSelectionRange()).replace("\"","").replace("\"",""),1);
        '></a>
            <a type="button" data-theme="e" data-role="button" data-icon="android" data-mini="true" data-inline="true" data-iconpos="notext" value="Выбрать несколько елементов"
                   onclick='
        // Get line and pos
        editor.focus();
        var sel = editor.getSelectionRange();
        if (sel.start.column==sel.end.column) {
            var pos = sel.start.column;
            sel.setStart(sel.start.row,0);
            sel.setEnd(sel.start.row+1,0);
            var line = editor.session.getTextRange(sel);
            //alert(line+" : "+pos);
            var m = [];
            var quo = 0;
            var doit = false;
            for (var i=0;i<line.length;i++)
                if (line[i]=="\"") {
                    doit = true;
                    quo = 1-quo;
                    m[i]=quo+2;
                   }
                else m[i] = quo;
        }
        if (doit) {
            if (!m[pos]) // Find it near
                for (i=0;i<line.length;i++)
                    if (m[i] && (Math.abs(pos-i) <5))   pos = i;

            if (m[pos]) while (m[pos]!=3) pos--;
            else doit = false;
            if (doit) {
                sel = editor.getSelectionRange();
                sel.start.column = pos;
                while (m[pos]!=2) pos++;
                sel.end.column = pos+1;
                editor.getSelection().setSelectionRange(sel);
            }
        }

        GetSelector($("[name=url]").val(),editor.session.getTextRange(editor.getSelectionRange()).replace("\"","").replace("\"",""),0);
        '></a>
        <?php } ?>
        <input data-mini="true" data-inline="true" oninput="$('#xback').hide(1000); $('#test').hide(1000); $('#warn').show(1000)" type="text" name="url" value="<?php echo @$donor['check_url'] ?>">
    </p>
    <a data-transition="reverse" id="xback" rel="external" data-role="button" data-icon="arrow-l" data-inline="true" href="<?php u() ?>">Назад</a>
    <input type="submit" data-inline="true" data-icon="check" data-theme="b"
           value="Сохранить"/>
    <?php if ($ins and $donor['check_url'] ) { ?>
    <a target="_blank" id="test" data-role="button" data-transition="slidedown"
       data-inline="true" data-icon="gear" data-theme="a"
       href="go.php?ins_id=<?php echo $ins ?>&url=<?php echo urlencode($go_url) ?>#result">Проверить</a>
    <span id="warn" style="color:grey; display:none;">Для тестирования сохраните изменения</span>
    <?php } else { ?>
    <span style="color:red; font-weight: bold">
        <?php if ($donor['check_url'] ) { ?>
        Для тестирования создайте хотя бы одну задачу
        <?php } else { ?>
        Задайте ссылку на тестовый товар
        <?php } ?>
    </span>
    <?php } ?>
    <a id="wiz" data-role="button" data-transition="slidedown"
       data-inline="true" data-icon="star" data-theme="e"
       href="<?php u() ?>wizard1&id=<?php echo $donor['donor_id'] ?>">Мастер</a>


</form>
<script type="text/javascript">

    function SetSelector(selector) {
        if (selector)
            editor.insert('"'+selector+'"');
        editor.focus();
    }

    $("html, body").animate({ scrollTop: $(document).height()+50000 }, 1000);
    <?php if (!file_exists($donor['host'].'_product.php')) { ?>
    $('#xback').hide(1000); $('#test').hide(1000); $('#warn').show(1000);
    <?php } ?>

    $("#form").submit(function() {
        $("#code").val(editor.getValue());
        return true;
    });

</script>