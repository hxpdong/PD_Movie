<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Validation\Rule;

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

    public function changeAdminInfo($uid, Request $request)
    {
        try {
            $email = $request->input('email');
            $fullname = $request->input('fullname');
            $phone = $request->input('phone');
            $request->validate([
                'email' => [
                    'required',
                    Rule::unique('pdmv_users', 'email')->ignore($uid, 'user_id'),
                    Rule::unique('pdmv_admins', 'email')->ignore($uid, 'admin_id'),
                ],
                'phone' => 'required'
            ], [
                'email.required' => 'Trường email là bắt buộc.',
                'email.unique' => 'Email này đã được sử dụng cho tài khoản khác, vui lòng sử dụng email khác!',
                'phone.required' => 'Trường điện thoại là bắt buộc.'
            ]);

            // Gọi stored procedure user_update truyền tham số vào
            $result = DB::select('CALL admin_update(?, ?, ?, ?)', [$uid, $email, $fullname, $phone]);
            if($result){
                DB::table('users')
                ->join('pdmv_admins', 'users.id', '=', 'pdmv_admins.admin_id')
                ->where('users.id', '=', $uid) // Replace $yourUserId with the specific user ID you want to update
                ->update([
                    'users.email' => DB::raw('pdmv_admins.email'),
                    'users.fullname' => DB::raw('pdmv_admins.fullname'),
                ]);
    
                return response()->json([
                    'success' => true,
                    'message' => 'Cập nhật thông tin người dùng thành công',
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'error' => true,
                    'message' => 'Không cập nhật được',
                ]);
            }
            
        }
        catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                'success' => false,
                'error' => true,
                'message' => $e->getMessage(),
            ]);
        }
    }
}