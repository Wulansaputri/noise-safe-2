<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PageController;
use App\Http\Controllers\WaitingListController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Admin\ParentsController;
use App\Http\Controllers\Admin\DeviceController;
use App\Http\Controllers\Admin\PurchaseController;
use App\Http\Controllers\Admin\ServiceLogController;

// Admin Auth
Route::get('/admin/login', [AuthController::class, 'showLogin'])->name('login');
Route::post('/admin/login', [AuthController::class, 'login'])->name('login.post');
Route::get('/admin/dashboard', [AuthController::class, 'dashboard'])->name('dashboard');
Route::post('/admin/logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/', [PageController::class, 'index'])->name('home');
Route::post('/waiting-list', [WaitingListController::class, 'store'])->name('waiting-list.store');

// Resource routes for admin entities
Route::resource('parents', ParentsController::class);
Route::resource('devices', DeviceController::class);
Route::resource('purchases', PurchaseController::class);
Route::resource('service_logs', ServiceLogController::class);

Route::put('purchases/{id}/pay', [App\Http\Controllers\Admin\PurchaseController::class, 'markAsPaid'])->name('purchases.pay');