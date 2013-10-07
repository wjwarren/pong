<?php

require_once ("../php_lib/template_parser.php");
require_once ("ponfig.php");
require_once ("../php_lib/db_functions.php");

//create the header
$newpage = new Page("templates/home/home_head.tpl");
$newpage->output();

//create all the news items
$db_connection = dbConnect($dbhost, $dbuser, $dbpass);
selectDataBase($db_connection, $dbname);
$db_query = "SELECT DATE_FORMAT(datum, '%e-%c-%Y'), item FROM nieuws ORDER BY datum DESC";
$result = dbQuery($db_connection, $db_query);
while ($row = mysql_fetch_row($result)) {
	//$tags["datum"]		= dbQuery($db_connection, "DATE_FORMAT($row[0], '%e-%c-%Y')");
	$tags["datum"]		= $row[0];
	$tags["bericht"]	= $row[1];
	$newpage = new Page("templates/home/home_item.tpl");
	$newpage->replace_tags($tags);
	$newpage->output();
}

//create the footer
$newpage = new Page("templates/home/home_foot.tpl");
$newpage->output();

?>