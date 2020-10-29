<?php

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');



Route::post('/directory-create', 'DirectoryController@directoryCreate');
Route::post('/directory-all-files', 'DirectoryController@directoryAllFiles');
Route::post('/file-copy', 'DirectoryController@fileCopy');
Route::post('/file-move', 'DirectoryController@fileMove');
Route::post('/rename', 'DirectoryController@rename');
Route::post('/delete', 'DirectoryController@delete');

Route::post('/upload', 'DirectoryController@fileUpload');

