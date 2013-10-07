<?php

require_once ("../../php_lib/template_parser.php");
require_once ("../ponfig.php");
require_once ("../../php_lib/db_functions.php");

//create the header
$newpage = new Page("../templates/scores/scores_head.tpl");
$newpage->output();

//create all the scores
$db_connection = dbConnect($dbhost, $dbuser, $dbpass);
selectDataBase($db_connection, $dbname);
$cols = array("tijd", "speler", "ai", "score", "niveau");
$sort_col = getSort($cols);
$result_sort = getSortType();
$db_query = "SELECT * FROM scores ORDER BY " . $sort_col . " " . $result_sort;
$result = dbQuery($db_connection, $db_query);
while ($row = mysql_fetch_row($result)) {
	$tags["mens"]		= $row[0];
	$tags["ai"]	= $row[1];
	$tags["score"]	= $row[2];
	$tags["niveau"]	= $row[3];
	$newpage = new Page("../templates/scores/scores_row.tpl");
	$newpage->replace_tags($tags);
	$newpage->output();
}

//create the footer
$newpage = new Page("../templates/scores/scores_foot.tpl");
$newpage->output();

?>