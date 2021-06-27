<?php
include 'conn.php';

$kodeBarang = $_POST['kodeBarang'];
$namaBarang = $_POST['namaBarang'];
$hargaBarang = $_POST['hargaBarang'];
$stokBarang = $_POST['stokBarang'];

$connect->query("INSERT INTO barang (kode,nama,harga,stok) VALUES('".$kodeBarang."','".$namaBarang."','".$hargaBarang."','".$stokBarang."')");

?>