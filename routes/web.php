<?php

use App\Http\Controllers\Web\HomeController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/success', [HomeController::class, 'success']);
Route::get('/cancel', [HomeController::class, 'cancel']);