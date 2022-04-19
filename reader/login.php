<?php
  include "../connection.php";
  include "../header.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
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
  <link rel="stylesheet" type="text/css" href="../CSS/header.css">
  <link rel="stylesheet" type="text/css" href="../CSS/footer.css">
  <link rel="stylesheet" type="text/css" href="../CSS/login.css">
</head>
<body>
  <section>
      <div class="bg">
        <br><br><br><br>
        <h1 class="title">LIBRARY MANAGEMENT SYSTEM</h1>
        <div class="signin">
          <h1 style="font-size: 25px; text-align: center;">Sign in</h1>
          <form name="login" action="" method="post">
            <input type="text" name="User" placeholder="Username" required="" /><br>
					  <input type="password" name="password" placeholder="Password" required="" /><br>
            <a href="#" class="forgot">Forgot Password ?</a><br>
            
            <div class="submit">
              <input type="submit" value="SIGN IN">
            </div>
            
            <p class="signup"><a href="sign_up.php">Sign Up here</a>if u don't have an account yet.</p>
          </form>
        </div>
      </div>
    </section>

    <?php include "../footer.php"; ?>

    <?php
      if(isset($_POST['submit'])){
        $count=0;
        $res=mysqli_query($db,"SELECT * FROM `reader` WHERE `User` = '$_POST[User]' && `password` = '$_POST[password]';");
        $row= mysqli_fetch_assoc($res);
        $count = mysqli_num_rows($res);

        if ($count==0) {
    ?>
    <div class="alert alert-danger" role="alert">
      <strong>The information doesn't match</strong>
    </div>

    <?php
        }
        else{
          $_SESSION['login_user'] = $_POST['User'];
    ?>
          <script type="text/javascript">
            window.location="../reader/index.php"
          </script>
    <?php
        }
      }
    ?>
</body>
</html>