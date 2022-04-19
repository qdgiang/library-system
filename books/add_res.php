<?php
include "../connection.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Adding reservations</title>
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
  <link rel="stylesheet" type="text/css" href="../CSS/add.css">
  <link rel="stylesheet" type="text/css" href="../CSS/header.css">
  <link rel="stylesheet" type="text/css" href="../CSS/footer.css">
</head>
<body>
  <header>
    <div class="logo">
      <a href="../index.php"><img src="../images/logo3.png" alt="logo" srcset="" height="70"></a>
    </div>  
    <nav>
       <ul>
        <li><a href="../index.php">HOME</a></li>
        <li><a href="reservation.php">RESERVATION</a></li>
        <li><a href="book.php">BOOKS</a></li>
        <li><a href="../index.php">LOGIN</a></li>
        <li><a href="../index.php">JOIN</a></li>
      </ul>
    </nav>
  </header>
  <div class="wrapper">
    <section>
      <div class="box">        
        <h1 class="title">Adding Reservation</h1>
        <form class="book" action="" method="post">
          <input type="text"name="isbn" class="form-control" placeholder="Book ID" required="">
          <input type="number"name="copyID" class="form-control" placeholder="Copy ID" required="">
          <input type="text" name="readerName" class="form-control" placeholder="Reader Name" required="">
          <input type="number"name="libID" class="form-control" placeholder="Library ID" required="">
          <!-- <input type="text"name="a_name" class="form-control" placeholder="Author" required=""> -->

          <div class="submit">
              <input type="submit" name="submit" value="ADD RESERVATION">
          </div>
        </form>
        <?php
          if(isset($_POST['submit'])){
            mysqli_query($db, "call add_new_reservation('$_POST[isbn]','$_POST[copyID]','$_POST[readerName]','$_POST[libID]')");
            // mysqli_query($db, "INSERT INTO authors_have_books(a_name, isbn) VALUES ('$_POST[a_name]', '$_POST[isbn]')");
        ?>

        <script type="text/javascript">
          alert("Reservation has been added successfully");
        </script>

        <?php
          }
        ?>

      </div>
    </section>
    <?php include "../footer.php"; ?>
  </div>
</body>
</html>