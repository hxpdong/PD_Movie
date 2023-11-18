<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RatingController extends Controller
{
    public function exportCSV()
    {
        // Thực hiện stored procedure và lấy kết quả
        $results = DB::select('CALL rating_export_csv_test()');

        // Chuyển đối tượng stdClass thành mảng
        $data = array_map(function($result) {
            return (array) $result;
        }, $results);

        // Tên cột của file CSV
        $headers = array(
            'Content-Type' => 'text/csv',
            'Content-Disposition' => 'attachment; filename="ratings_export.csv"',
            'Pragma' => 'no-cache',
            'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
            'Expires' => '0',
        );

        // Tạo file CSV và ghi dữ liệu vào đó
        $callback = function () use ($data) {
            $file = fopen('php://output', 'w');

            // Ghi tên cột
            //fputcsv($file, array_keys($data[0]));

            // Ghi dữ liệu
            foreach ($data as $row) {
                fputcsv($file, $row);
            }

            fclose($file);
        };

        // Trả về response với file CSV
        return response()->stream($callback, 200, $headers);
    }

    public function importCSV(Request $request){
        // Kiểm tra xem có file đã được gửi lên hay không
        if ($request->hasFile('file')) {
            // Lấy đối tượng UploadedFile từ request
            $file = $request->file('file');

            // Tạo một tên tệp tin duy nhất
            $fileName = uniqid() . '_' . $file->getClientOriginalName();

            // Lưu tệp tin vào thư mục storage/app
            $file->storeAs('public', 'ratings.csv', 'local');

            // Thực hiện các công việc khác nếu cần thiết

            // Trả về thông báo thành công hoặc chuyển hướng đến trang khác
            return response()->json([
                'success' => true
            ]);
        }

        // Trả về thông báo nếu không có file nào được gửi lên
        return response()->json([
            'success' => false
        ]);
    }
    public function getAllRating(){
        $results = DB::select("select * from pdmv_ratings");
        if($results) {
            return response()->json([
                'success' => true,
                'items' => $results
            ]);
        }
        return response()->json([
            'success' => false
        ]);
    }
}
