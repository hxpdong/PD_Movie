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

Route::get('/', function () {
    return view('movie.index');
});
Route::get('movies', function(){
    return view('/movie.index');
});
Route::get('movies/{mid}', function(){
    return view('/movie.show');
});
Route::get('recommend', function(){
    return view('/movie.recommender');
});
Route::middleware('pdmv_checkLogin')->group(function () {
    Route::get('/login', function () {
        return view('auth.login');
    });
});
Route::middleware('pdmv_checkUserType')->group(function () {
    Route::get('/dashboard', function () {
        return view('auth.dashboard');
    });
});

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout']);

//in web-header
Route::post('/modalLogin', [AuthController::class, 'modalPostAuthLogin'])->name('modalLogin');
Route::get('/logoutHeader', [AuthController::class, 'logoutHeader'])->name('logoutHeader');