<?php
/**
 * Скрипт для запуска через cron автоэкспорта товаров вконтакте(модуль vkExport)
 */

include 'config.php';

if (in_array('-wall', $argv)) {
    $logfile = 'vkExport_cron_wall.txt';
    $route = 'autowallpost';
}
else if (in_array('-update', $argv)) {
    $logfile = 'vkExport_cron_update.txt';
    $route = 'autoupdate';
}
else {
    $logfile = 'vkExport_cron.txt';
    $route = 'autoexport';
}

if (file_exists(DIR_LOGS . $logfile) && !unlink(DIR_LOGS . $logfile)) {
    die('Ошибка прав доступа к файлу лога ' . DIR_LOGS . $logfile);
}

// лог
function logging($text, $logfile) {
    $date = date('d.m.y H:i:s');
    $msg = "Date: $date\n";
    $msg .= $text . " \n------------------------------------------------------\n";
    file_put_contents(DIR_LOGS . $logfile, $msg, FILE_APPEND);
}
logging('Старт скрипта', $logfile);
chmod(DIR_LOGS . $logfile, 0777);

$res = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD);
mysql_select_db(DB_DATABASE);
$query = mysql_query('SELECT * FROM ' . DB_PREFIX . 'setting WHERE `group` = \'vk_export\' AND (`key` = \'vk_export_cron_user\' OR `key` = \'vk_export_cron_pass\')');
$user = array();
while ($row = mysql_fetch_assoc($query)) {
    $user[$row['key']] = $row['value'];
}
echo mysql_error();
mysql_close($res);

if (!$user) {
    logging('не найдены данные пользователя для запуска автоэкспорта', $logfile);
    exit();
}

$ch = curl_init(HTTP_SERVER . 'index.php?route=common/login');
curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.0.4) Gecko/2008102920 AdCentriaIM/1.7 Firefox/3.0.4");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
curl_setopt($ch, CURLOPT_AUTOREFERER, true);
curl_setopt($ch, CURLOPT_HEADER, true);
curl_setopt($ch, CURLOPT_POST, true); // set POST method  
curl_setopt($ch, CURLOPT_POSTFIELDS, 'username=' . $user['vk_export_cron_user'] . '&password=' . $user['vk_export_cron_pass']); // add POST fields
$res = curl_exec($ch);
curl_close($ch);

if (preg_match('/Location: .+?index\.php\?route=common\/home&token=(.+?)\n/', $res, $matches)) {
    logging('Успешная авторизация в админке', $logfile);
    $cookie_string = '';
    preg_match_all('/Set-Cookie:(.+?)\n/', $res, $cookies);
    for ($i = 0; $i < count($cookies[0]); $i++) {
        $cookie_string .= trim($cookies[1][$i]) . '; ';
    }
    
    $ch = curl_init(HTTP_SERVER . 'index.php?route=extension/vk_export/' . $route . '&token=' . trim($matches[1]));
    curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.0.4) Gecko/2008102920 AdCentriaIM/1.7 Firefox/3.0.4");
    curl_setopt($ch, CURLOPT_COOKIE, $cookie_string);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_AUTOREFERER, true);
    $res = curl_exec($ch);
    echo $res;
}
else {
    logging('неудачная авторизация в админке', $logfile);
}

?>
