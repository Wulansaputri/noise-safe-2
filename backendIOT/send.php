<?php
include "config.php";

// Validasi koneksi database
if (!isset($conn) || $conn === null) {
    echo json_encode([
        "status" => "error",
        "message" => "Database connection failed"
    ]);
    exit;
}

// Ambil parameter dari request
$device_id = $_GET['device_id'] ?? null;
$user_id = $_GET['user_id'] ?? null;
$lat = $_GET['lat'] ?? null;
$lng = $_GET['lng'] ?? null;
$decibel_level = $_GET['noise'] ?? null;
$noise_status = $_GET['level'] ?? ($_GET['status'] ?? null);
$message = $_GET['message'] ?? null;

// Validasi device_id karena menjadi FK untuk tabel-tabel baru
if (!$device_id) {
    echo json_encode([
        "status" => "error",
        "message" => "Parameter device_id diperlukan"
    ]);
    exit;
}

$response_messages = [];
$success = true;

// 1. Insert ke device_location bila ada data koordinat
if ($lat !== null && $lng !== null) {
    $lat = mysqli_real_escape_string($conn, $lat);
    $lng = mysqli_real_escape_string($conn, $lng);
    
    $query_loc = "INSERT INTO device_location (device_id, latitude, longitude) VALUES ('$device_id', '$lat', '$lng')";
    if (mysqli_query($conn, $query_loc)) {
        $response_messages[] = "Data lokasi disimpan";
    } else {
        $success = false;
        $response_messages[] = "Error lokasi: " . mysqli_error($conn);
    }
}

// 2. Insert ke noise_logs bila ada data kebisingan
if ($decibel_level !== null) {
    $decibel_level = mysqli_real_escape_string($conn, $decibel_level);
    $noise_status = mysqli_real_escape_string($conn, $noise_status);
    
    $query_noise = "INSERT INTO noise_logs (device_id, decibel_level, noise_status) VALUES ('$device_id', '$decibel_level', '$noise_status')";
    if (mysqli_query($conn, $query_noise)) {
        $response_messages[] = "Data kebisingan disimpan";
    } else {
        $success = false;
        $response_messages[] = "Error kebisingan: " . mysqli_error($conn);
    }
}

// 3. Insert ke notifications bila ada pesan
if ($message !== null && $user_id !== null) {
    $message = mysqli_real_escape_string($conn, $message);
    $notif_status = "unread"; // Default status untuk notifikasi baru
    
    $query_notif = "INSERT INTO notifications (user_id, device_id, message, status, created_at) VALUES ('$user_id', '$device_id', '$message', '$notif_status', NOW())";
    if (mysqli_query($conn, $query_notif)) {
        $response_messages[] = "Pemberitahuan disimpan";
    } else {
        $success = false;
        $response_messages[] = "Error notifikasi: " . mysqli_error($conn);
    }
}

// Response hasil
if(empty($response_messages)) {
    echo json_encode([
        "status" => "error",
        "message" => "Tidak ada data (lat/lng atau noise) yang dikirim untuk disimpan"
    ]);
} else if ($success) {
    echo json_encode([
        "status" => "success",
        "message" => implode(", ", $response_messages)
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => implode(", ", $response_messages)
    ]);
}
?>