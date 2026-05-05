@extends('admin.layouts.app')

@section('title', 'Edit Log Servis — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>🔧 Edit Log Servis #{{ $log->service_id }}</h2>
        <p>Update status dan catatan servis</p>
    </div>
    <a href="{{ route('service_logs.index') }}" class="btn-primary">← Kembali</a>
</div>

<div class="card" style="max-width:700px">
    <form method="POST" action="{{ route('service_logs.update', $log->service_id) }}">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label>🎧 Perangkat</label>
            <input type="text" value="{{ $devices->where('device_id', $log->device_id)->first()->serial_number ?? '-' }}"
                disabled style="background:#f0f0f0;color:#999">
        </div>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">
            <div class="form-group">
                <label>📋 Status <span style="color:#F4A7D0">*</span></label>
                <select name="service_status" required>
                    <option value="pending" {{ $log->service_status == 'pending' ? 'selected' : '' }}>⏳ Pending</option>
                    <option value="in_progress" {{ $log->service_status == 'in_progress' ? 'selected' : '' }}>🔄 In Progress</option>
                    <option value="done" {{ $log->service_status == 'done' ? 'selected' : '' }}>✅ Done</option>
                </select>
            </div>
            <div class="form-group">
                <label>🛡️ Menggunakan Garansi? <span style="color:#F4A7D0">*</span></label>
                <select name="is_warranty" required>
                    <option value="1" {{ $log->is_warranty ? 'selected' : '' }}>✅ Ya</option>
                    <option value="0" {{ !$log->is_warranty ? 'selected' : '' }}>❌ Tidak</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label>📝 Deskripsi Keluhan <span style="color:#F4A7D0">*</span></label>
            <textarea name="description" rows="4" required
                style="width:100%;background:#f5f9fb;border:1.5px solid #e0edf3;border-radius:10px;padding:12px 14px;font-size:14px;font-family:'Inter',sans-serif;outline:none;resize:vertical">{{ $log->description }}</textarea>
        </div>

        <div style="display:flex;gap:12px;margin-top:8px">
            <button type="submit" class="btn-primary">💾 Update Log Servis</button>
            <a href="{{ route('service_logs.index') }}" class="btn-primary" style="background:#ddd;color:#666">Batal</a>
        </div>
    </form>
</div>

@endsection