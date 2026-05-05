import 'package:flutter/material.dart';
import 'features/splash/splash_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/home/home_screen.dart';
import 'features/device/add_device_screen.dart';
import 'features/profile/profile_screen.dart';

void main() {
  runApp(const NoiseSafeApp());
}

class NoiseSafeApp extends StatelessWidget {
  const NoiseSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: "/",

      routes: {
        "/": (context) => const SplashScreen(),
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/home": (context) => const HomeScreen(),
        "/addDevice": (context) => const AddDeviceScreen(),
        "/profile": (context) => const ProfileScreen(),
      },
    );
  }
}