<?php
$Taruh = json_decode(file_get_contents('php://input'),true); 
$username= $Taruh["Username"];
$feedback=  $Taruh["Feedback"];
$timestamp = date('d/m/Y h:i:s');
$feed = 'logs/feedback-info.html';
$fb = fopen($feed, 'a+');
fwrite($fb, '</h></p><h style="color:white;">Time : ['.$timestamp.'] <p> Username : '.$username.' </p><p> Feedback : '.$feedback. "\n\n<br><br>");
fclose($fb);