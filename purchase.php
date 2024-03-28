<?php include 'nav/enav.php';
if (isset($_SESSION['stuff'])) {
} elseif (isset($_SESSION['admin'])) {
} else {
    echo "<script>alert('Unautorized Access')</script>";
    echo "<script>window.location='employeelogin.php'</script>";
}
?>
<form method="post">
    <div class="container">
        <h1>Purchase Request</h1>
        <table class="table table-borderless">
            <tr>
                <th>Brand</th>
                <th>Generic</th>
                <th>Medicine</th>
                <th>Unit</th>
            </tr>
            <tr>
                <td>
                    <?php
                    $brand = "SELECT * FROM medicine_brand";
                    $result = mysqli_query($conn, $brand);
                    ?>
                    <select class="form-control form-control-lg" aria-label="Default select example" name="brand" id="brand">
                        <option selected disabled>Select Brand</option>
                        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
                            <option value="<?php echo $row['brand_id']; ?>"> <?php echo $row['brand_name']; ?> </option>
                        <?php endwhile; ?>
                    </select>
                </td>
                <td>
                    <?php
                    $generic = "SELECT * FROM medicine_generic";
                    $result = mysqli_query($conn, $generic);
                    ?>
                    <select class="form-control form-control-lg" aria-label="Default select example" name="generic" id="generic">
                        <option selected disabled>Select catagory</option>
                        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
                            <option value="<?php echo $row['generic_id']; ?>"> <?php echo $row['generic_name']; ?> </option>
                        <?php endwhile; ?>
                    </select>
                </td>
                <td>
                    <select class="form-control form-control-lg" aria-label="Default select example" name="medicine" id="medicine">
                        <option selected disabled>Select Item</option>

                    </select>
                </td>
                <td> <input type="text" class=" form-control form-control-lg" required="true" name="unit" placeholder=" Unit"></td>
            </tr>
        </table>
        <script>
            // Target the correct select element
            $('#generic').on('change', function() {
                var catagory_id = this.value;
                console.log(catagory_id);
                $.ajax({
                    url: 'ajax/item.php',
                    type: "POST",
                    data: {
                        catagory_data: catagory_id
                    },
                    success: function(result) {
                        $('#medicine').html(result); // Target the 'medicine' select
                    }
                });
            });
        </script>
        <div class="button">
            <button class="btn btn-primary" type="submit" name="submit">SUBMIT</button>
        </div>
    </div>
</form>
</body>

</html>
<?php   
if (isset($_POST['submit'])) {

    if (isset($_POST['brand'])&& isset($_POST['generic']) && isset($_POST['medicine']) && isset($_POST['unit'])) {
        $brand=$_POST['brand'];
        $generic=$_POST['generic'];
        $medicine=$_POST['medicine'];
        $unit=$_POST['unit'];

        $query = "INSERT INTO order_table (`brand_id`, `generic_id`, `medicine_id`,`unit`) VALUES ($brand,$generic,$medicine,$unit)";
        $query_run = mysqli_query($conn, $query);
        

        if ($query_run) {
            $_SESSION['status'] = "Inserted Successfully";
            echo "<script>window.location='medicine_stock.php'</script>";
        } else {
            $_SESSION['status'] = "Not Inserted";
            echo "<script>window.location='medicine_stock.php'</script>";
        }
        $stmt->close();

    } else {
        // Handle the case where required POST data is missing (e.g., form not fully submitted)
        $_SESSION['status'] = "Error: Please complete the form.";
        echo "<script>window.location='purchase.php'</script>";
    }
}
?>
