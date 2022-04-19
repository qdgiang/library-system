<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Library Management System</title>
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
  <link rel="stylesheet" type="text/css" href="CSS/sign_up.css">
  <link rel="stylesheet" type="text/css" href="CSS/header.css">
  <link rel="stylesheet" type="text/css" href="CSS/footer.css">
</head>
<body>
  <div class="wrapper">
    <header>
      <div class="logo">
        <a href="./index.php"><img src="./images/logo3.png" alt="logo" srcset="" height="70"></a>
      </div>
          
      <nav>
        <ul>
          <li><a href="index.php">HOME</a></li>
          <li><a href="books/reservation.php">RESERVATION</a></li>
          <li><a href="books/book.php">BOOKS</a></li>
          <li><a href="index.php">LOGIN</a></li>
          <li><a href="index.php">JOIN</a></li>
        </ul>
      </nav>
    </header>
    <section>
      <div class="bg">
        <br><br><br><br>
        <h1 class="title">LIBRARY MANAGEMENT SYSTEM</h1><br>
        <div class="signup">
          <h1 style="font-size: 25px; text-align: center;">Access the library as:</h1>
            <div class="submit"style="color: rgba(255,255,255,1)">
              <form action="reader/index.php">
                <input type="submit" value="READER">
              </form>
              <form action="librarian/index.php">
                <input type="submit" value="LIBRARIAN">
              </form>
            </div>
        </div>
      </div>
    </section>
    <?php include "footer.php"; ?>
  </div>
</body>
</html>