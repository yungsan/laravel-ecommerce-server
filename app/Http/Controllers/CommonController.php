<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class CommonController extends Controller
{
    public function getTotalRows(Request $request)
    {
        $table = $request->query('table');
        $data = DB::table($table)->count();
        return $data;
    }
}
