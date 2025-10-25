<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    protected $redirectTo = '/tickets';

    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        // Validate input
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required'
        ]);

        // Find user by email
        $user = DB::table('users')->where('email', $request->email)->first();

        // Check if user exists and password matches (MD5 comparison)
        if ($user && $user->password === md5($request->password)) {
            // Log user in manually
            Auth::loginUsingId($user->id);

            // Role-based redirection
            if ($user->role == 1) { // Admin
                session()->flash('success', 'Welcome, Admin!');
                return redirect('/tickets');
            } elseif ($user->role == 2) { // Engineer
                session()->flash('success', 'Welcome, Engineer!');
                return redirect('/tickets');
            } elseif ($user->role == 3) { // Branch
                session()->flash('success', 'Welcome, Branch user!');
                return redirect('/tickets');
            } else {
                Auth::logout();
                return back()->withErrors(['email' => 'Unauthorized role.']);
            }
        }

        // Invalid credentials
        return back()->withErrors(['email' => 'Invalid email or password.']);
    }

    public function logout()
    {
        Auth::logout();
        return redirect('/login')->with('success', 'Logged out successfully.');
    }
}