<?php include 'nav/enav.php';
if (isset($_SESSION['stuff'])) {
} elseif (isset($_SESSION['admin'])) {
} else {
    echo "<script>alert('Unautorized Access')</script>";
    echo "<script>window.location='employeelogin.php'</script>";
}
?>
<div class="container">
    <div class="title">
        <span class="text">All Catagories</span>
        <a href="add_catagory.php" class="text"><button class="btn btn-primary" style="position: relative;
    left: 470px;"> Add Catagory</button> </i></a>
    </div>
    <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
        <thread>
            <tr>
                <th>S/N</th>
                <th>Catagory Name</th>
                <th>Operation</th>
            </tr>
        </thread>
        <?php
        $c = 1;
        $query = "select * from medicine_catagory";
        $data = mysqli_query($conn, $query);
        $total = mysqli_num_rows($data);
        if ($total != 0) {
            while ($result = mysqli_fetch_assoc($data)) {

                echo '
        <tr>
        <td>' . $c . '</td>
        <td>' . $result['catagory_name'] . '</td>
        <td>
        <a href="view.php? selectid=' . $result['catagory_id'] . '"  class="text-light"><button  class="btn btn-primary"><i class="uil uil-eye"></i></button></a>
        <a href="cupdate.php? updateid=' . $result['catagory_id'] . '"  class="text-light"><button  class="btn btn-primary"><i class="bx bxs-edit-alt" ></i></button></a>
        <a href="cdelete.php? deleteid=' . $result['catagory_id'] . '"  class="text-light"><button  class="btn btn-danger"><i class="bx bxs-trash" ></i></button></a>
        </td>
        </tr>';
                $c++;
            }
        } else {
            echo "NO records Found";
        };


        include 'nav/footer.php'; ?>