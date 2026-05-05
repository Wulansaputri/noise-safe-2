<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Admin;
use App\Models\Device;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;


class AuthController extends Controller
{
    public function showLogin()
    {
        return view('admin.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'name'     => 'required',
            'password' => 'required',
        ]);

        $admin = Admin::where('name', $request->name)->first();

        if ($admin && Hash::check($request->password, $admin->password)) {
            session(['admin' => $admin]);
            return redirect()->route('dashboard');
        }

        return back()->with('error', 'Nama atau password salah!');
    }

    public function dashboard()
    {
        $totalDevices  = Device::count();
        $totalParents  = DB::table('parents')->count();
        $totalPurchase = DB::table('purchase')->count();
        $totalServis   = DB::table('service_log')->where('service_status', '!=', 'done')->count();

        $parents = DB::table('parents')->pluck('name', 'user_id');
        $devices = Device::all()->keyBy('device_id');

        $latestDevices = Device::where('registered_at', '>=', now()->subDays(1))
            ->orderBy('device_id', 'desc')
            ->take(5)
            ->get();

        $latestPurchases = DB::table('purchase')
            ->where('created_at', '>=', now()->subDays(1))
            ->orderBy('purchase_id', 'desc')
            ->take(5)
            ->get();

        return view('admin.dashboard', compact(
            'totalDevices',
            'totalParents',
            'totalPurchase',
            'totalServis',
            'parents',
            'devices',
            'latestDevices',
            'latestPurchases'
        ));
    }

    public function logout()
    {
        session()->forget('admin');
        return redirect()->route('login');
    }
}