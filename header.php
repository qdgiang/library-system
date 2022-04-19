<?php
  session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <!-- IE8 support -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

  <!-- Font google -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

  <!-- LIGHTBOX CSS -->
  <link rel="stylesheet" href="./css/lightbox.min.css">

  <!-- OWL CSS -->
  <link rel="stylesheet" href="./css/owl.carousel.min.css">
  <link rel="stylesheet" href="./css/owl.theme.default.min.css">

  <!--CSS-->
  <link rel="stylesheet" type="text/css" href="./library/CSS/header.css">
  <link rel="stylesheet" type="text/css" href="./library/CSS/footer.css">
</head>
<body>
  <header>
    <div class="logo">
      <a href="../index.php"><img src="images/logo3.png" alt="logo" srcset="" height="70"></a>
    </div>
        
    <nav>
      <ul>
        <li><a href="./index.php">HOME</a></li>
        <li><a href="../books/reservation.php">RESERVATION</a></li>
        <li><a href="../books/book.php">BOOKS</a></li>
        
        <?php
          if (isset($_SESSION['login_user'])) {
        ?>
            <li><a href="./logout.php">LOGOUT</a></li>
        <?php 
          }
          else{
        ?>
            <li><a href="./login.php">LOGIN</a></li>
            <li><a href="./sign_up.php">JOIN</a></li>
        <?php 
          }
        ?>
      </ul>
    </nav>

  </header>
</body>
</html>