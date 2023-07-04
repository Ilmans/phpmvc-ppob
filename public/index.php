<?php
date_default_timezone_set('Asia/jakarta');
// session_save_path('0;644;/home/darkforc/sessions');
// umask(0);
// ini_set('session.gc_probability', 1);

session_start();
require_once('../app/init.php');
new App;
