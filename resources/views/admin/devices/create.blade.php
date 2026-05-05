@extends('admin.layouts.app')

@section('title', 'Tambah Perangkat — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>🎧 Tambah Perangkat</h2>
        <p>Daftarkan perangkat Noise Safe baru</p>
    </div>
    <a href="{{ route('devices.index') }}" class="btn-primary">← Kembali</a>
</div>

@if($errors->any())
    <div class="alert-error">
        ❌ Mohon periksa kembali inputan kamu!
        <ul style="margin-top:6px;padding-left:16px">
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="card" style="max-width:700px">
    <form method="POST" action="{{ route('devices.store') }}">
        @csrf

        <div class="form-group">
            <label>Serial Number <span style="color:#F4A7D0">*</span></label>
            <input type="text" name="serial_number" value="{{ old('serial_number') }}"
                placeholder="Contoh: NS-2026-00001" required>
        </div>

        <div class="form-group">
            <label>Nama Pemilik <span style="color:#F4A7D0">*</span></label>
            <input type="text" name="owner_name" value="{{ old('owner_name') }}"
                placeholder="Nama lengkap pemilik" required>
        </div>

        <div class="form-group">
            <label>ID User (Parents) <span style="color:#F4A7D0">*</span></label>
            <input type="number" name="user_id" value="{{ old('user_id') }}"
                placeholder="ID user dari tabel parents" required>
        </div>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">
            <div class="form-group">
                <label>Tanggal Pembelian</label>
                <input type="date" name="purchase_date" value="{{ old('purchase_date') }}">
            </div>
            <div class="form-group">
                <label>Garansi (bulan)</label>
                <input type="number" name="garansi" value="{{ old('garansi') }}"
                    placeholder="Contoh: 12">
            </div>
        </div>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">
            <div class="form-group">
                <label>Status <span style="color:#F4A7D0">*</span></label>
                <select name="status" required>
                    <option value="">-- Pilih Status --</option>
                    <option value="active" {{ old('status') == 'active' ? 'selected' : '' }}>Aktif</option>
                    <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>Tidak Aktif</option>
                </select>
            </div>
            <div class="form-group">
                <label>Tanggal Registrasi</label>
                <input type="date" name="registered_at" value="{{ old('registered_at', date('Y-m-d')) }}">
            </div>
        </div>

        <div style="display:flex;gap:12px;margin-top:8px">
            <button type="submit" class="btn-primary">💾 Simpan Perangkat</button>
            <a href="{{ route('devices.index') }}" class="btn-primary" style="background:#ddd;color:#666">Batal</a>
        </div>

    </form>
</div>

@endsection