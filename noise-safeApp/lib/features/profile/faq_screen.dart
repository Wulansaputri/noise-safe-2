import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../shared_widgets/custom_header.dart';
import '../../core/constants/app_spacing.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Column(
        children: [

          /// 🔥 HEADER
          CustomHeader(title: "FAQ"),

          /// 🔥 CONTENT
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
                vertical: AppSpacing.md,
              ),
              children: [

                _buildFAQItem(
                  "Apa itu Noise Safe?",
                  "Noise Safe adalah aplikasi berbasis IoT yang membantu anak dengan autisme dalam menghadapi lingkungan yang bising dengan memberikan monitoring suara dan respon otomatis.",
                ),

                _buildFAQItem(
                  "Bagaimana cara kerja perangkat Noise Safe?",
                  "Perangkat akan mendeteksi tingkat kebisingan di sekitar pengguna. Jika suara terlalu tinggi, sistem akan memberikan white noise atau notifikasi untuk membantu pengguna tetap tenang.",
                ),

                _buildFAQItem(
                  "Apakah aplikasi ini harus terhubung dengan perangkat?",
                  "Ya, untuk fitur utama seperti monitoring suara dan white noise, aplikasi harus terhubung dengan perangkat Noise Safe.",
                ),

                _buildFAQItem(
                  "Apa fungsi tombol emergency?",
                  "Tombol emergency digunakan untuk mengirim sinyal darurat ke orang tua atau pendamping ketika pengguna merasa tidak nyaman atau dalam kondisi berbahaya.",
                ),

                _buildFAQItem(
                  "Apakah aplikasi ini bisa melacak lokasi?",
                  "Ya, aplikasi dilengkapi fitur GPS tracking untuk membantu memantau lokasi pengguna secara real-time demi keamanan.",
                ),

                _buildFAQItem(
                  "Bagaimana jika perangkat tidak terhubung?",
                  "Aplikasi tetap bisa digunakan, namun fitur utama seperti monitoring suara tidak akan aktif sampai perangkat terhubung kembali.",
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        iconColor: AppColors.primary,
        collapsedIconColor: Colors.grey,

        title: Text(
          question,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        children: [
          Text(
            answer,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}