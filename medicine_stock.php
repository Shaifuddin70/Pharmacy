<?php
include 'nav/enav.php';

// Check if user is authorized
if (!isset($_SESSION['stuff']) && !isset($_SESSION['admin'])) {
    echo "<script>alert('Unauthorized Access')</script>";
    echo "<script>window.location='employeelogin.php'</script>";
    exit; // Stop execution if unauthorized
}

// Pagination variables
$results_per_page = 10; // Number of results per page
$offset = 0; // Starting offset

// Get current page number from URL
if (isset($_GET['page'])) {
    $page = $_GET['page'];
    $offset = ($page - 1) * $results_per_page; // Calculate offset
} else {
    $page = 1;
}

$cq = "";
$iq = "";
$brand = "";
$generic = "";
if (isset($_POST['submit'])) {
    if (!empty($_POST['brand'])) {
        $brand_id = $_POST['brand'];

        $q = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM medicine_brand WHERE brand_id=$brand_id"));
        $brand_name = $q['brand_name'];
        $cq = " AND b.brand_name='$brand_name'";
    }
    if (!empty($_POST['generic'])) {
        $generic_id = $_POST['generic'];
        $q = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM medicine_generic WHERE generic_id=$generic_id"));
        $generic_name = $q['generic_name'];
        $iq = " AND g.generic_name='$generic_name'";
    }
}

$data = mysqli_query($conn, "
    SELECT m.medicine_name, b.brand_name, g.generic_name, s.unit, DATE(s.expiry_date) AS expiry_date, r.shelf_number
    FROM medicine_stock s
    JOIN medicine m ON s.medicine_id = m.medicine_id
    JOIN medicine_brand b ON s.brand_id = b.brand_id
    JOIN medicine_generic g ON s.generic_id = g.generic_id
    LEFT JOIN shelf r ON s.shelf_id = r.shelf_id
    WHERE 1 $cq $iq
    LIMIT $offset, $results_per_page
");
?>

<head>
    <style>
        .inputbox {
            position: relative;
            width: 150px;
            padding: 10px 10px 0px;
            background: transparent;
            border: 1px solid #dddfe2;
            border-radius: 10px;
            outline: none;
            color: rgb(0, 0, 0);
            letter-spacing: .1em;
            z-index: 10;
        }
    </style>
</head>

<div class="container">
    <h1>All Stock Items</h1>
    <button onclick="purchaseReport()" class="btn btn-info"> Create Report</button>
    <form method="post">
        <div class="input-group date" style="margin-left:450px;bottom: 35px;font-weight: bold;">
            <label for="brand" class="col-1 col-form-label">Brand</label>
            <?php
            $brand_query = "SELECT * FROM medicine_brand";
            $brand_result = mysqli_query($conn, $brand_query);
            ?>
            <select class="inputbox" aria-label="Default select example" name="brand" id="brand">
                <option selected disabled>Select Brand</option>
                <?php while ($brand_row = mysqli_fetch_assoc($brand_result)) : ?>
                    <option value="<?php echo $brand_row['brand_id']; ?>"> <?php echo $brand_row['brand_name']; ?> </option>
                <?php endwhile; ?>
            </select>
            <label for="generic" class="col-1 col-form-label">Generic</label>
            <?php
            $generic_query = "SELECT * FROM medicine_generic";
            $generic_result = mysqli_query($conn, $generic_query);
            ?>
            <select class="inputbox" aria-label="Default select example" name="generic" id="generic">
                <option selected disabled>Select Generic</option>
                <?php while ($generic_row = mysqli_fetch_assoc($generic_result)) : ?>
                    <option value="<?php echo $generic_row['generic_id']; ?>"> <?php echo $generic_row['generic_name']; ?> </option>
                <?php endwhile; ?>
            </select>
            <input type="submit" class="btn btn-info" name="submit" value="Filter">
        </div>
    </form>
   <a href="purchase.php"><button class="btn btn-primary" style="margin-left:200px ; margin-bottom: 15px;margin-top: -120px;">Create Purchase Request</button></a>


    <div id="table">
        <h1 id="invisible" class="d-none">Stock Report</h1>

        <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>S/N</th>
                    <th>Medicine Name</th>
                    <th>Brand Name</th>
                    <th>Generic Name</th>
                    <th>Quantity</th>
                    <th>Expiry Date</th>
                    <th>Shelf Number</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $total = mysqli_num_rows($data);
                if ($total != 0) {
                    $c = $offset + 1;
                    while ($result = mysqli_fetch_assoc($data)) {
                        echo '
                    <tr>
                        <td>' . $c . '</td>
                        <td>' . $result['medicine_name'] . '</td>
                        <td>' . $result['brand_name'] . '</td>
                        <td>' . $result['generic_name'] . '</td>
                        <td>' . $result['unit'] . '</td>
                        <td>' . $result['expiry_date'] . '</td>
                        <td>' . $result['shelf_number'] . '</td>
                    </tr>';
                        $c++;
                    }
                } else {
                    echo "<tr><td colspan='7'>No records found</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</div>

<script>
    const purchaseReport = () => {
        $("#invisible").removeClass("d-none");
        var divName = "table";
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
        $("#invisible").addClass("d-none");
    }
</script>

<?php
include 'nav/footer.php';
?>