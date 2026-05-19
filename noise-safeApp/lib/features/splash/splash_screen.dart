import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

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
  |----------------------------------------------------------------
  | SPLASH + CHECK TOKEN
  |----------------------------------------------------------------
  */

  void _startSplash() async {

    // ⏳ delay splash
    await Future.delayed(
      const Duration(seconds: 2),
    );

    // 🎬 animasi fade
    await _controller.forward();

    // 🔐 cek token
    final prefs =
        await SharedPreferences.getInstance();

    final token = prefs.getString('token');

    if (!mounted) return;

    // ✅ SUDAH LOGIN
    if (token != null &&
        token.isNotEmpty) {

      Navigator.pushReplacementNamed(
        context,
        "/home",
      );
    }

    // ❌ BELUM LOGIN
    else {

      Navigator.pushReplacementNamed(
        context,
        "/onboarding",
      );
    }
  }

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}