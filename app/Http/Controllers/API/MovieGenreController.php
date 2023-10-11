<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Validation\Rule;

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

    public function createGenre(Request $request){
        try {
            $request->validate([
                'newEnGenre' => [
                    'required',
                    Rule::unique('pdmv_mvgenres', 'mvgenre_en_name'),
                ],

            ], [
                'newEnGenre.required' => 'Tên tiếng Anh là bắt buộc.',
                'newEnGenre.unique' => "Tên phim đã tồn tại, vui lòng thêm chapter mới cho phim hoặc dùng tên khác."
            ]);

            $titlevi = request()->get('newViGenre', '');
            $titleen = request()->get('newEnGenre', '');

            $results = DB::select("CALL mvgenre_add(?,?)", array(
                $titlevi,
                $titleen
            ));

            if($results){
                return response()->json([
                    'success' => true,
                    'message' => 'Phim được thêm thành công',
                    'newgenre' => $results
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không thêm được phim mới'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
}
