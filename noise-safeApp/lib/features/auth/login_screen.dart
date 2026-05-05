import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared_widgets/custom_button.dart';
import '../../shared_widgets/custom_textfield.dart';
import 'package:noise_safe_1/core/theme/app_colors.dart';
import '../../services/auth_service.dart';

/*
|--------------------------------------------------------------------------
| LOGIN SCREEN (FIXED & CLEAN)
|--------------------------------------------------------------------------
| Perbaikan:
| - Struktur Column diperbaiki
| - ConstrainedBox dipakai dengan benar
| - Spacing atas dibuat responsif
|--------------------------------------------------------------------------
*/

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool isPasswordHidden = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(emailFocus);
    });
  }

  Future<void> _login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email dan password wajib diisi")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await AuthService.login(
        email: emailController.text,
        password: passwordController.text,
      );

      final token = response['token'];
      
      if (token != null) {
        // Simpan token ke SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        if (mounted) {
          Navigator.pushReplacementNamed(context, "/home");
        }
      } else {
        throw Exception("Token tidak ditemukan dalam respons");
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceAll("Exception: ", ""))),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),

          /*
          --------------------------------------------------
          CENTER + CONSTRAINED BOX
          --------------------------------------------------
          Biar layout tetap rapi di tablet / layar besar
          --------------------------------------------------
          */

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /*
                  --------------------------------------------------
                  SPACING ATAS (RESPONSIVE)
                  --------------------------------------------------
                  */

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),

                  /*
                  --------------------------------------------------
                  LOGO
                  --------------------------------------------------
                  */

                  Center(
                    child: SvgPicture.asset(
                      "assets/icons/logo.svg",
                      width: 160,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /*
                  --------------------------------------------------
                  TITLE
                  --------------------------------------------------
                  */

                  Center(
                    child: Text(
                      "Masuk",
                      style: GoogleFonts.madimiOne(
                        fontSize: 22,
                        color: const Color(0xFFF093DA),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /*
                  --------------------------------------------------
                  EMAIL FIELD
                  --------------------------------------------------
                  */

                  CustomTextField(
                    label: "E-mail",
                    hint: "E-mail",
                    controller: emailController,
                    suffixIcon: const Icon
                      (Icons.email_outlined),
                    focusNode: emailFocus,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                  ),

                  const SizedBox(height: 20),

                  /*
                  --------------------------------------------------
                  PASSWORD FIELD
                  --------------------------------------------------
                  */

                  CustomTextField(
                    label: "Kata Sandi",
                    hint: "Kata Sandi",
                    controller: passwordController,
                    obscureText: isPasswordHidden,
                    focusNode: passwordFocus,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      _login();
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: AppColors.button,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  /*
                  --------------------------------------------------
                  LOGIN BUTTON
                  --------------------------------------------------
                  */

                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          text: "Masuk",
                          onPressed: _login,
                        ),

                  const SizedBox(height: 25),

                  /*
                  --------------------------------------------------
                  DIVIDER
                  --------------------------------------------------
                  */

                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Belum memiliki akun ?",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /*
                  --------------------------------------------------
                  REGISTER BUTTON
                  --------------------------------------------------
                  */

                  CustomButton(
                    text: "Daftar",
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }
}


