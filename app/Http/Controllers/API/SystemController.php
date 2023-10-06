<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SystemController extends Controller
{
    //
    public function getSystemVar(){
        $themoviedb = DB::select("SELECT varLink as APILINK FROM pdmv_systemvariable WHERE id = 1");
        $themoviedb = $themoviedb[0]->APILINK; // Lấy giá trị APILINK từ kết quả truy vấn
        return response()->json([
            'success' => true,
            'themoviedbLINK' => $themoviedb
        ]);        
    }
}
