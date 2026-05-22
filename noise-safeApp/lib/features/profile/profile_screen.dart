import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/app_colors.dart';
import 'package:noise_safe_1/shared_widgets/custom_header.dart';
import 'package:noise_safe_1/core/constants/app_spacing.dart';

import '../../services/device_service.dart';
import '../../services/avatar_service.dart';
import '../../services/user_service.dart';

import 'profile_viewmodel.dart';
import 'edit_profile_screen.dart';
import 'reset_password_screen.dart';
import 'about_app_screen.dart';
import 'faq_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {

  bool isNotificationOn = true;

  String name = "";
  String email = "";

  String currentAvatar =
      "assets/avatars/avatar1.png";

  bool isLoading = true;

  int totalDevice = 0;
  int connectedDevice = 0;

  final ProfileViewModel viewModel =
      ProfileViewModel();

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  /*
  |--------------------------------------------------------------------------
  | LOAD PROFILE
  |--------------------------------------------------------------------------
  */

 Future<void> loadProfile() async {

  try {

    final prefs =
        await SharedPreferences.getInstance();

    /*
    ------------------------------------------
    GET PROFILE DARI API
    ------------------------------------------
    */

    final profileData =
        await UserService.getProfile();

    final user = profileData['user'];

    /*
    ------------------------------------------
    DEVICE
    ------------------------------------------
    */

    final devices =
        await DeviceService.getDevices();

    /*
    ------------------------------------------
    AVATAR
    ------------------------------------------
    */

    final avatar =
        await AvatarService.getAvatar();

    if (!mounted) return;

    setState(() {

      /*
      ------------------------------------------
      NAME
      ------------------------------------------
      */

      name =
          prefs.getString('name') ??
          user['name'] ??
          "";

      /*
      ------------------------------------------
      EMAIL (DARI DATABASE/API)
      ------------------------------------------
      */

      email =
          user['email'] ?? "";

      /*
      ------------------------------------------
      AVATAR
      ------------------------------------------
      */

      currentAvatar = avatar;

      /*
      ------------------------------------------
      DEVICE
      ------------------------------------------
      */

      totalDevice = devices.length;

      connectedDevice = devices.where(
        (e) => e['is_active'] == true,
      ).length;

      isLoading = false;
    });

  } catch (e) {

    print("PROFILE ERROR: $e");

    if (mounted) {

      setState(() {

        isLoading = false;
      });
    }
  }
}

  /*
  |--------------------------------------------------------------------------
  | BUILD
  |--------------------------------------------------------------------------
  */

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

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

                  const SizedBox(
                    height: AppSpacing.md,
                  ),

                  /*
                  ------------------------------------------------
                  USER INFO
                  ------------------------------------------------
                  */

                  Padding(

                    padding:
                        const EdgeInsets.symmetric(

                      horizontal:
                          AppSpacing.screenPadding,

                      vertical: AppSpacing.md,
                    ),

                    child: Row(
                      children: [

                        /*
                        ----------------------------------------
                        AVATAR
                        ----------------------------------------
                        */

                        Container(

                          decoration: BoxDecoration(

                            shape: BoxShape.circle,

                            border: Border.all(
                              color:
                                  AppColors.primary,

                              width: 2,
                            ),

                            boxShadow: [

                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.08),

                                blurRadius: 10,

                                offset:
                                    const Offset(0, 4),
                              ),
                            ],
                          ),

                          child: CircleAvatar(

                            radius: 32,

                            backgroundColor:
                                Colors.white,

                            backgroundImage:
                                AssetImage(
                              currentAvatar,
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                        /*
                        ----------------------------------------
                        NAME & EMAIL
                        ----------------------------------------
                        */

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              isLoading ? "Loading..." : name,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              isLoading
                                  ? "Loading..."
                                  : (email.isEmpty
                                      ? "email@gmail.com"
                                      : email),
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: AppSpacing.sm,
                  ),

                  /*
                  ------------------------------------------------
                  STATS
                  ------------------------------------------------
                  */

                  Padding(

                    padding:
                        const EdgeInsets.symmetric(
                      horizontal:
                          AppSpacing.screenPadding,
                    ),

                    child: Row(
                      children: [

                        _buildStatCard(

                          title: "Jumlah Perangkat",

                          value:
                              totalDevice.toString(),

                          icon: Icons.devices,
                        ),

                        const SizedBox(
                          width: AppSpacing.sm,
                        ),

                        _buildStatCard(

                          title: "Terhubung",

                          value:
                              connectedDevice.toString(),

                          icon:
                              Icons.check_circle_outline,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: AppSpacing.sm,
                  ),

                  /*
                  ------------------------------------------------
                  MENU
                  ------------------------------------------------
                  */

                  Padding(

                    padding:
                        const EdgeInsets.symmetric(

                      horizontal:
                          AppSpacing.screenPadding,

                      vertical: AppSpacing.md,
                    ),

                    child: Column(
                      children: [

                        /*
                        ----------------------------------------
                        EDIT PROFILE
                        ----------------------------------------
                        */

                        _buildMenuItem(

                          Icons.person_outline,

                          "Profil Saya",

                          onTap: () async {

                            final result =
                                await Navigator.push(

                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    EditProfileScreen(

                                  name: name,
                                  email: email,
                                ),
                              ),
                            );

                            /*
                            REFRESH
                            */

                            if (result == true) {

                              loadProfile();
                            }
                          },
                        ),

                        const SizedBox(
                          height: AppSpacing.md,
                        ),

                        /*
                        ----------------------------------------
                        NOTIFIKASI
                        ----------------------------------------
                        */

                        _buildSwitchItem(

                          icon:
                              Icons.notifications_none,

                          title: "Notifikasi",

                          value: isNotificationOn,

                          onChanged: (val) {

                            setState(() {

                              isNotificationOn = val;
                            });
                          },
                        ),

                        const SizedBox(
                          height: AppSpacing.md,
                        ),

                        /*
                        ----------------------------------------
                        KEAMANAN
                        ----------------------------------------
                        */

                        _buildMenuItem(

                          Icons.lock_outline,

                          "Keamanan",

                          onTap: () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    const ResetPasswordScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(
                          height: AppSpacing.md,
                        ),

                        /*
                        ----------------------------------------
                        FAQ
                        ----------------------------------------
                        */

                        _buildMenuItem(

                          Icons.help_outline,

                          "FAQ",

                          onTap: () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    const FAQScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(
                          height: AppSpacing.md,
                        ),

                        /*
                        ----------------------------------------
                        ABOUT APP
                        ----------------------------------------
                        */

                        _buildMenuItem(

                          Icons.info_outline,

                          "Tentang Aplikasi",

                          onTap: () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    const AboutAppScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(
                          height: AppSpacing.lg,
                        ),

                        /*
                        ----------------------------------------
                        LOGOUT
                        ----------------------------------------
                        */

                        ListTile(

                          contentPadding:
                              EdgeInsets.zero,

                          leading: const Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),

                          title: Text(

                            "Keluar",

                            style:
                                GoogleFonts.inter(

                              color: Colors.red,

                              fontWeight:
                                  FontWeight.w500,
                            ),
                          ),

                          onTap: () =>
                              logout(context),
                        ),
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

  /*
  |--------------------------------------------------------------------------
  | LOGOUT
  |--------------------------------------------------------------------------
  */

  Future<void> logout(
    BuildContext context,
  ) async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove('token');

    Navigator.pushNamedAndRemoveUntil(

      context,

      "/login",

      (route) => false,
    );
  }

  /*
  |--------------------------------------------------------------------------
  | SWITCH ITEM
  |--------------------------------------------------------------------------
  */

  Widget _buildSwitchItem({

    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,

  }) {

    return ListTile(

      contentPadding: EdgeInsets.zero,

      leading:
          Icon(icon, color: Colors.grey),

      title: Text(

        title,

        style: GoogleFonts.inter(
          fontSize: 14,
        ),
      ),

      trailing: Transform.scale(

        scale: 0.8,

        child: Switch(

          value: value,

          activeColor:
              AppColors.primary,

          activeTrackColor:
              AppColors.primary
                  .withOpacity(0.3),

          onChanged: onChanged,
        ),
      ),
    );
  }

  /*
  |--------------------------------------------------------------------------
  | STAT CARD
  |--------------------------------------------------------------------------
  */

  Widget _buildStatCard({

    required String title,
    required String value,
    required IconData icon,

  }) {

    return Expanded(

      child: Container(

        padding:
            const EdgeInsets.symmetric(
          vertical: 14,
        ),

        decoration: BoxDecoration(

          color:
              const Color(0xFFDCECF4),

          borderRadius:
              BorderRadius.circular(14),
        ),

        child: Column(
          children: [

            Icon(
              icon,
              size: 18,
              color: AppColors.primary,
            ),

            const SizedBox(height: 5),

            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 5),

            Text(

              value,

              style: GoogleFonts.inter(

                fontSize: 15,

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
  |--------------------------------------------------------------------------
  | MENU ITEM
  |--------------------------------------------------------------------------
  */

  Widget _buildMenuItem(

    IconData icon,
    String title, {

    VoidCallback? onTap,

  }) {

    return ListTile(

      contentPadding:
          EdgeInsets.zero,

      leading:
          Icon(icon, color: Colors.grey),

      title: Text(

        title,

        style: GoogleFonts.inter(
          fontSize: 14,
        ),
      ),

      trailing: const Icon(
        Icons.chevron_right,
        size: 18,
      ),

      onTap: onTap,
    );
  }
}