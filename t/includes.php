<?php
//1 vuln, 1 safe call
include($_GET['lang'].'/error100.txt');
include("frameset.php");
include_once($_COOKIE['theme']."/css3-style.php");
include_once('menu.inc.php');
require($_GET[category]."php");
require('functions.php');
require "lib/lang/$_COOKIE['language'].php";
require_once($_POST[action]);
require_once('includes/DB.php');
//fread
?>
