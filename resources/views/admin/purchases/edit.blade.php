@extends('admin.layouts.app')

@section('title', 'Edit Transaksi — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>💰 Edit Transaksi</h2>
        <p>Ubah data transaksi #{{ $purchase->purchase_id }}</p>
    </div>
    <a href="{{ route('purchases.index') }}" class="btn-primary">← Kembali</a>
</div>

<div class="card" style="max-width:700px">
    <form method="POST" action="{{ route('purchases.update', $purchase->purchase_id) }}">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label>👤 Pembeli</label>
            <input type="text" value="{{ $parents->where('user_id', $purchase->user_id)->first()->name ?? '-' }}" disabled style="background:#f0f0f0;color:#999">
        </div>

        <div class="form-group">
            <label>🎧 Serial Number</label>
            <input type="text" value="{{ $devices->where('device_id', $purchase->device_id)->first()->serial_number ?? '-' }}" disabled style="background:#f0f0f0;color:#999">
        </div>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px">
            <div class="form-group">
                <label>📅 Tanggal Transaksi <span style="color:#F4A7D0">*</span></label>
                <input type="date" name="transaction_date" value="{{ $purchase->transaction_date }}" required>
            </div>
            <div class="form-group">
                <label>📋 Status Transaksi <span style="color:#F4A7D0">*</span></label>
                <select name="transaction_status" required>
                    <option value="pending" {{ $purchase->transaction_status == 'pending' ? 'selected' : '' }}>⏳ Pending</option>
                    <option value="paid" {{ $purchase->transaction_status == 'paid' ? 'selected' : '' }}>✅ Paid</option>
                    <option value="cancelled" {{ $purchase->transaction_status == 'cancelled' ? 'selected' : '' }}>❌ Cancelled</option>
                </select>
            </div>
        </div>

        <div style="display:flex;gap:12px;margin-top:8px">
            <button type="submit" class="btn-primary">💾 Update Transaksi</button>
            <a href="{{ route('purchases.index') }}" class="btn-primary" style="background:#ddd;color:#666">Batal</a>
        </div>
    </form>
</div>

@endsection