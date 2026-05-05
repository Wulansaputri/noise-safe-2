@extends('admin.layouts.app')

@section('title', 'Detail Transaksi — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>💰 Detail Transaksi #{{ $purchase->purchase_id }}</h2>
        <p>Informasi lengkap transaksi</p>
    </div>
    <a href="{{ route('purchases.index') }}" class="btn-primary">← Kembali</a>
</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:20px">

    <div class="card">
        <h3 style="font-family:'Madimi One',sans-serif;color:#8DBED7;margin-bottom:16px">📋 Info Transaksi</h3>
        <table style="width:100%;font-size:14px">
            <tr><td style="color:#888;padding:6px 0;width:40%">ID Transaksi</td><td><strong>#{{ $purchase->purchase_id }}</strong></td></tr>
            <tr><td style="color:#888;padding:6px 0">Tanggal</td><td>{{ $purchase->transaction_date }}</td></tr>
            <tr><td style="color:#888;padding:6px 0">Status</td><td>
                @if($purchase->transaction_status == 'paid')
                    <span class="badge badge-paid">✅ Paid</span>
                @elseif($purchase->transaction_status == 'pending')
                    <span class="badge badge-pending">⏳ Pending</span>
                @else
                    <span class="badge badge-inactive">❌ Cancelled</span>
                @endif
            </td></tr>
            <tr><td style="color:#888;padding:6px 0">Dibuat</td><td>{{ $purchase->created_at }}</td></tr>
        </table>
    </div>

    <div class="card">
        <h3 style="font-family:'Madimi One',sans-serif;color:#8DBED7;margin-bottom:16px">👤 Info Pembeli</h3>
        <table style="width:100%;font-size:14px">
            <tr><td style="color:#888;padding:6px 0;width:40%">Nama</td><td><strong>{{ $parent->name ?? '-' }}</strong></td></tr>
            <tr><td style="color:#888;padding:6px 0">Email</td><td>{{ $parent->email ?? '-' }}</td></tr>
            <tr><td style="color:#888;padding:6px 0">Telepon</td><td>{{ $parent->phone ?? '-' }}</td></tr>
        </table>
    </div>

    <div class="card" style="grid-column:1/-1">
        <h3 style="font-family:'Madimi One',sans-serif;color:#8DBED7;margin-bottom:16px">🎧 Info Perangkat</h3>
        <table style="width:100%;font-size:14px">
            <tr><td style="color:#888;padding:6px 0;width:20%">Serial Number</td><td><strong>{{ $device->serial_number ?? '-' }}</strong></td></tr>
            <tr><td style="color:#888;padding:6px 0">Status</td><td>
                @if(isset($device) && $device->status == 'active')
                    <span class="badge badge-paid">✅ Aktif</span>
                @else
                    <span class="badge badge-inactive">❌ Tidak Aktif</span>
                @endif
            </td></tr>
            <tr><td style="color:#888;padding:6px 0">Garansi</td><td>{{ $device->garansi ?? '-' }} bulan</td></tr>
            <tr><td style="color:#888;padding:6px 0">Tgl Registrasi</td><td>{{ $device->registered_at ?? '-' }}</td></tr>
        </table>
    </div>

</div>

@endsection