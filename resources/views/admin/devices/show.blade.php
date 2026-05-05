@extends('admin.layouts.app')

@section('title', 'Detail Perangkat — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>🎧 Detail Perangkat</h2>
        <p>Informasi lengkap perangkat</p>
    </div>
    <a href="{{ route('devices.index') }}" class="btn-primary">← Kembali</a>
</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">

    <div class="card">
        <div style="font-family:'Madimi One',sans-serif;font-size:15px;color:#2d4a5a;margin-bottom:16px;padding-bottom:12px;border-bottom:2px solid #e8f4fb">
            📋 Informasi Perangkat
        </div>
        <div style="margin-bottom:14px">
            <div style="font-size:11px;font-weight:700;color:#aaa;text-transform:uppercase;margin-bottom:4px">Serial Number</div>
            <div style="font-size:14px;font-weight:600;color:#2d4a5a">{{ $device->serial_number }}</div>
        </div>
        <div style="margin-bottom:14px">
            <div style="font-size:11px;font-weight:700;color:#aaa;text-transform:uppercase;margin-bottom:4px">Nama Pemilik</div>
            <div style="font-size:14px;color:#444">{{ $device->owner_name }}</div>
        </div>
        <div style="margin-bottom:14px">
            <div style="font-size:11px;font-weight:700;color:#aaa;text-transform:uppercase;margin-bottom:4px">ID User</div>
            <div style="font-size:14px;color:#444">{{ $device->user_id }}</div>
        </div>
        <div style="margin-bottom:14px">
            <div style="font-size:11px;font-weight:700;color:#aaa;text-transform:uppercase;margin-bottom:4px">Status</div>
            @if($device->status == 'active')
                <span class="badge badge-active">✅ Aktif</span>
            @else
                <span class="badge badge-inactive">❌ Tidak Aktif</span>
            @endif
        </div>
    </div>

    <div class="card">
        <div style="font-family:'Madimi One',sans-serif;font-size:15px;color:#2d4a5a;margin-bottom:16px;padding-bottom:12px;border-bottom:2px solid #e8f4fb">
            🛒 Informasi Pembelian
        </div>
        <div style="margin-bottom:14px">
            <div style="font-size:11px;font-weight:700;color:#aaa;text-transform:uppercase;margin-bottom:4px">Tanggal Pembelian</div>
            <div style="font-size:14px;color:#444">{{ $device->purchase_date ?? '-' }}</div>
        </div>
        <div style="margin-bottom:14px">
            <div style="font-size:11px;font-weight:700;color:#aaa;text-transform:uppercase;margin-bottom:4px">Garansi</div>
            <div style="font-size:14px;color:#444">{{ $device->garansi ? $device->garansi . ' bulan' : '-' }}</div>
        </div>
        <div style="margin-bottom:14px">
            <div style="font-size:11px;font-weight:700;color:#aaa;text-transform:uppercase;margin-bottom:4px">Tanggal Registrasi</div>
            <div style="font-size:14px;color:#444">{{ $device->registered_at ?? '-' }}</div>
        </div>
        <div style="margin-bottom:14px">
            <div style="font-size:11px;font-weight:700;color:#aaa;text-transform:uppercase;margin-bottom:4px">Device ID</div>
            <div style="font-size:14px;color:#444">#{{ $device->device_id }}</div>
        </div>
    </div>

</div>

<!-- <div class="card" style="display:flex;gap:12px;align-items:center">
    <form method="POST" action="{{ route('devices.destroy', $device->device_id) }}" onsubmit="confirmDelete(this); return false;">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn-primary" style="background:#F4A7D0">🗑️ Hapus Perangkat</button> 
    </form>
</div>-->

@endsection