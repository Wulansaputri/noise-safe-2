<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Noise Safe - Earbud Pintar untuk Disabilitas Sensorik</title>
    <link href="https://fonts.googleapis.com/css2?family=Madimi+One&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #8BBED7;
            --primary-dark: #5a9ab8;
            --primary-light: #c5e0ed;
            --accent: #E84FA3;
            --accent-light: #f8b6d9;
            --lime: #B8D964;
            --lime-dark: #94b540;
            --dark: #1a2e3b;
            --gray: #6b7280;
            --light-bg: #f0f8fc;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            color: #1a2e3b;
            background: #fff;
            overflow-x: hidden;
        }

        h1, h2, h3, .brand {
            font-family: 'Madimi One', sans-serif;
        }

        /* NAV */
        nav {
            position: fixed;
            top: 0; left: 0; right: 0;
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(12px);
            z-index: 100;
            border-bottom: 2px solid var(--primary-light);
        }
        .nav-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
            height: 68px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }
        .logo-icon {
            width: 44px;
            height: 44px;
        }
        .logo-text {
            font-family: 'Madimi One', sans-serif;
            font-size: 1.4rem;
            color: var(--primary-dark);
        }
        .logo-text span { color: var(--accent); }
        .nav-links {
            display: flex;
            align-items: center;
            gap: 32px;
            list-style: none;
        }
        .nav-links a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            font-size: 0.95rem;
            transition: color 0.2s;
        }
        .nav-links a:hover { color: var(--accent); }
        .btn-nav {
            background: var(--accent);
            color: white !important;
            padding: 10px 22px;
            border-radius: 999px;
            font-weight: 700 !important;
            transition: background 0.2s, transform 0.15s !important;
        }
        .btn-nav:hover { background: #c93d8a !important; transform: scale(1.04); }

        /* HERO */
        .hero {
            min-height: 100vh;
            background: #fff;
            padding: 100px 24px 80px;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute;
            top: -80px; right: -120px;
            width: 700px; height: 700px;
            background: radial-gradient(circle, var(--primary-light) 0%, transparent 70%);
            pointer-events: none;
        }
        .hero::after {
            content: '';
            position: absolute;
            bottom: -60px; left: -80px;
            width: 400px; height: 400px;
            background: radial-gradient(circle, #fde8f4 0%, transparent 70%);
            pointer-events: none;
        }
        .hero-inner {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
            position: relative;
            z-index: 1;
        }
        .hero h1 {
            font-size: clamp(2.4rem, 5vw, 3.8rem);
            color: var(--dark);
            line-height: 1.1;
            margin-bottom: 20px;
        }
        .hero h1 span { color: var(--accent); }
        .hero p {
            color: var(--gray);
            font-size: 1.1rem;
            line-height: 1.7;
            margin-bottom: 36px;
        }
        .hero-btns {
            display: flex;
            gap: 16px;
            flex-wrap: wrap;
            margin-bottom: 40px;
        }
        .btn-primary {
            background: var(--accent);
            color: white;
            padding: 14px 32px;
            border-radius: 999px;
            font-weight: 700;
            font-size: 1rem;
            text-decoration: none;
            transition: background 0.2s, transform 0.15s, box-shadow 0.2s;
            box-shadow: 0 8px 24px rgba(232,79,163,0.35);
        }
        .btn-primary:hover { background: #c93d8a; transform: translateY(-2px); box-shadow: 0 12px 32px rgba(232,79,163,0.45); }
        .btn-secondary {
            background: white;
            color: var(--primary-dark);
            padding: 14px 32px;
            border-radius: 999px;
            font-weight: 700;
            font-size: 1rem;
            text-decoration: none;
            border: 2px solid var(--primary);
            transition: background 0.2s, transform 0.15s;
        }
        .btn-secondary:hover { background: var(--light-bg); transform: translateY(-2px); }
        .counter {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .avatars {
            display: flex;
        }
        .avatar {
            width: 38px; height: 38px;
            border-radius: 50%;
            border: 2.5px solid white;
            background: var(--primary-light);
            display: flex; align-items: center; justify-content: center;
            font-weight: 700; color: var(--primary-dark);
            font-size: 0.85rem;
            margin-left: -10px;
        }
        .avatar:first-child { margin-left: 0; }
        .counter-text { font-size: 0.9rem; color: var(--gray); }
        .counter-text strong { color: var(--accent); }

        /* HERO VISUAL */
        .hero-visual {
            position: relative;
        }
        .hero-img-box {
            background: linear-gradient(135deg, var(--primary-light) 0%, #ddf0f9 100%);
            border-radius: 28px;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        .hero-img-box::before {
            content: '';
            position: absolute;
            top: 20px; left: 20px; right: 20px;
            height: 3px;
            background: repeating-linear-gradient(90deg, var(--accent) 0, var(--accent) 8px, transparent 8px, transparent 16px);
            border-radius: 2px;
            opacity: 0.5;
        }
        .earbud-placeholder {
            text-align: center;
        }
        .earbud-placeholder svg {
            width: 120px; height: 120px;
            opacity: 0.5;
        }
        .earbud-placeholder p {
            color: var(--primary-dark);
            font-weight: 600;
            margin-top: 12px;
            font-size: 0.95rem;
        }
        .badge {
            position: absolute;
            background: white;
            padding: 12px 16px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
        }
        .badge p:first-child { font-weight: 700; font-size: 0.9rem; color: var(--dark); }
        .badge p:last-child { font-size: 0.75rem; color: var(--gray); }
        .badge-top { top: -16px; right: -16px; }
        .badge-bottom { bottom: -16px; left: -16px; }
        .badge-dot {
            display: inline-block;
            width: 8px; height: 8px;
            border-radius: 50%;
            background: var(--lime);
            margin-right: 6px;
            vertical-align: middle;
        }

        /* WAVE DIVIDER */
        .wave-divider {
            width: 100%;
            overflow: hidden;
            line-height: 0;
        }
        .wave-divider svg { display: block; }

        /* PROBLEM */
        .problem {
            padding: 80px 24px;
            background: white;
        }
        .section-inner { max-width: 1200px; margin: 0 auto; }
        .section-header { text-align: center; margin-bottom: 56px; }
        .section-label {
            display: inline-block;
            background: var(--accent-light);
            color: var(--accent);
            font-weight: 700;
            font-size: 0.8rem;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            padding: 6px 16px;
            border-radius: 999px;
            margin-bottom: 16px;
        }
        .section-header h2 {
            font-size: clamp(1.8rem, 3.5vw, 2.6rem);
            color: var(--dark);
            margin-bottom: 12px;
        }
        .section-header p { color: var(--gray); font-size: 1.05rem; max-width: 540px; margin: 0 auto; }
        .cards-3 {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 28px;
        }
        .problem-card {
            text-align: center;
            padding: 36px 28px;
            border-radius: 24px;
            background: var(--light-bg);
            border: 1.5px solid var(--primary-light);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .problem-card:hover { transform: translateY(-4px); box-shadow: 0 12px 32px rgba(139,190,215,0.2); }
        .icon-wrap {
            width: 72px; height: 72px;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 20px;
        }
        .icon-wrap.pink { background: #fde8f4; }
        .icon-wrap.pink svg { color: var(--accent); }
        .problem-card h3 { font-size: 1.15rem; color: var(--dark); margin-bottom: 8px; }
        .problem-card p { color: var(--gray); line-height: 1.6; font-size: 0.95rem; }

        /* FEATURES */
        .features {
            padding: 80px 24px;
            background: linear-gradient(180deg, #f0f8fc 0%, white 100%);
        }
        .cards-4 {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
        }
        .feat-card {
            background: white;
            padding: 28px 24px;
            border-radius: 24px;
            border: 1.5px solid var(--primary-light);
            box-shadow: 0 4px 16px rgba(139,190,215,0.12);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .feat-card:hover { transform: translateY(-6px); box-shadow: 0 16px 40px rgba(139,190,215,0.25); }
        .feat-icon {
            width: 56px; height: 56px;
            border-radius: 16px;
            display: flex; align-items: center; justify-content: center;
            margin-bottom: 18px;
        }
        .feat-icon.blue { background: var(--primary-light); }
        .feat-icon.blue svg { color: var(--primary-dark); }
        .feat-icon.pink { background: #fde8f4; }
        .feat-icon.pink svg { color: var(--accent); }
        .feat-icon.lime { background: #edf7d0; }
        .feat-icon.lime svg { color: var(--lime-dark); }
        .feat-icon.purple { background: #f0ebff; }
        .feat-icon.purple svg { color: #7c5cbf; }
        .feat-card h3 { font-size: 1.05rem; color: var(--dark); margin-bottom: 8px; }
        .feat-card p { color: var(--gray); font-size: 0.9rem; line-height: 1.6; }

        /* HOW IT WORKS */
        .how {
            padding: 80px 24px;
            background: white;
        }
        .steps {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 40px;
            position: relative;
        }
        .steps::before {
            content: '';
            position: absolute;
            top: 32px;
            left: calc(16.66% + 16px);
            right: calc(16.66% + 16px);
            height: 2px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            z-index: 0;
        }
        .step { text-align: center; position: relative; z-index: 1; }
        .step-num {
            width: 64px; height: 64px;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: white;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.5rem;
            font-family: 'Madimi One', sans-serif;
            margin: 0 auto 24px;
            box-shadow: 0 8px 20px rgba(232,79,163,0.3);
        }
        .step h3 { font-size: 1.1rem; color: var(--dark); margin-bottom: 8px; }
        .step p { color: var(--gray); font-size: 0.93rem; line-height: 1.6; }

        /* PRICING */
        .pricing {
            padding: 80px 24px;
            background: var(--light-bg);
        }
        .pricing-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 28px;
            max-width: 820px;
            margin: 0 auto;
        }
        .price-card {
            background: white;
            border: 2px solid var(--primary-light);
            border-radius: 28px;
            padding: 36px 32px;
        }
        .price-card.recommended {
            background: linear-gradient(145deg, var(--primary-dark), #3a7fa0);
            border-color: var(--primary-dark);
            color: white;
            position: relative;
        }
        .rec-badge {
            position: absolute;
            top: 0; right: 28px;
            background: var(--lime);
            color: var(--dark);
            font-weight: 700;
            font-size: 0.75rem;
            padding: 6px 16px;
            border-radius: 0 0 12px 12px;
            letter-spacing: 1px;
        }
        .price-card h3 { font-size: 1.6rem; margin-bottom: 4px; }
        .price-card .subtitle { font-size: 0.9rem; opacity: 0.7; margin-bottom: 24px; }
        .price-amount { font-size: 2.2rem; font-family: 'Madimi One', sans-serif; margin-bottom: 28px; }
        .price-features { list-style: none; margin-bottom: 32px; }
        .price-features li {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 14px;
            font-size: 0.95rem;
        }
        .check-icon { flex-shrink: 0; }
        .price-features li .check-icon { color: var(--lime); }
        .price-card:not(.recommended) .price-features li .check-icon { color: var(--primary-dark); }
        .price-card:not(.recommended) .price-amount { color: var(--primary-dark); }
        .btn-price {
            display: block;
            text-align: center;
            padding: 14px;
            border-radius: 999px;
            font-weight: 700;
            text-decoration: none;
            font-size: 1rem;
            transition: transform 0.15s, box-shadow 0.2s;
        }
        .btn-price:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(0,0,0,0.15); }
        .btn-price.blue { background: var(--primary-dark); color: white; }
        .btn-price.yellow { background: var(--lime); color: var(--dark); }

        /* WAITING LIST */
        .waiting-list {
            padding: 80px 24px;
            background: linear-gradient(135deg, var(--primary-dark) 0%, #2c6880 50%, #1f4f66 100%);
            position: relative;
            overflow: hidden;
        }
        .waiting-list::before {
            content: '';
            position: absolute;
            top: -100px; right: -100px;
            width: 500px; height: 500px;
            background: radial-gradient(circle, rgba(232,79,163,0.2) 0%, transparent 70%);
            pointer-events: none;
        }
        .waiting-list::after {
            content: '';
            position: absolute;
            bottom: -80px; left: -80px;
            width: 400px; height: 400px;
            background: radial-gradient(circle, rgba(184,217,100,0.15) 0%, transparent 70%);
            pointer-events: none;
        }
        .wl-inner {
            max-width: 760px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }
        .wl-header { text-align: center; margin-bottom: 40px; }
        .wl-label {
            display: inline-block;
            background: var(--lime);
            color: var(--dark);
            font-weight: 700;
            font-size: 0.8rem;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            padding: 6px 18px;
            border-radius: 999px;
            margin-bottom: 16px;
        }
        .wl-header h2 { font-size: clamp(1.8rem, 3.5vw, 2.4rem); color: white; margin-bottom: 10px; }
        .wl-header p { color: rgba(255,255,255,0.75); font-size: 1.05rem; }
        .wl-form {
            background: white;
            border-radius: 28px;
            padding: 40px;
            box-shadow: 0 24px 64px rgba(0,0,0,0.25);
        }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .form-group { display: flex; flex-direction: column; }
        .form-group.full { grid-column: 1 / -1; }
        label { font-weight: 600; font-size: 0.9rem; color: var(--dark); margin-bottom: 8px; }
        label span { color: var(--accent); }
        input, select, textarea {
            padding: 12px 16px;
            border: 1.5px solid #d1e8f2;
            border-radius: 14px;
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            color: var(--dark);
            transition: border-color 0.2s, box-shadow 0.2s;
            outline: none;
            background: white;
        }
        input:focus, select:focus, textarea:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(232,79,163,0.12);
        }
        textarea { resize: vertical; min-height: 100px; }
        .btn-submit {
            display: block;
            width: 100%;
            background: var(--accent);
            color: white;
            padding: 16px;
            border: none;
            border-radius: 999px;
            font-family: 'Madimi One', sans-serif;
            font-size: 1.15rem;
            cursor: pointer;
            margin-top: 24px;
            transition: background 0.2s, transform 0.15s, box-shadow 0.2s;
            box-shadow: 0 8px 24px rgba(232,79,163,0.35);
        }
        .btn-submit:hover { background: #c93d8a; transform: translateY(-2px); box-shadow: 0 12px 32px rgba(232,79,163,0.45); }
        .form-note { text-align: center; color: var(--gray); font-size: 0.82rem; margin-top: 12px; }

        /* FAQ */
        .faq {
            padding: 80px 24px;
            background: white;
        }
        .faq-list { max-width: 760px; margin: 0 auto; display: flex; flex-direction: column; gap: 12px; }
        .faq-item {
            border: 1.5px solid var(--primary-light);
            border-radius: 18px;
            overflow: hidden;
            background: white;
            transition: border-color 0.2s;
        }
        .faq-item:hover { border-color: var(--primary); }
        .faq-btn {
            width: 100%;
            padding: 20px 24px;
            background: none;
            border: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            font-family: 'Inter', sans-serif;
            font-weight: 600;
            font-size: 1rem;
            color: var(--dark);
            text-align: left;
        }
        .faq-arrow {
            width: 28px; height: 28px;
            border-radius: 50%;
            background: var(--primary-light);
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
            transition: background 0.2s, transform 0.3s;
        }
        .faq-arrow svg { color: var(--primary-dark); }
        .faq-item.open .faq-arrow { background: var(--accent); transform: rotate(180deg); }
        .faq-item.open .faq-arrow svg { color: white; }
        .faq-body { display: none; padding: 0 24px 20px; color: var(--gray); line-height: 1.7; font-size: 0.95rem; }
        .faq-item.open .faq-body { display: block; }

        /* FOOTER */
        footer {
            background: var(--dark);
            color: rgba(255,255,255,0.6);
            text-align: center;
            padding: 28px 24px;
            font-size: 0.88rem;
        }
        footer strong { color: var(--primary-light); }
        footer .accent { color: var(--accent); }

        /* RESPONSIVE */
        @media (max-width: 900px) {
            .hero-inner { grid-template-columns: 1fr; }
            .cards-3, .steps { grid-template-columns: 1fr; }
            .steps::before { display: none; }
            .cards-4 { grid-template-columns: 1fr 1fr; }
            .pricing-grid { grid-template-columns: 1fr; }
            .nav-links { display: none; }
        }
        @media (max-width: 600px) {
            .cards-4 { grid-template-columns: 1fr; }
            .form-grid { grid-template-columns: 1fr; }
            .hero-btns { flex-direction: column; }
        }
    </style>
</head>
<body>

<!-- NAV -->
<nav>
    <div class="nav-inner">
        <a href="#" class="logo">
            <!-- Noise Safe Logo SVG (simplified from brand guide) -->
            <svg class="logo-icon" viewBox="0 0 44 44" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="22" cy="22" r="21" fill="white" stroke="#8BBED7" stroke-width="1.5"/>
                <!-- Headphone shape -->
                <path d="M10 22 C10 14.3 15.4 8 22 8 C28.6 8 34 14.3 34 22" stroke="#8BBED7" stroke-width="2.5" fill="none" stroke-linecap="round"/>
                <!-- Left ear cup -->
                <rect x="7" y="20" width="7" height="10" rx="3" fill="#E84FA3"/>
                <!-- Right ear cup -->
                <rect x="30" y="20" width="7" height="10" rx="3" fill="#8BBED7"/>
                <!-- Heartbeat line -->
                <polyline points="15,25 17,25 18,21 20,29 22,23 24,27 25,25 29,25" stroke="#B8D964" stroke-width="1.8" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
                <!-- Plus sign -->
                <text x="31" y="14" fill="#E84FA3" font-size="8" font-weight="bold">+</text>
            </svg>
            <span class="logo-text">Noise<span>Safe</span></span>
        </a>
        <ul class="nav-links">
            <li><a href="#fitur">Fitur</a></li>
            <li><a href="#cara-kerja">Cara Kerja</a></li>
            <li><a href="#harga">Harga</a></li>
            <li><a href="#faq">FAQ</a></li>
            <li><a href="#waiting-list" class="btn-nav">Daftar Waiting List</a></li>
        </ul>
    </div>
</nav>

<!-- HERO -->
<section class="hero">
    <div class="hero-inner">
        <div>
            <h1>Tenang di Tengah <span>Kebisingan</span></h1>
            <p>Earbud pintar dengan noise cancelling otomatis dan fitur keamanan GPS real-time untuk anak dengan disabilitas sensorik.</p>
            <div class="hero-btns">
                <a href="#waiting-list" class="btn-primary">Daftar Waiting List</a>
                <a href="#fitur" class="btn-secondary">Pelajari Fitur</a>
            </div>
            <div class="counter">
                <div class="avatars">
                    <div class="avatar">A</div>
                    <div class="avatar">B</div>
                    <div class="avatar">C</div>
                </div>
                <p class="counter-text"><strong>0+</strong> orang sudah mendaftar</p>
            </div>
        </div>
        <div class="hero-visual">
            <div class="hero-img-box">
                <div class="earbud-placeholder">
                    <svg viewBox="0 0 120 120" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="60" cy="60" r="55" fill="#c5e0ed" opacity="0.5"/>
                        <path d="M28 60 C28 42.3 42.3 28 60 28 C77.7 28 92 42.3 92 60" stroke="#5a9ab8" stroke-width="4" fill="none" stroke-linecap="round"/>
                        <rect x="20" y="56" width="18" height="26" rx="8" fill="#E84FA3"/>
                        <rect x="82" y="56" width="18" height="26" rx="8" fill="#8BBED7"/>
                        <polyline points="35,69 39,69 41,61 45,77 49,65 53,71 55,69 65,69" stroke="#B8D964" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    <p>Noise Safe Earbud</p>
                </div>
                <div class="badge badge-top">
                    <p>🔇 Noise Cancelling</p>
                    <p>-32dB</p>
                </div>
                <div class="badge badge-bottom">
                    <p><span class="badge-dot"></span>GPS Real-time</p>
                    <p>Akurasi 5m</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- PROBLEM -->
<section class="problem">
    <div class="section-inner">
        <div class="section-header">
            <span class="section-label">Tantangan</span>
            <h2>Tantangan yang Dihadapi</h2>
            <p>Setiap hari, anak dengan disabilitas sensorik berjuang melawan kebisingan</p>
        </div>
        <div class="cards-3">
            <div class="problem-card">
                <div class="icon-wrap pink">
                    <svg width="32" height="32" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#E84FA3">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.536 8.464a5 5 0 010 7.072m2.828-9.9a9 9 0 010 12.728M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z"/>
                    </svg>
                </div>
                <h3>Sensitivitas Suara</h3>
                <p>Suara bising bisa memicu kecemasan dan kepanikan pada anak</p>
            </div>
            <div class="problem-card">
                <div class="icon-wrap pink">
                    <svg width="32" height="32" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#E84FA3">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3>Keterbatasan Komunikasi</h3>
                <p>Sulit menyampaikan saat butuh bantuan di tempat ramai</p>
            </div>
            <div class="problem-card">
                <div class="icon-wrap pink">
                    <svg width="32" height="32" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#E84FA3">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                </div>
                <h3>Kekhawatiran Orang Tua</h3>
                <p>Tidak bisa memantau kondisi anak setiap saat</p>
            </div>
        </div>
    </div>
</section>

<!-- FEATURES -->
<section id="fitur" class="features">
    <div class="section-inner">
        <div class="section-header">
            <span class="section-label">Fitur</span>
            <h2>Fitur Unggulan Noise Safe</h2>
            <p>Dirancang khusus untuk memberikan ketenangan bagi anak dan orang tua</p>
        </div>
        <div class="cards-4">
            <div class="feat-card">
                <div class="feat-icon blue">
                    <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.536 8.464a5 5 0 010 7.072m2.828-9.9a9 9 0 010 12.728M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z"/>
                    </svg>
                </div>
                <h3>Noise Cancelling Otomatis</h3>
                <p>Meredam suara bising hingga 32dB secara otomatis</p>
            </div>
            <div class="feat-card">
                <div class="feat-icon lime">
                    <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#94b540">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19V6l12-3v13M9 19c0 1.105-1.343 2-3 2s-3-.895-3-2 1.343-2 3-2 3 .895 3 2zm12-3c0 1.105-1.343 2-3 2s-3-.895-3-2 1.343-2 3-2 3 .895 3 2zM9 10l12-3"/>
                    </svg>
                </div>
                <h3>Suara Menenangkan</h3>
                <p>Putar otomatis white noise saat deteksi kepanikan</p>
            </div>
            <div class="feat-card">
                <div class="feat-icon pink">
                    <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#E84FA3">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                    </svg>
                </div>
                <h3>Tombol Darurat</h3>
                <p>Kirim notifikasi instan ke orang tua</p>
            </div>
            <div class="feat-card">
                <div class="feat-icon purple">
                    <svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#7c5cbf">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                </div>
                <h3>GPS Real-time</h3>
                <p>Pantau lokasi anak dari aplikasi orang tua</p>
            </div>
        </div>
    </div>
</section>

<!-- HOW IT WORKS -->
<section id="cara-kerja" class="how">
    <div class="section-inner">
        <div class="section-header">
            <span class="section-label">Cara Kerja</span>
            <h2>Cara Kerja Noise Safe</h2>
            <p>Tiga langkah sederhana untuk ketenangan anak dan orang tua</p>
        </div>
        <div class="steps">
            <div class="step">
                <div class="step-num">1</div>
                <h3>Anak Pakai Earbud</h3>
                <p>Earbud nyaman dipakai seharian dengan baterai tahan 12 jam</p>
            </div>
            <div class="step">
                <div class="step-num">2</div>
                <h3>Suara Bising Teredam</h3>
                <p>Noise cancelling otomatis aktif, suara menenangkan diputar</p>
            </div>
            <div class="step">
                <div class="step-num">3</div>
                <h3>Butuh Bantuan? Notifikasi!</h3>
                <p>Tekan tombol darurat, orang tua langsung tahu lokasi</p>
            </div>
        </div>
    </div>
</section>

<!-- PRICING -->
<section id="harga" class="pricing">
    <div class="section-inner">
        <div class="section-header">
            <span class="section-label">Harga</span>
            <h2>Pilih Paket yang Tepat</h2>
            <p>Investasi untuk ketenangan buah hati Anda</p>
        </div>
        <div class="pricing-grid">
            <div class="price-card">
                <h3>Starter</h3>
                <p class="subtitle">Cocok untuk mencoba fitur dasar</p>
                <div class="price-amount">Rp 1.299.000</div>
                <ul class="price-features">
                    <li>
                        <svg class="check-icon" width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/></svg>
                        1 unit Earbud
                    </li>
                    <li>
                        <svg class="check-icon" width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/></svg>
                        Akses aplikasi 6 bulan
                    </li>
                    <li>
                        <svg class="check-icon" width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/></svg>
                        Garansi 1 tahun
                    </li>
                </ul>
                <a href="#waiting-list" class="btn-price blue">Daftar Waiting List</a>
            </div>
            <div class="price-card recommended">
                <div class="rec-badge">REKOMENDASI</div>
                <h3>Complete</h3>
                <p class="subtitle">Solusi lengkap untuk keamanan maksimal</p>
                <div class="price-amount" style="color:var(--lime)">Rp 1.999.000</div>
                <ul class="price-features">
                    <li>
                        <svg class="check-icon" width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#B8D964"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/></svg>
                        1 unit Earbud
                    </li>
                    <li>
                        <svg class="check-icon" width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#B8D964"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/></svg>
                        Akses aplikasi seumur hidup
                    </li>
                    <li>
                        <svg class="check-icon" width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#B8D964"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/></svg>
                        Garansi 2 tahun
                    </li>
                    <li>
                        <svg class="check-icon" width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="color:#B8D964"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/></svg>
                        Free suara premium 1 tahun
                    </li>
                </ul>
                <a href="#waiting-list" class="btn-price yellow">Daftar Waiting List</a>
            </div>
        </div>
    </div>
</section>

<!-- WAITING LIST -->
<section id="waiting-list" class="waiting-list">
    <div class="wl-inner">
        <div class="wl-header">
            <span class="wl-label">EARLY ACCESS</span>
            <h2>Daftar Waiting List Sekarang</h2>
            <p>Dapatkan diskon 20% untuk batch pertama!</p>
        </div>
        <div class="wl-form">
            <div class="form-grid">
                <div class="form-group">
                    <label>Nama Lengkap <span>*</span></label>
                    <input type="text" placeholder="Masukkan nama lengkap">
                </div>
                <div class="form-group">
                    <label>Email <span>*</span></label>
                    <input type="email" placeholder="Masukkan email">
                </div>
                <div class="form-group">
                    <label>No WhatsApp <span>*</span></label>
                    <input type="tel" placeholder="08123456789">
                </div>
                <div class="form-group">
                    <label>Pilih Paket <span>*</span></label>
                    <select>
                        <option>Paket Starter - Rp 1.299.000</option>
                        <option>Paket Complete - Rp 1.999.000</option>
                    </select>
                </div>
                <div class="form-group full">
                    <label>Pesan Tambahan (opsional)</label>
                    <textarea placeholder="Ceritakan kebutuhan khusus buah hati Anda..."></textarea>
                </div>
            </div>
            <button class="btn-submit">Daftar Waiting List →</button>
            <p class="form-note">🔒 Data Anda aman dan tidak akan disalahgunakan</p>
        </div>
    </div>
</section>

<!-- FAQ -->
<section id="faq" class="faq">
    <div class="section-inner">
        <div class="section-header">
            <span class="section-label">FAQ</span>
            <h2>Pertanyaan yang Sering Diajukan</h2>
            <p>Ada yang ingin ditanyakan? Kami siap membantu</p>
        </div>
        <div class="faq-list">
            <div class="faq-item">
                <button class="faq-btn" onclick="toggleFaq(this)">
                    Apakah cocok untuk semua usia?
                    <div class="faq-arrow">
                        <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M19 9l-7 7-7-7"/></svg>
                    </div>
                </button>
                <div class="faq-body">Noise Safe dirancang untuk anak dan remaja (5–18 tahun) dengan disabilitas sensorik.</div>
            </div>
            <div class="faq-item">
                <button class="faq-btn" onclick="toggleFaq(this)">
                    Bagaimana cara setting suara?
                    <div class="faq-arrow">
                        <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M19 9l-7 7-7-7"/></svg>
                    </div>
                </button>
                <div class="faq-body">Setting suara dilakukan melalui aplikasi Noise Safe di smartphone orang tua.</div>
            </div>
            <div class="faq-item">
                <button class="faq-btn" onclick="toggleFaq(this)">
                    Kapan produk dikirim?
                    <div class="faq-arrow">
                        <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M19 9l-7 7-7-7"/></svg>
                    </div>
                </button>
                <div class="faq-body">Pengiriman batch pertama akan dimulai setelah produksi selesai. Anda akan mendapat notifikasi via email.</div>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer>
    <p>© 2026 <strong>NoiseSafe</strong>. Dibuat dengan <span class="accent">♥</span> untuk anak-anak istimewa.</p>
</footer>

<script>
function toggleFaq(btn) {
    const item = btn.closest('.faq-item');
    item.classList.toggle('open');
}
</script>
</body>
</html>