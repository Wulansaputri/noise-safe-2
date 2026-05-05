import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  /*
  |--------------------------------------------------------------------------
  | BUILD UI
  |--------------------------------------------------------------------------
  | Menggunakan Stack agar background SVG berada di layer paling bawah
  | dan konten berada di atasnya.
  |--------------------------------------------------------------------------
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*
          --------------------------------------------------------------
          BACKGROUND SVG
          --------------------------------------------------------------
          SVG digunakan sebagai background agar sesuai dengan design UI
          dan tetap scalable pada berbagai ukuran layar.
          --------------------------------------------------------------
          */
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/images/onboarding.svg",
              fit: BoxFit.cover,
            ),
          ),

          /*
          --------------------------------------------------------------
          MAIN CONTENT
          --------------------------------------------------------------
          Konten utama ditempatkan menggunakan Column agar elemen
          tersusun secara vertikal
          --------------------------------------------------------------
          */
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /*
                  --------------------------------------------------
                  LOGO NOISE SAFE
                  --------------------------------------------------
                  Logo menggunakan SVG agar tetap tajam di semua
                  resolusi layar
                  --------------------------------------------------
                  */
                  const Spacer(flex: 2),

                  Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/logo.svg",
                        width: 180,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "pertolongan untuk si buah hati",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 3),

                  /*
                  --------------------------------------------------
                  BUTTON MULAI
                  --------------------------------------------------
                  Tombol utama untuk melanjutkan ke halaman login
                  menggunakan warna button dari design system
                  --------------------------------------------------
                  */
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        /*
                        ----------------------------------------------
                        NAVIGASI KE HALAMAN LOGIN
                        ----------------------------------------------
                        Menggunakan pushReplacement agar user tidak
                        kembali ke onboarding saat menekan back
                        ----------------------------------------------
                        */
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: Text(
                        "mulai",
                        style: GoogleFonts.madimiOne(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}