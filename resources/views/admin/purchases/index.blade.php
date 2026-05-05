@extends('admin.layouts.app')

@section('title', 'Riwayat Penjualan — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>💰 Riwayat Penjualan</h2>
        <p>Daftar semua transaksi penjualan</p>
    </div>
    <a href="{{ route('purchases.create') }}" class="btn-primary">+ Tambah Transaksi</a>
</div>

<div class="card" style="margin-bottom:20px;display:flex;gap:12px;align-items:center;padding:16px 20px">
    <span style="font-size:13px;font-weight:600;color:#888">Filter Status:</span>
    <select onchange="filterStatus(this.value)" style="width:auto">
        <option value="all">Semua</option>
        <option value="badge-paid">Paid</option>
        <option value="badge-pending">Pending</option>
        <option value="badge-inactive">Cancelled</option>
    </select>
    <input type="text" placeholder="🔍 Cari transaksi..." id="searchInput" onkeyup="searchTable()" style="width:250px">
</div>

<div class="card">
    <table id="purchaseTable">
        <thead>
            <tr>
                <th>#</th>
                <th>ID Transaksi</th>
                <th>Pembeli</th>
                <th>Serial Number</th>
                <th>Tanggal</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse($purchases as $i => $purchase)
            <tr>
                <td>{{ $i + 1 }}</td>
                <td><strong>#{{ $purchase->purchase_id }}</strong></td>
                <td>{{ $parents[$purchase->user_id] ?? '-' }}</td>
                <td>{{ $devices[$purchase->device_id]->serial_number ?? '-' }}</td>
                <td>{{ $purchase->transaction_date }}</td>
                <td>
                    @if($purchase->transaction_status == 'paid')
                        <span class="badge badge-paid">✅ Paid</span>
                    @elseif($purchase->transaction_status == 'pending')
                        <span class="badge badge-pending">⏳ Pending</span>
                    @else
                        <span class="badge badge-inactive">❌ Cancelled</span>
                    @endif
                </td>
                <td>
    <div class="action-btns">
        <a href="{{ route('purchases.show', $purchase->purchase_id) }}" class="btn-blue">Detail</a>
        @if($purchase->transaction_status == 'pending')
        <form method="POST" action="{{ route('purchases.pay', $purchase->purchase_id) }}" style="display:inline">
            @csrf
            @method('PUT')
            <button type="submit" class="btn-green">✅ Lunas</button>
        </form>
        @endif
    </div>
</td>
            </tr>
            @empty
            <tr>
                <td colspan="7">
                    <div class="empty-state">
                        <div>💰</div>
                        Belum ada data transaksi
                    </div>
                </td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>

<script>
    function searchTable() {
        const input = document.getElementById('searchInput').value.toLowerCase();
        const rows = document.querySelectorAll('#purchaseTable tbody tr');
        rows.forEach(row => {
            row.style.display = row.innerText.toLowerCase().includes(input) ? '' : 'none';
        });
    }
    function filterStatus(val) {
        const rows = document.querySelectorAll('#purchaseTable tbody tr');
        rows.forEach(row => {
            if (val === 'all') { row.style.display = ''; return; }
            const badge = row.querySelector('.badge');
            if (!badge) return;
            row.style.display = badge.classList.contains(val) ? '' : 'none';
        });
    }
</script>

@endsection