<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
}
