<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
    $a1 = Array();
    $s1 = "AAAAAAAAAAAAAAAAAAA";
    $s2 = "BBBBBBBBBBBBBBBBBBB";
    $s3 = "CCCCCCCCCCCCCCCC";
    array_push($a1,$s1);
    array_push($a1,$s2);
    array_push($a1,$s3);
    $a1[4] = "DDDDDDDDDDDDDDDDDDDDDDDD";
    $a1[5] = "EEEEEEEEEEEEEEEEEEEEEEEEE";
    var_dump($a1);

    ?>

  </body>
</html>
