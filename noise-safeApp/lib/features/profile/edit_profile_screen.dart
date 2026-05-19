import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared_widgets/custom_button.dart';
import '../../../shared_widgets/custom_textfield.dart';
import '../../../shared_widgets/custom_header.dart';
import '../../core/constants/app_spacing.dart';
import '../../../services/avatar_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends State<EditProfileScreen> {

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  bool isSaving = false;

  /*
  |--------------------------------------------------------------------------
  | AVATAR
  |--------------------------------------------------------------------------
  */

  String currentAvatar =
      "assets/avatars/avatar1.png";

  bool isLoadingAvatar = true;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: widget.name,
    );

    emailController = TextEditingController(
      text: widget.email,
    );

    phoneController = TextEditingController();

    _loadAvatar();
  }

  @override
  void dispose() {

    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  /*
  |--------------------------------------------------------------------------
  | LOAD AVATAR
  |--------------------------------------------------------------------------
  */

  Future<void> _loadAvatar() async {

    try {

      final avatar =
          await AvatarService.getAvatar();

      if (mounted) {

        setState(() {

          currentAvatar = avatar;
          isLoadingAvatar = false;
        });
      }

    } catch (e) {

      print("ERROR LOAD AVATAR: $e");

      if (mounted) {

        setState(() {

          isLoadingAvatar = false;
        });
      }
    }
  }

  /*
  |--------------------------------------------------------------------------
  | CHANGE AVATAR
  |--------------------------------------------------------------------------
  */

  Future<void> _changeAvatar() async {

    final result = await Navigator.push(

      context,

      MaterialPageRoute(
        builder: (context) =>
            AvatarSelectionScreen(
          currentAvatar: currentAvatar,
        ),
      ),
    );

    if (result != null &&
        result is String) {

      setState(() {

        currentAvatar = result;
      });
    }
  }

  /*
  |--------------------------------------------------------------------------
  | UPDATE PROFILE
  |--------------------------------------------------------------------------
  */

  Future<void> updateProfile() async {

    setState(() {

      isSaving = true;
    });

    try {

      final prefs =
          await SharedPreferences.getInstance();

      /*
      ------------------------------------------------
      SIMPAN DATA
      ------------------------------------------------
      */

      await prefs.setString(
        'name',
        nameController.text,
      );

      await prefs.setString(
        'email',
        emailController.text,
      );

      await prefs.setString(
        'user_avatar',
        currentAvatar,
      );

      /*
      ------------------------------------------------
      DELAY
      ------------------------------------------------
      */

      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            "Profil berhasil diperbarui",
          ),
        ),
      );

      /*
      ------------------------------------------------
      KIRIM TRUE KE PROFILE SCREEN
      ------------------------------------------------
      */

      Navigator.pop(context, true);

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text("Error: $e"),
        ),
      );

    } finally {

      if (mounted) {

        setState(() {

          isSaving = false;
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

      backgroundColor:
          AppColors.background,

      body: Column(
        children: [

          const CustomHeader(
            title: "Edit Profil",
          ),

          Expanded(

            child: SingleChildScrollView(

              padding:
                  const EdgeInsets.symmetric(

                horizontal:
                    AppSpacing.screenPadding,

                vertical:
                    AppSpacing.md,
              ),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  /*
                  ------------------------------------------------
                  AVATAR
                  ------------------------------------------------
                  */

                  Center(
                    child: Column(
                      children: [

                        InkWell(

                          onTap: _changeAvatar,

                          borderRadius:
                              BorderRadius.circular(
                            100,
                          ),

                          child: Stack(

                            alignment:
                                Alignment.bottomRight,

                            children: [

                              Container(

                                padding:
                                    const EdgeInsets.all(
                                  4,
                                ),

                                decoration:
                                    BoxDecoration(

                                  shape:
                                      BoxShape.circle,

                                  gradient:
                                      LinearGradient(
                                    colors: [

                                      AppColors.primary,

                                      const Color(
                                        0xFF8EC5FC,
                                      ),
                                    ],
                                  ),

                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black
                                              .withOpacity(
                                        0.12,
                                      ),
                                      blurRadius: 12,
                                      offset:
                                          const Offset(
                                        0,
                                        4,
                                      ),
                                    ),
                                  ],
                                ),

                                child: isLoadingAvatar

                                    ? const CircleAvatar(
                                        radius: 50,
                                        backgroundColor:
                                            Colors.white,
                                        child:
                                            CircularProgressIndicator(),
                                      )

                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundColor:
                                            Colors.white,
                                        backgroundImage:
                                            AssetImage(
                                          currentAvatar,
                                        ),
                                      ),
                              ),

                              Container(

                                padding:
                                    const EdgeInsets.all(
                                  8,
                                ),

                                decoration:
                                    BoxDecoration(

                                  color:
                                      AppColors.primary,

                                  shape:
                                      BoxShape.circle,

                                  border: Border.all(
                                    color:
                                        Colors.white,
                                    width: 2,
                                  ),
                                ),

                                child: const Icon(
                                  Icons.edit,
                                  color:
                                      Colors.white,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        InkWell(

                          onTap: _changeAvatar,

                          borderRadius:
                              BorderRadius.circular(
                            30,
                          ),

                          child: Container(

                            padding:
                                const EdgeInsets.symmetric(

                              horizontal: 20,
                              vertical: 12,
                            ),

                            decoration:
                                BoxDecoration(

                              color:
                                  const Color(
                                0xFFEAF4FB,
                              ),

                              borderRadius:
                                  BorderRadius.circular(
                                30,
                              ),

                              border: Border.all(
                                color:
                                    AppColors.primary
                                        .withOpacity(
                                  0.25,
                                ),
                              ),
                            ),

                            child: Row(

                              mainAxisSize:
                                  MainAxisSize.min,

                              children: [

                                Icon(
                                  Icons.image_outlined,
                                  size: 18,
                                  color:
                                      AppColors.primary,
                                ),

                                const SizedBox(
                                  width: 8,
                                ),

                                Text(

                                  "Ganti Avatar",

                                  style: TextStyle(
                                    color:
                                        AppColors.primary,
                                    fontWeight:
                                        FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  /*
                  ------------------------------------------------
                  NAMA
                  ------------------------------------------------
                  */

                  _buildLabel("Nama"),

                  const SizedBox(height: 8),

                  CustomTextField(
                    controller: nameController,
                    hint: 'Masukan nama',
                  ),

                  const SizedBox(height: 20),

                  /*
                  ------------------------------------------------
                  EMAIL
                  ------------------------------------------------
                  */

                  _buildLabel("Email"),

                  const SizedBox(height: 8),

                  CustomTextField(
                    controller: emailController,
                    hint: 'Masukan email',
                  ),

                  const SizedBox(height: 20),

                  /*
                  ------------------------------------------------
                  NOMOR DARURAT
                  ------------------------------------------------
                  */

                  _buildLabel("Nomor Darurat"),

                  const SizedBox(height: 8),

                  Row(
                    children: [

                      Container(

                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),

                        decoration:
                            BoxDecoration(

                          color:
                              const Color(
                            0xFFF2F2F2,
                          ),

                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),
                        ),

                        child: const Row(
                          children: [

                            Text("+62"),

                            Icon(
                              Icons.arrow_drop_down,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: CustomTextField(
                          controller:
                              phoneController,
                          hint:
                              'Masukan nomor',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  /*
                  ------------------------------------------------
                  BUTTON
                  ------------------------------------------------
                  */

                  CustomButton(

                    text: isSaving
                        ? "Menyimpan..."
                        : "Simpan Profil",

                    onPressed: isSaving

                        ? null

                        : () async {

                            await updateProfile();
                          },
                  ),

                  const SizedBox(height: 20),
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
  | LABEL
  |--------------------------------------------------------------------------
  */

  Widget _buildLabel(String text) {

    return Text(

      text,

      style: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}