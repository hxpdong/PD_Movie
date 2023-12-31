<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Session;
use Carbon\Carbon;
use App\Http\Controllers\Token;
use App\Models\User;
use Illuminate\Validation\Rule;

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
        foreach ($results as $rs) {
            $rs->commentTime = Carbon::parse($rs->commentTime)->format('H:i:s d/m/Y');
        }
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
        try{
            $token = Token::getToken();
            $user = User::where('id', $request->accId)
                ->whereNotNull('api_token')
                ->first();
            if($token != null){
                if ($user && $token === $user->api_token) {

                    $request->validate([
                        'accId' => ['required',],
                        'mId' => ['required',],
                        'comment' => ['required',]
                    ], [
                        'accId.required' => 'accId is required.',
                        'mId.required' => 'mId is required.',
                        'comment.required' => 'comment is required.',
                    ]);

                    $usid = $request->accId;
                    $mid = $request->mId;
                    $cmt = $request->comment;
            
                    // Insert the new user's account
                    DB::update('CALL comment_post(?, ?, ?)', [$usid, $mid, $cmt]);
            
                    return response()->json([
                        'success' => true
                    ]);
                }
                else return response()->json([
                    'success' => false,
                    'message' => 'You donnot have this permission.',
                    'uid1' => $request->accId
                ]);
            } else return response()->json([
                'success' => false,
                'message' => 'You donnot have this permission.',
                'uid2' => $request->accId
            ]);
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
        
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
        try{
            $request->validate([
                'accId' => ['required',],
                'mId' => ['required',],
                'ratingpoint' => ['required',]
            ], [
                'accId.required' => 'accId is required.',
                'mId.required' => 'mId is required.',
                'ratingpoint.required' => 'Ratingpoint is required.',
            ]);
            if(Token::checkToken($request->accId)){
                $uid = $request->accId;
                $mid = $request->mId;
                $rating = $request->ratingpoint;
                DB::update("CALL rating_post(?, ?, ?)", array($uid, $mid, $rating));
                $newrt = DB::select("CALL movie_showdetail(?);", array($mid));
                return response()->json([
                        'success' => true,
                        "mvpoint" => $newrt[0]->mvpoint,
                        "numrating" => $newrt[0]->numrating
                    ]);
            } else return response()->json([
                'success' => false,
                'message' => 'You donnot have this permission.'
            ]);
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function dropRating($rtid){
        try{
            $accId = DB::select('select * from pdmv_ratings where rating_id=?', array($rtid));
            $accId = $accId[0]->user_id;
            if(Token::checkToken($accId)){
                $isDel = DB::select('CALL rating_drop(?)', array($rtid));
                if($isDel){
                    return response()->json([
                        'success' => true,
                    ]);
                }
                return response()->json([
                    'success' => false,
                    'message' => 'Rating does not exist'
                ]);
            } else return response()->json([
                'success' => false,
                'message' => 'You donnot have this permission.'
            ]);
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function dropComment($cmtid)
    {
        try{
            $accId = DB::select('select * from pdmv_comments where comment_id=?', array($cmtid));
            $accId = $accId[0]->user_id;
            if(Token::checkToken($accId)){
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
            } else return response()->json([
                'success' => false,
                'message' => 'You donnot have this permission.'
            ]);
            
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
            $accId = DB::select('select * from pdmv_comments where comment_id=?', array($cmtid));
            $accId = $accId[0]->user_id;
            if(Token::checkToken($accId)){
                DB::update('CALL comment_edit(?,?);', array($cmtid,$cmt));
        
                return response()->json([
                    'success' => true
                ]);
            } else return response()->json([
                'success' => false,
                'message' => 'You donnot have this permission.'
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage() // Hoặc bạn có thể định nghĩa thông báo lỗi riêng
            ], 500); // 500 là mã lỗi nội bộ (Internal Server Error)
        }
    }

    public function postError(Request $request)
    {
        try {
            $mvid = $request->mId;
            $rpct = $request->errorContent;
    
            // Insert the new user's account
            DB::update('CALL error_post(?, ?)', [$mvid, $rpct]);
    
            return response()->json([
                'success' => true
            ]);
        } catch (\Exception $e) {
            // Xử lý ngoại lệ ở đây, ví dụ: ghi log, trả về lỗi
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }    

    public function indexAdmin()
    {
        $results = DB::select("CALL movie_list()");
        
        if (!empty($results)) {
        return response()->json([
            'success' => true,
            'results' => $results,
            'totalMovies' => count($results)
        ]);
        } else {
            return response()->json([
                'success' => false]);
        }
    }

    public function createMovie(Request $request){
        try {
            $request->validate([
                'newEnName' => [
                    'required',
                    Rule::unique('pdmv_movies', 'title_en'),
                ],

            ], [
                'newEnName.required' => 'English name is required.',
                'newEnName.unique' => "The movie name already exists, please add a new chapter to the movie or use another name."
            ]);

            $titlevi = request()->get('newViName', '');
            $titleen = request()->get('newEnName', ''); // Thêm các giá trị còn lại
            $content = request()->get('newContent', '');
            $director = request()->get('newDirector', '');
            $actors = request()->get('newActor', '');
            $manufactureYear = request()->get('newYear', '');
            $videoLength = request()->get('newVidLength', '');
            $typeOfPosterURL = request()->get('newTypePoster', '');
            $posterURL = request()->get('newPosterURL', '');

            $results = DB::select("CALL movie_add(?,?,?,?,?,?,?,?,?)", array(
                $titlevi,
                $titleen,
                $content,
                $director,
                $actors,
                $manufactureYear,
                $videoLength,
                $typeOfPosterURL,
                $posterURL
            ));

            if($results){
                return response()->json([
                    'success' => true,
                    'message' => 'The movie was successfully added',
                    'newmv' => $results
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Cannot add new movies'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function dropMovie($mvid){
        try{
            $results = DB::select("CALL movie_drop(?)", array($mvid));
            if($results){
                return response()->json([
                    'success' => true,
                    'message' => 'Delete successfully'
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Can not delete'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    public function updateMovie($mvid, Request $request){
        try {
            $uptRequest = "uptgenre-";
            $matchingRequests = $request->all();
            $hasMatchingRequest = false;

            $totalMvg = request()->get('totalGenre');
            $request->validate([
                'dtEnName' => [
                    'required',
                    Rule::unique('pdmv_movies', 'title_en')->ignore($mvid, 'movie_id'),
                ],

            ], [
                'dtEnName.required' => 'English name is required.',
                'dtEnName.unique' => "The movie name already exists, please add a new chapter to the movie or use another name."
            ]);

            $titlevi = request()->get('dtViName', '');
            $titleen = request()->get('dtEnName', ''); // Thêm các giá trị còn lại
            $content = request()->get('dtContent', '');
            $director = request()->get('dtDirector', '');
            $actors = request()->get('dtActor', '');
            $manufactureYear = request()->get('dtYear', '');
            $videoLength = request()->get('dtVidLength', '');
            $typeOfPosterURL = request()->get('dtTypePoster', '');
            $posterURL = request()->get('dtPosterURL', '');

            $results = DB::select("CALL movie_update(?,?,?,?,?,?,?,?,?,?)", array(
                $mvid,
                $titlevi,
                $titleen,
                $content,
                $director,
                $actors,
                $manufactureYear,
                $videoLength,
                $typeOfPosterURL,
                $posterURL
            ));

            if($results){
                $rmgenre = DB::select("CALL movie_genre_drop_all_of_movie(?)", array($mvid));
                foreach ($matchingRequests as $key => $value) {
                    if (strpos($key, $uptRequest) === 0) {
                        $genreId = substr($key, strlen($uptRequest)); // Lấy phần số sau "uptgenre-"
                        $addgenre = DB::select("CALL movie_genre_add(?,?)", array($mvid, $value));
                        $hasMatchingRequest = true;
                    }
                }
                if (!$hasMatchingRequest) {
                    $noseegenre = DB::select("CALL movie_genre_add(?, ?)", array($mvid, 1));
                }
                return response()->json([
                    'success' => true,
                    'message' => 'Movie updated successfully',
                    'newmv' => $results
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Unable to update movie'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    public function getChapterOfMovieAdmin($mvid){
        try{
            $results =DB::select("CALL movie_listChaptersOfMovie(?);", array($mvid));
            if($results){
                return response()->json([
                    'success' => true,
                    'message' => 'Get list of movie successfully',
                    'chapters' => $results,
                    'totals' => count($results)
                ]);
            }else {
                return response()->json([
                    'success' => false,
                    'message' => 'Get list of movie failed',
                    'totals' => count($results)
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    public function postReport(Request $request){
        try {
            $cmtid = $request->commentId;
            $results = DB::select("CALL report_post(?);", array($cmtid));
            return response()->json([
                'success' => true
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    public function postView($mvid){
        try {
            $results = DB::select("CALL mvview_post(?);", array($mvid));
            return response()->json([
                'success' => true
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
}