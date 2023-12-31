<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\User;

class PDMV_APICheckAdminRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
    {
        $accid = $request->route('accid'); // Lấy giá trị accid từ route

        $user = User::where('id', $accid)
                ->whereNotNull('api_token')
                ->first();
        if($user->acctype_id === 1 || $user->acctype_id === 2){
            return $next($request);
        }
        return response()->json([
            'success' => false,
            'message' => 'You donnot have this permission'
        ], 401); 
    }
}
