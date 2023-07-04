<?php

date_default_timezone_set('Asia/jakarta');

define('DB_HOST', 'localhost');
define('DB_NAME', 'ppob');
define('DB_USER', 'root');
define('DB_PASS', 'root');
define('BASEURL', 'http://localhost/ppob/public/');
define('WEB_NAME', 'M Pedia');



$ttt = new DateTime();
$date = date('Y-m-d');
$time = date('H:i:s');

define('DATE', $date);
define('TIME', $time);


//error_reporting(0);
