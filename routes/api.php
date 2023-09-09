<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\MovieController;
use App\Http\Controllers\API\RecommenderController;
use App\Http\Controllers\API\MovieGenreController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::post('register', [AuthController::class, 'registerAPI']);
Route::post('login', [AuthController::class, 'loginAPI']);

Route::group(['middleware' => ['auth:api']], function () {
    Route::post('logout', [AuthController::class, 'logoutAPI']);
});

Route::get('/movies', [MovieController::class, 'index']);
Route::get('/movies/{mid}', [MovieController::class, 'show']);
Route::get('comments/{mid}', [MovieController::class, 'getCommentListOf']);
Route::post('/postcomment' , [MovieController::class, 'postComment']);
Route::get('/ratings/{uid}/{mid}' , [MovieController::class, 'getRatingOf']);
Route::post('/postrating' , [MovieController::class, 'postRatingOf']);
Route::get('/movies/recommended/{uid}', [RecommenderController::class, 'UserBased_CollaborativeFiltering']);
Route::get('/genres', [MovieGenreController::class, 'listAllGenres']);