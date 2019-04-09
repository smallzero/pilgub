<?php
include 'connection1.php';
$sql = "SELECT SUM(kofifah_emil) as pasangan_1, SUM(saiful_puti) as pasangan_2 FROM `hasilsuara`";
if (!$result = $mysqli->query($sql)) {
    // Oh no! The query failed. 
    echo "Sorry, the website is experiencing problems.";

    // Again, do not do this on a public site, but we'll show you how
    // to get the error information
    echo "Error: Our query failed to execute and here is why: \n";
    echo "Query: " . $sql . "\n";
    echo "Errno: " . $mysqli->errno . "\n";
    echo "Error: " . $mysqli->error . "\n";
    exit;
}
$data = $result->fetch_assoc();
$mysqli->close();
echo json_encode($data);
?>