<style type="text/css">
    .log {
        left:750px;
        width:600px;
        top: 0px;
        margin-top: 130px;
        height:400px;
        z-index: 1000;
        background-color:#AAA;
        font-size: 10px;
        text-shadow: none;

        -webkit-transition: left 0.3s,width 0.3s,height 0.3s, margin-top 0.3s, font-size 0.3s, background-color 1s;
        -moz-transition: left 0.3s,width 0.3s,height 0.3s, margin-top 0.3s, font-size 0.3s, background-color 1s;
        -o-transition: left 0.3s,width 0.3s,height 0.3s, margin-top 0.3s, font-size 0.3s, background-color 1s;
        transition: left 0.3s,width 0.3s,height 0.3s, margin-top 0.3s, font-size 0.3s, background-color 1s;
    }
    .log:hover {
        left:450px;
        width:500px;
        background-color:#DDD;
        border: 2px solid #BBB;
        margin-top: 10px;
        height: 600px;
        font-size: 12px;
    }
    .log:hover .loghead {
        display:block;
    }
    .loghead {
        display:none;
        text-align: center;
        background-color: #BBB;
        font-size: 12px;
        padding:3px;
        height:15px;
        color:white;
        margin-bottom: 5px;
    }
    .logfeed {
        width:100%;
        height:400px;
        overflow:hidden;
        font-size: 10px;

        -webkit-transition: height 0.3s, font-size 0.3s;
        -moz-transition: height 0.3s, font-size 0.3s;
        -o-transition: height 0.3s, font-size 0.3s;
        transition: height 0.3s, font-size 0.3s;
    }
    .log:hover .logfeed {
        height:570px;
        font-size: 12px;
        overflow:auto;
    }
</style>
<div class="log" style="position:absolute; padding:7px; color:#ddd; display:none;">
    <div class="loghead">Лог операций</div>
    <div class="logfeed" id="logfeed"></div>
</div>

<img title="Close Window" src="lib/close.gif" id="selectclose" style="display:none; position:fixed; left:95%; top: 1%; cursor: pointer"
    onclick="iSetSelector('')" />
<iframe data-role="popup" id="selectorg"
        style="display:none; position:fixed; background-color:#EEE; left:2%; top: 4%; width:96%; height:92%;"></iframe>

<script type="text/javascript">
    // Selector-Gadget communication
    var iSelector = '';
    function GetSelector(url,selector,single) {
        //alert(document.body.style.overflow);
        document.body.style.overflow = 'hidden';
        url = "selector.php?url="+encodeURIComponent(url)+'&single='+single;
        iSelector = selector;
        $('#selectorg').attr('src', url).show(300);
        $('#selectclose').show();
    }

    function iSetSelector(selector) {
        $('#selectorg').hide().attr('src', 'about:blank');
        $('#selectclose').hide();
        document.body.style.overflow = '';
        SetSelector(selector);
    }
</script>

<script type="text/javascript">

    $(document).bind("mobileinit", function(){
        $.mobile.ajaxEnabled = false;
    });

    $(window).scroll(function(){
        $('.log').css('top',($(window).scrollTop()+0)+'px');
    });

    setInterval('UpdateLog();<?php if (empty($_GET["route"])) echo "UpdateDonors();" ?>', 3000);

    var feeds = 0;
    function UpdateLog()
    {
        $.get('feed.php',false, function(data) {
            if (!data) return;
            var logfeed = $('.logfeed');
            if (feeds++>50) {
                logfeed.empty();
                feeds = 0;
            }
            logfeed.append(data);
            <?php if (@$_GET["route"]!=="wizard2") { ?>
            $(".log").show();
            <?php } ?>
            //$("#log").scrollTop($("#log")[0].scrollHeight);
            //animate({scrollTop : 0},'slow');
            logfeed.animate({scrollTop:logfeed[0].scrollHeight},1800);
        },"json");
    }

    UpdateLog();<?php if (empty($_GET["route"])) echo "UpdateDonors();" ?>

</script>

</div><!-- /content -->

</div><!-- /page -->

</body>
</html>