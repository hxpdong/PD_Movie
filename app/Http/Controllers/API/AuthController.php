<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
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
}