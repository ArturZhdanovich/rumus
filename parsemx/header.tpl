<?php
        header('Content-Type: text/html; charset=utf-8');
?>

<!DOCTYPE html>
<html>
<head>
    <title><?php echo $site ?> - ParseMX</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="lib/jquery.mobile-1.2.0.min.css" />
    <link rel="stylesheet" href="lib/jqm-icon-pack.css" />
    <script src="lib/jquery-1.8.2.min.js"></script>

    <script type="text/javascript">
    $(document).bind("mobileinit", function(){
        $.mobile.defaultPageTransition ='pop';
    });
    </script>

    <script src="lib/jquery.mobile-1.2.0.min.js"></script>
</head>

<style type="text/css">
    @media only screen and (min-width: 700px) {
        .ui-page {
            width: 700px !important;
            margin: 0 auto !important;
            position: relative !important;
        }
        .ui-footer {
            max-width: 700px;
            margin: 0 auto;
        }
        BODY {
            background-color: #aaa !important;
        }
    }

    .remark {
      color:grey;
      font-size:12px;
    }
</style>

<body>

<div data-role="page">

    <div data-role="header" data-theme="b">

        <?php if (!empty($_GET['route'])) { ?>
            <a href="<?php u() ?>" rel="external" data-direction="reverse" data-icon="home">Домой</a>
        <?php } ?>
        <h1><?php echo 'ParseMX ' . version . '' ?></h1>
        <div align="center" style="font-size:13px;">написание инструкций для parsemx: support@ruopencart.com (недорого!)</div>  <br>
    </div><!-- /header -->

    <div data-role="content">

