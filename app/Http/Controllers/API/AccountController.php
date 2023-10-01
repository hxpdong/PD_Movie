<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;

class AccountController extends Controller
{
    //
    public function getAllUser(){
        try {
            $results = DB::select("CALL user_getAll()");
            if($results){
                return response()->json([
                    'success' => true,
                    'usersList' => $results,
                    'totaluser' => count($results),
                    'message' => 'Dữ liệu được lấy thành công'
                ], 200); // Sử dụng 200 OK khi lấy dữ liệu thành công
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy dữ liệu lưu trữ'
                ], 404); // Sử dụng 404 Not Found khi không tìm thấy dữ liệu
            }
        }
        catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => 'Server error when getting users data: ' . $e->getMessage()
            ], 500); // Sử dụng 500 Internal Server Error cho lỗi ngoại lệ
        }
    }    

    public function getAllAdmin(){
        try {
            $results = DB::select("CALL admin_getAll()");
            if($results){
                return response()->json([
                    'success' => true,
                    'adminsList' => $results,
                    'totaladmin' => count($results),
                    'message' => 'Dữ liệu được lấy thành công'
                ], 200); // Sử dụng 200 OK khi lấy dữ liệu thành công
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy dữ liệu lưu trữ'
                ], 404); // Sử dụng 404 Not Found khi không tìm thấy dữ liệu
            }
        }
        catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => 'Server error when getting admins data: ' . $e->getMessage()
            ], 500); // Sử dụng 500 Internal Server Error cho lỗi ngoại lệ
        }
    }

    public function changeLockState($uid){
        try {
            $isLock = DB::select("CALL account_changeLock(?)", array($uid));
            if($isLock){
                $user = User::where('id', $uid)
                    ->first();
                $user->isLocked = $isLock[0]->isLocked;
                $user->save();
                return response()->json([
                    'success' => true,
                    'currentState' => $isLock[0]->isLocked
                ]);
            }else {
                return response()->json([
                    'success' => false,
                    'message' => 'This account is not exists'
                ]);
            }
        }
        catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => 'Server error when getting admins data: ' . $e->getMessage()
            ], 500); // Sử dụng 500 Internal Server Error cho lỗi ngoại lệ
        }
    }

    public function changeLockStateUser($uid){
        try {
            $user = User::where('id', $uid)
                ->first();
            if($user->acctype_id == 3){
                $isLock = DB::select("CALL account_changeLock(?)", array($uid));
                if($isLock){
                    $user->isLocked = $isLock[0]->isLocked;
                    $user->save();
                    return response()->json([
                        'success' => true,
                        'currentState' => $isLock[0]->isLocked
                    ]);
                }
            }

            else return response()->json([
                'success' => false,
                'message' => 'Bạn không có quyền với tài khoản này'
            ]);
        }
        catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => 'Server error when getting admins data: ' . $e->getMessage()
            ], 500); // Sử dụng 500 Internal Server Error cho lỗi ngoại lệ
        }
    }

    public function changeLockStateAdmin($uid){
        try {
            $user = User::where('id', $uid)
                ->first();
            if($user->acctype_id == 2){
                $isLock = DB::select("CALL account_changeLock(?)", array($uid));
                if($isLock){
                    $user->isLocked = $isLock[0]->isLocked;
                    $user->save();
                    return response()->json([
                        'success' => true,
                        'currentState' => $isLock[0]->isLocked
                    ]);
                }
            }
            
            else return response()->json([
                'success' => false,
                'message' => 'Bạn không có quyền với tài khoản này'
            ]);
        }
        catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => 'Server error when getting admins data: ' . $e->getMessage()
            ], 500); // Sử dụng 500 Internal Server Error cho lỗi ngoại lệ
        }
    }
}
