<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    public function index_old()
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

    public function index()
            {
                if (auth()->user()->role === 'admin') {

                    $tickets = DB::table('tickets')
                        ->join('users', 'tickets.user_id', '=', 'users.id') // ticket created by
                        ->join('branches as b', 'users.branch_id', '=', 'b.id')
                        ->leftJoin('users as solvers', 'tickets.solved_by', '=', 'solvers.id') // who solved it
                        ->select(
                            'tickets.*',
                            'users.name as user_name',
                            'b.name as br_name',
                            'solvers.name as solved_by_name'
                        )
                        ->get();

                } else {

                        $tickets = DB::table('tickets')
                            ->join('users', 'tickets.user_id', '=', 'users.id') // ticket created by
                            ->join('branches as b', 'users.branch_id', '=', 'b.id')
                            ->leftJoin('users as solvers', 'tickets.solved_by', '=', 'solvers.id') // who solved it
                            ->select(
                                'tickets.*',
                                'users.name as user_name',
                                'b.name as br_name',
                                'solvers.name as solved_by_name'
                            )
                            ->where('tickets.user_id', auth()->id())
                            ->get();

                    }

                    return view('tickets.index', compact('tickets'));
                }

    public function create()
    {
         $branches = DB::table('branches')->select('id', 'name')->get();
        return view('tickets.create', compact('branches'));
        
    }

    public function store(Request $request)
    {
       if (auth()->user()->role === 'admin') {
        // Get first user in selected branch
        $user = DB::table('users')
            ->where('branch_id', $request->branch_id)
            ->first();

        if (!$user) {
            return back()->with('error', 'No user found in the selected branch.');
        }

        DB::table('tickets')->insert([
            'user_id' => $user->id, //Insert selected branch's user_id
            'subject' => $request->subject,
            'description' => $request->description,
            'status' => 0,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
       }else{
            DB::table('tickets')->insert([
                'user_id' => auth()->id(), //own user id
                'subject' => $request->subject,
                'description' => $request->description,
                'status' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
       }
        

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
