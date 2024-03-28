<?php
// Check if deleteid is set and is a valid number
if (isset($_GET['deleteid']) && is_numeric($_GET['deleteid'])) {
    // Include database connection
    include 'db_connect.php';

    // Get the medicine ID to delete
    $medicine_id = $_GET['deleteid'];

    // Perform delete query
    $delete_query = "DELETE FROM medicine WHERE medicine_id = $medicine_id";
    $result = mysqli_query($conn, $delete_query);

    // Check if deletion was successful
    if ($result) {
        // Redirect back to the medicine details page
        header("Location: medicine_details.php");
        exit;
    } else {
        // If deletion fails, display error message
        echo "Error: " . mysqli_error($conn);
    }
} else {
    // If deleteid is not set or not a valid number, redirect back to the medicine details page
    header("Location: medicine_details.php");
    exit;
}
?>
