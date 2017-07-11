<?php

sleep(5);
$conn = mysql_connect("db", "root", "heliostech");
$piwik_db = mysql_select_db('piwik', $conn);

if(!$piwik_db)
  echo mysql_query('CREATE DATABASE piwik') ? "Piwik db created successfully" : mysql_error(); 
else
  echo "Piwik DB already exists";

mysql_close($conn);
?>
