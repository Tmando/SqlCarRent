<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  </head>
  <body>
    <form action="customer.php" method="post" class="form-group">
    First Name: <input class="form-control-file" type="text" name="fnameForm"><br>
    LastName: <input class="form-control-file" type="text" name="lnameForm"><br>
    Address:<input class="form-control-file" type="text" name="addressForm"><br>
    E-Mail:<input class="form-control-file" type="text" name="emailForm"><br>
    <input class="form-control-file" type="submit" name="submit">
    </form>
    <?php
    class person {
        var $name;
        var $firstName;
        var $lastName;
        var $address;
        var $email;
        var $id;
        function __construct($id_input,$firstName_input,$lastName_input,$address_input,$email_input) {
          $this->id = $id_input;
          $this->firstName = $firstName_input;
          $this->lastName = $lastName_input;
          $this->address = $address_input;
          $this->email = $email_input;
        }

        public function getFirstName(){
          return $this->firstName;
        }
        public function getId(){
          return $this->id;
        }
        public function getLastName(){
          return $this->lastName;
        }
        public function getAddress(){
          return $this->address;
        }
        public function getEmail(){
          return $this->email;
        }

        public function setLastName($lastName){
          echo $lastName;
          $this->lastName = $lastName;
          echo $this->lastName;
        }
        public function setAddress($address){
          $this->address = $address;
        }
        public function setEmail($email){
          $this->email = $email;
        }
        public function setFirstName($firstName){
          $this->firstName = $firstName;
        }
        public function setId($id){
          $this->id = $id;
        }
        public function toString(){
          $str = "";
          $str .= $this->getFirstName();
          $str .= $this->getLastName();
          $str .= $this->getAddress();
          $str .= $this->getEmail();
          return $str;
        }
        public function render(){
          $tag = "<div class=\"row\">";
              $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
              $tag .= $this->getFirstName();
              $tag .= "</div>";
              $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
              $tag .= $this->getLastName();
              $tag .= "</div>";
              $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
              $tag .= $this->getEmail();
              $tag .= "</div>";
              $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
              $tag .= $this->getAddress();
              $tag .= "</div>";
          $tag .= "</div>";
          return $tag;
        }
        public function insertData($servername = "localhost",$username = "root",$password = "",$dbname="carrental1"){
          if(isset($_POST['submit'])){
          $conn = mysqli_connect($servername, $username, $password,$dbname);
          // Check connection
          if (!$conn) {
              die("Connection failed: " . mysqli_connect_error());
          }
          if(isset($this->firstName) && isset($this->lastName) && isset($this->address) && isset($this->email) && !empty($this->firstName) && !empty($this->lastName) && !empty($this->email) && !empty($this->address)){
            $firstName_input = htmlspecialchars($this->firstName);
            $lastName_input = htmlspecialchars($this->lastName);
            $address_input = htmlspecialchars($this->address);
            $email_input = htmlspecialchars($this->email);
            $sqlStatement = "INSERT INTO Customer(firstName, lastName,address,email) VALUES(?,?,?,?)";
            if($stmt = mysqli_prepare($conn,$sqlStatement)){
            mysqli_stmt_bind_param($stmt,'ssss',$firstName_input,$lastName_input,$address_input,$email_input);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_close($stmt);
            }
          }
        }
        }
       }
       if(isset($_POST['fnameForm']) && isset($_POST['lnameForm']) && isset($_POST['addressForm']) && isset($_POST['emailForm'])){
       $Person = new person(7,$_POST['fnameForm'],$_POST['lnameForm'],$_POST['addressForm'],$_POST['emailForm']);
       $Person->insertData();
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
    $query = "SELECT userid,firstName,lastName,address,email FROM Customer";
    $result = mysqli_query($conn,$query);
    $customerArray=Array();
    $tag = "";
    /*
    $row = mysqli_fetch_assoc($result);
    $stefan = new person($row["userid"],$row["firstName"],$row["lastName"],$row["address"],$row["email"]);
    print_r($stefan);
    */
    $tag = "";
    $tag .= firstRow();
    while ($row = mysqli_fetch_assoc($result)) {
      $person = new person($row["userid"],$row["firstName"],$row["lastName"],$row["address"],$row["email"]);

      $tag .= $person->render();
      if($row["userid"] == "6"){
        var_dump($person);
        var_dump($row["userid"]);
        exit;
      }
      /*
      array_push($customerArray,$person);
      print_r("<p>");
      print_r($customerArray);
      print_r("</p>");
      $tag .= $customer->render();
      echo $customer->toString();
      */
    }
    echo $tag;

    // .= Php               =  += Strings JavScript
    function firstRow(){
      $tag = "";
      $tag .= "<div class=\"row headerRow\">";
          $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
          $tag .= "First Name";
          $tag .= "</div>";
          $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
          $tag .= "Last Name";
          $tag .= "</div>";
          $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
          $tag .= "Address";
          $tag .= "</div>";
          $tag .= "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-xl-3\">";
          $tag .= "E-Mail";
          $tag .= "</div>";
      $tag .= "</div>";
      return $tag;
    }









    ?>

  </body>
</html>
