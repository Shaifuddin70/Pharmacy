<?php
include 'nav/enav.php';
if (isset($_SESSION['admin'])) {
} else {
    echo "<script>alert('Unautorized Access')</script>";
    echo "<script>window.location='index.php'</script>";
}
?>
<div class="container">
    <form method="post">
        <h1>Add New Catagory</h1>
        <div class="container mt-3">
            <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                <tr>
                    <td> <input type="text" class=" form-control form-control-lg" required="true" name="cname" placeholder="Gatagory Name"></td>
                </tr>
            </table>
            <div class="button">
                <button class="btn btn-primary" type="submit" name="submit">SUBMIT</button>
            </div>
        </div>
    </form>
</div>
<?php
include 'nav/footer.php';
if (isset($_POST['submit'])) {
    $cname = $_POST['cname'];
    $query = "INSERT INTO `medicine_catagory` (`catagory_name`)VALUES('$cname')";
    $query_run = mysqli_query($conn, $query);
    if ($query_run) {
        $_SESSION['status'] = "Inserted Succesfully";
        echo "<script>window.location='catagory.php'</script>";
    } else {
        $_SESSION['status'] = "Not Inserted";
        echo "<script>window.location='catagory.php'</script>";
    }
}
