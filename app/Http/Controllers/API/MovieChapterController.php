<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MovieChapterController extends Controller
{
    //
    public function update($ctid, Request $request){
        try{
            $name = $request->uptchaptername;
            $url = $request->uptURL;
            $uptdChapter = DB::select("CALL mvchapter_update(?,?,?);", array($ctid,$name, $url));
            if($uptdChapter){
                return response()->json([
                    'success' => true,
                    'message' => 'Cập nhật thành công',
                    'chapter' => $uptdChapter
                ]);
            }else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy tập phim'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        } 
    }

    public function drop($ctid){
        try{
            $rs = DB::select("CALL mvchapter_drop(?);", array($ctid));
            if($rs){
                return response()->json([
                    'success' => true,
                    'message' => 'Xóa thành công',
                    'deletedId' => $ctid[0] 
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy tập phim'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function insert(Request $request){
        try{
            $request->validate([
                'mvid' => ['required',],
                'chaptername' => ['required',],
                'chapterurl' => ['required',]
            ], [
                'mvid.required' => 'Id phim là bắt buộc.',
                'chaptername.required' => 'Tên tập phim là bắt buộc.',
                'chapterurl.required' => 'Đường dẫn là bắt buộc.',
            ]);

            $mvid = $request->mvid;
            $chaptername = $request->chaptername;
            $chapterurl = $request->chapterurl;
            $newChap = DB::select("CALL mvchapter_add(?,?,?);", array($mvid, $chaptername, $chapterurl));
            if($newChap){
                return response()->json([
                    'success' => true,
                    'message' => 'Thêm tập phim thành công',
                    'chapter' => $newChap
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Phim này không tồn tại trong cơ sở dữ liệu'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        }
    }
}
