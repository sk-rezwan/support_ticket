<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

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
            'email' => 'required|email',
            'password' => 'required'
        ]);

        // Attempt login
        $credentials = $request->only('email', 'password');
        

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            // Check role
            if ($user->role === 'admin') {
                session()->flash('success', 'Welcome, Admin!');
                return redirect('/tickets'); // or ->route('tickets.index')
            } elseif ($user->role === 'branch') {
                session()->flash('success', 'Welcome, Branch user!');
                return redirect('/tickets'); // or with bm view
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
