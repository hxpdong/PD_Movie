<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\CacheImageController;
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
Route::get('lang/{locale}', function($locale){
    if(! in_array($locale, ['en', 'vi'])){
        abort(404);
    }
    session()->put('locale', $locale);
    return redirect()->back();
});
Route::middleware('pdmv_checkLogin')->group(function () {
    Route::get('/login', function () {
        return view('auth.login');
    });
    Route::get('/register', function () {
        return view('auth.register');
    });
    Route::get('/forgot-password', function () {
        return view('auth.password');
    });
});
Route::middleware('pdmv_checkIsAdmin')->group(function () {
    Route::get('/admin/dashboard', function () {
        return view('auth.admin.dashboard');
    });
    Route::get('/admin/genres', function () {
        return view('auth.admin.genre');
    });
    Route::get('/admin/movies', function () {
        return view('auth.admin.movie');
    });
    Route::get('/admin/reports', function () {
        return view('auth.admin.report');
    });
    Route::get('/admin/system', function () {
        return view('auth.admin.system');
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
    Route::get('genres/{mvgid}', function(){
        return view('/movie.genre');
    });
});
Route::middleware('pdmv_checkIsUser', 'pdmv_checkHaveKWSearch')->group(function (){
    Route::get('recommend', function(){
        return view('/movie.recommender');
    });
});
//Route::post('/register', [AuthController::class, 'register']);
//Route::post('/login', [AuthController::class, 'login']);
//Route::post('/logout', [AuthController::class, 'logout']);



//in web-header
Route::post('/modalLogin', [AuthController::class, 'modalPostAuthLogin'])->name('modalLogin');
Route::post('/modalRegister', [AuthController::class, 'modalPostAuthRegister'])->name('modalRegister');
Route::get('/logoutHeader', [AuthController::class, 'logoutHeader'])->name('logoutHeader');

Route::middleware('pdmv_checkIsUserOrGuest','pdmv_checkHaveKWSearch')->group(function (){
    Route::get('movies/{mid}', function(){
        return view('/movie.show');
    });
    Route::get('tags/{tagname}', function(){
        return view('/movie.tag');
    });
    Route::get('genres/{mvgid}', function(){
        return view('/movie.genre');
    });
    Route::get('/users/{uid}', function(){
        return view('auth.userpage');
    });
    Route::get('related/{mid}', function(){
        return view('/movie.related');
    });
});
/*
Route::get('/users/{uid}', function(){
    return view('auth.userpage');
});*/
Route::middleware('pdmv_checkHaveKWSearch')->group(function (){
    
});
Route::get('/movie/poster/{mid}', [CacheImageController::class, 'showDetail'])->name('movie.getPoster');

Route::get('/test', function(){
    return view('auth.admin.dashboardtest');
});
Route::get('/test/sidebar', function(){
    return view('auth.admin.sidebar');
});
Route::get('/test/navbar', function(){
    return view('auth.admin.navbar');
});
Route::get('/admin', function(){
    return view('auth.admin.dashboardtest');
});
Route::get('/not-found', function(){
    return view('page.notfound');
});