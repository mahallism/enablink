<?php
$servername = "localhost";
$username = "u363797047_udin";
$password = "@enablink354";
$dbname = "u363797047_eldb2";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$date = date("Y/m/d");

$sql = "SELECT student_status,volunteer_status,date,accompaniment_id FROM app_accompaniment WHERE date = $date";
$result = mysqli_query($conn,$sql);
while($r = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
    // echo $accompaniment_id = $r['accompaniment_id'];
    if($r['date'] < date("Y/m/d") && $r['student_status'] != 'Selesai') {
        echo $accompaniment_id = $r['accompaniment_id'];
        $sqlupdate = "UPDATE app_accompaniment SET student_status = 'Tidak Didampingi', volunteer_status = 'Tidak Mendampingi' WHERE accompaniment_id = $accompaniment_id";
        
        $resultupdate = $conn->query($sqlupdate);
    }
    // echo $r['date'];
    
}
$conn->close();
?>