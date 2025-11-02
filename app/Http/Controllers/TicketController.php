<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    public function index()
{
    $query = DB::table('tickets')
    ->leftJoin('branches as b', 'tickets.user_id', '=', 'b.id') // ✅ user_id now points to branch id
    ->leftJoin('users as solvers', 'tickets.solved_by', '=', 'solvers.id')
    ->leftJoin('priorities', 'tickets.priority_id', '=', 'priorities.id')
    ->leftJoin('categories', 'tickets.category_id', '=', 'categories.id')
    ->select(
        'tickets.*',
        'b.name as br_name', //branch name
        'solvers.name as solved_by_name',
        'priorities.name as priority_name',
        'categories.name as category_name'
    )
    ->orderBy('tickets.created_at', 'desc');

        // Normal users: show only their branch tickets
        if (auth()->user()->role != 1) {
        $query->where('tickets.user_id', auth()->user()->branch_id);
    }

        $tickets = $query->get();

        return view('tickets.index', compact('tickets'));
    }


   public function create(Request $request)
    {
        $branches = DB::table('branches')->select('id', 'name')->get();
        $priorities = DB::table('priorities')->select('id', 'name')->get();
        $categories = DB::table('categories')->select('id', 'name')->get();

        $selectedCategory = $request->category; // get category from query string

        return view('tickets.create', compact('branches', 'priorities', 'categories', 'selectedCategory'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'subject' => 'required|string|max:255',
            'description' => 'required|string',
            'contact_person' => 'nullable|string|max:255',
            'attachment' => 'nullable|file|mimes:jpg,jpeg,png,pdf,doc,docx,xlsx|max:2048',
            'priority_id' => 'nullable|exists:priorities,id',
            'category_id' => 'nullable|exists:categories,id',
            'branch_id' => 'nullable|integer|exists:branches,id',
        ]);

        $filePath = null;
        if ($request->hasFile('attachment')) {
            $filePath = $request->file('attachment')->store('tickets', 'public');
        }

    if (auth()->user()->role === 1) {
        $user = DB::table('users')
            ->where('branch_id', $request->branch_id)
            ->first();

        if (!$user) {
            return back()->with('error', 'No user found in the selected branch.');
        }

        DB::table('tickets')->insert([
            'user_id' => $request->branch_id,
            'subject' => $request->subject,
            'description' => $request->description,
            'contact_person' => $request->contact_person,
            'attachment' => $filePath ?? null,
            'priority_id' => $request->priority_id,
            'category_id' => $request->category_id,
            'status' => 0,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    } else {
            DB::table('tickets')->insert([
                
                'user_id' => auth()->user()->branch_id,
                'subject' => $request->subject,
                'description' => $request->description,
                'contact_person' => $request->contact_person,
                'attachment' => $filePath,
                'priority_id' => $request->priority_id,
                'category_id' => $request->category_id,
                'status' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        return redirect()->route('tickets.index')->with('success', 'Ticket created successfully.');
    }

    public function show($id)
    {
        $ticket = DB::table('tickets')->where('id', $id)->first();
        return view('tickets.show', compact('ticket'));
    }

    public function update(Request $request, $id)
    {
        if (auth()->user()->role !== 1) {
            abort(403);
        }

        DB::table('tickets')->where('id', $id)->update([
            'solved_by' => auth()->id(),
            'status' => $request->status,
            'updated_at' => now(),
        ]);

        return redirect()->route('tickets.index');
    }
}
