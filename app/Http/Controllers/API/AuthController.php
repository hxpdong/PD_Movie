<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    //API
    public function registerAPI(Request $request)
    {
        try {
            $usname = $request->name;
            $passwd = bcrypt($request->password);
            $email = $request->email;
            $fullname = $request->fullname;
            DB::insert('insert into pdmv_accounts (usname, password, acctype_id) values (?, ?, ?)', [$usname, $passwd, 3]);
            $numaccid = DB::table('pdmv_accounts')
                ->where('acctype_id', 3)
                ->max('acc_id');
            DB::insert('insert into pdmv_users (user_id, email, fullname) values (?, ?, ?)', [$numaccid, $email, $fullname]);

            $user = new User();
            $user->id = $numaccid;
            $user->name = $usname;
            $user->email = $email;
            $user->password = $passwd;
            $user->fullname = $fullname;
            $user->acctype_id = 3;
            $user->save();

            return $user;
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function loginAPI(Request $request)
    {
        try {
            $credentials = [
                'name' => $request->name,
                'password' => $request->password,
            ];

            if (Auth::guard('web')->attempt($credentials)) {
                $user = Auth::guard('web')->user();
                $user->api_token = Str::random(60);
                $user->save();

                return $user;
            }

            return response()->json(['message' => 'Something went wrong'], 401);
        } catch (\Exception $e) {
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function logoutAPI(Request $request)
    {
        try{
            $user = Auth::guard('api')->user();
            $user->api_token = null;
            $user->save();

            return response()->json(['message' => 'You are successfully logged out'], 200);
        }
        catch (\Exception $e) {
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }
    //Web
    public function register(Request $request)
    {
        try {
            $usname = $request->name;
            $passwd = bcrypt($request->password);
            $email = $request->email;
            $fullname = $request->fullname;
            DB::insert('insert into pdmv_accounts (usname, password, acctype_id) values (?, ?, ?)', [$usname, $passwd, 3]);
            $numaccid = DB::table('pdmv_accounts')
                ->where('acctype_id', 3)
                ->max('acc_id');
            DB::insert('insert into pdmv_users (user_id, email, fullname) values (?, ?, ?)', [$numaccid, $email, $fullname]);

            $user = new User();
            $user->id = $numaccid;
            $user->name = $usname;
            $user->email = $email;
            $user->password = $passwd;
            $user->fullname = $fullname;
            $user->acctype_id = 3;
            $user->save();

            return $user;
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function login(Request $request)
    {
        try {
            $credentials = [
                'name' => $request->name,
                'password' => $request->password,
            ];

            if (Auth::guard('web')->attempt($credentials)) {
                return redirect('/admin/dashboard');
            } else {
                return back()->with('message', 'Invalid login credentials');
            }
        } catch (\Exception $e) {
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }
    
    public function logout(Request $request)
    {
        try {
            Auth::guard('web')->logout();
            return redirect('/login'); // Chuyển hướng đến trang đăng nhập sau khi đăng xuất
        } catch (\Exception $e) {
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }
    //Web-modal
    public function modalPostAuthRegister(Request $request)
    {
        try {
            $usname = $request->mdregusname;
            $passwd = bcrypt($request->mdreguspassword);
            $email = $request->mdregemail;
            $fullname = $request->mdregfullname;
            if($usname == null || $passwd == null || $email == null || $fullname == null){
                return response()->json([
                    "error" => true,
                    "message" => "Các trường không được bỏ trống",
                ]);
            }
            DB::insert('insert into pdmv_accounts (usname, password, acctype_id) values (?, ?, ?)', [$usname, $passwd, 3]);
            $numaccid = DB::table('pdmv_accounts')
                ->where('acctype_id', 3)
                ->max('acc_id');
            DB::insert('insert into pdmv_users (user_id, email, fullname) values (?, ?, ?)', [$numaccid, $email, $fullname]);

            $user = new User();
            $user->id = $numaccid;
            $user->name = $usname;
            $user->email = $email;
            $user->password = $passwd;
            $user->fullname = $fullname;
            $user->acctype_id = 3;
            $user->save();

            $credentials = [
                'name' => $usname,
                'password' => $request->mdreguspassword,
            ];

            if (Auth::guard('web')->attempt($credentials)) {
                return response()->json([
                    'success' => true,
                ]);
            }

            return response()->json([
                "success" => true,
            ]);
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                "error" => true,
                "message" => $e->getMessage(),
            ]);
        }
    }

    public function modalPostAuthLogin(Request $request)
    {
        try {
            $credentials = [
                'name' => $request->mdusname,
                'password' => $request->mduspassword,
            ];

            if (Auth::guard('web')->attempt($credentials)) {
                return response()->json([
                    'success' => true,
                ]);
            } else {
                return response()->json([
                    'message' => "Invalid credentials",
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function logoutHeader(Request $request)
    {
        try {
            Auth::guard('web')->logout();
            return redirect()->back();
        } catch (\Exception $e) {
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function modalUpdateUserInfo(Request $request)
    {
        try {
            $user_id = $request->input('uptAccId'); // Lấy ID của người dùng đã đăng nhập
            $email = $request->input('uptemail');
            $fullname = $request->input('uptfullname');

            // Gọi stored procedure user_update truyền tham số vào
            DB::select('CALL user_update(?, ?, ?)', [$user_id, $email, $fullname]);

            DB::table('users')
            ->join('pdmv_users', 'users.id', '=', 'pdmv_users.user_id')
            ->where('users.id', '=', $user_id) // Replace $yourUserId with the specific user ID you want to update
            ->update([
                'users.email' => DB::raw('pdmv_users.email'),
                'users.fullname' => DB::raw('pdmv_users.fullname'),
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Cập nhật thông tin người dùng thành công',
            ]);
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                'success' => false,
                'error' => true,
                'message' => $e->getMessage(),
            ]);
        }
    }
    
    public function modalUpateUserPassword(Request $request){
        try {
            // Validate the input data
            $request->validate([
                'uptoldpassword' => 'required',
                'uptnewpassword' => 'required|min:5',
                'uptconfirmpassword' => 'required|min:5', // You can adjust the validation rules as needed
            ]);

            // Get the current user
            $user = Auth::user();

            // Check if the old password matches the hashed password in the database
            if (Hash::check($request->uptoldpassword, $user->password)) {
                // Update the user's password with the new password
                $newpass = bcrypt($request->uptnewpassword);
                $user->password = $newpass;
                $user->save();

                DB::select('CALL user_changePassword(?, ?)', [$user->id, $newpass]);

                return response()->json([
                    'success' => true,
                    'message' => 'Mật khẩu đã được thay đổi thành công.',
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Mật khẩu cũ không đúng. Vui lòng kiểm tra lại.',
                ]);
            }
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
}