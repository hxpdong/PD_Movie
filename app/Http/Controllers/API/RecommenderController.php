<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;

class RecommenderController extends Controller
{
    //
    public function UserBased_CollaborativeFiltering($uid)
    {
        $numofmov = request()->get('num', 12);
        $sameUsers = DB::select('call collab_similarityUsers(?)', array($uid));
        if(empty($sameUsers)){
            $movies = DB::select('call movie_listhighestratingmovies(?)', array($numofmov));
        }
        else {
            $movies = DB::select('CALL collab_recommendedmovies(?, ?)', array($uid, $numofmov));
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
}