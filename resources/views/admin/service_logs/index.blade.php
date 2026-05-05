@extends('admin.layouts.app')

@section('title', 'Garansi & Catatan — Noise Safe')

@section('content')

<div class="topbar">
    <div>
        <h2>🔧 Garansi & Catatan</h2>
        <p>Log servis dan catatan garansi perangkat</p>
    </div>
    <a href="{{ route('service_logs.create') }}" class="btn-primary">+ Tambah Log Servis</a>
</div>

<div class="card" style="margin-bottom:20px;display:flex;gap:12px;align-items:center;padding:16px 20px">
    <span style="font-size:13px;font-weight:600;color:#888">Filter Status:</span>
    <select onchange="filterStatus(this.value)" style="width:auto">
        <option value="all">Semua</option>
        <option value="badge-done">Done</option>
        <option value="badge-pending">Pending</option>
        <option value="badge-progress">In Progress</option>
    </select>
    <input type="text" placeholder="🔍 Cari servis..." id="searchInput" onkeyup="searchTable()" style="width:250px">
</div>

<div class="card">
    <table id="serviceTable">
        <thead>
            <tr>
                <th>#</th>
                <th>Perangkat</th>
                <th>Tanggal</th>
                <th>Garansi</th>
                <th>Status</th>
                <th>Deskripsi</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse($logs as $i => $log)
            <tr>
                <td>{{ $i + 1 }}</td>
                <td><strong>{{ $devices[$log->device_id]->serial_number ?? '-' }}</strong></td>
                <td>{{ $log->date }}</td>
                <td>
                    @if($log->is_warranty)
                        <span class="badge badge-paid">✅ Ya</span>
                    @else
                        <span class="badge badge-inactive">❌ Tidak</span>
                    @endif
                </td>
                <td>
                    @if($log->service_status == 'done')
                        <span class="badge badge-done">✅ Done</span>
                    @elseif($log->service_status == 'in_progress')
                        <span class="badge badge-progress">🔄 In Progress</span>
                    @else
                        <span class="badge badge-pending">⏳ Pending</span>
                    @endif
                </td>
                <td style="max-width:200px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap">
                    {{ $log->description }}
                </td>
                <td>
                    <div class="action-btns">
                        <a href="{{ route('service_logs.show', $log->service_id) }}" class="btn-blue">Detail</a>
                        <a href="{{ route('service_logs.edit', $log->service_id) }}" class="btn-green">Edit</a>
                        <form method="POST" action="{{ route('service_logs.destroy', $log->service_id) }}" onsubmit="confirmDelete(this); return false;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn-red">Hapus</button>
                        </form>
                    </div>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="7">
                    <div class="empty-state">
                        <div>🔧</div>
                        Belum ada log servis
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
        const rows = document.querySelectorAll('#serviceTable tbody tr');
        rows.forEach(row => {
            row.style.display = row.innerText.toLowerCase().includes(input) ? '' : 'none';
        });
    }
    function filterStatus(val) {
        const rows = document.querySelectorAll('#serviceTable tbody tr');
        rows.forEach(row => {
            if (val === 'all') { row.style.display = ''; return; }
            const badge = row.querySelector('.badge-done, .badge-pending, .badge-progress');
            if (!badge) return;
            row.style.display = badge.classList.contains(val) ? '' : 'none';
        });
    }
</script>

@endsection