<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Noise Safe Admin')</title>
    <link href="https://fonts.googleapis.com/css2?family=Madimi+One&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: #f0f6fa;
            display: flex;
            min-height: 100vh;
        }

        /* SIDEBAR */
        /* SIDEBAR */
.sidebar {
    width: 240px;
    background: #fff;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    position: fixed;
    left: 0; top: 0;
    box-shadow: 2px 0 12px rgba(141,190,215,0.2);
}
.sidebar-logo {
    padding: 24px 24px 20px;
    border-bottom: 1px solid #e8f4fb;
}
.sidebar-logo p {
    font-size: 11px;
    color: #888;
    margin-top: 4px;
}
.sidebar-menu { padding: 16px 0; flex: 1; }
.menu-label {
    font-size: 10px; font-weight: 700;
    letter-spacing: 2px; text-transform: uppercase;
    color: #aaa;
    padding: 8px 24px 4px;
}
.menu-item {
    display: flex; align-items: center; gap: 10px;
    padding: 11px 24px;
    color: #666;
    font-size: 13px; font-weight: 500;
    text-decoration: none;
    border-left: 3px solid transparent;
    transition: all 0.2s;
}
.menu-item:hover {
    background: #f0f6fa;
    color: #2d4a5a;
}
.menu-item.active {
    background: #e8f4fb;
    color: #2d4a5a;
    border-left: 3px solid #8DBED7;
    font-weight: 700;
}
.menu-icon { font-size: 16px; width: 20px; text-align: center; }
.sidebar-footer {
    padding: 16px 24px;
    border-top: 1px solid #e8f4fb;
}
.admin-info {
    display: flex; align-items: center;
    gap: 10px; margin-bottom: 12px;
}
.admin-avatar {
    width: 36px; height: 36px; border-radius: 50%;
    background: #F4A7D0;
    display: flex; align-items: center; justify-content: center;
    font-family: 'Madimi One', sans-serif;
    font-size: 16px; color: #fff;
}
.admin-name { font-size: 13px; font-weight: 600; color: #2d4a5a; }
.admin-role { font-size: 11px; color: #aaa; }
.btn-logout {
    width: 100%;
    background: #f0f6fa;
    border: 1.5px solid #c5dce8;
    color: #2d4a5a; border-radius: 8px; padding: 8px;
    font-size: 13px; font-family: 'Inter', sans-serif;
    cursor: pointer; transition: all 0.2s;
}
.btn-logout:hover { background: #e8f4fb; }

        /* MAIN */
        .main { margin-left: 240px; flex: 1; padding: 28px; }

        /* TOPBAR */
        .topbar {
            display: flex; align-items: center;
            justify-content: space-between;
            margin-bottom: 28px;
        }
        .topbar h2 {
            font-family: 'Madimi One', sans-serif;
            font-size: 22px; color: #2d4a5a;
        }
        .topbar p { font-size: 13px; color: #888; margin-top: 2px; }
        .date-badge {
            background: #fff;
            border: 1.5px solid #8DBED7;
            border-radius: 8px;
            padding: 8px 14px;
            font-size: 12px; color: #2d4a5a;
        }

        /* CARD */
        .card {
            background: #fff;
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(141,190,215,0.15);
            margin-bottom: 20px;
        }

        /* TABLE */
        table { width: 100%; border-collapse: collapse; }
        th {
            font-size: 11px; font-weight: 700; color: #aaa;
            text-align: left; padding: 10px 12px;
            border-bottom: 2px solid #e8f4fb;
            text-transform: uppercase; letter-spacing: 0.5px;
        }
        td {
            font-size: 13px; color: #444;
            padding: 12px 12px;
            border-bottom: 1px solid #f0f6fa;
        }
        tr:hover td { background: #f7fbfd; }

        /* BADGE */
        .badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 11px; font-weight: 700;
        }
        .badge-active { background: #e8f5e1; color: #6a9a2a; }
        .badge-inactive { background: #fce4ec; color: #c0507a; }
        .badge-paid { background: #e8f5e1; color: #6a9a2a; }
        .badge-pending { background: #fff8e1; color: #e08000; }
        .badge-open { background: #fce4ec; color: #c0507a; }
        .badge-in_progress { background: #fff8e1; color: #e08000; }
        .badge-done { background: #e8f5e9; color: #2e7d32; }
        .badge-progress { background: #fff8e1; color: #f57f17; }

        /* BUTTONS */
        .btn-primary {
            background: #8DBED7; color: #fff;
            border: none; border-radius: 10px;
            padding: 10px 20px; font-size: 13px;
            font-weight: 600; font-family: 'Inter', sans-serif;
            cursor: pointer; text-decoration: none;
            transition: all 0.2s; display: inline-block;
        }
        .btn-primary:hover { background: #7aaec9; }
        .btn-blue {
            background: #8DBED7; color: #fff;
            border: none; border-radius: 6px;
            padding: 5px 12px; font-size: 12px;
            cursor: pointer; text-decoration: none;
            font-weight: 600; display: inline-block;
        }
        .btn-green {
            background: #C8D96E; color: #fff;
            border: none; border-radius: 6px;
            padding: 5px 12px; font-size: 12px;
            cursor: pointer; text-decoration: none;
            font-weight: 600; display: inline-block;
        }
        .btn-red {
            background: #F4A7D0; color: #fff;
            border: none; border-radius: 6px;
            padding: 5px 12px; font-size: 12px;
            cursor: pointer; font-weight: 600;
        }
        .btn-red:hover { background: #e891bf; }
        .action-btns { display: flex; gap: 6px; }

        /* FORM */
        .form-group { margin-bottom: 18px; }
        label {
            display: block; font-size: 13px;
            font-weight: 600; color: #444; margin-bottom: 6px;
        }
        input, select, textarea {
            width: 100%;
            background: #f0f6fa;
            border: 1.5px solid #c5dce8;
            border-radius: 10px;
            padding: 10px 14px;
            color: #333; font-size: 14px;
            font-family: 'Inter', sans-serif;
            outline: none; transition: border 0.2s;
        }
        input:focus, select:focus, textarea:focus {
            border-color: #8DBED7;
            background: #fff;
        }

        /* ALERT */
        .alert-success {
            background: #e8f5e1; border: 1.5px solid #C8D96E;
            color: #6a9a2a; border-radius: 10px;
            padding: 12px 16px; margin-bottom: 16px;
            font-size: 13px; font-weight: 600;
        }
        .alert-error {
            background: #fce4ec; border: 1.5px solid #F4A7D0;
            color: #c0507a; border-radius: 10px;
            padding: 12px 16px; margin-bottom: 16px;
            font-size: 13px; font-weight: 600;
        }

        /* EMPTY STATE */
        .empty-state {
            text-align: center; padding: 40px;
            color: #bbb; font-size: 13px;
        }
        .empty-state div { font-size: 32px; margin-bottom: 8px; }

        @yield('styles')
    </style>
</head>
<body>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="sidebar-logo">
    <img src="{{ asset('images/logo.png') }}" alt="Noise Safe" 
         style="width:160px;display:block;">
    <p style="font-size:11px;color:#888;margin-top:4px">Admin Panel</p>
</div>
        <div class="sidebar-menu">
            <div class="menu-label">Menu</div>
            <a href="{{ route('dashboard') }}"
               class="menu-item {{ request()->routeIs('dashboard') ? 'active' : '' }}">
                <span class="menu-icon">🏠</span> Dashboard
            </a>
            <a href="{{ route('purchases.index') }}"
               class="menu-item {{ request()->routeIs('purchases.*') ? 'active' : '' }}">
                <span class="menu-icon">💰</span> Riwayat Penjualan
            </a>
            <a href="{{ route('devices.index') }}"
               class="menu-item {{ request()->routeIs('devices.*') ? 'active' : '' }}">
                <span class="menu-icon">🎧</span> Manajemen Perangkat
            </a>
            <a href="{{ route('service_logs.index') }}"
               class="menu-item {{ request()->routeIs('service_logs.*') ? 'active' : '' }}">
                <span class="menu-icon">🔧</span> Garansi & Catatan
            </a>
        </div>
        <div class="sidebar-footer">
            <div class="admin-info">
                <div class="admin-avatar">A</div>
                <div>
                    <div class="admin-name">{{ session('admin')->name }}</div>
                    <div class="admin-role">Super Admin</div>
                </div>
            </div>
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" class="btn-logout">🚪 Logout</button>
            </form>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main">
        @yield('content')
    </div>

    <!-- POPUP NOTIFICATION -->
<div id="popup-overlay" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.3);z-index:999;align-items:center;justify-content:center">
    <div id="popup-box" style="background:#fff;border-radius:16px;padding:32px;max-width:380px;width:90%;text-align:center;box-shadow:0 10px 40px rgba(0,0,0,0.15)">
        <div id="popup-icon" style="font-size:48px;margin-bottom:12px"></div>
        <div id="popup-title" style="font-family:'Madimi One',sans-serif;font-size:18px;color:#2d4a5a;margin-bottom:8px"></div>
        <div id="popup-message" style="font-size:13px;color:#888;margin-bottom:20px"></div>
        <button onclick="closePopup()" style="background:#8DBED7;color:#fff;border:none;border-radius:10px;padding:10px 28px;font-size:13px;font-weight:600;font-family:'Inter',sans-serif;cursor:pointer">OK</button>
    </div>
</div>

<!-- POPUP KONFIRMASI HAPUS -->
<div id="confirm-overlay" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.3);z-index:999;align-items:center;justify-content:center">
    <div style="background:#fff;border-radius:16px;padding:32px;max-width:380px;width:90%;text-align:center;box-shadow:0 10px 40px rgba(0,0,0,0.15)">
        <div style="font-size:48px;margin-bottom:12px">🗑️</div>
        <div style="font-family:'Madimi One',sans-serif;font-size:18px;color:#2d4a5a;margin-bottom:8px">Yakin mau hapus?</div>
        <div style="font-size:13px;color:#888;margin-bottom:20px">Data yang dihapus tidak bisa dikembalikan!</div>
        <div style="display:flex;gap:10px;justify-content:center">
            <button onclick="closeConfirm()" style="background:#ddd;color:#666;border:none;border-radius:10px;padding:10px 24px;font-size:13px;font-weight:600;font-family:'Inter',sans-serif;cursor:pointer">Batal</button>
            <button id="confirm-btn" style="background:#F4A7D0;color:#fff;border:none;border-radius:10px;padding:10px 24px;font-size:13px;font-weight:600;font-family:'Inter',sans-serif;cursor:pointer">Hapus</button>
        </div>
    </div>
</div>

<script>
    // Show popup notifikasi
    function showPopup(icon, title, message) {
        document.getElementById('popup-icon').innerText = icon;
        document.getElementById('popup-title').innerText = title;
        document.getElementById('popup-message').innerText = message;
        const overlay = document.getElementById('popup-overlay');
        overlay.style.display = 'flex';
    }
    function closePopup() {
        document.getElementById('popup-overlay').style.display = 'none';
    }

    // Konfirmasi hapus
    let deleteForm = null;
    function confirmDelete(form) {
        deleteForm = form;
        document.getElementById('confirm-overlay').style.display = 'flex';
    }
    function closeConfirm() {
        document.getElementById('confirm-overlay').style.display = 'none';
        deleteForm = null;
    }
    document.getElementById('confirm-btn').addEventListener('click', function() {
        if (deleteForm) deleteForm.submit();
    });

    // Auto show popup dari session
    @if(session('success'))
        showPopup('✅', 'Berhasil!', '{{ session('success') }}');
    @endif
    @if(session('error'))
        showPopup('❌', 'Gagal!', '{{ session('error') }}');
    @endif
</script>

</body>
</html>