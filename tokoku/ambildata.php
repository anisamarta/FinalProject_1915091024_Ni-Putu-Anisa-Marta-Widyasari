<?php
include 'conn.php';

$hasilQuery=$connect->query("SELECT * FROM barang");

$hasil = array();

while($potongganData=$hasilQuery->fetch_assoc()){
    $hasil[]=$potongganData;
}

echo json_encode($hasil);

?>