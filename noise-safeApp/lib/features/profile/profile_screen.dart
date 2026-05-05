import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import 'package:noise_safe_1/shared_widgets/custom_header.dart';
import 'package:noise_safe_1/core/constants/app_spacing.dart';


import 'profile_viewmodel.dart';
import 'edit_profile_screen.dart';
import 'reset_password_screen.dart';
import 'about_app_screen.dart';
import 'faq_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationOn = true;

  final ProfileViewModel viewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          const CustomHeader(
            title: "Profil",
            showBackButton: false,
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.md),

                  /// USER INFO
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                      vertical: AppSpacing.md,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/avatar.svg",
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.name,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              viewModel.email,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),

                  /// STATS
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                    ),
                    child: Row(
                      children: [
                        _buildStatCard(
                          title: "Jumlah Perangkat",
                          value: viewModel.totalDevice.toString(),
                          icon: Icons.devices,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        _buildStatCard(
                          title: "Terhubung",
                          value: viewModel.connectedDevice.toString(),
                          icon: Icons.check_circle_outline,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  /// MENU
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                      vertical: AppSpacing.md,
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          Icons.person_outline,
                          "Profil Saya",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EditProfileScreen(),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),

                        _buildSwitchItem(
                          icon: Icons.notifications_none,
                          title: "Notifikasi",
                          value: isNotificationOn,
                          onChanged: (val) {
                            setState(() => isNotificationOn = val);
                          },
                        ),
                        const SizedBox(height: AppSpacing.md),

                        _buildMenuItem(
                          Icons.lock_outline,
                          "Keamanan",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ResetPasswordScreen(),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),

                        _buildMenuItem(
                          Icons.help_outline,
                          "FAQ",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FAQScreen(),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),

                        _buildMenuItem(
                          Icons.info_outline,
                          "Tentang Aplikasi",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AboutAppScreen(),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        /// LOGOUT
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.logout, color: Colors.red),
                          title: Text(
                            "Keluar",
                            style: GoogleFonts.inter(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => viewModel.logout(context),
                        ),

                        const SizedBox(height: AppSpacing.md),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// SWITCH ITEM (🔥 DIPERKECIL)
  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: GoogleFonts.inter(fontSize: 14),
      ),
      trailing: Transform.scale(
        scale: 0.8, // 🔥 kecilin di sini
        child: Switch(
          value: value,
          activeColor: AppColors.primary,
          activeTrackColor: AppColors.primary.withOpacity(0.3),
          onChanged: onChanged,
        ),
      ),
    );
  }

  /// STAT CARD
  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFDCECF4),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(height: 5),
            Text(title, style: GoogleFonts.inter(fontSize: 11)),
            const SizedBox(height: 5),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// MENU ITEM
  Widget _buildMenuItem(
    IconData icon,
    String title, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: GoogleFonts.inter(fontSize: 14),
      ),
      trailing: const Icon(Icons.chevron_right, size: 18),
      onTap: onTap,
    );
  }
}