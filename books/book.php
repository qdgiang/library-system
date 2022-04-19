<?php
  include "../connection.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Books</title>

  <!-- IE8 support -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

  <!-- Font google -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!--CSS-->
  <link rel="stylesheet" type="text/css" href="../CSS/header.css">
  <link rel="stylesheet" type="text/css" href="../CSS/footer.css">
  <link rel="stylesheet" type="text/css" href="../CSS/book.css">
</head>

<body>
  <div>
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

    <section>
      <div class="box">
        <h1>List of Books</h1>
        <div class="search-style">
          <form class="navbar-form" method="post" name="search-form">
            <!-- <label for="cate_name">Choose a category</label>
              <select name="cate_name">
                <option>Horror</option>
                <option>Comedy</option>
                <option>History</option>
                <option>Journal</option>
                <option>Fantasy</option>
                <option>Comic book</option>
                <option>Classic</option>
                <option>Dystopian</option>
                <option>Mystery</option>
                <option >Thriller & Suspense</option>
                <option >Romance</option>
                <option >Biography</option>
                <option >Science & Technology</option>
                <option >Textbook</option>
                <option >Novel</option>
              </select> -->
          
            <div class="search-bar">
              <input class="form-control" type="text" name="search" placeholder="Search" required="">
              <button  name="submit" class="btn btn-default">
                <span><i class="fas fa-search"></i></span>
              </button>
            </div>
          </form>
         
          <form action="add.php">
          <div>
              <button name="add" class="btn btn-default">
                <i class="fas fa-plus"></i>
              </button>
            </div>
          </form>
        </div>
        <?php
          if (isset($_POST['submit'])) {
            $q = mysqli_query($db,"SELECT b.isbn, b.no_of_copies, b.title, b.b_year, b.publisher, GROUP_CONCAT(c.cate_name) as 'Categories' 
            from book b
             join book_has_categories bc ON b.isbn = bc.isbn
             join category c ON bc.cateID = c.cateID
            where no_of_copies LIKE '%$_POST[search]%' OR title LIKE '%$_POST[search]%' OR b_year LIKE '%$_POST[search]%' OR publisher LIKE '%$_POST[search]%' OR c.cate_name LIKE '%$_POST[search]%'
            group by b.isbn");
            
            if (mysqli_num_rows($q) == 0) {
              echo "Sorry, seems like we don't have your book yet.";
            }
            else {
              echo "<table class='table table-hover'>";
              echo "<tr>";
                echo "<th>"; echo "ID"; echo "</th>";
                echo "<th>"; echo "No. of Copies"; echo "</th>";
                echo "<th>"; echo "Titles"; echo "</th>";
                echo "<th>"; echo "Published Year"; echo "</th>";
                echo "<th>"; echo "Publisher"; echo "</th>";
                echo "<th>"; echo "Category"; echo "</th>";
                // echo "<th>"; echo "Author"; echo "</th>";
                echo "<th class='right'>"; echo "Edit"; echo"</th>";
              echo "</tr>";
    
              while ($row=mysqli_fetch_assoc($q)) {
                echo "<tr>";
                  echo "<td>"; echo $row['isbn']; echo "</td>";
                  echo "<td>"; echo $row['no_of_copies']; echo "</td>";
                  echo "<td>"; echo $row['title']; echo "</td>";
                  echo "<td>"; echo $row['b_year']; echo "</td>";
                  echo "<td>"; echo $row['publisher']; echo "</td>";
                  echo "<td>"; echo $row['Categories']; echo "</td>";
                  // echo "<td>"; echo $row['a_name']; echo "</td>";
                  echo "<td>"; echo "<a href='#' class='edit'>";
                               echo "<i class='fa fa-pen'>"; echo "</i>";
                               echo "</a>";
                               echo "<a class='remove' href='#'>";
                               echo "<i class='fa fa-trash'>"; echo "</i>";
                               echo "</a>"; echo "</td>";
                echo "</tr>";
              };
              echo "</table>";
            };
          }
          else { //if the button is not pressed
            $res = mysqli_query($db, 
            "SELECT b.isbn, b.no_of_copies, b.title, b.b_year, b.publisher, GROUP_CONCAT(c.cate_name) as 'Categories' 
            from book b
            join book_has_categories bc ON b.isbn = bc.isbn
            join category c ON bc.cateID = c.cateID
            -- join authors_have_books a ON a.isbn = b.isbn 
            group by b.isbn
            ORDER BY b.isbn ASC");
              echo "<table class='table table-hover'>";
              echo "<tr t>";
                echo "<th>"; echo "ID"; echo "</th>";
                echo "<th>"; echo "No. of Copies"; echo "</th>";
                echo "<th>"; echo "Titles"; echo "</th>";
                echo "<th>"; echo "Published Year"; echo "</th>";
                echo "<th>"; echo "Publisher"; echo "</th>";
                echo "<th>"; echo "Category"; echo "</th>";
                // echo "<th>"; echo "Author"; echo "</th>";
                echo "<th class='right'>"; echo "Edit"; echo"</th>";
              echo "</tr>";
              while ($row=mysqli_fetch_assoc($res)) {
                echo "<tr>";
                  echo "<td>"; echo $row['isbn']; echo "</td>";
                  echo "<td>"; echo $row['no_of_copies']; echo "</td>";
                  echo "<td>"; echo $row['title']; echo "</td>";
                  echo "<td>"; echo $row['b_year']; echo "</td>";
                  echo "<td>"; echo $row['publisher']; echo "</td>";
                  echo "<td>"; echo $row['Categories']; echo "</td>";
                  // echo "<td>"; echo $row['a_name']; echo "</td>";
                  echo "<td>"; echo "<a href='#' class='edit'>";
                               echo "<i class='fa fa-pen'>"; echo "</i>";
                               echo "</a>";
                               echo "<a class='remove' href='#'>";
                               echo "<i class='fa fa-trash'>"; echo "</i>";
                               echo "</a>"; echo "</td>";
                echo "</tr>";
              };
            echo "</table>";
          }
        ?>

      </div>
      <?php include "../footer.php";?>
    </section>
  </div>
</body>
</html>