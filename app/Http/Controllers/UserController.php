<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('auth:api', ['except' => ['getUserss', 'getTotalUsers']]);
    // }
    public function getUsers(Request $req)
    {
        $limit = $req->query('limit');
        $offset = $req->query('offset');
        $keyword = $req->query('keyword');
        $columns = [
            'avatar AS Avatar',
            'full_name AS Full Name',
            'Email AS Email',
            'role AS User Type',
            'updated_at AS Last Update',
            'created_at AS Joined',
        ];

        $query = User::select($columns);

        $data = $query;

        if ($keyword) {
            $data = $query
                ->where('full_name', 'like', "%{$keyword}%")
                ->orWhere('email', 'like', "%{$keyword}%")
                ->orWhere('role', 'like', "%{$keyword}%");
        }

        $total_rows = $data->count();
        $data = $data->skip($offset)
            ->take($limit)
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json(
            [
                'data' => $data,
                'total_rows' => $total_rows
            ]
        );
    }

    public function getTotalUsers(Request $req)
    {
        $total = User::get()->count();
        return $total;
    }
}
