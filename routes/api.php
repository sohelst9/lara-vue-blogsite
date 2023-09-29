<?php

use App\Http\Controllers\BlogPostController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\FrontendController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Fortify\Http\Controllers\AuthenticatedSessionController;
use Laravel\Fortify\Http\Controllers\RegisteredUserController;

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


Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('logout', [AuthenticatedSessionController::class, 'destroy']);
    //---category
    route::post('/category/create', [CategoryController::class, 'store']);
    route::get('/category', [CategoryController::class, 'index']);
    route::get('/category/edit/{id}', [CategoryController::class, 'edit']);
    route::put('/category/update/{id}', [CategoryController::class, 'update']);
    route::delete('/category/delete/{id}', [CategoryController::class, 'delete']);
    //-blog post ---
    route::post('/post/create', [BlogPostController::class, 'store']);
});

Route::post('register', [RegisteredUserController::class, 'store']);
Route::post('login', [AuthenticatedSessionController::class, 'store']);

//----frontend controller ---
Route::get('front/blog', [FrontendController::class, 'index']);
Route::get('front/blog/{slug}', [FrontendController::class, 'single_blog']);
