<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ParentSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('parents')->insert([
            [
                'name'      => 'Budi Santoso',
                'email'     => 'budi@email.com',
                'phone'     => 81234567890,
                'password'  => Hash::make('password123'),
                'create_at' => now(),
            ],
            [
                'name'      => 'Siti Rahayu',
                'email'     => 'siti@email.com',
                'phone'     => 82345678901,
                'password'  => Hash::make('password123'),
                'create_at' => now(),
            ],
            [
                'name'      => 'Hani Putri',
                'email'     => 'hani@email.com',
                'phone'     => 83456789012,
                'password'  => Hash::make('password123'),
                'create_at' => now(),
            ],
        ]);
    }
}