<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $users = [[
            'id' => 1,
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'email_verified_at' => null,
            'password' => Hash::make('password'),
            'remember_token' => null,
            'role' => 'admin',
            'branch_id' => null,
            'created_at' => now(),
            'updated_at' => now(),
        ],
        [
            'id' => 2,
            'name' => 'Branch One',
            'email' => 'branch1@example.com',
            'email_verified_at' => null,
            'password' => Hash::make('password'),
            'remember_token' => null,
            'role' => 'branch',
            'branch_id' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ],
        [
            'id' => 3,
            'name' => 'Branch Two',
            'email' => 'branch2@example.com',
            'email_verified_at' => null,
            'password' => Hash::make('password'),
            'remember_token' => null,
            'role' => 'branch',
            'branch_id' => 2,
            'created_at' => now(),
            'updated_at' => now(),
        ],
        [
            'id' => 4,
            'name' => 'Admin User',
            'email' => 'rezwanul@cdipbd.org',
            'email_verified_at' => null,
            'password' => Hash::make('password'),
            'remember_token' => null,
            'role' => 'admin',
            'branch_id' => null,
            'created_at' => now(),
            'updated_at' => now(),
        ],
        [
            'id' => 6,
            'name' => 'Admin User',
            'email' => 'admin@mail.com',
            'email_verified_at' => null,
            'password' => Hash::make('password'),
            'remember_token' => null,
            'role' => 'admin',
            'branch_id' => null,
            'created_at' => now(),
            'updated_at' => now(),
        ],
    ];

        DB::table('users')->insert($users);
    }
}