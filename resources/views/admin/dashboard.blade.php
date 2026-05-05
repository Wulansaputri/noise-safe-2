@extends('admin.layouts.app')

@section('title', 'Dashboard — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>Dashboard</h2>
        <p>Selamat datang kembali, {{ session('admin')->name }}! 👋</p>
    </div>
    <div class="date-badge">📅 {{ now()->translatedFormat('d F Y') }}</div>
</div>

<!-- Stat Cards -->
<div style="display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:24px">
    <div class="card" style="border-top:3px solid #8DBED7">
        <div style="width:42px;height:42px;border-radius:10px;background:#e8f4fb;display:flex;align-items:center;justify-content:center;font-size:20px;margin-bottom:12px">🎧</div>
        <div style="font-family:'Madimi One',sans-serif;font-size:28px;color:#2d4a5a">{{ $totalDevices }}</div>
        <div style="font-size:12px;color:#888;margin-top:2px">Total Perangkat</div>
        <div style="font-size:11px;margin-top:8px;font-weight:600;color:#C8D96E">↑ Data dari tabel devices</div>
    </div>
    <div class="card" style="border-top:3px solid #F4A7D0">
        <div style="width:42px;height:42px;border-radius:10px;background:#fce9f3;display:flex;align-items:center;justify-content:center;font-size:20px;margin-bottom:12px">👥</div>
        <div style="font-family:'Madimi One',sans-serif;font-size:28px;color:#2d4a5a">{{ $totalParents }}</div>
        <div style="font-size:12px;color:#888;margin-top:2px">Total User</div>
        <div style="font-size:11px;margin-top:8px;font-weight:600;color:#C8D96E">↑ Data dari tabel parents</div>
    </div>
    <div class="card" style="border-top:3px solid #C8D96E">
        <div style="width:42px;height:42px;border-radius:10px;background:#f3f8e4;display:flex;align-items:center;justify-content:center;font-size:20px;margin-bottom:12px">💰</div>
        <div style="font-family:'Madimi One',sans-serif;font-size:28px;color:#2d4a5a">{{ $totalPurchase }}</div>
        <div style="font-size:12px;color:#888;margin-top:2px">Total Penjualan</div>
        <div style="font-size:11px;margin-top:8px;font-weight:600;color:#C8D96E">↑ Data dari tabel purchase</div>
    </div>
    <div class="card" style="border-top:3px solid #F4A7D0">
        <div style="width:42px;height:42px;border-radius:10px;background:#fce9f3;display:flex;align-items:center;justify-content:center;font-size:20px;margin-bottom:12px">🔧</div>
        <div style="font-family:'Madimi One',sans-serif;font-size:28px;color:#2d4a5a">{{ $totalServis }}</div>
        <div style="font-size:12px;color:#888;margin-top:2px">Servis Aktif</div>
        <div style="font-size:11px;margin-top:8px;font-weight:600;color:#F4A7D0">↓ Data dari tabel service_log</div>
    </div>
</div>

<!-- Recent Data -->
<div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">

    <!-- Perangkat Terbaru -->
    <div class="card">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px">
            <div style="font-family:'Madimi One',sans-serif;font-size:14px;color:#2d4a5a">🎧 Perangkat Terbaru</div>
            <a href="{{ route('devices.index') }}" style="font-size:12px;color:#8DBED7;font-weight:600;text-decoration:none">Lihat Semua</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Serial</th>
                    <th>User</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                @forelse($latestDevices as $device)
                <tr>
                    <td><strong>{{ $device->serial_number }}</strong></td>
                    <td>{{ $parents[$device->user_id] ?? '-' }}</td>
                    <td>
                        @if($device->status == 'active')
                            <span class="badge badge-paid">✅ Aktif</span>
                        @else
                            <span class="badge badge-inactive">❌ Tidak Aktif</span>
                        @endif
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="3" style="text-align:center;color:#bbb;padding:20px">Belum ada data</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <!-- Transaksi Terbaru -->
    <div class="card">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px">
            <div style="font-family:'Madimi One',sans-serif;font-size:14px;color:#2d4a5a">💰 Transaksi Terbaru</div>
            <a href="{{ route('purchases.index') }}" style="font-size:12px;color:#8DBED7;font-weight:600;text-decoration:none">Lihat Semua</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Invoice</th>
                    <th>Pembeli</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                @forelse($latestPurchases as $purchase)
                <tr>
                    <td><strong>#{{ $purchase->purchase_id }}</strong></td>
                    <td>{{ $parents[$purchase->user_id] ?? '-' }}</td>
                    <td>
                        @if($purchase->transaction_status == 'paid')
                            <span class="badge badge-paid">✅ Paid</span>
                        @elseif($purchase->transaction_status == 'pending')
                            <span class="badge badge-pending">⏳ Pending</span>
                        @else
                            <span class="badge badge-inactive">❌ Cancelled</span>
                        @endif
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="3" style="text-align:center;color:#bbb;padding:20px">Belum ada data</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

</div>

@endsection