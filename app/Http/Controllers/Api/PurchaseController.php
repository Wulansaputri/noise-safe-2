<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\Device;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    // Semua transaksi milik user yang login
    public function index(Request $request)
    {
        $purchases = DB::table('purchase')
            ->where('user_id', $request->user()->user_id)
            ->orderBy('purchase_id', 'desc')
            ->get();
        return response()->json($purchases);
    }

    // Detail transaksi
    public function show($id)
    {
        $purchase = DB::table('purchase')->where('purchase_id', $id)->first();
        if (!$purchase) {
            return response()->json(['message' => 'Transaksi tidak ditemukan!'], 404);
        }
        $device = Device::find($purchase->device_id);
        return response()->json([
            'purchase' => $purchase,
            'device'   => $device,
        ]);
    }
}