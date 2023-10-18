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
}
