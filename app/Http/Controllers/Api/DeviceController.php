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

    public function index(Request $request)
    {
        $user = $request->user();

        $devices = DB::table('devices')
            ->where('user_id', $user->user_id)
            ->get();

        return response()->json([
        'devices' => $devices->map(function ($device) {

            return [

                'device_id' => $device->device_id,

                'owner_name' => $device->owner_name,

                'serial_number' => $device->serial_number,

                'battery' => '100%',

                'location' => 'Unknown',

                'is_active' => $device->status === 'active',
                ];
            }),
        ]);
    
    }

    public function delete($id)
    {
        $device = DB::table('devices')
            ->where('device_id', $id)
            ->first();

        if (!$device) {
            return response()->json([
                'message' => 'Device tidak ditemukan'
            ], 404);
        }

        DB::table('devices')
            ->where('device_id', $id)
            ->delete();

        return response()->json([
            'message' => 'Device berhasil dihapus'
        ]);
    }
}
