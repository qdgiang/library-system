<?php
  include "../connection.php";
  include "../header.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Librarian</title>

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
  <link rel="stylesheet" type="text/css" href="../CSS/sign_up.css">
  <link rel="stylesheet" type="text/css" href="../CSS/header.css">
  <link rel="stylesheet" type="text/css" href="../CSS/footer.css">

</head>

<body>
  <div class="wrapper">
    <section>
      <div class="bg">
        <br><br><br>
        <h1 class="title">LIBRARY MANAGEMENT SYSTEM</h1>
        <div class="signup">
          <h1 style="font-size: 25px; text-align: center;">Librarian</h1>
            <div class="submit"style="color: rgba(255,255,255,1)">
              <form name="librarian" action=""method="post" style="display: inline-block;">
                <div class="next">
                  <input type="text" name="librarian_name" placeholder="Name" required=""/>
                  <input type="email" name="email" placeholder="Email" required="" />
                </div>
                <div class="next">
                  <input type="number" name="phone" placeholder="Phone" required="" />
                  <input type="text" name="address" placeholder="Address" required="" />
                </div>
                <div class="next">
                  <input type="text" name="User" placeholder="Username" required=""/>
                  <input type="password" name="password" placeholder="Password" required=""/>
                </div>
                <input type="number" name="branchID" placeholder="Branch ID" required>
                <input type="submit" name="submit"  value="SIGN UP"/>
              </form>           
              <p class="signin"><a href="login.php">Sign In here</a>if u've already had an account.</p>  
            </div>
        </div>
      </div>
    </section>
    <?php include "../footer.php"; ?>

    <?php
      if (isset($_POST['submit'])) {
        $count = 0;
        $sql="SELECT email FROM mylib.librarian";
        $res=mysqli_query($db,$sql);

        while($row=mysqli_fetch_assoc($res)){
          if ($row['mylib.librarian.email'] == $_POST['email'] || $row['mylib.librarian.User'] == $_POST['User']) {
            $count = $count+1;
          }
        }
        
        if ($count==0) {
          mysqli_query($db,"INSERT INTO `mylib`.`librarian`(`librarian_name`,`User`,`password`,`email`,`phone`,`address`,`branchID`) values('$_POST[librarian_name]','$_POST[User]','$_POST[password]','$_POST[email]','$_POST[phone]','$_POST[address]','$_POST[branchID]');");
    ?>

    <script type="text/javascript">
      alert("Registration successful");
    </script>

    <?php
        }
        else {
    ?>

    <script type="text/javascript">
      alert("The email/username already exist");
    </script>

    <?php
        }
      }
    ?>
  </div>
</body>
</html>