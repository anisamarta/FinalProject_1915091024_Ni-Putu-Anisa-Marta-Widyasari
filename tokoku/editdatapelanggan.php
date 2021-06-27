<?php
include 'conn.php';

$id = $_POST['id'];
$namapelanggan = $_POST['namapelanggan'];
$nohp = $_POST['nohp'];
$alamat = $_POST['alamat'];

$connect->query("UPDATE pelanggan SET namapelanggan='".$namapelanggan."',nohp='".$nohp."',alamat='".$alamat."'WHERE id=".$id);

?>