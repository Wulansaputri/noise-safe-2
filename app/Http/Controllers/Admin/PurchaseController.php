<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\Device;

class PurchaseController extends Controller
{
    public function index()
    {
        $parents = \DB::table('parents')->pluck('name', 'user_id');
        $devices = Device::all()->keyBy('device_id');
        $purchases = Purchase::orderBy('purchase_id', 'desc')->get();
        return view('admin.purchases.index', compact('purchases', 'parents', 'devices'));
    }

    public function create()
    {
        $parents = \DB::table('parents')->get();
        return view('admin.purchases.create', compact('parents'));
    }

    public function store(Request $request)
    {
        $request->validate([
    'user_id'          => 'required|integer',
    'serial_number'    => 'required|unique:devices,serial_number',
    'transaction_date' => 'required|date',
    'garansi'          => 'required|integer',
]);

        $parent = \DB::table('parents')->where('user_id', $request->user_id)->first();

        // Buat device dulu
        $device = Device::create([
            'user_id'       => $request->user_id,
            'owner_name'    => $parent ? $parent->name : '-',
            'serial_number' => $request->serial_number,
            'status'        => 'active',
            'purchase_date' => $request->transaction_date,
            'garansi'       => $request->garansi,
            'registered_at' => now(),
        ]);

        // Baru buat purchase
        Purchase::create([
    'device_id'          => $device->device_id,
    'user_id'            => $request->user_id,
    'transaction_date'   => $request->transaction_date,
    'transaction_status' => 'pending',
    'created_at'         => now(),
]);

        return redirect()->route('purchases.index')
            ->with('success', 'Transaksi & perangkat berhasil ditambahkan!');
    }

    public function show($id)
    {
        $purchase = Purchase::findOrFail($id);
        $parent = \DB::table('parents')->where('user_id', $purchase->user_id)->first();
        $device = Device::find($purchase->device_id);
        return view('admin.purchases.show', compact('purchase', 'parent', 'device'));
    }

    public function edit($id)
    {
        $purchase = Purchase::findOrFail($id);
        $parents = \DB::table('parents')->get();
        $devices = Device::all();
        return view('admin.purchases.edit', compact('purchase', 'parents', 'devices'));
    }

    public function update(Request $request, $id)
    {
        $purchase = Purchase::findOrFail($id);

        $request->validate([
            'transaction_date'   => 'required|date',
            'transaction_status' => 'required|in:pending,paid,cancelled',
        ]);

        $purchase->update([
            'transaction_date'   => $request->transaction_date,
            'transaction_status' => $request->transaction_status,
        ]);

        return redirect()->route('purchases.index')
            ->with('success', 'Transaksi berhasil diupdate!');
    }

    public function destroy($id)
    {
        Purchase::destroy($id);
        return redirect()->route('purchases.index')
            ->with('success', 'Transaksi berhasil dihapus!');
    }

    public function markAsPaid($id)
{
    $purchase = Purchase::findOrFail($id);

    $purchase->update([
        'transaction_status' => 'paid'
    ]);

    return redirect()->route('purchases.index')
        ->with('success', 'Transaksi berhasil ditandai lunas!');
}
}