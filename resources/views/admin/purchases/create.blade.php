@extends('admin.layouts.app')

@section('title', 'Tambah Transaksi — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>💰 Tambah Transaksi</h2>
        <p>Tambah transaksi baru — device otomatis terdaftar</p>
    </div>
    <a href="{{ route('purchases.index') }}" class="btn-primary">← Kembali</a>
</div>

@if($errors->any())
@php
    $errorMsg = $errors->first();
@endphp
<script>
    document.addEventListener('DOMContentLoaded', function() {
        showPopup('❌', 'Gagal!', '{{ $errorMsg }}');
    });
</script>
@endif

<div class="card" style="max-width:700px">
    <form method="POST" action="{{ route('purchases.store') }}">
        @csrf

        <div class="form-group">
            <label>👤 User / Pembeli <span style="color:#F4A7D0">*</span></label>
            <select name="user_id" required>
                <option value="">-- Pilih User --</option>
                @foreach($parents as $parent)
                    <option value="{{ $parent->user_id }}" {{ old('user_id') == $parent->user_id ? 'selected' : '' }}>
                        {{ $parent->name }} — {{ $parent->email }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="form-group">
            <label>🎧 Serial Number Perangkat <span style="color:#F4A7D0">*</span></label>
            <input type="text" name="serial_number" value="{{ old('serial_number') }}"
                placeholder="Contoh: NS-2026-00001" required>
            <small style="color:#aaa;font-size:11px">Device akan otomatis terdaftar di Manajemen Perangkat</small>
        </div>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">
            <div class="form-group">
                <label>📅 Tanggal Transaksi <span style="color:#F4A7D0">*</span></label>
                <input type="date" name="transaction_date"
                    value="{{ old('transaction_date', date('Y-m-d')) }}" required>
            </div>
            <div class="form-group">
                <label>🛡️ Garansi (bulan) <span style="color:#F4A7D0">*</span></label>
                <input type="number" name="garansi" value="{{ old('garansi', 12) }}"
                    placeholder="Contoh: 12" required>
            </div>
        </div>


        <div style="display:flex;gap:12px;margin-top:8px">
            <button type="submit" class="btn-primary">💾 Simpan Transaksi</button>
            <a href="{{ route('purchases.index') }}" class="btn-primary" style="background:#ddd;color:#666">Batal</a>
        </div>
    </form>
</div>

@endsection