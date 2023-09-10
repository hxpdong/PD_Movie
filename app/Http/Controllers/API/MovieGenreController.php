<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MovieGenreController extends Controller
{
    //
    public function listAllGenres(){
        $type = request()->get('type', 0);
        $genreList = DB::select("CALL mvgenre_listGenres(?)", array($type));
        if($genreList) {
            return response()->json([
                "genres" => $genreList,
                "success" => true
            ]);
        }
        return response()->json([
            "success" => false
        ]);
    }

    public function listMoviesOf(){
        
    }
}
