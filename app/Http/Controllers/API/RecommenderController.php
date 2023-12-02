<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;
use App\Models\Movie;

class RecommenderController extends Controller
{
    //
    public function UserBased_CollaborativeFiltering($uid)
    {
        $numofmov = request()->get('num',48);
        $sameUsers = DB::select('call collab_similarityUsers(?)', array($uid));
        if(empty($sameUsers)){
            $movies = DB::select('call movie_listhighestratingmovies(?)', array($numofmov));
        }
        else {
            $movies = DB::select('CALL collab_recommendedmovies(?, ?)', array($uid, $numofmov));
        }
        if (empty($movies)){
            $movies = DB::select('call movie_listhighestratingmovies(?)', array($numofmov));
        } 
        $resultArray = [
            'recommendedmovies' => $movies
        ];
        if (!empty($resultArray)) {
            return response()->json([
                'success' => true,
                'results' => $resultArray]);
        } else {
            return response()->json([
                'success' => false]);
        }
    }

    public function UserBased_SimilarityUsers($uid){
        $sameUsers = DB::select('call collab_similarityUsers(?)', array($uid));
        $sameUsers = array_slice($sameUsers, 0, 6);
        return response()->json([
            'sameUsers' => $sameUsers,
        ]);
    }

    public function ContentBased_recommendMovies($mvid)
    {
        try {
            $numofmov = request()->get('num', 12);
            /*
            // Lấy thông tin về bộ phim được chọn
            $selectedMovie = DB::table('pdmv_movies')
                ->where('movie_id', $mvid)
                ->first();
    
            if (!$selectedMovie) {
                return response()->json([
                    'error' => 'Bộ phim không tồn tại',
                    'success' => false,
                ], 404);
            }
    
            $selectedTitleVi = $selectedMovie->title_vi;
            $selectedTitleEn = $selectedMovie->title_en;
            $selectedDirector = $selectedMovie->director;
            $selectedActors = $selectedMovie->actors;
            $selectedManufactureYear = $selectedMovie->manufactureYear;
    
            // Tính điểm tương đồng và lấy danh sách các bộ phim liên quan
            $recommendedMovies = DB::table('pdmv_movies')
                ->select('pdmv_movies.*')
                ->addSelect(DB::raw('
                    (
                        -- Tính điểm tương đồng
                        IFNULL(CalculateHammingDistance(?, title_vi), 0) +
                        IFNULL(CalculateHammingDistance(?, title_en), 0) +
                        IFNULL(CalculateHammingDistance(?, director), 0) +
                        IFNULL(CalculateHammingDistance(?, actors), 0) +
                        IF(manufactureYear = ?, 1, 0)
                    ) AS similarity
                '))
                ->setBindings([$selectedTitleVi, $selectedTitleEn, $selectedDirector, $selectedActors, $selectedManufactureYear])
                ->where('movie_id', '!=', $mvid)
                ->orderBy('similarity', 'asc')
                ->limit($numofmov)
                ->get();
                */
                $uid = request()->get('userid', 0);
                $threshold = request()->get('threshold', 0.5);
                $recommendedMovies = DB::select("CALL Content_RecommendedMovies(?,?,?,?)", array($mvid, $numofmov, $uid, $threshold));
            return response()->json([
                'success' => true,
                'recommended_movies' => $recommendedMovies
            ]);
        } catch (\Exception $e) {
           // Log::error($e->getMessage());
            return response()->json([
                'error' => 'An error occurred while processing the request.' . $e,
                'success' => false,
            ], 500);
        }
    }

    public function UserBased_CollaborativeFiltering_From_Python(){
        $ids = request()->get('id_list', 1);
        $movies = DB::select('CALL Collab_getRecommendedMoviesFromIds(?)', array($ids));
        $resultArray = [
            'recommendedmovies' => $movies
        ];
        if (!empty($resultArray)) {
            return response()->json([
                'success' => true,
                'results' => $resultArray]);
        } else {
            return response()->json([
                'success' => false]);
        }
    }
}