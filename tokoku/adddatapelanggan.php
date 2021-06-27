<?php
include 'conn.php';

$namapelanggan = $_POST['namapelanggan'];
$nohp = $_POST['nohp'];
$alamat = $_POST['alamat'];

$connect->query("INSERT INTO pelanggan (namapelanggan,nohp,alamat) VALUES('".$namapelanggan."','".$nohp."','".$alamat."')");

?>