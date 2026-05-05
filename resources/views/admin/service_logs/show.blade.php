@extends('admin.layouts.app')

@section('title', 'Detail Log Servis — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>🔧 Detail Log Servis #{{ $log->service_id }}</h2>
        <p>Informasi lengkap servis perangkat</p>
    </div>
    <a href="{{ route('service_logs.index') }}" class="btn-primary">← Kembali</a>
</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:20px">

    <div class="card">
        <h3 style="font-family:'Madimi One',sans-serif;color:#8DBED7;margin-bottom:16px">📋 Info Servis</h3>
        <table style="width:100%;font-size:14px">
            <tr><td style="color:#888;padding:6px 0;width:40%">ID Servis</td><td><strong>#{{ $log->service_id }}</strong></td></tr>
            <tr><td style="color:#888;padding:6px 0">Tanggal</td><td>{{ $log->date }}</td></tr>
            <tr><td style="color:#888;padding:6px 0">Garansi</td><td>
                @if($log->is_warranty)
                    <span class="badge badge-paid">✅ Ya</span>
                @else
                    <span class="badge badge-inactive">❌ Tidak</span>
                @endif
            </td></tr>
            <tr><td style="color:#888;padding:6px 0">Status</td><td>
                @if($log->service_status == 'done')
                    <span class="badge badge-done">✅ Done</span>
                @elseif($log->service_status == 'in_progress')
                    <span class="badge badge-progress">🔄 In Progress</span>
                @else
                    <span class="badge badge-pending">⏳ Pending</span>
                @endif
            </td></tr>
        </table>
    </div>

    <div class="card">
        <h3 style="font-family:'Madimi One',sans-serif;color:#8DBED7;margin-bottom:16px">🎧 Info Perangkat</h3>
        <table style="width:100%;font-size:14px">
            <tr><td style="color:#888;padding:6px 0;width:40%">Serial Number</td><td><strong>{{ $device->serial_number ?? '-' }}</strong></td></tr>
            <tr><td style="color:#888;padding:6px 0">Pemilik</td><td>{{ $device->owner_name ?? '-' }}</td></tr>
            <tr><td style="color:#888;padding:6px 0">Status Device</td><td>
                @if(isset($device) && $device->status == 'active')
                    <span class="badge badge-paid">✅ Aktif</span>
                @else
                    <span class="badge badge-inactive">❌ Tidak Aktif</span>
                @endif
            </td></tr>
            <tr><td style="color:#888;padding:6px 0">Pemilik (User)</td><td>{{ $parent->name ?? '-' }}</td></tr>
        </table>
    </div>

    <div class="card" style="grid-column:1/-1">
        <h3 style="font-family:'Madimi One',sans-serif;color:#8DBED7;margin-bottom:12px">📝 Deskripsi Keluhan</h3>
        <p style="font-size:14px;color:#444;line-height:1.7">{{ $log->description }}</p>
    </div>

</div>

@endsection