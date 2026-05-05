<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — Noise Safe Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Madimi+One&family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
            display: flex;
            background: #fff;
        }

        /* KIRI - dekorasi */
        .left-panel {
            width: 45%;
            background: linear-gradient(135deg, #8DBED7 0%, #6aaac5 50%, #5a9ab5 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 48px;
            position: relative;
            overflow: hidden;
        }
        .left-panel::before {
            content: '';
            position: absolute;
            width: 300px; height: 300px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
            top: -80px; left: -80px;
        }
        .left-panel::after {
            content: '';
            position: absolute;
            width: 200px; height: 200px;
            border-radius: 50%;
            background: rgba(255,255,255,0.06);
            bottom: -40px; right: -40px;
        }
        .left-panel img {
            width: 280px;
            margin-bottom: 28px;
            position: relative;
            z-index: 1;
            filter: drop-shadow(0 8px 24px rgba(0,0,0,0.15));
        }
        .left-panel h2 {
            font-family: 'Madimi One', sans-serif;
            font-size: 24px;
            color: #fff;
            text-align: center;
            margin-bottom: 10px;
            position: relative;
            z-index: 1;
        }
        .left-panel p {
            font-size: 13px;
            color: rgba(255,255,255,0.8);
            text-align: center;
            line-height: 1.6;
            position: relative;
            z-index: 1;
        }
        
        /* KANAN - form */
        .right-panel {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 48px;
            background: #fff;
        }
        .form-box {
            width: 100%;
            max-width: 380px;
        }
        .form-box h1 {
            font-family: 'Madimi One', sans-serif;
            font-size: 28px;
            color: #2d4a5a;
            margin-bottom: 6px;
        }
        .form-box .subtitle {
            font-size: 13px;
            color: #999;
            margin-bottom: 32px;
        }
        .form-group { margin-bottom: 18px; }
        label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #444;
            margin-bottom: 6px;
        }
        input {
            width: 100%;
            background: #f5f9fb;
            border: 1.5px solid #e0edf3;
            border-radius: 10px;
            padding: 12px 14px;
            color: #333;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
            outline: none;
            transition: all 0.2s;
        }
        input:focus {
            border-color: #8DBED7;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(141,190,215,0.15);
        }
        .btn {
            width: 100%;
            background: linear-gradient(135deg, #8DBED7, #6aaac5);
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 13px;
            font-size: 15px;
            font-family: 'Madimi One', sans-serif;
            cursor: pointer;
            margin-top: 8px;
            transition: all 0.2s;
            box-shadow: 0 4px 12px rgba(141,190,215,0.4);
        }
        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(141,190,215,0.5);
        }
        .error {
            background: #fff0f5;
            border: 1.5px solid #F4A7D0;
            color: #c0507a;
            border-radius: 10px;
            padding: 10px 14px;
            font-size: 13px;
            margin-bottom: 18px;
        }
        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 20px 0;
            color: #ccc;
            font-size: 12px;
        }
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #eee;
        }
    </style>
</head>
<body>

    <!-- KIRI -->
    <div class="left-panel">
        <img src="{{ asset('images/logo-full.png') }}" alt="Noise Safe">
        <h2>Admin</h2>
        <p>Kelola perangkat, penjualan,<br>dan garansi dengan mudah</p>
        
    </div>

    <!-- KANAN -->
    <div class="right-panel">
        <div class="form-box">
            <h1>Selamat Datang! 👋</h1>
            <p class="subtitle">Masuk ke panel admin Noise Safe</p>

            @if(session('error'))
                <div class="error">⚠️ {{ session('error') }}</div>
            @endif

            <form method="POST" action="{{ route('login.post') }}">
                @csrf
                <div class="form-group">
                    <label>👤 Nama Admin</label>
                    <input type="text" name="name" placeholder="Masukkan nama" required>
                </div>
                <div class="form-group">
                    <label>🔒 Password</label>
                    <input type="password" name="password" placeholder="Masukkan password" required>
                </div>
                <button type="submit" class="btn">Masuk ke Dashboard →</button>
            </form>

            <div class="divider">Noise Safe © 2026</div>
        </div>
    </div>

</body>
</html>