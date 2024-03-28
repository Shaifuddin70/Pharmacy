<?php include 'nav/enav.php';
if (isset($_SESSION['admin'])) {
} else {
  echo "<script>alert('Unautorized Access')</script>";
  echo "<script>window.location='employeelogin.php'</script>";
}
?>

<head>
  <title>Item Requests</title>

</head>

<div class="container">

  <h1>Purchase Request</h1>

  <div id="table">
    <div id="invisible" class="d-none">
      <h1>Invoice</h1>
      <span>Date: </span>
      <span>
        <script>
          document.write(new Date().toLocaleDateString());
        </script>
      </span>
    </div>
    <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
      <thread>
        <tr>
          <th>S/N</th>
          <th>Brand</th>
          <th>Generic</th>
          <th>Medicine</th>
          <th>Unit</th>
          <th>Operation</th>

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
        <td> 
        <a href="paccept.php? acceptid=' . $result['order_id'] . '"  class="text-light"><button  class="btn btn-primary">Accept</button></a>
      <a href="preject.php? rejectid=' . $result['order_id'] . '"  class="text-light"><button  class="btn btn-danger">Reject</button></a>
      <a href="invoice.php? invoiceid=' . $result['order_id'] . '"  class="text-light"><button  class="btn btn-info"> Invoice</button></a>
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
<script>
  const invoice = () => {
    $("#invisible").removeClass("d-none");
    $("#sn").addClass("d-none");
    var divName = "table";
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
    $("#invisible").addClass("d-none");
    $("#sn").removeClass("d-none");
  }
</script>
<?php include 'nav/footer.php';
?>