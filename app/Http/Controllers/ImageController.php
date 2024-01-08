<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ImageController extends Controller
{
    //
    public function getById($mvid){
        $results = DB::select("SELECT * FROM `pdmv_mvimages` WHERE movie_id = ?", array($mvid));
        if (!empty($results)) {
            return response()->json([
                'success' => true,
                'images' => $results
            ]);
        } else {
            // Đăng nhập thất bại
            return response()->json([
                'success' => false
            ]);
        }

        
    }
}
