<?php
// *** ParseMX Log Feed ***

$feed='feed.log';

if (@filesize($feed)>50000) @unlink($feed);

$data=@file_get_contents($feed);
if (!$data) $data='';
@unlink($feed);

echo json_encode($data);