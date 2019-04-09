<?php
    $mysqli_2 = new mysqli('127.0.0.1', 'root', '', 'sms');
    if ($mysqli_2->connect_errno) {
        echo "Sorry, this website is experiencing problems.";

        // Something you should not do on a public site, but this example will show you
        // anyways, is print out MySQL error related information -- you might log this
        echo "Error: Failed to make a MySQL connection, here is why: \n";
        echo "Errno: " . $mysqli_2->connect_errno . "\n";
        echo "Error: " . $mysqli_2->connect_error . "\n";
    }
?>