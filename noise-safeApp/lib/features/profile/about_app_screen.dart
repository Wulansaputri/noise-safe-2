import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import 'package:noise_safe_1/shared_widgets/custom_header.dart';
import 'package:noise_safe_1/core/constants/app_spacing.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: AppColors.background,

  appBar: CustomHeader(title: "Tentang Aplikasi"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPadding,
          vertical: AppSpacing.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),

            /// APP NAME
            Text(
              "Noise Safe",
              style: GoogleFonts.madimiOne(
                fontSize: 22,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 10),

            /// DESCRIPTION
            Text(
              "Noise Safe adalah aplikasi berbasis Internet of Things (IoT) yang dirancang untuk membantu anak dengan autisme yang sensitif terhadap suara di lingkungan ramai.\n\n"
              "Aplikasi ini terhubung dengan perangkat khusus yang mampu mendeteksi tingkat kebisingan secara real-time dan memberikan respon berupa white noise atau notifikasi untuk menjaga kenyamanan pengguna.",
              style: GoogleFonts.inter(
                fontSize: 13,
                height: 1.6,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 25),

            /// FITUR TITLE
            Text(
              "Fitur Utama",
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 10),

            _buildFeature("Monitoring Kebisingan", "Mendeteksi tingkat suara secara real-time."),
            _buildFeature("White Noise", "Membantu menenangkan pengguna saat lingkungan terlalu bising."),
            _buildFeature("Emergency Button", "Tombol darurat untuk kondisi tidak nyaman."),
            _buildFeature("GPS Tracking", "Memantau lokasi pengguna untuk keamanan tambahan."),

            const SizedBox(height: 25),

            /// VERSION
            Text(
              "Versi Aplikasi",
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "1.0.0",
              style: GoogleFonts.inter(fontSize: 13),
            ),

            const SizedBox(height: 25),

            /// FOOTER
            Center(
              child: Text(
                "© 2026 Noise Safe\nAll Rights Reserved",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 18, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$title\n",
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: desc,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}