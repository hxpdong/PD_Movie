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
                    'message' => 'Data retrieved successfully'
                ], 200); // Sử dụng 200 OK khi lấy dữ liệu thành công
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'No archived data found'
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
                    'message' => 'Data retrieved successfully'
                ], 200); // Sử dụng 200 OK khi lấy dữ liệu thành công
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'No archived data found'
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
                'message' => 'You do not have permissions to this account'
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
                'message' => 'You do not have permissions to this account'
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
                'email.required' => 'Email field is required.',
                'email.unique' => 'This email is already used for another account, please use another email!',
                'phone.required' => 'Phone field is mandatory.'
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
                    'message' => 'User information updated successfully',
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'error' => true,
                    'message' => 'Unable to update',
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

    public function changeUserInfo($uid, Request $request)
    {
        try {
            $email = $request->input('email');
            $fullname = $request->input('fullname');
            $request->validate([
                'email' => [
                    'required',
                    Rule::unique('pdmv_users', 'email')->ignore($uid, 'user_id'),
                    Rule::unique('pdmv_admins', 'email')->ignore($uid, 'admin_id'),
                ],
            ], [
                'email.required' => 'Email field is required.',
                'email.unique' => 'This email is already used for another account, please use another email!',
            ]);

            // Gọi stored procedure user_update truyền tham số vào
            $result = DB::select('CALL user_update(?, ?, ?)', [$uid, $email, $fullname]);
            if($result){
                DB::table('users')
                ->join('pdmv_users', 'users.id', '=', 'pdmv_users.user_id')
                ->where('users.id', '=', $uid) // Replace $yourUserId with the specific user ID you want to update
                ->update([
                    'users.email' => DB::raw('pdmv_users.email'),
                    'users.fullname' => DB::raw('pdmv_users.fullname'),
                ]);
    
                return response()->json([
                    'success' => true,
                    'message' => 'User information updated successfully',
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'error' => true,
                    'message' => 'Unable to update',
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

    public function changeAdminPassword($uid, Request $request){
        try {
            $request->validate([
                'uptnewpassword' => 'required|min:5'
            ], [
                'uptnewpassword.required' => 'Password is required.',
            ]);
    
            // Update the user's password with the new password
            $userId = User::where('id', $uid)
                ->first();
            $newpass = bcrypt($request->uptnewpassword);
            $result = DB::select('CALL user_changePassword(?, ?)', [$uid, $newpass]);
            if($result){
                $userId->password = $newpass;
                $userId->save();

                return response()->json([
                    'success' => true,
                    'message' => 'Account password has been changed successfully.',
                ]);
            } else return response()->json([
                'success' => false,
                'message' => 'Unable to update',
            ]);
        }
        catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                'success' => false,
                'message' => 'Error: '.$e->getMessage(),
            ]);
        }
    }

    public function changeUserPassword($uid, Request $request){
        try {
            $request->validate([
                'uptnewpassword' => 'required|min:5'
            ], [
                'uptnewpassword.required' => 'Password is required.',
            ]);
    
            // Update the user's password with the new password
            $userId = User::where('id', $uid)
                ->first();
            $newpass = bcrypt($request->uptnewpassword);
            $result = DB::select('CALL user_changePassword(?, ?)', [$uid, $newpass]);
            if($result){
                $userId->password = $newpass;
                $userId->save();

                return response()->json([
                    'success' => true,
                    'message' => 'Account password has been changed successfully.',
                ]);
            } else return response()->json([
                'success' => false,
                'message' => 'Unable to update',
            ]);
        }
        catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                'success' => false,
                'message' => 'Error: '.$e->getMessage(),
            ]);
        }
    }

    public function addNewAdminAccount(Request $request){
        try{
            $request->validate([
                'fullname' => 'required',
                'email' => [
                    'required',
                    Rule::unique('pdmv_users', 'email'),
                    Rule::unique('pdmv_admins', 'email'),
                ],
                'phone' => 'required|max:10',
                'username' => [
                    'required',
                    Rule::unique('pdmv_accounts', 'usname'),
                ],
                'password' => 'required',
            ], [
                'fullname.required' => 'Name is required.',
                'email.required' => 'Email field is required.',
                'email.unique' => 'Email is already in use, please use another email.',
                'phone.required' => 'Phone number field is required.',
                'username.required' => 'The username field is required.',
                'username.unique' => 'Username is already taken, please use another username.',
                'password.required' => 'Password field is required.',
            ]);
            $fn = $request->fullname;
            $em = $request->email;
            $ph = $request->phone;
            $usn = $request->username;
            $pw = bcrypt($request->password);

            $reslt = DB::select("CALL admin_addNew(?,?,?,?,?)", [$fn, $em, $ph, $usn, $pw]);
            if($reslt) {
                $user = new User();
                $user->id = $reslt[0]->results;
                $user->name = $usn;
                $user->email = $em;
                $user->password = $pw;
                $user->fullname = $fn;
                $user->acctype_id = 2;
                $user->save();

                return response()->json([
                    'success' => true,
                    'message' => 'Administrator added successfully',
                    'newadmin' => $reslt[0]->results
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'Add failed'
                ]);
            }
        }catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
}