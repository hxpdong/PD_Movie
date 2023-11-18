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
                    'message' => 'Update successful',
                    'chapter' => $uptdChapter
                ]);
            }else {
                return response()->json([
                    'success' => false,
                    'message' => 'Chapter not found'
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
                    'message' => 'Delete successfully',
                    'deletedId' => $ctid[0] 
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Chapter not found'
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
                'mvid.required' => 'Movie id is required.',
                'chaptername.required' => 'Chapter name is required.',
                'chapterurl.required' => 'Source is required.',
            ]);

            $mvid = $request->mvid;
            $chaptername = $request->chaptername;
            $chapterurl = $request->chapterurl;
            $newChap = DB::select("CALL mvchapter_add(?,?,?);", array($mvid, $chaptername, $chapterurl));
            if($newChap){
                return response()->json([
                    'success' => true,
                    'message' => 'Add successful chapter',
                    'chapter' => $newChap
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'This movie does not exist in the database'
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
