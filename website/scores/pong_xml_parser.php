<?php

$theElements = array();
$oldElements = array();
$thisElement = "";

function startElement($parser, $name, $attribs){
	global $theElements, $oldElements, $thisElement;
	array_push($oldElements, $thisElement);
	$thisElement = $name;
	$theElements[$thisElement] = "";
}

function endElement($parser, $name){
	global $oldElements, $thisElement;
	$thisElement = array_pop($oldElements);
}

/* 
 * XML CharacterData handler
 */
function characterData($parser, $text){
	global $theElements, $thisElement;
	$theElements[$thisElement] .= $text;
}

function unknownXML($parser, $text){
	echo "What is this? ( $text )<br/>\n";
}

$xml_parser = xml_parser_create();

//specify the different XML handlers...
xml_set_default_handler($xml_parser, "unknownXML");
xml_set_element_handler($xml_parser, "startElement", "endElement");
xml_set_character_data_handler($xml_parser, "characterData");

$data = $HTTP_RAW_POST_DATA;

if( !xml_parse($xml_parser, $data, true) ){
	die( "XML error: " . xml_error_string( xml_get_error_code($xml_parser) ). " at line " . xml_get_current_line_number($xml_parser) );
}

// save to database...
require_once ("../ponfig.php");
require_once ("../../php_lib/db_functions.php");

$human 			= $theElements["HUMANNAME"];
$ai 			= $theElements["AINAME"];
$pong_result 	= $theElements["PONGRESULT"];
$difficulty		= $theElements["DIFFICULTY"];
$table			= "scores";

$db_connection = dbConnect($dbhost, $dbuser, $dbpass);
selectDataBase($db_connection, $dbname);

$cols = getColNames(getFields($table, $db_connection));
$query = "INSERT into $table values ( '$human', '$ai', '$pong_result', '$difficulty', NOW() )";
$succes = dbQuery($db_connection, $query);

// return results
header("Content-type: text/xml");
echo ("<xml><succes>");
if($succes){
	echo ("Ja");
}
else{
	echo ("Nee");
}
echo ("</succes></xml>");

xml_parser_free($xml_parser);

?>