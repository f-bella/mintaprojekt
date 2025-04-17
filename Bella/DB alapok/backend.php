<?php
//Erőforrás változó
$dsn = 'mysql:dbname=test_db;host=127.0.0.1';
$user = 'root';
$password = '';

try {
    $con = new PDO($dsn, $user, $password);
}
catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
$con->exec("set names utf8");


$result = ["total"=>0,"dataSet"=>[]];

if(
    $_POST["name"] == "" &&
    $_POST["role"] == "" &&
    $_POST["status"] == "" 
){}
else{


    $sql = "SELECT 
        count(*) as total
    FROM users 
        left join roles on roles.id = users.role
        left join statuslist on statuslist.id = users.active
    where 
        users.userName like ? and roles.roleName like ? and statuslist.statusName like ?
    ";
    $sth = $con->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
    $sth->execute(["%$_POST[name]%", "%$_POST[role]%", "%$_POST[status]%"]);
    $result["total"] = $sth->fetchAll(PDO::FETCH_COLUMN,0);

    //Query
    $sql = "SELECT 
        users.id,
        users.active,
        statuslist.statusName,
        users.lastEvent,
        users.userName,
        users.role, 
        roles.roleName
    FROM users 
        left join roles on roles.id = users.role
        left join statuslist on statuslist.id = users.active
    where 
        users.userName like ? and roles.roleName like ? and statuslist.statusName like ?
        limit 10
    ";
    $sth = $con->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
    $sth->execute(["%$_POST[name]%", "%$_POST[role]%", "%$_POST[status]%"]);
    $result["dataSet"] = $sth->fetchAll(PDO::FETCH_ASSOC);
}
echo json_encode($result);
