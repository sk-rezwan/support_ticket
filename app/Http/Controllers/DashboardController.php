<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        // Load categories dynamically from DB
        $categories = DB::table('categories')->select('id', 'name')->get();
        return view('dashboard.index', compact('categories'));
    }
}
