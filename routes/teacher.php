<?php

use App\Http\Controllers\OptionsController;
use App\Http\Controllers\ChapterController;
use App\Http\Controllers\LiveController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\UeController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ExaminationController;


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

Route::get('examination/add_examination/{ue}', [ExaminationController::class, 'add_examination'])->name('class.add_examination');
Route::get('examination/add_examination_cc/{ue}', [ExaminationController::class, 'add_examination_cc'])->name('class.add_examination_cc');

Route::post("add/{ue}", [ExaminationController::class, "createexam"])->name('exam.add');
Route::post("add_cc/{ue}", [ExaminationController::class, "createexam_cc"])->name('exam_cc.add');

Route::get('/tp/{ue}', [ExaminationController::class, 'tpcontrole'])->name('result.tp');
Route::get('/download/{nom}', [ExaminationController::class, 'downloadtp'])->name('download.don');

Route::post('/modification/{id}', [ExaminationController::class, 'updatetp'])->name('tp.note.add');


//question route

Route::get('/questions/{ue}', [ExaminationController::class, 'index1'])->name('questions.index');
Route::get('/questions_cc/{ue}', [ExaminationController::class, 'index1_cc'])->name('questions.index_cc');

Route::get('/questions/create/{ue}', [ExaminationController::class, 'create'])->name('questions.create');
Route::get('/questions/create_cc/{ue}', [ExaminationController::class, 'create_cc'])->name('questions.create_cc');

Route::post('/', [ExaminationController::class, 'newquestion'])->name('questions.new');
Route::post('/', [ExaminationController::class, 'newquestion_cc'])->name('questions.new_cc');

Route::get('questions/delete/{id}', [ExaminationController::class, "deletequestion"])->name('question.delete');

Route::get('/edit/{id}', [ExaminationController::class, "editquestion"])->name("question.edit");
Route::get('/edit_cc/{id}', [ExaminationController::class, "editquestion_cc"])->name("question.edit_cc");

Route::post('questions/update/{ue}', [ExaminationController::class, "updatequestion"])->name("question.update");
Route::post('questions/update_cc/{ue}', [ExaminationController::class, "updatequestion_cc"])->name("question.update_cc");


//Options route
Route::get('/options/{ue}', [OptionsController::class, 'index'])->name('options.index');
Route::get('/options_cc/{ue}', [OptionsController::class, 'index_cc'])->name('options.index_cc');

Route::get('/options/create/{ue}', [OptionsController::class, 'create'])->name('options.create');
Route::get('/options/create_cc/{ue}', [OptionsController::class, 'create_cc'])->name('options.create_cc');

Route::post('new/{ue}', [OptionsController::class, 'newoptions'])->name('options.new');
Route::post('new/{ue}', [OptionsController::class, 'newoptions_cc'])->name('options.new_cc');
Route::get('/delete/{id}', [OptionsController::class, "deleteoption"])->name("option.delete");



//resultat
Route::get('/result/{ue}', [ExaminationController::class, 'index2'])->name('result.index');
Route::get('/result_cc/{ue}', [ExaminationController::class, 'index2_cc'])->name('result.index_cc');





Route::get('/', [TeacherController::class, "index"])->name("teacher.index");

Route::group(['prefix' => "ues"], function(){
    Route::get('/', [UeController::class, 'getAllTeacherCourses'])->name('teacher.ues');
    Route::get('/{ue_code}', [UeController::class, 'ueDetails'])->name('teacher.ue.details');
    Route::get('/edit/{ue_code}', [UeController::class, 'editUe'])->name('teacher.ue.edit');
    Route::post('/update-ue', [UeController::class, 'updateUe'])->name('teacher.ue.update_infos');

    Route::group(['prefix' => "chapter"], function(){
        Route::post("add", [ChapterController::class, "create"])->name('chapter.add');
        Route::post("delete", [ChapterController::class, "delete"])->name('chapter.delete');
    });

//    Route::get('create', [CourseController::class, 'add'])->name('course.add');
//    Route::post('create', [CourseController::class, 'create'])->name('course.create');
//    Route::get('create/content/{uuid_course}', [CourseController::class, 'addContent'])->name('course.addContent');
//    Route::post('create/content/{uuid_course}', [CourseController::class, 'createContent'])->name('course.createContent');
//
//    Route::get('edit/{uuid_course}', [CourseController::class, 'edit'])->name('course.edit');
//    Route::post('edit/{uuid_course}', [CourseController::class, 'update'])->name('course.update');
//    Route::get('edit/content/{uuid_course}', [CourseController::class, 'editContent'])->name('course.editContent');
//    Route::post('edit/content/{uuid_course}', [CourseController::class, 'updateContent'])->name('course.updateContent');
//
//
//    Route::post('delete', [CourseController::class, 'delete'])->name('course.delete');
});


Route::group(['prefix'=>"live"], function(){
    Route::get('',  [LiveController::class, 'getUserLives'])->name("user.lives");
//    Route::post('/nbre-users',  [LiveController::class, 'getNbreConectedUsers'])->name("user.lives.count_users");
    Route::post('/new',  [LiveController::class, 'create'])->name("user.lives.new");
    Route::post('/delete',  [LiveController::class, 'delete'])->name("user.lives.delete");
});





