<?php

// use App\Http\Controllers\Api\UserController;

// use App\Admin\Controllers\CourseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['namespace'=>'Api'], function(){

  // Route::post('/login', [UserController::class, 'login']);
  Route::post('/login', 'UserController@login');
  //authentication middleware
  Route::group(['middleware'=>['auth:sanctum']], function(){
    Route::any('/courseList', 'CourseController@courseList');
    Route::any('/courseDetail', 'CourseController@courseDetail');
    Route::any('/coursesBought', 'CourseController@coursesBought');
    Route::any('/lessonList', 'LessonController@lessonList');
    Route::any('/lessonDetail', 'LessonController@lessonDetail');
    Route::any('/checkOut', 'PaymentController@checkOut');
  });

  Route::any('/webGoHooks', 'PaymentController@webGoHooks');
});

// Route::post('/auth/login', [UserController::class, 'loginUser']);