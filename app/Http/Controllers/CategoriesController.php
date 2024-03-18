<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use DB;

class CategoriesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['getCategories']]);
    }
    public function getCategories(Request $req)
    {
        $limit = $req->query('limit');
        $offset = $req->query('offset');
        $keyword = $req->query('keyword');

        $columns = [
            'categories.name AS Name',
            DB::raw('count(*) AS "Total Products"'),
            'categories.description AS Description',
            'categories.updated_at AS Last Update'
        ];

        $query = Category::
            select($columns)
            ->leftJoin('products', 'products.category', '=', 'categories.id')
            ->groupBy('categories.id', 'categories.description', 'categories.updated_at');

        $data = $query;
        if ($keyword) {
            $data = $query
                ->where('categories.name', 'like', "{$keyword}%")
                ->orWhere('categories.name', 'like', "%{$keyword}%");
        }

        $total_rows = $data->get()->count();

        if ($limit != 0) {
            $data = $data->skip($offset)->take($limit);
        }

        $data = $data->orderBy('categories.updated_at', 'desc')->get();

        return response()->json(
            [
                'data' => $data,
                'total_rows' => $total_rows
            ]
        );
    }
}
