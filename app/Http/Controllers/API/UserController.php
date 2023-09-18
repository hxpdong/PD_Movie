<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
}
