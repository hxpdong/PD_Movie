<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Pagination\LengthAwarePaginator;

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

            $perPage = request()->get('num', 5);
            $currentPage = request()->get('page', 1);
            $total = count($cmt);
            $offset = ($currentPage - 1) * $perPage;
            $cmt = array_slice($cmt, $offset, $perPage); 

            $comments = new LengthAwarePaginator(
                $cmt,
                $total,
                $perPage,
                $currentPage,
                [
                    'path' => request()->url(),
                    'query' => request()->query(),
                ]
            );

            foreach ($comments as $comment) {
                $comment->commentTime = Carbon::parse($comment->commentTime)->format('H:i:s d/m/Y');
            }

            $pagingArray = [
                'comments' => $comments->items(),
                'current_page' => $comments->currentPage(),
                'total' => $comments->total(),
                'per_page' => $comments->perPage(),
                'last_page' => $comments->lastPage(),
            ];

            
            return response()->json([
                'success' => true,
                'listcomment' => $pagingArray
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
                $rt->ratingTime = Carbon::parse($rt->ratingTime)->format('H:i:s d/m/Y');
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