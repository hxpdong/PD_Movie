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
                'newEnGenre.required' => 'English name is required.',
                'newEnGenre.unique' => "The genre already exists in the system."
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
                    'message' => 'Genre added successfully',
                    'newgenre' => $results
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Cannot add genre'
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
                'uptGenreEn.required' => 'English name is required.',
                'uptGenreEn.unique' => "The genre already exists in the system."
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
                    'message' => 'Genre updated',
                    'newgenre' => $results
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to update genre'
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
                        'message' => 'Genre removed',
                    ]);
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Genre exist for movies, genre cannot be deleted'
                    ]);
                }
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Cannot delete this genre'
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
                    'message' => 'Delete this genre of movie successfully',
                    'movgenid' => $results[0]->results,
                ]);
            }else {
                return response()->json([
                    'success' => false,
                    'message' => 'This genre of movie cannot be deleted'
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
                    'message' => 'Get list of genres successfully',
                    'genres' => $genres,
                    'total' => count($genres)
                ]);
            }else {
                return response()->json([
                    'success' => false,
                    'message' => 'Movie does not exist'
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
