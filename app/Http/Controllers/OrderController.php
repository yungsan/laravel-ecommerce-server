<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function getOrders(Request $req)
    {
        $limit = $req->query('limit');
        $offset = $req->query('offset');
        $keyword = $req->query('keyword');
        $columns = [
            'orders.id',
            'full_name AS Customer',
            'total_price AS Total',
            'status',
            'orders.created_at AS Order Date',
            'orders.updated_at AS Order Update',
        ];

        $role = auth()->user()['role'];

        if ($role == 'admin') {
            $query = Order::select($columns)
                ->leftJoin('users', 'users.id', '=', 'orders.customer_id');

            $data = $query;

            if ($keyword) {
                $data = $query
                    ->where('full_name', 'like', "%{$keyword}%")
                    ->orWhere('status', 'like', "%{$keyword}%");
            }

            $total_rows = $data->count();
            $data = $data->skip($offset)
                ->take($limit)
                ->orderBy('orders.updated_at', 'desc')
                ->get();

            return response()->json(
                [
                    'data' => $data,
                    'total_rows' => $total_rows
                ]
            );
        }

        $customer_id = auth()->user()['id'];
        $data = Order::where('customer_id', '=', $customer_id)->get();
        return $data;
    }
    public function getTotalOrders(Request $req)
    {
        $total = Order::get()->count();
        return $total;
    }
}
