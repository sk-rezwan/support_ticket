<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReportsController extends Controller
{
    public function branchReport(Request $request)
    {
        $tickets = [];

        if ($request->filled(['from_date', 'to_date'])) {
            $tickets = DB::table('tickets')
                ->join('users', 'tickets.user_id', '=', 'users.id')
                ->join('branches', 'users.branch_id', '=', 'branches.id')
                ->select('tickets.*', 'branches.name as branch_name')
                ->whereBetween('tickets.created_at', [$request->from_date, $request->to_date])
                ->orderBy('tickets.created_at', 'desc')
                ->get();
        }

        return view('reports.branch', compact('tickets'));
    }
}
