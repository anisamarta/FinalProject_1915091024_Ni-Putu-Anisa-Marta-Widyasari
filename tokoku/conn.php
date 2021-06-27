<?php
$connect= new mysqli ("localhost", "root","","tokoku");

if($connect) {

}else{
    echo "koneksi ke DB gagal";
    exit();
}
?>