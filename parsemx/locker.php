<?php

$max_time_in_minutes= 4.5 ; // Max execution time in minutes;

$max_time = (int) ($max_time_in_minutes*60);

$locker = 'locker.tmp';

// *** ParseMX fast locker check ***
if (file_exists($locker) and (filemtime($locker)>time() - $max_time)) {
        echo "ParseMX script already working. Exiting";
        exit;
    } else {
    $max_time -= 30;
    require('go.php');
}