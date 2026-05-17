import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared_widgets/custom_button.dart';
import '../../../shared_widgets/custom_textfield.dart';
import '../../../shared_widgets/custom_header.dart';
import '../../core/constants/app_spacing.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
late TextEditingController nameController;
late TextEditingController emailController;
late TextEditingController phoneController;

bool isSaving = false;

@override
void dispose() {
  nameController.dispose();
  emailController.dispose();
  phoneController.dispose();
  super.dispose();
}

@override
void initState() {
  super.initState();

  nameController =
      TextEditingController(text: widget.name);

  emailController =
      TextEditingController(text: widget.email);

  phoneController =
      TextEditingController();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Column(
        children: [
          CustomHeader(title: "Edit Profil"),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
                vertical: AppSpacing.md,
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// PROFILE IMAGE
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// ===== NAMA =====
                  _buildLabel("Nama"),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: nameController,
                    hint: 'Masukan nama',
                  ),

                  const SizedBox(height: 20),

                  /// ===== EMAIL =====
                  _buildLabel("Email"),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: emailController,
                    hint: 'Masukan email',
                  ),

                  const SizedBox(height: 20),

                  /// ===== NOMOR DARURAT =====
                  _buildLabel("Nomor Darurat"),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Text("+62"),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child: CustomTextField(
                          controller: phoneController,
                          hint: 'Masukan nomor',
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 40),

                  /// ===== BUTTON =====
                  CustomButton(
                    text: "Simpan Profil",
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

  /// 🔥 LABEL
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }

    Future<void> updateProfile() async {

    setState(() {
      isSaving = true;
    });

    try {

      /// NANTI API UPDATE DI SINI

      await Future.delayed(
        const Duration(seconds: 1),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Profil berhasil diperbarui"),
        ),
      );

      Navigator.pop(context, true);

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
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
}