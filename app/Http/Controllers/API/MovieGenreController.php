<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Validation\Rule;

use function PHPUnit\Framework\isNull;

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
                'newEnGenre.unique' => "Thể loại đã tồn tại trong hệ thống."
            ]);

            $titlevi = request()->get('newViGenre', '');
            $titleen = request()->get('newEnGenre', '');

            if($titlevi == ''){
                $titlevi = $titleen;
            }
            $results = DB::select("CALL mvgenre_add(?,?)", array(
                $titlevi,
                $titleen
            ));

            if($results){
                return response()->json([
                    'success' => true,
                    'message' => 'Thể loại được thêm thành công',
                    'newgenre' => $results
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không thêm được thể loại'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    public function updateGenre($gid, Request $request){
        try {
            $request->validate([
                'uptGenreEn' => [
                    'required',
                    Rule::unique('pdmv_mvgenres', 'mvgenre_en_name')->ignore($gid, 'mvgenre_id'),
                ],

            ], [
                'uptGenreEn.required' => 'Tên tiếng Anh là bắt buộc.',
                'uptGenreEn.unique' => "Thể loại đã tồn tại trong hệ thống."
            ]);

            $titlevi = request()->get('uptGenreVi', '');
            $titleen = request()->get('uptGenreEn', '');

            if($titlevi == ''){
                $titlevi = $titleen;
            }
            $results = DB::select("CALL mvgenre_update(?,?,?)", array(
                $gid,
                $titlevi,
                $titleen
            ));

            if($results){
                return response()->json([
                    'success' => true,
                    'message' => 'Đã cập nhật thể loại',
                    'newgenre' => $results
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không cập nhật được thể loại'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    public function dropGenre($gid){
        try {
            if($gid != 1){
                $results = DB::select("CALL mvgenre_drop(?)", array($gid));

                if($results){
                    return response()->json([
                        'success' => true,
                        'message' => 'Đã xóa thể loại',
                    ]);
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Thể loại tồn tại phim, không thể xóa thể loại'
                    ]);
                }
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không thể xóa thể loại này'
                ]);
            }
            
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    public function AdminlistMovieOf($mvgid)
    {
        $genreInfo = DB::select("CALL mvgenre_getGenre(?)", array($mvgid));

        $results = DB::select("CALL mvgenre_listMovieOfGenreWithId(?)", array($mvgid));
        
        $total = count($results);

        $resultArray = [
            'movies' => $results,
            'total' => $total,
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

    public function dropGenreOfMovie($movgenid){
        try{
            $mvgInfo = DB::select("CALL movie_genre_get_info(?);", array($movgenid));
            $results = DB::select("CALL movie_genre_drop(?)", array($movgenid));
            if($results){
                $mvid = $mvgInfo[0]->movie_id;
                $addToOther = DB::select("CALL movie_genre_if_not_exists(?);", array($mvid));
                return response()->json([
                    'success' => true,
                    'message' => 'Xóa thể loại này của phim thành công',
                    'movgenid' => $results[0]->results,
                ]);
            }else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không thể xóa thể loại này của phim'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    public function getGenresOfMovie($mvid){
        try{
            $genres = DB::select("CALL movie_genre_get(?)", array($mvid));
            if($genres){
                return response()->json([
                    'success' => true,
                    'message' => 'Lấy thể loại thành công',
                    'genres' => $genres,
                    'total' => count($genres)
                ]);
            }else {
                return response()->json([
                    'success' => false,
                    'message' => 'Phim không tồn tại'
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
