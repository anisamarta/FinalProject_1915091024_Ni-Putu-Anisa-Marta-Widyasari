<?php
include 'conn.php';

$hasilQuery=$connect->query("SELECT * FROM pelanggan");

$hasil = array();

while($potongganData=$hasilQuery->fetch_assoc()){
    $hasil[]=$potongganData;
}

echo json_encode($hasil);

?>