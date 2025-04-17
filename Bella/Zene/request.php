<?php
$dsn = 'mysql:dbname=zene;host=127.0.0.1';
$user = 'root';
$password = '';

try {
    $con = new PDO($dsn, $user, $password);
}
catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
$con->exec("set names utf8");

//$_POST[parameters]
if( isset($_POST) ){
    $sql = " CALL `$_POST[procedure]` ($_POST[parameters])";
    $sth = $con->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
    $sth->execute([]);
    $result =  $sth->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
   
}


