<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Auth::routes();
//CRUD AJAX
Route::get('/', 'HomeController@index')->name('home');
Route::post('/upazila-list','HomeController@upazila_list');

Route::prefix('user')->group(function () {
    Route::post('store','HomeController@store' );
    Route::post('list','HomeController@userList' );
    Route::post('edit','HomeController@edit' );
    Route::post('view','HomeController@view' );
    Route::post('delete','HomeController@delete' );
    Route::post('status','HomeController@status' );
    Route::post('bulk_action_delete','HomeController@bulk_action_delete' );
});

//Javascript-Ajax
Route::get('/turag', 'jsController@index');
Route::get('/get_ajax', 'jsController@get_ajax')->name('ajax');
Route::get('/image', 'jsController@get_image');
Route::post('/submit-url', 'jsController@submit_form');

//Jquery-Ajax
Route::prefix('jquery')->group(function () {
    Route::get('/index', 'jqueryController@index');
    Route::get('/get_ajax', 'jqueryController@get_ajax');
    Route::get('/image', 'jqueryController@get_image');
    Route::post('/submit-url', 'jqueryController@submit_form');
});

//JSON
Route::view('/json', 'json');