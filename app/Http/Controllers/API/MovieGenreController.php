<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;

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

    public function listMovieOf($mvgid)
    {
        $genreInfo = DB::select("CALL mvgenre_getGenre(?)", array($mvgid));

        $results = DB::select("CALL mvgenre_listMovieOfGenre(?)", array($mvgid));
        
        $perPage = request()->get('num', 12);
        $currentPage = request()->get('page', 1);
        $total = count($results);
        $offset = ($currentPage - 1) * $perPage;
        $results = array_slice($results, $offset, $perPage);
        $movies = new LengthAwarePaginator(
            $results,
            $total,
            $perPage,
            $currentPage,
            [
                'path' => request()->url(),
                'query' => request()->query(),
            ]
        );

        $resultArray = [
            'movies' => $movies->items(),
            'current_page' => $movies->currentPage(),
            'total' => $movies->total(),
            'per_page' => $movies->perPage(),
            'last_page' => $movies->lastPage(),
        ];
        if (!empty($resultArray)) {
        return response()->json([
            'success' => true,
            'infogenre' => $genreInfo[0],
            'results' => $resultArray]);
        } else {
            return response()->json([
                'success' => false]);
        }
    }
}
