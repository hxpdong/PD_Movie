<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Session;

class MovieController extends Controller
{
    //
    public function index()
    {
        $results = DB::select("CALL movie_list()");
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
            'results' => $resultArray]);
        } else {
            return response()->json([
                'success' => false]);
        }
    }

    public function show($mid){
        $results = DB::select("CALL movie_showdetail(?)", array($mid));
        if (!empty($results)) {
            $chapters = DB::select("CALL movie_listChaptersOfMovie(?)", array($mid));
            $cnt = count($chapters);
            return response()->json([
                'success' => true,
                'movie_detail' => $results,
                'chapters' => $chapters,
                'numchap' => $cnt,
            ]);
        } else {
            // Đăng nhập thất bại
            return response()->json([
                'success' => false
            ]);
        }

        
    }

    public function showWithUrl($mid,$murl){
        $results = DB::select("CALL movie_showdetailByURL(?)", array($murl));
        if (!empty($results)) {
            return response()->json([
                'success' => true,
                'movie_detail' => $results
            ]);
        } else {
            // Đăng nhập thất bại
            return response()->json([
                'success' => false
            ]);
        }

        
    }

    public function getCommentListOf($mid){
        $results = DB::select("SELECT * FROM pdmv_comments cmt JOIN pdmv_accounts acc ON cmt.user_id = acc.acc_id WHERE movie_id = ? ORDER BY comment_id DESC;", array($mid));
        
        $perPage = request()->get('num', 3);
        $currentPage = request()->get('page', 1);
        $total = count($results);
        $offset = ($currentPage - 1) * $perPage;
        $results = array_slice($results, $offset, $perPage);
        $comments = new LengthAwarePaginator(
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
            'comments' => $comments->items(),
            'current_page' => $comments->currentPage(),
            'total' => $comments->total(),
            'per_page' => $comments->perPage(),
            'last_page' => $comments->lastPage(),
        ];
        
        
        if (!empty($resultArray)) {
            return response()->json([
                'success' => true,
                'results' => $resultArray
            ]);
        } else {
            // Đăng nhập thất bại
            return response()->json([
                'success' => false
            ]);
        }
    }

    public function postcomment(Request $request)
    {
        $usid = $request->accId;
        $mid = $request->mId;
        $cmt = $request->comment;

        // Insert the new user's account
        DB::insert('insert into pdmv_comments (user_id, movie_id, comment) values (?, ?, ?)', [$usid, $mid, $cmt]);

        return response()->json([
            'success' => true
        ]);
    }

    public function getRatingOf($uid, $mid){
        $results = DB::select("SELECT * FROM pdmv_ratings WHERE user_id = ? AND movie_id = ?;", array($uid, $mid));
        if($results){
            return response()->json([
                'success' => true,
                'rating' => $results
            ]);
        }
        else return response()->json([
            'success' => false,
        ]);
    }

    public function postRatingOf(Request $request){
        $uid = $request->accId;
        $mid = $request->mId;
        $rating = $request->ratingpoint;
        DB::delete("DELETE FROM pdmv_ratings WHERE user_id = ? AND movie_id = ?", [$uid, $mid]);
        DB::insert("INSERT INTO pdmv_ratings(user_id, movie_id, rating) VALUES(?, ?, ?)", array($uid, $mid, $rating));
        return response()->json([
                'success' => true,
            ]);
       
    }
}