<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::middleware('pdmv_checkLogin')->group(function () {
    Route::get('/login', function () {
        return view('auth.login');
    });
    Route::get('/register', function () {
        return view('auth.register');
    });
});
Route::middleware('pdmv_checkIsAdmin')->group(function () {
    Route::get('/admin/dashboard', function () {
        return view('auth.dashboard');
    });
});
Route::middleware('pdmv_checkIsUserOrGuest')->group(function (){
    Route::get('/', function () {
        return view('movie.index');
    });
    Route::get('movies', function(){
        return view('/movie.index');
    });
    Route::get('movies/{mid}', function(){
        return view('/movie.show');
    });
});
Route::middleware('pdmv_checkIsUser')->group(function (){
    Route::get('recommend', function(){
        return view('/movie.recommender');
    });
    Route::get('/logoutHeader', [AuthController::class, 'logoutHeader'])->name('logoutHeader');
});
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout']);

//in web-header
Route::post('/modalLogin', [AuthController::class, 'modalPostAuthLogin'])->name('modalLogin');
Route::post('/modalRegister', [AuthController::class, 'modalPostAuthRegister'])->name('modalRegister');

Route::get('/test', function(){
    return view('auth.dashboardtest');
});