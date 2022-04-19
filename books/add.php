<?php
include "../connection.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Adding books</title>
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
      <div class="dropdown">
        <button class="dropbtn">Category</button>
        <div class="dropdown-content">
          <li>1. Horror</li>
          <li>2. Comedy</li>
          <li>3. History</li>
          <li>4. Journal</li>
          <li>5. Fantasy</li>
          <li>6. Comic book</li>
          <li>7. Classic</li>
          <li>8. Dystopian</li>
          <li>9. Mystery</li>
          <li>10.Thriller & Suspense</li>
          <li>11.Romance</li>
          <li>12.Biography</li>
          <li>13.Science & Technology</li>
          <li>14.Textbook</li>
          <li>15.Novel</li>
        </div>
      </div>

      <div class="box">        
        <h1 class="title">Adding Books</h1>
        <form class="book" action="" method="post">
          <input type="number"name="isbn" class="form-control" placeholder="Book ID" required="">
          <input type="number"name="no_of_copies" class="form-control" placeholder="No. of Copies" required="">
          <input type="text" name="title" class="form-control" placeholder="Title" required="">
          <input type="number"name="b_year" class="form-control" placeholder="Publshed Year" required="">
          <input type="text"name="publisher" class="form-control" placeholder="Publisher" required="">
          <input type="number"name="cateID" class="form-control" placeholder="CategoryID" required="">
          <!-- <input type="text"name="a_name" class="form-control" placeholder="Author" required=""> -->

          <div class="submit">
              <input type="submit" name="submit" value="ADD BOOK">
          </div>
        </form>
        <?php
          if(isset($_POST['submit'])){
            mysqli_query($db, "INSERT INTO mylib.book(isbn, no_of_copies, title, b_year, publisher) VALUES ('$_POST[isbn]', '$_POST[no_of_copies]', '$_POST[title]', '$_POST[b_year]', '$_POST[publisher]')");
            mysqli_query($db, "INSERT INTO book_has_categories(isbn, cateID) VALUES ('$_POST[isbn]','$_POST[cateID]')");
            // mysqli_query($db, "INSERT INTO authors_have_books(a_name, isbn) VALUES ('$_POST[a_name]', '$_POST[isbn]')");
        ?>

        <script type="text/javascript">
          alert("Book has been added successfully");
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