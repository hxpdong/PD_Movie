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
            return response()->json([
                'success' => true,
                'userInfo' => $info
            ]);
        }
        return response()->json([
            'success' => false,
            'message' => 'Cannot find this username'
        ]);
    }
}
