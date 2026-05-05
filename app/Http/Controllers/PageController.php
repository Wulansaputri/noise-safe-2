<?php

namespace App\Http\Controllers;

use App\Models\WaitingList;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function index()
    {
        $totalWaitingList = WaitingList::count();
        return view('pages.index', compact('totalWaitingList'));
    }
}