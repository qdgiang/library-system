<?php
include "../header.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reader</title>

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
  <link rel="stylesheet" type="text/css" href="../CSS/style.css">
  <link rel="stylesheet" type="text/css" href="../CSS/header.css">
  <link rel="stylesheet" type="text/css" href="../CSS/footer.css">
</head>

<body>
  <div class="wrapper">
    <!-- <header>
      <div class="logo">
        <a href="../index.php"><img src="images/logo3.png" alt="logo" srcset="" height="70"></a>
      </div>

      <?php
        if (isset($_SESSION['login_user'])) {
      ?>    
          <nav>
            <ul>
              <li><a href="./index.php">HOME</a></li>
              <li><a href="../books/book.php">BOOKS</a></li>
              <li><a href="">
                <div style="color: white">
                  <?php
                    echo "Welcome ".$_SESSION['login_user']; 
                  ?>
                </div>
              </a></li>
              <li><a href="./logout.php">LOGOUT</a></li>
            </ul>
          </nav>
      <?php
        }
        else {
      ?> 
          <nav>
            <ul>
              <li><a href="./index.php">HOME</a></li>
              <li><a href="../books/book.php">BOOKS</a></li>
              <li><a href="./login.php">LOGIN</a></li>
              <li><a href="./sign_up.php">JOIN</a></li>
            </ul>
          </nav>
      <?php
        }
      ?>
        
    </header> -->
    <section>
      <div class="box">
        <h1>Welcome to the library</h1>
        <h2 style="color:silver;"><a href="login.php">Login</a> or <a href="sign_up.php">join</a> to find the books you're looking for</h2>
      </div>
    </section>
    <?php include "../footer.php"; ?>
  </div>
</body>
</html>