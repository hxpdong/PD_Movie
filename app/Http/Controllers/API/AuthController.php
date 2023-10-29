<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use App\Http\Controllers\Token;
use Illuminate\Support\Facades\Mail;
use App\Mail\ForgotPasswordMail;

class AuthController extends Controller
{
    //API
    public function registerAPI(Request $request)
    {
        try {
            $request->validate([
                'name' => 'required|unique:pdmv_accounts,usname',
                'email' => [
                    'required',
                    Rule::unique('pdmv_users', 'email'),
                    Rule::unique('pdmv_admins', 'email'),
                ],
            ], [
                'name.required' => 'Trường username là bắt buộc.',
                'name.unique' => 'Username đã tồn tại. Vui lòng nhập lại!',
                'email.required' => 'Trường email là bắt buộc.',
                'email.unique' => 'Email này đã được sử dụng cho tài khoản khác, vui lòng sử dụng email khác!',
            ]);
            
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
                if ($user->isLocked == 0) {
                    $user->api_token = Str::random(60);
                    $user->password_otp = null;
                    $user->save();

                    return $user;
                } else {
                    Auth::guard('web')->logout();
                    return response()->json(['message' => 'Bạn đã bị khóa'], 404);
                }
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

    /*
    //Web
    public function register(Request $request)
    {
        try {
            $request->validate([
                'name' => 'required|unique:pdmv_accounts,usname',
                'email' => [
                    'required',
                    Rule::unique('pdmv_users', 'email'),
                    Rule::unique('pdmv_admins', 'email'),
                ],
            ], [
                'name.required' => 'Trường username là bắt buộc.',
                'name.unique' => 'Username đã tồn tại. Vui lòng nhập lại!',
                'email.required' => 'Trường email là bắt buộc.',
                'email.unique' => 'Email này đã được sử dụng cho tài khoản khác, vui lòng sử dụng email khác!',
            ]);

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
            $user = Auth::guard('web')->user();
            $user->api_token = null;
            $user->save();
            Auth::guard('web')->logout();
            return redirect('/login'); // Chuyển hướng đến trang đăng nhập sau khi đăng xuất
        } catch (\Exception $e) {
            return response()->json([
                "error:" => $e->getMessage(),
            ]);
        }
    }
    */

    //Web-modal
    public function modalPostAuthRegister(Request $request)
    {
        try {
            $request->validate([
                'mdregusname' => 'required|unique:pdmv_accounts,usname',
                'mdregemail' => [
                    'required',
                    Rule::unique('pdmv_users', 'email'),
                    Rule::unique('pdmv_admins', 'email'),
                ],
            ], [
                'mdregusname.required' => 'Trường username là bắt buộc.',
                'mdregusname.unique' => 'Username đã tồn tại. Vui lòng nhập lại!',
                'mdregemail.required' => 'Trường email là bắt buộc.',
                'mdregemail.unique' => 'Email này đã được sử dụng cho tài khoản khác, vui lòng sử dụng email khác!',
            ]);

            $usname = $request->mdregusname;
            $passwd = bcrypt($request->mdreguspassword);
            $email = $request->mdregemail;
            $fullname = $request->mdregfullname;
            if($usname == null || $passwd == null){
                return response()->json([
                    "error" => true,
                    "message" => "Tài khoản và mật khẩu không được bỏ trống",
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
                $user = Auth::guard('web')->user();
                $user->api_token = Str::random(60);
                $user->password_otp = null;
                $user->save();
                return response()->json([
                    'success' => true,
                    'api_token' => $user->api_token,
                    'accid' => $user->id
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
                $user = Auth::guard('web')->user();
                if ($user->isLocked == 0) {
                    $user->api_token = Str::random(60);
                    $user->password_otp = null;
                    $user->save();
                    return response()->json([
                        'success' => true,
                        'api_token' => $user->api_token,
                        'accid' => $user->id
                    ]);
                }
                else {
                    Auth::guard('web')->logout();
                    return response()->json([
                        'success' => false,
                        'message' => "Bạn đã bị khóa",
                    ]);
                }
            } else {
                return response()->json([
                    'success' => false,
                    'message' => "Tài khoản hoặc mật khẩu không đúng",
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
            $user = Auth::guard('web')->user();
            $user->api_token = null;
            $user->save();
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
            $token = Token::getToken();
            $user = User::where('id', $request->input('uptAccId'))
                ->whereNotNull('api_token')
                ->first();
            if($token !== null){
                if ($user && $token === $user->api_token) {
                    $request->validate([
                        'uptemail' => [
                            'required',
                            Rule::unique('pdmv_users', 'email')->ignore($request->input('uptAccId'), 'user_id'),
                            Rule::unique('pdmv_admins', 'email')->ignore($request->input('uptAccId'), 'admin_id'),
                        ],
                    ], [
                        'uptemail.required' => 'Trường email là bắt buộc.',
                        'uptemail.unique' => 'Email này đã được sử dụng cho tài khoản khác, vui lòng sử dụng email khác!',
                    ]);
        
                    $user_id = $request->input('uptAccId'); // Lấy ID của người dùng đã đăng nhập
                    $email = $request->input('uptemail');
                    $fullname = $request->input('uptfullname');
        
                    // Gọi stored procedure user_update truyền tham số vào
                    $result = DB::select('CALL user_update(?, ?, ?)', [$user_id, $email, $fullname]);
        
                    if($result){
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
                    } else {
                        return response()->json([
                            'success' => false,
                            'error' => true,
                            'message' => 'Không cập nhật được',
                        ]);
                    }
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Bạn không có quyền này',
                    ]);
                }
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Bạn không có quyền này',
                ]);
            }
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
            $token = Token::getToken();
            $userId = User::where('id', $request->input('changePassAccId'))
                ->whereNotNull('api_token')
                ->first();
            if($token !== null){
                if ($userId && $token === $userId->api_token) {
                    // Validate the input data
                    $request->validate([
                        'uptoldpassword' => 'required',
                        'uptnewpassword' => 'required|min:5',
                        'uptconfirmpassword' => 'required|min:5', // You can adjust the validation rules as needed
                    ]);
    
                    // Check if the old password matches the hashed password in the database
                    if (Hash::check($request->uptoldpassword, $userId->password)) {
                        // Update the user's password with the new password
                        $newpass = bcrypt($request->uptnewpassword);

                        $result = DB::select('CALL user_changePassword(?, ?)', [$userId->id, $newpass]);
                        if($result){
                            $userId->password = $newpass;
                            $userId->save();

                            return response()->json([
                                'success' => true,
                                'message' => 'Mật khẩu đã được thay đổi thành công.',
                            ]);
                        } else return response()->json([
                            'success' => false,
                            'message' => 'Không cập nhật được',
                        ]);
                    } else {
                        return response()->json([
                            'success' => false,
                            'message' => 'Mật khẩu cũ không đúng. Vui lòng kiểm tra lại.',
                        ]);
                    }
                }else return response()->json([
                    'success' => false,
                    'message' => 'Bạn không có quyền này.',
                ]);
            }
            else return response()->json([
                'success' => false,
                'message' => 'Bạn không có quyền này.',
            ]);
        } catch (\Exception $e) {
            // Xử lý lỗi ở đây, ví dụ: in thông báo lỗi
            return response()->json([
                'success' => false,
                'message' => 'Lỗi: '.$e->getMessage(),
            ]);
        }
    }

    public function createPasswordOTP(Request $request) {
        try {
            $request->validate([
                'registed_email' => 'required'
            
            ], [
                'registed_email.required' => 'Vui lòng nhập email.'
            ]);

            $user = User::where('email', $request->input('registed_email'))->first();
    
            if ($user) {
                $otp = "";
                for ($i = 1; $i <= 6; $i++) {
                    $otp .= random_int(0, 9);
                }
    
                $user->password_otp = $otp;
                $user->save();
                $user_after = User::where('email','=', $request->registed_email)->first();
                Mail::to($request->registed_email)->send(new ForgotPasswordMail($user_after));

                return response()->json([
                    'success' => true,
                    'message' => 'Mã OTP đang được gửi đến email.',
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy người dùng với email đã đăng ký.',
                ]);
            }
    
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi: ' . $e->getMessage(),
            ]);
        }
    }

    public function resetPassword(Request $request){
        try {
            $request->validate([
                'email' => 'required',
                'otp' => 'required|valid_otp_for_email:' . $request->input('email'),
                'password' => 'required|min:5',
                'confirm-password' => 'required|min:5'
            
            ], [
                'email.required' => 'Vui lòng nhập email.',
                'otp.required' => 'Vui lòng nhập mã OTP.',
                'otp.valid_otp_for_email' => 'Mã OTP không hợp lệ, vui lòng nhập lại.',
                'password.required' => 'Vui lòng nhập mật khẩu.',
                'confirm-password.required' => 'Vui lòng nhập mật khẩu xác nhận.',
            ]);
            $user = User::where('email', $request->input('email'))->first();
            if($user){
                $newpass = bcrypt($request->password);
                $result = DB::select('CALL user_changePassword(?, ?)', [$user->id, $newpass]);
                if($result){
                    $user->password = $newpass;
                    $user->save();
                }
                return response()->json([
                    'success' => true,
                ]);
            }
            else {
                return response()->json([
                    'success' => false,
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi: ' . $e->getMessage(),
            ]);
        }
    }
}