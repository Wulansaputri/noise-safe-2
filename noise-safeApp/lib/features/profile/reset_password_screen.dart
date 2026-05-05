import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../shared_widgets/custom_button.dart';
import '../../shared_widgets/custom_header.dart';
import '../../core/constants/app_spacing.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool isOldHidden = true;
  bool isNewHidden = true;
  bool isConfirmHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Column(
        children: [

          /// 🔥 HEADER
          CustomHeader(title: "Keamanan"),

          /// 🔥 CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
                vertical: AppSpacing.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 10),

                  /// TITLE
                  Text(
                    "Mengatur Ulang Kata Sandi",
                    style: GoogleFonts.madimiOne(
                      fontSize: 20,
                      color: Colors.pinkAccent,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Perbarui password akunmu untuk menjaga keamanan data.",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// OLD PASSWORD
                  _buildLabel("Kata Sandi Lama"),
                  const SizedBox(height: 8),
                  _buildPasswordField(
                    controller: oldPassController,
                    isHidden: isOldHidden,
                    onToggle: () {
                      setState(() => isOldHidden = !isOldHidden);
                    },
                  ),

                  const SizedBox(height: 20),

                  /// NEW PASSWORD
                  _buildLabel("Kata Sandi Baru"),
                  const SizedBox(height: 8),
                  _buildPasswordField(
                    controller: newPassController,
                    isHidden: isNewHidden,
                    onToggle: () {
                      setState(() => isNewHidden = !isNewHidden);
                    },
                  ),

                  const SizedBox(height: 20),

                  /// CONFIRM PASSWORD
                  _buildLabel("Konfirmasi Kata Sandi"),
                  const SizedBox(height: 8),
                  _buildPasswordField(
                    controller: confirmPassController,
                    isHidden: isConfirmHidden,
                    onToggle: () {
                      setState(() => isConfirmHidden = !isConfirmHidden);
                    },
                  ),

                  const SizedBox(height: 40),

                  /// BUTTON
                  CustomButton(
                    text: "Simpan Profil",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// LABEL
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(color: AppColors.primary),
    );
  }

  /// PASSWORD FIELD
  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool isHidden,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: isHidden,
      decoration: InputDecoration(
        hintText: "Masukan kata sandi",
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isHidden ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}