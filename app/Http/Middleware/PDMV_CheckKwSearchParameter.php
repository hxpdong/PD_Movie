<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class PDMV_CheckKwSearchParameter
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
    // Kiểm tra xem tham số 'kwsearch' có tồn tại trong URL không
    if ($request->has('kwsearch')) {
        // Nếu có, thực hiện chuyển hướng đến URL mới
        return redirect('/movies?kwsearch=' . $request->input('kwsearch'));
    }

    return $next($request);
    }
}
