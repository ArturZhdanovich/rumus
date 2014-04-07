<?php
// *** ParseMX Admin ***

require_once("parsemx.php");
require_once('platform.php'); // Use platform connector

function redirect($route) {
    header('Location: index.php?rd='.rand(1,10000000)."&route=".$route);
    exit;
}

/* Redirect when require admin rights */
if (! HaveAdminAccess() ) {
    header('Location: /admin/');
    exit;
}

CheckParseMXTables();

$newversion = '';
$site = $host;

// Random to disable JQM Caching
function u() {
    echo "index.php?rd=".rand(1,10000000)."&route=";
}

// Generate page

if (@$_GET['route']) {
    require_once(@$_GET['route'].".tpl");
} else {
    require_once("donors_list.php");
}
require_once("footer.tpl");
?>