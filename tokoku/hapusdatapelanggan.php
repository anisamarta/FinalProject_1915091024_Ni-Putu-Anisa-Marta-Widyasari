<?php
    include 'conn.php';
    $id=$_POST['id'];
    $connect->query("DELETE FROM pelanggan WHERE id=".$id);

?>