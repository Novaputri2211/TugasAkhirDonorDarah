<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Method: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers,Authorization,X-Requested-With");

function msg($success,$status,$message,$extra = []){
    return array_merge([
        'success' => $success,
        'status' => $status,
        'message'=> $message
    ],$extra);
}

include_once '../class/database.php';

$database = new Database();
$conn = $database->dbConnection();

$returnData = [];

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    $returnData = msg(0,404,'Page Not Found');

}else if ( !isset($_POST['id_pendonor']) || !isset($_POST['id_user']) || !isset($_POST['tgl_ambil']) || !isset($_POST['kantong_diambil']) ||
         empty(trim($_POST['id_pendonor'])) ||empty(trim($_POST['id_user'])) || empty(trim($_POST['tgl_ambil'])) || empty(trim($_POST['kantong_diambil'])) 
){
    $returnData = msg(0,422,'Isi Semua Data');
}else{
    $id_user = $_POST['id_user'];
    $id_pendonor = $_POST['id_pendonor'];
    $tgl_ambil = $_POST['tgl_ambil'];
    $kantong = $_POST['kantong_diambil'];

    $query = " INSERT INTO tb_history(id_user,id_pendonor,tgl_ambil,kantong_diambil)
                VALUES(:iduser, :idpendonor, :tgl, :kantong) ";
    $set = $conn->prepare($query);
    $set->bindParam(":iduser", $id_user);
    $set->bindParam(":idpendonor", $id_pendonor);
    $set->bindParam(":tgl", $tgl_ambil);
    $set->bindParam(":kantong", $kantong);
    $set->execute();

    $returnData = msg(1,200,'History Ditambahkan');

}
echo json_encode($returnData);
?>