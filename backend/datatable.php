<?php
include 'connection1.php';
$sql = "SELECT nohp,kecamatan, desa, tps,kofifah_emil,saiful_puti,tidaksah,total,tidakhadir,dptb,suratrusak FROM `hasilsuara` ORDER BY kecamatan, desa, tps, nohp";
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
$dataRow = [];
while($row = $result->fetch_assoc()){
    $dataRow[] = $row;
}

$data = array( "row" => $dataRow);
$mysqli->close();
echo json_encode($data);
?>