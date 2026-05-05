<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ServiceLog;
use App\Models\Device;

class ServiceLogController extends Controller
{
    public function index()
    {
        $logs = ServiceLog::orderBy('service_id', 'desc')->get();
        $devices = Device::all()->keyBy('device_id');
        return view('admin.service_logs.index', compact('logs', 'devices'));
    }

    public function create()
    {
        $devices = Device::all();
        $admin = session('admin');
        return view('admin.service_logs.create', compact('devices', 'admin'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'device_id'      => 'required|integer',
            'is_warranty'    => 'required|boolean',
            'service_status' => 'required|in:pending,in_progress,done',
            'date'           => 'required|date',
            'description'    => 'required|string',
        ]);

        ServiceLog::create([
            'device_id'      => $request->device_id,
            'admin_id'       => session('admin')->admin_id,
            'is_warranty'    => $request->is_warranty,
            'service_status' => $request->service_status,
            'date'           => $request->date,
            'description'    => $request->description,
            'created_at'     => now(),
        ]);

        return redirect()->route('service_logs.index')
            ->with('success', 'Log servis berhasil ditambahkan!');
    }

    public function show($id)
    {
        $log = ServiceLog::findOrFail($id);
        $device = Device::find($log->device_id);
        $parent = \DB::table('parents')->where('user_id', $device->user_id ?? 0)->first();
        return view('admin.service_logs.show', compact('log', 'device', 'parent'));
    }

    public function edit($id)
    {
        $log = ServiceLog::findOrFail($id);
        $devices = Device::all();
        return view('admin.service_logs.edit', compact('log', 'devices'));
    }

    public function update(Request $request, $id)
    {
        $log = ServiceLog::findOrFail($id);

        $request->validate([
            'service_status' => 'required|in:pending,in_progress,done',
            'description'    => 'required|string',
            'is_warranty'    => 'required|boolean',
        ]);

        $log->update([
            'service_status' => $request->service_status,
            'description'    => $request->description,
            'is_warranty'    => $request->is_warranty,
        ]);

        return redirect()->route('service_logs.index')
            ->with('success', 'Log servis berhasil diupdate!');
    }

    public function destroy($id)
    {
        ServiceLog::destroy($id);
        return redirect()->route('service_logs.index')
            ->with('success', 'Log servis berhasil dihapus!');
    }
}