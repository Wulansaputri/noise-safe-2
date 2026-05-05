@extends('admin.layouts.app')

@section('title', 'Edit Perangkat — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>🎧 Edit Perangkat</h2>
        <p>Ubah data perangkat {{ $device->serial_number }}</p>
    </div>
    <a href="{{ route('devices.index') }}" class="btn-primary">← Kembali</a>
</div>

<div class="card" style="max-width:700px">
    <form method="POST" action="{{ route('devices.update', $device->device_id) }}">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label>🎧 Serial Number</label>
            <input type="text" value="{{ $device->serial_number }}" disabled style="background:#f0f0f0;color:#999">
        </div>

        <div class="form-group">
            <label>👤 Pemilik</label>
            <input type="text" value="{{ $device->owner_name }}" disabled style="background:#f0f0f0;color:#999">
        </div>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">
            <div class="form-group">
                <label>📋 Status <span style="color:#F4A7D0">*</span></label>
                <select name="status" required>
                    <option value="active" {{ $device->status == 'active' ? 'selected' : '' }}>✅ Aktif</option>
                    <option value="inactive" {{ $device->status == 'inactive' ? 'selected' : '' }}>❌ Tidak Aktif</option>
                </select>
            </div>
            <div class="form-group">
                <label>🛡️ Garansi (bulan)</label>
                <input type="number" name="garansi" value="{{ $device->garansi }}">
            </div>
        </div>

        <div style="display:flex;gap:12px;margin-top:8px">
            <button type="submit" class="btn-primary">💾 Update Perangkat</button>
            <a href="{{ route('devices.index') }}" class="btn-primary" style="background:#ddd;color:#666">Batal</a>
        </div>
    </form>
</div>

@endsection