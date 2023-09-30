<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class Token extends Controller
{
    //
    public static function getToken(){
        $authorizationHeader = request()->header('Authorization');
        if (strpos($authorizationHeader, 'Bearer ') === 0) {
            $token = substr($authorizationHeader, 7);
        } else {
            $token = request()->header('Authorization');
        }
        return $token;
    }

    public static function checkToken($accid){
        $authorizationHeader = request()->header('Authorization');
        if (strpos($authorizationHeader, 'Bearer ') === 0) {
            $token = substr($authorizationHeader, 7);
        } else {
            $token = request()->header('Authorization');
        }
        $user = User::where('id', $accid)
                ->whereNotNull('api_token')
                ->first();
        if($token != null){
            if ($user && $token === $user->api_token) {
                return true;
            } else return false;
        }
        return false;
    }
}
