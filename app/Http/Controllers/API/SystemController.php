<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SystemController extends Controller
{
    //
    public function getSystemVarMovie(){
        $themoviedb = DB::select("SELECT varLink as APILINK FROM pdmv_systemvariable WHERE id = 1");
        $themoviedb = $themoviedb[0]->APILINK; // Lấy giá trị APILINK từ kết quả truy vấn
        return response()->json([
            'success' => true,
            'themoviedbLINK' => $themoviedb
        ]);        
    }
    public function getSystemVarTV(){
        $themoviedb = DB::select("SELECT varLink as APILINK FROM pdmv_systemvariable WHERE id = 2");
        $themoviedb = $themoviedb[0]->APILINK; // Lấy giá trị APILINK từ kết quả truy vấn
        return response()->json([
            'success' => true,
            'themoviedbLINK' => $themoviedb
        ]);        
    }
    public function getPosterAPI(){
        $results = DB::select("SELECT * FROM pdmv_api");
        if ($results){
            return response()->json([
                'success' => true,
                'apiList' => $results
            ]);
        }
        else return response()->json([
            'success' => false,
            'message' => 'Cannot get APIs'
        ]);
    }
}
