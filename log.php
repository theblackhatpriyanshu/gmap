<?php
if (isset($_GET['data'])) {
    $data = $_GET['data'] . " | Time: " . date("h:i:sa") . "\n";
    file_put_contents("location.txt", $data, FILE_APPEND);
    echo "Success";
}
?>
