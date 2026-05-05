<?php

namespace App\Http\Controllers;

use App\Models\WaitingList;
use Illuminate\Http\Request;

class WaitingListController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:waiting_list,email',
            'phone' => 'required|string|max:20',
            'package' => 'required|in:starter,complete'
        ], [
            'email.unique' => 'Email ini sudah terdaftar di waiting list kami!'
        ]);

        WaitingList::create($validated);

        return redirect()->back()->with('success', 'Terima kasih! Anda telah terdaftar di waiting list Noise Safe. Tim kami akan segera menghubungi Anda.');
    }
}