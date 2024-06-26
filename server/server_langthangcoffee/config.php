<?php

// Http Url
$scriptName = str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME']));
define('HTTP_URL', '/' . substr_replace(trim($_SERVER['REQUEST_URI'], '/'), '', 0, strlen($scriptName)));


// Define Path Application
define('SCRIPT', str_replace('\\', '/', rtrim(__DIR__, '/')) . '/');
define('SYSTEM', SCRIPT . 'System/');
define('CONTROLLERS', SCRIPT . 'Application/Controllers/');
define('MODELS', SCRIPT . 'Application/Models/');
define('UPLOAD', SCRIPT . 'Upload/');
define('SERVERKEYMESSAGE', '');
define('IMGUR_CLIENT_ID', '');

// Config Database
define('DATABASE', [
    'Port'   => '3306',
    'Host'   => 'localhost',
    'Driver' => 'PDO',
    'Name'   => 'langthangcoffee',
    'User'   => 'root',
    'Pass'   => '',
    'Prefix' => ''
]);
// DB_PREFIX
define('DB_PREFIX', '');

date_default_timezone_set('Asia/Ho_Chi_Minh');
