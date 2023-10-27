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

    public function getMovieDetail($mvid){
        try {
            $results = DB::select("CALL statistic_movie_show(?);", array($mvid));
            if($results){
                $total = $results[0]->total;
                $point1 = $results[0]->numRating1;
                $point2 = $results[0]->numRating2;
                $point3 = $results[0]->numRating3;
                $point4 = $results[0]->numRating4;
                $point5 = $results[0]->numRating5;
                if($total > 0){
                    $ratio1 = number_format(($point1 / $total) * 100, 2);
                    $ratio2 = number_format(($point2 / $total) * 100, 2);
                    $ratio3 = number_format(($point3 / $total) * 100, 2);
                    $ratio4 = number_format(($point4 / $total) * 100, 2);
                    $ratio5 = number_format(($point5 / $total) * 100, 2);

                    // Kiểm tra tổng phần trăm
                    $totalPercentage = $ratio1 + $ratio2 + $ratio3 + $ratio4 + $ratio5;
                    if ($totalPercentage != 100) {
                        // Tính toán sự sai khác và cộng vào một trong các tỷ lệ
                        $difference = 100 - $totalPercentage;
                        $ratio1 += $difference;
                    }
                }
                else {
                    $ratio1 = 0;
                    $ratio2 = 0;
                    $ratio3 = 0;
                    $ratio4 = 0;
                    $ratio5 = 0;
                }
    
                return response()->json([
                    'success' => true,
                    'detail' => $results,
                    'rate1' => $ratio1,
                    'rate2' => $ratio2,
                    'rate3' => $ratio3,
                    'rate4' => $ratio4,
                    'rate5' => $ratio5,
                ]);
            } else {
                return response()->json([
                    'success' => false
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error" => $e->getMessage(),
            ]);
        }
    }    
}