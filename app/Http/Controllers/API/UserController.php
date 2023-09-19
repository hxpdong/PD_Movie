<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class UserController extends Controller
{
    //
    public function getInfoByUsername($usn){
        $info = DB::select("CALL user_getByUsername(?)", array($usn));
        if($info){
            $usid = DB::select("CALL account_getUid(?)", array($usn));
            $usid = $usid[0];
            $favoritemvs = DB::select("CALL user_getFavoriteMovies(?)", array($usid->acc_id));
            return response()->json([
                'success' => true,
                'userInfo' => $info,
                'favmovies' => $favoritemvs
            ]);
        }
        return response()->json([
            'success' => false,
            'message' => 'Cannot find this username'
        ]);
    }

    public function getListOfComment($uid){
        try {
            $cmt = DB::select("CALL user_getCommentList(?)", array($uid));
            foreach ($cmt as $comment) {
                $comment->commentTime = Carbon::parse($comment->commentTime)->format('H:i:s d/m/Y');
            }
            return response()->json([
                'success' => true,
                'listcomment' => $cmt
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => 'An error occurred while fetching comments: ' . $e->getMessage()
            ], 500); 
        }
    }

    public function getListOfRating($uid){
        try {
            $ratings = DB::select("CALL user_getRatingList(?)", array($uid));
            foreach ($ratings as $rt) {
                $rt->ratingtime = Carbon::parse($rt->ratingtime)->format('H:i:s d/m/Y');
            }
            return response()->json([
                'success' => true,
                'listrating' => $ratings
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => 'An error occurred while fetching comments: ' . $e->getMessage()
            ], 500); 
        }
    }
}
