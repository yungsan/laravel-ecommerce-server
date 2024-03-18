<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\DB;
use App\Models\Product;
use JD\Cloudder\Facades\Cloudder;
use Validator;
use DB;

class ProductsController extends Controller
{
    public function getProducts(Request $req)
    {
        $limit = $req->query('limit');
        $offset = $req->query('offset');
        $keyword = $req->query('keyword');

        $columns = [
            'products.id AS ID',
            'thumbnail AS Thumbnail',
            'name AS Name',
            DB::raw('price - (price * promotion / 100) AS "Promotional Price"'),
            'price AS Unit Price',
            'promotion AS Promotion (%)',
            'stock AS Stock',
            'full_name AS Shop',
            'description AS Description',
            'products.updated_at AS Last Update',
        ];

        $query = Product::select($columns)
            ->leftJoin('users', 'users.id', '=', 'products.author');

        $data = $query;

        if ($keyword) {
            $data = $query
                ->where('name', 'like', "{$keyword}%")
                ->orWhere('name', 'like', "%{$keyword}%")
                ->orWhere('full_name', 'like', "%{$keyword}%")
                ->orWhere('price', '=', $keyword)
                ->orWhere('stock', '=', $keyword);
        }

        $total_rows = $data->count();

        $data = $data->skip($offset)
            ->take($limit)
            ->orderBy('products.id', 'desc')
            ->get();

        return response()->json(
            [
                'data' => $data,
                'total_rows' => $total_rows,
            ]
        );
    }

    public function getOneProduct(Request $req)
    {
        $id = $req->query('productId');
        $data = Product::leftJoin('users', 'users.id', '=', 'products.author')
            ->leftJoin('categories', 'categories.id', '=', 'products.category')
            ->where('products.id', '=', $id)
            ->get([
                'products.id AS ID',
                'thumbnail AS Thumbnail',
                'products.name AS Name',
                'price AS Price',
                'promotion AS Promotion (%)',
                'stock AS Stock',
                'full_name AS Shop',
                'categories.name AS Category',
                'products.description AS Description',
                'products.updated_at AS Last Update',
            ]);
        return $data[0];
    }

    public function getTotalProduct(Request $req)
    {
        return Product::get()->count();
    }

    public function createNewProduct(Request $req)
    {
        $validator = validator::make($req->all(), [
            'author' => 'required|integer|min:1',
            'name' => 'bail:required|string|min:1|max:255',
            'stock' => 'required|integer|min:0',
            'price' => 'required|integer|min:500',
            'category' => 'required|string|min:3',
            'description' => 'nullable|string|min:0|max:500',
            'promotion' => 'nullable|integer',
            'thumbnail' => 'nullable',
        ]);

        // return $validator->validated();

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $insertData = $validator->validated();

        $category = $insertData['category'];
        $category_id = Category::whereRaw('LOWER(`name`) = ? ', [strtolower($category)])->get();
        if (count($category_id) == 0) {
            $newCategory = Category::create(['name' => strtolower($category)]);
            $insertData['category'] = $newCategory['id'];
        } else {
            $insertData['category'] = $category_id[0]['id'];
        }

        // return $category_id;

        if ($req->hasFile('thumbnail')) {
            $filename = $req->file('thumbnail');
            Cloudder::upload($filename, null, [
                'folder' => 'AdminDashboard/product_media/' . $req->all()['author']
            ]);

            $result = Cloudder::getResult();
            $url = $result['url'];
            $insertData['thumbnail'] = $url;
        } else {
            unset($insertData['thumbnail']);
        }

        $product = Product::create(array_merge($insertData));

        return response()->json([
            'message' => 'Product successfully created',
            'product' => $product
        ], 201);
    }

    public function deleteProduct(Request $req)
    {
        $userRole = auth()->user()['role'];
        if ($userRole == 'customer') {
            return response()->json(['error' => 'Can not access'], 402);
        }
        $validator = validator::make($req->all(), [
            'id' => 'required|integer|min:1'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        try {
            $product = Product::find($validator->validated()['id']);
            $product->delete();
            return response()->json([
                'message' => 'Product successfully deleted',
                'product' => $product
            ], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Product can not delete because it is NULL'
            ]);
        }
    }

    public function updateProduct(Request $req)
    {
        // return $req->all();

        $validator = validator::make($req->all(), [
            'productId' => 'required|integer|min:1',
            'author' => 'required|integer|min:1',
            'name' => 'bail:required|string|min:1|max:255',
            'stock' => 'required|integer|min:0',
            'price' => 'required|integer|min:500',
            'category' => 'required|string|min:3',
            'description' => 'nullable|string|min:0|max:500',
            'promotion' => 'nullable|integer',
            'thumbnail' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $insertData = $validator->validated();
        // return $insertData;
        $category = $insertData['category'];
        $category_id = Category::whereRaw('LOWER(`name`) = ? ', [strtolower($category)])->get();
        if (count($category_id) == 0) {
            $newCategory = Category::create(['name' => strtolower($category)]);
            $insertData['category'] = $newCategory['id'];
        } else {
            $insertData['category'] = $category_id[0]['id'];
        }


        // return $insertData;

        if ($req->hasFile('thumbnail')) {
            $filename = $req->file('thumbnail');
            Cloudder::upload($filename, null, [
                'folder' => 'AdminDashboard/product_media/' . $req->all()['author']
            ]);

            $result = Cloudder::getResult();
            $url = $result['url'];
            $insertData['thumbnail'] = $url;
        }

        // return $insertData;

        $id = $insertData['productId'];
        $data = array_merge($insertData);
        try {
            $product = Product::find($id);
            unset($data['id']);
            // return $data;
            $product->update($data);

            return response()->json([
                'message' => 'Product successfully updated',
                'id' => $id,
                'product' => $product
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Product can not delete because it is NULL',
                'id' => $id,
            ]);
        }
    }
}
