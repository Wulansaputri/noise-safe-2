<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DeviceController extends Controller
{
    public function connect(Request $request)
    {
        $request->validate([
            'serial_number' => 'required',
            'owner_name' => 'required',
        ]);

        $user = $request->user();

        $device = DB::table('devices')
            ->where('serial_number', $request->serial_number)
            ->first();

        if (!$device) {
            return response()->json([
                'message' => 'Device tidak ditemukan'
            ], 404);
        }

        if ($device->user_id != null) {
            return response()->json([
                'message' => 'Device sudah digunakan'
            ], 400);
        }

        DB::table('devices')
            ->where('device_id', $device->device_id)
            ->update([
                'user_id' => $user->user_id,
                'owner_name' => $request->owner_name,
            ]);

        return response()->json([
            'message' => 'Device berhasil terhubung'
        ]);
    }
}
