<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StatisticController extends Controller
{
    //
    public function getMovie(){
        try {
            $results = DB::select("CALL statistic_movie();");
            if($results){
                $totalViews = 0;
                $totalRatings = 0;
                foreach ($results as $result) {
                    $totalViews += $result->view;
                    $totalRatings += $result->rating;
                }                
                return response()->json([
                    'success' => true,
                    'totalViews' => $totalViews,
                    'totalRatings' => $totalRatings,
                    'totalMovies' => count($results),
                    'movieList' => $results,
                ]);
            } else {
                return response()->json([
                    'success' => false
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        }
    }
}
