<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LaporanController;
use App\Http\Middleware\EnsureOrderExistMiddleware;
use App\Http\Middleware\CheckUserType;
use App\Http\Controllers\ChartController;
use App\Http\Controllers\PDFController;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth', CheckUserType::class . ':admin'])->group(function() {

    Route::resource('categories', CategoryController::class);
    Route::resource('products', ProductController::class);

    Route::get('/orders', [OrderController::class, 'index'])
    ->name('orders.index');
    Route::get('/orders/create', [OrderController::class, 'create'])
        ->name('orders.create');

    Route::middleware(EnsureOrderExistMiddleware::class)
        ->group(function () {
            Route::get('/orders/create/detail/{product}', [OrderController::class, 'createDetail'])
                ->name('orders.create.detail');
            Route::post('/orders/create/detail/{product}', [OrderController::class, 'storeDetail'])
                ->name('orders.store.detail');
                Route::post('/orders/checkout', [OrderController::class, 'checkout'])
                ->name('orders.checkout');
            });

    Route::delete('/orders/{order}', [OrderController::class, 'destroy'])->name('orders.destroy');

    Route::get('/orders/{order}', [OrderController::class, 'show'])
        ->name('orders.show');

});

Route::get('/login', [AuthController::class, 'index'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
Route::resource('users', UserController::class);

Route::middleware(['auth', CheckUserType::class . ':owner'])->group(function () {
    Route::get('/laporan/penjualan', [LaporanController::class, 'penjualan'])->name('laporan.penjualan');
    Route::get('/chart', [ChartController::class, 'showChart'])->name('chart');
    Route::get('/download-sales-report', [PDFController::class, 'download'])->name('download');
});


