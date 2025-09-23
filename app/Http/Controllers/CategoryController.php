<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class CategoryController extends Controller
{
    // Show all categories
    public function index()
    {
        $categories = DB::table('categories')->orderBy('category_id', 'ASC')->get();
        return view('config.categories', compact('categories'));
    }

    // Store new category
    public function store(Request $request)
    {
        DB::table('categories')->insert([
            'category_name' => $request->category_name,
            'status' => $request->status ?? 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return redirect()->route('categories.index')->with('success', 'Category added successfully!');
    }

    // Update category (example: toggle status)
    public function update(Request $request, $id)
    {
        DB::table('categories')
            ->where('category_id', $id)
            ->update([
                'category_name' => $request->category_name,
                'status' => $request->status,
                'updated_at' => now(),
            ]);

        return redirect()->route('categories.index')->with('success', 'Category updated successfully!');
    }

    // Delete category
    public function destroy($id)
    {
        DB::table('categories')->where('category_id', $id)->delete();
        return redirect()->route('categories.index')->with('success', 'Category deleted successfully!');
    }
}
