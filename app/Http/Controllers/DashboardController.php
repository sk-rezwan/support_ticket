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

    public function subCategories($id)
    {
        // Get parent category
        $category = DB::table('categories')->where('id', $id)->first();
        if (!$category) {
            abort(404);
        }

        // Get all subcategories under this category
        $subCategories = DB::table('sub_categories')
            ->where('category_id', $id)
            ->orderBy('name')
            ->get();

        return view('dashboard.subcategories', compact('category', 'subCategories'));
    }
}
