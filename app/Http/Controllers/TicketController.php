<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    public function index()
    {
        if (auth()->user()->role === 'admin') {

            $tickets = DB::table('tickets')
                ->join('users', 'tickets.user_id', '=', 'users.id') // ticket created by
                ->join('branches as b', 'users.branch_id', '=', 'b.id')
                ->leftJoin('users as solvers', 'tickets.solved_by', '=', 'solvers.id') // who solved it
                ->select(   'tickets.*',
                            'users.name as user_name',
                            'b.name as br_name',
                            'solvers.name as solved_by_name'
                        )
                ->get();
        } else {
            $tickets = DB::table('tickets')->where('user_id', auth()->id())->get();
        }

        return view('tickets.index', compact('tickets'));
    }

    public function create()
    {
        return view('tickets.create');
    }

    public function store(Request $request)
    {
        DB::table('tickets')->insert([
            'user_id' => auth()->id(),
            'subject' => $request->subject,
            'description' => $request->description,
            'status' => 0,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return redirect()->route('tickets.index');
    }

    public function show($id)
    {
        $ticket = DB::table('tickets')->where('id', $id)->first();
        return view('tickets.show', compact('ticket'));
    }

    public function update(Request $request, $id)
    {
        if (auth()->user()->role !== 'admin') {
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
