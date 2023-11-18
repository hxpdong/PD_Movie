<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\User;

class PDMV_APICheckTokenMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
    {
        $authorizationHeader = $request->header('Authorization');
        if (strpos($authorizationHeader, 'Bearer ') === 0) {
            $token = substr($authorizationHeader, 7);
        } else {
            $token = $authorizationHeader;
        }

        $accid = $request->route('accid'); // Lấy giá trị accid từ route

        $user = User::where('id', $accid)
                ->whereNotNull('api_token')
                ->first();

        if ($user && $token === $user->api_token) {
            return $next($request); // Tiếp tục xử lý yêu cầu nếu token hợp lệ
        }

        return response()->json([
            'success' => false,
            'message' => 'You donnot have this permission'
        ], 401); // Trả về lỗi 401 nếu token không hợp lệ
    }
}
