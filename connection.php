<?php

  $db=mysqli_connect("localhost","root","","mylib"); //server name, username, password, database
  if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
  }

  //echo "Connected successfully";
  // run select query on $old
  // run matching insert query on $new

?>