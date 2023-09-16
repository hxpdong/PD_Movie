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
        $haveKW = request()->get('kwsearch', '');
        if($haveKW == 'null'){
            $haveKW = '';
        }
        $results = DB::select("CALL movie_listWithSearch(?)", array($haveKW));
       
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
            $genres = DB::select("CALL movie_listGenresOfMovie(?)", array($mid));
            $cntGenre = count($genres);
            return response()->json([
                'success' => true,
                'movie_detail' => $results,
                'chapters' => $chapters,
                'numchap' => $cnt,
                'genres' => $genres,
                'numgenre' => $cntGenre
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
        $results = DB::select("CALL movie_listCommentOfMovie(?);", array($mid));
        
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
        DB::update('CALL comment_post(?, ?, ?)', [$usid, $mid, $cmt]);

        return response()->json([
            'success' => true
        ]);
    }

    public function getRatingOf($uid, $mid){
        $results = DB::select("CALL movie_getRatingOf(?, ?);", array($uid, $mid));
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
        DB::update("CALL rating_post(?, ?, ?)", array($uid, $mid, $rating));
        return response()->json([
                'success' => true,
            ]);
       
    }

    public function dropComment($cmtid)
    {
        try{
            $cmt = DB::select("CALL comment_get(?)", array($cmtid));
            if($cmt){
                DB::statement('CALL comment_drop(?)', [$cmtid]);
                return response()->json([
                    'success' => true
                ]);
            }else {
                return response()->json([
                    'success' => false
                ]);
            }
        }        
        catch (\Exception $e){
            return response()->json([
                'success' => false,
                'error' => $e->getMessage() // Hoặc bạn có thể định nghĩa thông báo lỗi riêng
            ], 500); // 500 là mã lỗi nội bộ (Internal Server Error)
        }
    }

    public function editComment(Request $request, $cmtid)
    {
        $cmt = $request->editComment;
        if(!$cmt){
          $cmt = "This comment is in error";  
        }
        try {
            DB::update('CALL comment_edit(?,?);', array($cmtid,$cmt));
        
            return response()->json([
                'success' => true
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage() // Hoặc bạn có thể định nghĩa thông báo lỗi riêng
            ], 500); // 500 là mã lỗi nội bộ (Internal Server Error)
        }
    }
}