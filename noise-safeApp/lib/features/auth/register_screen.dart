import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:noise_safe_1/core/theme/app_colors.dart';

import '../../shared_widgets/custom_button.dart';
import '../../shared_widgets/custom_textfield.dart';
import '../../services/auth_service.dart';
/*
|--------------------------------------------------------------------------
| REGISTER SCREEN - NOISE SAFE
|--------------------------------------------------------------------------
| Halaman untuk membuat akun baru
|
| Fitur:
| - Input nama
| - Input email
| - Input password
| - Input konfirmasi password
| - Navigasi ke login
|--------------------------------------------------------------------------
*/

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  bool isLoading = false;

  /*
  --------------------------------------------------
  AUTO FOCUS KE FIELD PERTAMA
  --------------------------------------------------
  */

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(nameFocus);
    });
  }

  /*
  --------------------------------------------------
  BUILD UI
  --------------------------------------------------
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /*
                  --------------------------------------------------
                  SPACING ATAS
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
                      "Daftar",
                      style: GoogleFonts.madimiOne(
                        fontSize: 22,
                        color: const Color(0xFFF093DA),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /*
                  --------------------------------------------------
                  NAMA
                  --------------------------------------------------
                  */

                  CustomTextField(
                    label: "Nama",
                    hint: "Nama lengkap",
                    controller: nameController,
                    focusNode: nameFocus,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(emailFocus);
                    },
                  ),

                  const SizedBox(height: 20),

                  /*
                  --------------------------------------------------
                  EMAIL
                  --------------------------------------------------
                  */

                  CustomTextField(
                    label: "E-mail",
                    hint: "E-mail",
                    controller: emailController,
                    focusNode: emailFocus,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(phoneFocus);
                    },
                    suffixIcon: const Icon(Icons.email_outlined),
                  ),

                  const SizedBox(height: 20),

                  /*
                  --------------------------------------------------
                  Phone Number
                  --------------------------------------------------
                  */

                  CustomTextField(
                    label: "Phone Number",
                    hint: "Phone Number",
                    controller: phoneController,
                    focusNode: phoneFocus,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                    suffixIcon: const Icon(Icons.phone),
                  ),

                  const SizedBox(height: 20),

                  /*
                  --------------------------------------------------
                  PASSWORD
                  --------------------------------------------------
                  */

                  CustomTextField(
                    label: "Kata Sandi",
                    hint: "Kata Sandi",
                    controller: passwordController,
                    focusNode: passwordFocus,
                    obscureText: isPasswordHidden,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(confirmPasswordFocus);
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

                  const SizedBox(height: 20),

                  /*
                  --------------------------------------------------
                  KONFIRMASI PASSWORD
                  --------------------------------------------------
                  */

                  CustomTextField(
                    label: "Konfirmasi Kata Sandi",
                    hint: "Ulangi kata sandi",
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordFocus,
                    obscureText: isConfirmPasswordHidden,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      _register();
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: AppColors.button,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordHidden = !isConfirmPasswordHidden;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  /*
                  --------------------------------------------------
                  BUTTON DAFTAR
                  --------------------------------------------------
                  */

                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          text: "Daftar",
                          onPressed: _register,
                        ),

                  const SizedBox(height: 25),

                  /*
                  --------------------------------------------------
                  BACK TO LOGIN
                  --------------------------------------------------
                  */

                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "sudah punya akun ?",
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

                  CustomButton(
                    text: "Masuk",
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
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

  /*
  --------------------------------------------------
  REGISTER ACTION
  --------------------------------------------------
  */

  Future<void> _register() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua field wajib diisi")),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password tidak sama")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await AuthService.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
      );

      final token = response['token'];

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Register berhasil")),
          );
          Navigator.pushReplacementNamed(context, "/addDevice");
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

  /*
  --------------------------------------------------
  DISPOSE
  --------------------------------------------------
  */

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    nameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();

    super.dispose();
  }
}