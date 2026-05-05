<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Device;

class DeviceController extends Controller
{
    public function index()
{
    $devices = \App\Models\Device::all();
    $parents = \DB::table('parents')->pluck('name', 'user_id');
    return view('admin.devices.index', compact('devices', 'parents'));
}

    public function create()
    {
        return view('admin.devices.create');
    }

    public function store(Request $request)
{
    $request->validate([
        'serial_number' => 'required|unique:devices,serial_number',
        'user_id'       => 'required|integer',
        'status'        => 'required|in:active,inactive',
    ]);

    $parent = \DB::table('parents')->where('user_id', $request->user_id)->first();

    Device::create(array_merge($request->all(), [
        'owner_name' => $parent ? $parent->name : '-',
    ]));

    return redirect()->route('devices.index')
        ->with('success', 'Perangkat berhasil ditambahkan!');
}

    public function show($id)
    {
        $device = Device::findOrFail($id);
        return view('admin.devices.show', compact('device'));
    }

    public function edit($id)
    {
        $device = Device::findOrFail($id);
        return view('admin.devices.edit', compact('device'));
    }

    public function update(Request $request, $id)
{
    $device = Device::findOrFail($id);

    $request->validate([
        'status'  => 'required|in:active,inactive',
        'garansi' => 'nullable|integer',
    ]);

    $device->update([
        'status'  => $request->status,
        'garansi' => $request->garansi,
    ]);

    return redirect()->route('devices.index')
        ->with('success', 'Perangkat berhasil diupdate!');
}

    public function destroy($id)
    {
        Device::destroy($id);
        return redirect()->route('devices.index');
    }
}
