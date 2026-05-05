@extends('admin.layouts.app')

@section('title', 'Tambah Log Servis — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>🔧 Tambah Log Servis</h2>
        <p>Catat servis atau keluhan perangkat</p>
    </div>
    <a href="{{ route('service_logs.index') }}" class="btn-primary">← Kembali</a>
</div>

@if($errors->any())
@php $errorMsg = $errors->first(); @endphp
<script>
    document.addEventListener('DOMContentLoaded', function() {
        showPopup('❌', 'Gagal!', '{{ $errorMsg }}');
    });
</script>
@endif

<div class="card" style="max-width:700px">
    <form method="POST" action="{{ route('service_logs.store') }}">
        @csrf

        <div class="form-group">
            <label>🎧 Perangkat <span style="color:#F4A7D0">*</span></label>
            <select name="device_id" required>
                <option value="">-- Pilih Perangkat --</option>
                @foreach($devices as $device)
                    <option value="{{ $device->device_id }}" {{ old('device_id') == $device->device_id ? 'selected' : '' }}>
                        {{ $device->serial_number }} — {{ $device->owner_name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">
            <div class="form-group">
                <label>📅 Tanggal Servis <span style="color:#F4A7D0">*</span></label>
                <input type="date" name="date" value="{{ old('date', date('Y-m-d')) }}" required>
            </div>
            <div class="form-group">
                <label>📋 Status <span style="color:#F4A7D0">*</span></label>
                <select name="service_status" required>
                    <option value="">-- Pilih Status --</option>
                    <option value="pending" {{ old('service_status') == 'pending' ? 'selected' : '' }}>⏳ Pending</option>
                    <option value="in_progress" {{ old('service_status') == 'in_progress' ? 'selected' : '' }}>🔄 In Progress</option>
                    <option value="done" {{ old('service_status') == 'done' ? 'selected' : '' }}>✅ Done</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label>🛡️ Menggunakan Garansi? <span style="color:#F4A7D0">*</span></label>
            <select name="is_warranty" required>
                <option value="">-- Pilih --</option>
                <option value="1" {{ old('is_warranty') == '1' ? 'selected' : '' }}>✅ Ya</option>
                <option value="0" {{ old('is_warranty') == '0' ? 'selected' : '' }}>❌ Tidak</option>
            </select>
        </div>

        <div class="form-group">
            <label>📝 Deskripsi Keluhan <span style="color:#F4A7D0">*</span></label>
            <textarea name="description" rows="4" placeholder="Jelaskan keluhan atau catatan servis..." required
                style="width:100%;background:#f5f9fb;border:1.5px solid #e0edf3;border-radius:10px;padding:12px 14px;font-size:14px;font-family:'Inter',sans-serif;outline:none;resize:vertical">{{ old('description') }}</textarea>
        </div>

        <div style="display:flex;gap:12px;margin-top:8px">
            <button type="submit" class="btn-primary">💾 Simpan Log Servis</button>
            <a href="{{ route('service_logs.index') }}" class="btn-primary" style="background:#ddd;color:#666">Batal</a>
        </div>
    </form>
</div>

@endsection