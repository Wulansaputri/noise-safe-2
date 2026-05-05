@extends('admin.layouts.app')

@section('title', 'Manajemen Perangkat — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>🎧 Manajemen Perangkat</h2>
        <p>Daftar semua perangkat Noise Safe</p>
    </div>
</div>

<!-- Filter -->
<div class="card" style="margin-bottom:20px;display:flex;gap:12px;align-items:center;padding:16px 20px">
    <span style="font-size:13px;font-weight:600;color:#888">Filter Status:</span>
    <select onchange="filterStatus(this.value)" style="width:auto">
        <option value="all">Semua</option>
        <option value="active">Aktif</option>
        <option value="inactive">Tidak Aktif</option>
    </select>
    <input type="text" placeholder="🔍 Cari serial number..." id="searchInput" onkeyup="searchTable()" style="width:250px">
</div>

<!-- Table -->
<div class="card">
    <table id="deviceTable">
        <thead>
            <tr>
                <th>No.</th>
                <th>Serial Number</th>
                <th>Nama Pemilik</th>
                <th>ID User</th>
                <th>Status</th>
                <th>Tgl Daftar</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse($devices as $i => $device)
            <tr>
                <td>{{ $i + 1 }}</td>
                <td><strong>{{ $device->serial_number }}</strong></td>
                <td>{{ $parents[$device->user_id] ?? $device->owner_name }}</td>
                <td>{{ $device->user_id }}</td>
                <td>
                    @if($device->status == 'active')
                        <span class="badge badge-active">✅ Aktif</span>
                    @else
                        <span class="badge badge-inactive">❌ Tidak Aktif</span>
                    @endif
                </td>
                <td>{{ $device->registered_at }}</td>
                <td>
    <div class="action-btns">
        <a href="{{ route('devices.show', $device->device_id) }}" class="btn-blue">Detail</a>
    </div>
</td>
            </tr>
            @empty
            <tr>
                <td colspan="7">
                    <div class="empty-state">
                        <div>🎧</div>
                        Belum ada perangkat terdaftar
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
        const rows = document.querySelectorAll('#deviceTable tbody tr');
        rows.forEach(row => {
            row.style.display = row.innerText.toLowerCase().includes(input) ? '' : 'none';
        });
    }
    function filterStatus(val) {
        const rows = document.querySelectorAll('#deviceTable tbody tr');
        rows.forEach(row => {
            if (val === 'all') { row.style.display = ''; return; }
            const badge = row.querySelector('.badge');
            if (!badge) return;
            row.style.display = badge.classList.contains('badge-' + val) ? '' : 'none';
        });
    }
</script>

@endsection