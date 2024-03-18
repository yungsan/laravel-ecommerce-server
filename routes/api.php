<?php
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\CommonController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\IsAdmin;
use App\Http\Middleware\JWTCheck;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::group([
    'prefix' => 'common',
    'middleware' => ['auth', IsAdmin::class]
], function ($router) {
    Route::get('/totalRows', [CommonController::class, 'getTotalRows']);
});

Route::group([
    'prefix' => 'products'
], function ($router) {
    Route::get('/', [ProductsController::class, 'getProducts']);
    Route::get('/detail', [ProductsController::class, 'getOneProduct']);
    Route::middleware(['auth:api', IsAdmin::class])->post('/create', [ProductsController::class, 'createNewProduct']);

    Route::middleware(['auth:api', IsAdmin::class])->put('/update', [ProductsController::class, 'updateProduct']);

    Route::middleware(['auth:api', IsAdmin::class])->delete('/delete', [ProductsController::class, 'deleteProduct']);
});

Route::group([
    'prefix' => 'categories'
], function ($router) {
    Route::get('/', [CategoriesController::class, 'getCategories']);
    Route::get('/total', [CategoriesController::class, 'getTotalCategory']);
});

Route::group([
    'middleware' => ['auth:api', IsAdmin::class],
    'prefix' => 'users'
], function ($router) {
    Route::get('/', [UserController::class, 'getUsers']);
    Route::get('/total', [UserController::class, 'getTotalUsers']);
});

Route::group([
    'middleware' => 'auth:api',
    'prefix' => 'orders'
], function ($router) {
    Route::get('/', [OrderController::class, 'getOrders']);
    Route::group(['middleware' => [IsAdmin::class]], function ($router) {
        Route::get('/total', [OrderController::class, 'getTotalOrders']);
    });
});


// /api/auth
Route::group([
    'middleware' => ['api', JWTCheck::class],
    'prefix' => 'auth'
], function ($router) {

    Route::post('/login', [AuthController::class, 'login'])
        ->withoutMiddleware(JWTCheck::class);
    Route::post('/register', [AuthController::class, 'register'])
        ->withoutMiddleware(JWTCheck::class);

    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
    Route::post('/change-pass', [AuthController::class, 'changePassWord']);
});

