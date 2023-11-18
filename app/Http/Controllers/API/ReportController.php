<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ReportController extends Controller
{
    //
    public function errorGetAll(){
        try{
            $results = DB::select("CALL error_getAll();");
            if ($results) {
                $errorList = $results;
                $totals = count($errorList);

                $unsolvedCount = 0;
                foreach ($errorList as $error) {
                    $error->createAt = Carbon::parse($error->createAt)->format('H:i:s d/m/Y');
                    $error->updateAt = Carbon::parse($error->updateAt)->format('H:i:s d/m/Y');
                    if ($error->isSolved === 0) {
                        $unsolvedCount++;
                    }
                }
    
                return response()->json([
                    'success' => true,
                    'errorList' => $results,
                    'unsolvedCount' => $unsolvedCount,
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'unsolvedCount' => 0
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        } 
    }

    public function errorSolve($errid){
        try {
            $results = DB::select("CALL error_solve(?);", array($errid));
            if($results){
                return response()->json([
                    'success' => true,
                    'updatedItem' => $results
                ]);
            } else {
                return response()->json([
                    'success' => false,
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        } 
    }

    public function reportGetAll(){
        try{
            $results = DB::select("CALL report_getAll();");
            if ($results) {
                $reportList = $results;
                $totals = count($reportList);

                $unsolvedCount = 0;
                foreach ($reportList as $report) {
                    $report->createAt = Carbon::parse($report->createAt)->format('H:i:s d/m/Y');
                    $report->updateAt = Carbon::parse($report->updateAt)->format('H:i:s d/m/Y');
                    if ($report->isSolved === 0) {
                        $unsolvedCount++;
                    }
                }
    
                return response()->json([
                    'success' => true,
                    'reportList' => $results,
                    'unsolvedCount' => $unsolvedCount,
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'unsolvedCount' => 0
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        } 
    }

    public function reportSolve($rpid){
        try {
            $results = DB::select("CALL report_solve(?);", array($rpid));
            if($results){
                return response()->json([
                    'success' => true,
                    'updatedItem' => $results
                ]);
            } else {
                return response()->json([
                    'success' => false,
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        } 
    }

    public function commentDrop($cmtid){
        try {
            $cmt = DB::select("CALL comment_get(?)", array($cmtid));
            if($cmt){
                DB::statement('CALL comment_drop(?)', [$cmtid]);
                return response()->json([
                    'success' => true
                ]);
            } else {
                return response()->json([
                    'success' => false
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function errorDropBefore(Request $request){
        try {
            $beforeDate = $request->input('beforeDate');
            $date = Carbon::createFromFormat('Y-m-d', $beforeDate);
            $results = DB::select("CALL error_drop(?);", array($date));
            if($results){
                return response()->json([
                    'success' => true,
                    'message' => 'Success'
                ]);
            } else {
                return response()->json([
                    'success' => false,
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                "success" => false,
                "error:" => $e->getMessage(),
            ]);
        }
    }

    public function reportDropBefore(Request $request){
        try {
            $beforeDate = $request->input('beforeDate');
            $date = Carbon::createFromFormat('Y-m-d', $beforeDate);
            $results = DB::select("CALL report_drop(?);", array($date));
            if($results){
                return response()->json([
                    'success' => true,
                    'message' => 'Success'
                ]);
            } else {
                return response()->json([
                    'success' => false,
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