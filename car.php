<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body>
  <style>
  @import url('https://fonts.googleapis.com/css?family=Raleway');
  .row{
    font-family: 'Raleway', sans-serif;
    font-size:15pt;
    margin-bottom: 4vh;
  }
  .headerRow{
    font-size: 20pt;
    font-weight: bold;
  }
  </style>

  <form action="car.php" method="post">
  Model: <input type="text" name="modelForm"><br>
  Producer: <input type="text" name="producerForm"><br>
  Year:<input type="number" name="yearForm"><br>
  Fuel:<input type="text" name="fuelForm"><br>
  <input type="submit" name="submit">
  </form>
  <?php
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname="carrental1";
  $conn = mysqli_connect($servername, $username, $password,$dbname);
  // Check connection
  if (!$conn) {
      die("Connection failed: " . mysqli_connect_error());
  }
   if(isset($_POST['submit'])){
     if(isset($_POST['modelForm']) && isset($_POST['producerForm']) && isset($_POST['yearForm']) && isset($_POST['fuelForm']) && !empty($_POST['modelForm']) && !empty($_POST['producerForm']) && !empty($_POST['yearForm']) && !empty($_POST['fuelForm'])){
       $model = htmlspecialchars($_POST['modelForm']);
       $producer = htmlspecialchars($_POST['producerForm']);
       $year = htmlspecialchars($_POST['yearForm']);
       $fuel = htmlspecialchars($_POST['fuelForm']);
       $sqlStatement = "INSERT INTO Car(model, producer,year,fuel) VALUES(?,?,?,?)";
       if($stmt = mysqli_prepare($conn,$sqlStatement)){
       mysqli_stmt_bind_param($stmt,'ssis',$model,$producer,$year,$fuel);
       mysqli_stmt_execute($stmt);
       mysqli_stmt_close($stmt);
       }
     }
     mysqli_close($conn);

   }



  ?>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname="carrental1";
// Create connection

$conn = mysqli_connect($servername, $username, $password,$dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$query = "SELECT model, producer,year,fuel FROM Car";
$result = mysqli_query($conn,$query);
  $tag = "";
  $tag .= "<div class=\"container\">";
  $tag .= firstRow();
  while ($row = mysqli_fetch_assoc($result)) {
    $row["model"] . $row["producer"] . $row["year"] . $row["fuel"];
    $tag .= "<div class=\"row\">";
        $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
        $tag .= $row["model"];
        $tag .= "</div>";
        $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
        $tag .= $row["producer"];
        $tag .= "</div>";
        $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
        $tag .= $row["year"];
        $tag .= "</div>";
        $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
        $tag .= $row["fuel"];
        $tag .= "</div>";
    $tag .= "</div>";
  }
  $tag .= "</div>";
  echo $tag;
mysqli_close($conn);

function firstRow(){
  $tag = "";
  $tag .= "<div class=\"row headerRow\">";
      $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
      $tag .= "Model";
      $tag .= "</div>";
      $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
      $tag .= "Producer";
      $tag .= "</div>";
      $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
      $tag .= "Year";
      $tag .= "</div>";
      $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
      $tag .= "Fuel";
      $tag .= "</div>";
  $tag .= "</div>";
  return $tag;
}
?>

  </body>
</html>
