import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
|--------------------------------------------------------------------------
| Splash Screen - Noise Safe
|--------------------------------------------------------------------------
| Halaman pertama yang muncul saat aplikasi dibuka.
| Fungsi utama:
| 1. Menampilkan logo aplikasi di tengah layar
| 2. Memberi waktu loading singkat
| 3. Melakukan transisi fade menuju halaman onboarding
|
| Desain mengikuti UI:
| - Background putih
| - Logo SVG di tengah
| - Animasi fade out saat pindah halaman
|--------------------------------------------------------------------------
*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  /*
  |--------------------------------------------------------------------------
  | INIT STATE
  |--------------------------------------------------------------------------
  | - Menginisialisasi animation controller
  | - Mengatur durasi animasi fade
  | - Menjalankan timer sebelum pindah ke onboarding
  |--------------------------------------------------------------------------
  */

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller);

    _startSplash();
  }

  /*
  |--------------------------------------------------------------------------
  | SPLASH TIMER
  |--------------------------------------------------------------------------
  | Memberikan delay sekitar 2 detik sebelum animasi fade dimulai
  | Setelah animasi selesai -> navigasi ke halaman onboarding
  |--------------------------------------------------------------------------
  */

  void _startSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    await _controller.forward();

    if (mounted) {
      Navigator.pushReplacementNamed(context, "/onboarding");
    }
  }

  /*
  |--------------------------------------------------------------------------
  | BUILD UI SPLASH SCREEN
  |--------------------------------------------------------------------------
  | Layout sangat sederhana:
  | - Scaffold
  | - Background putih
  | - Logo SVG di tengah layar
  | - Dibungkus FadeTransition untuk efek fade out
  |--------------------------------------------------------------------------
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: FadeTransition(
        opacity: _fadeAnimation,

        child: Center(
          child: SvgPicture.asset(
            "assets/icons/logoUtama.svg",
            width: 180,
          ),
        ),
      ),
    );
  }

  /*
  |--------------------------------------------------------------------------
  | DISPOSE
  |--------------------------------------------------------------------------
  | Membersihkan animation controller agar tidak terjadi memory leak
  |--------------------------------------------------------------------------
  */

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}