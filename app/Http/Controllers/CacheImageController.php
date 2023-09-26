<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class CacheImageController extends Controller
{
    public function showDetail($mid)
    {
        // Gọi stored procedure để lấy thông tin chi tiết phim
        $results = DB::select("CALL movie_showdetail(?)", [$mid]);

        if (empty($results)) {
            abort(404);
        }

        // Lấy thông tin đầu tiên trong kết quả (giả sử chỉ có một bộ phim)
        $movie = $results[0];

        // Lấy URL của poster từ kết quả
        $imageUrl = $movie->posterURL;
        $cacheKey = 'movie_poster_' . $mid;

        return Cache::remember($cacheKey, Carbon::now()->addHours(4), function () use ($imageUrl) {
            // Sử dụng Guzzle để lấy hình ảnh từ URL
            $response = Http::get($imageUrl);

            // Kiểm tra nếu yêu cầu thành công
            if ($response->successful()) {
                // Lấy dữ liệu nhị phân của hình ảnh
                $imageData = $response->body();

                // Xác định định dạng hình ảnh dựa trên đuôi mở rộng của URL
                $extension = pathinfo(parse_url($imageUrl, PHP_URL_PATH), PATHINFO_EXTENSION);

                // Thiết lập Content-Type phù hợp
                $contentType = 'image/jpeg'; // Mặc định là JPEG

                if ($extension === 'png') {
                    $contentType = 'image/png';
                }

                // Lưu hình ảnh vào cache và trả về nó với Content-Type đúng
                return response($imageData, 200)->header('Content-Type', $contentType);
            } else {
                // Xử lý lỗi nếu cần
                abort(404);
            }
        });
    }
}
