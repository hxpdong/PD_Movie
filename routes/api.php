<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\MovieController;
use App\Http\Controllers\API\RecommenderController;
use App\Http\Controllers\API\MovieGenreController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\MovieTagController;
use App\Http\Controllers\API\AccountController;
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
Route::get('/movies/recommended/{uid}', [RecommenderController::class, 'UserBased_CollaborativeFiltering']);
Route::get('/ratings/{uid}/{mid}' , [MovieController::class, 'getRatingOf']);
Route::get('/movies/recommended-by-movie/{mvid}', [RecommenderController::class, 'ContentBased_recommendMovies']);

Route::post('/postcomment' , [MovieController::class, 'postComment']);
Route::delete('/dropcomment/{cmtid}', [MovieController::class, 'dropComment']);
Route::put('/editcomment/{cmtid}', [MovieController::class, 'editComment']);

Route::post('/postrating' , [MovieController::class, 'postRatingOf']);
Route::delete('/droprating/{rtid}', [MovieController::class, 'dropRating']);

Route::get('/genres', [MovieGenreController::class, 'listAllGenres']);
Route::get('/genres/{mvgid}', [MovieGenreController::class, 'listMovieOf']);

Route::get('/users/by-username/{usn}', [UserController::class, 'getInfoByUsername']);
Route::get('/users/similarity-users/{uid}', [RecommenderController::class, 'UserBased_SimilarityUsers']);
Route::get('/users/get-commentlist/{uid}', [UserController::class, 'getListOfComment']);
Route::get('/users/get-ratinglist/{uid}', [UserController::class, 'getListOfRating']);

Route::post('/postreport' , [MovieController::class, 'postError']);

Route::get('/tags/{tagkw}', [MovieTagController::class, 'listMovieOf']);

Route::middleware(['pdmv_API_checkToken', 'pdmv_API_checkAdminRole'])->group(function () {
    Route::get('/admin/get-users/as/{accid}', [AccountController::class, 'getAllUser']);
    Route::put('/admin/lock-user/{uid}/as/{accid}', [AccountController::class, 'changeLockStateUser']);
    Route::put('/admin/changeInfo-user/{uid}/as/{accid}', [AccountController::class, 'changeUserInfo']);
    Route::put('/admin/changePassword-user/{uid}/as/{accid}', [AccountController::class, 'changeUserPassword']);
});

Route::middleware(['pdmv_API_checkToken', 'pdmv_API_checkSPAdminRole'])->group(function () {
    Route::get('/admin/get-admins/as/{accid}', [AccountController::class, 'getAllAdmin']);
    Route::put('/admin/lock-admin/{uid}/as/{accid}', [AccountController::class, 'changeLockStateAdmin']);
    Route::put('/admin/changeInfo-admin/{uid}/as/{accid}', [AccountController::class, 'changeAdminInfo']);
    Route::put('/admin/changePassword-admin/{uid}/as/{accid}', [AccountController::class, 'changeAdminPassword']);
});

Route::put('/users/update', [AuthController::class, 'modalUpdateUserInfo']);
Route::put('/users/changepassword', [AuthController::class, 'modalUpateUserPassword'])->name('modalChangePassword');