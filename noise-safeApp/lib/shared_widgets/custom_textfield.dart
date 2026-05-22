import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noise_safe_1/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly; // 🔥 TAMBAHAN
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  const CustomTextField({
    super.key,
    this.label,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false, // 🔥 TAMBAHAN
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
    this.labelStyle,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /*
        ----------------------------------------------------------
        LABEL TEXT
        ----------------------------------------------------------
        */

        if (label != null && label!.isNotEmpty) ...[
          Text(
            label!,
            style: labelStyle ??
                GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF8BBED7),
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 8),
        ],

        /*
        ----------------------------------------------------------
        INPUT FIELD
        ----------------------------------------------------------
        */

        TextField(
          controller: controller,
          obscureText: obscureText,
          readOnly: readOnly, // 🔥 TAMBAHAN
          focusNode: focusNode,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hint,

            hintStyle: hintStyle ??
                GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.placeholder,
                ),

            filled: true,

            // 🔥 WARNA BEDA JIKA READONLY
            fillColor: readOnly
                ? const Color(0xFFE8E8E8)
                : const Color(0xFFF2F2F2),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),

            suffixIcon: suffixIcon != null
                ? IconTheme(
                    data: const IconThemeData(
                      color: AppColors.button,
                    ),
                    child: suffixIcon!,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}