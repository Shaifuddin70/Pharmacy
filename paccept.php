<?php include 'nav/enav.php';
if (isset($_SESSION['admin'])) {
} else {
  echo "<script>alert('Unautorized Access')</script>";
  echo "<script>window.location='employeelogin.php'</script>";
}
$id = $_GET['acceptid'];
$pprice=$_GET['$pprice'];
$sprice=$_GET['$sprice'];
$sql = "UPDATE `order_table` SET `status`='1' ,`pprice`=$pprice,`sprice`=$sprice WHERE id=$id;";
$result = mysqli_query($conn, $sql);
if ($result) { 
    
    $sql = "SELECT *FROM `order_table` WHERE `id`='$id'";
    $result = mysqli_fetch_assoc(mysqli_query($conn, $sql));
    $catagory=$result['catagory'];
    $name=$result['name'];
    $quantity=$result['quantity'];
    
    $query =mysqli_query($conn, "INSERT INTO purchase_table(`catagory`,`name`,`quantity`)VALUES('$catagory','$name','$quantity')") ;
    if($query){
    
    
           
           header("location:purchase_request.php");
       }
       else{
          
           header("location:purchase_request.php");
       }
} else {
    die(mysqli_error($conn));
}


?>

<head>
  <title>Purchase Complete</title>

</head>

<div class="container">

  <h1>Purchase Complete</h1>

  <div id="table">
    <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
      <thread>
        <tr>
          <th>S/N</th>
          <th>Brand</th>
          <th>Generic</th>
          <th>Medicine</th>
          <th>Unit</th>
          <th>Purchase Price/Unit</th>
          <th>Selling Price/Unit</th>
          <th>Action</th>
        </tr>
      </thread>
      <?php

      $query = "SELECT medicine_generic.generic_name,medicine_brand.brand_name,medicine.medicine_name,order_table.unit ,order_table.status,order_table.order_id 
      FROM order_table 
      JOIN  medicine ON medicine.medicine_id=order_table.medicine_id 
      JOIN medicine_brand on medicine_brand.brand_id=order_table.brand_id
      JOIN medicine_generic on medicine_generic.generic_id=order_table.generic_id";
      $data = mysqli_query($conn, $query);
      $total = mysqli_num_rows($data);
      $c = 1;
      if ($total != 0) {
        while ($result = mysqli_fetch_assoc($data)) {
          if ($result['status'] == null) {
            echo '
        <tr>
        <td>' . $c . '</td>
        <td>' . $result['brand_name'] . '</td>
        <td>' . $result['generic_name'] . '</td>
        <td>' . $result['medicine_name'] . '</td>
        <td>' . $result['unit'] . '</td>
        <td><input type="text" class="form-control form-control-lg" required="true" name="pprice" id="pprice" placeholder="Purchase Price"></td>
        <td><input type="text" class="form-control form-control-lg" required="true" name="sprice" id="sprice" placeholder="Selling Price"></td>
        <td> 
        <a href="paccept.php? acceptid=' . $result['order_id'] . '"  class="text-light"><button  class="btn btn-primary">Accept</button></a>
    </td>
        
        </tr>';
            $c++;
          }
        }
      } else {
        echo "NO records Found";
      };
      ?>
    </table>
  </div>

</div>

<?php include 'nav/footer.php';
?>