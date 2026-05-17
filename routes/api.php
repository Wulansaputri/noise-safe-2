<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;    
use App\Http\Controllers\Api\DeviceController;
use App\Http\Controllers\Api\PurchaseController;
use App\Http\Controllers\Api\ServiceLogController;
use App\Http\Controllers\Api\NotificationController;

// Public routes (tidak perlu login)
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login',    [AuthController::class, 'login']);

//route untuk device
// Protected routes (perlu token)
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/profile', [AuthController::class, 'profile']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/device/connect', [DeviceController::class, 'connect']);

    // Devices
    Route::get('/devices',        [DeviceController::class, 'index']);
    Route::get('/devices/{id}',   [DeviceController::class, 'show']);
    Route::put('/devices/{id}',   [DeviceController::class, 'update']);
    Route::delete('/devices/{id}', [DeviceController::class, 'delete']);

    // Purchases
    Route::get('/purchases',      [PurchaseController::class, 'index']);
    Route::get('/purchases/{id}', [PurchaseController::class, 'show']);

    // Service Logs
    Route::get('/service-logs',      [ServiceLogController::class, 'index']);
    Route::get('/service-logs/{id}', [ServiceLogController::class, 'show']);

    // Notifications
    Route::get('/notifications',           [NotificationController::class, 'index']);
    Route::put('/notifications/{id}/read', [NotificationController::class, 'read']);
});