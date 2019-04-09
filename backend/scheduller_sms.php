<?php
include 'connection2.php';
include 'connection1.php';
$sql = "SELECT pilgub_id, id, `action` FROM pilgub_inbox WHERE `action` = 'INSERT' ";
if (!$result = $mysqli_2->query($sql)) {
    // Oh no! The query failed. 
    echo "Sorry, the website is experiencing problems.";

    // Again, do not do this on a public site, but we'll show you how
    // to get the error information
    echo "Error: Our query failed to execute and here is why: \n";
    echo "Query: " . $sql . "\n";
    echo "Errno: " . $mysqli_2->errno . "\n";
    echo "Error: " . $mysqli_2->error . "\n";
    exit;
}
while($row = $result->fetch_assoc()){
    $idSMS = $row['id'];
    $pilgubId = $row['pilgub_id'];
    $sqlSMS = "SELECT ID, TextDecoded, SenderNumber FROM `inbox` WHERE ID=".$idSMS;
    if($resultSMS = $mysqli_2->query($sqlSMS)){
        $sms = $resultSMS->fetch_assoc();
        $smsNumber = $sms['SenderNumber'];
        $smsParse = explode("#", $sms['TextDecoded']);
        $validate = false;
        if(count($smsParse)==9){
            if(is_numeric($smsParse[2]) && is_numeric($smsParse[3]) 
                && is_numeric($smsParse[4]) && is_numeric($smsParse[5])
                && is_numeric($smsParse[6])&& is_numeric($smsParse[7])
                && is_numeric($smsParse[8]) ) {
                $validate = true;
            }
        }
        if($validate){
            //exis validate
            $sqlPilgubExist ="SELECT * FROM hasilsuara WHERE UPPER(kecamatan)=UPPER('".$smsParse[0]."') "
                ." AND UPPER(desa)=UPPER('".$smsParse[1]."') AND tps=".$smsParse[2];
            if($resultPilgubExist = $mysqli->query($sqlPilgubExist)){
                $index = 0;
                while($row = $resultPilgubExist->fetch_assoc()){
                    $index++;
                }
                
                if($index>0){
                    echo "update";
                    $dataPilgubExist = $resultPilgubExist->fetch_assoc();
                    $sqlPilgubUpdate = "UPDATE hasilsuara SET kofifah_emil=".$smsParse[3]
                    .", saiful_puti=".$smsParse[4].", tidaksah="
                    .$smsParse[5].", total= ".($smsParse[3]+$smsParse[4]+$smsParse[5]).",tidakhadir=".$smsParse[6].",dptb=".$smsParse[7].",suratrusak=".$smsParse[8]
                    ." WHERE UPPER(kecamatan)=UPPER('".$smsParse[0]."') AND UPPER(desa)=UPPER('".$smsParse[1]."') AND tps=".$smsParse[2];
                    $mysqli->query($sqlPilgubUpdate);
                } else {
                    echo "insert";
                    $sqlPilgubInsert = "INSERT INTO hasilsuara (nohp, kecamatan, desa, tps, kofifah_emil, saiful_puti, tidaksah, total
                        ,tidakhadir,dptb,suratrusak)
                        VALUES('".$smsNumber."','".$smsParse[0]."', '".$smsParse[1]."', ".$smsParse[2].", ".$smsParse[3].", ".$smsParse[4]
                        .", ".$smsParse[5].",".($smsParse[3]+$smsParse[4]+$smsParse[5]).", ".$smsParse[6].", ".$smsParse[7].", ".$smsParse[8].")";
                    $mysqli->query($sqlPilgubInsert);
                }
                
            }

            $sqlSMSUpdate = "UPDATE pilgub_inbox SET action='PROCESSED' WHERE pilgub_id=".$pilgubId;
            $mysqli_2->query($sqlSMSUpdate);
        } else {
            $sqlSMSUpdate = "UPDATE pilgub_inbox SET action='FAILED' WHERE pilgub_id=".$pilgubId;
            $mysqli_2->query($sqlSMSUpdate);

        }
    }
}

$mysqli_2->close();
$mysqli->close();
echo "success";
?>