import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_widgets/custom_button.dart';
import '../../shared_widgets/custom_textfield.dart';
import '../../core/theme/app_colors.dart';

/*
|--------------------------------------------------------------------------
| ADD DEVICE SCREEN - NOISE SAFE
|--------------------------------------------------------------------------
*/

class AddDevice2Screen extends StatefulWidget {
  const AddDevice2Screen({super.key});

  @override
  State<AddDevice2Screen> createState() => _AddDevice2ScreenState();
}

class _AddDevice2ScreenState extends State<AddDevice2Screen> {

  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController deviceIdController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode idFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(nameFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: Column(
        children: [

          /*
          --------------------------------------------------
          HEADER (DENGAN SHADOW)
          --------------------------------------------------
          */

          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tambah Perangkat",
                  style: GoogleFonts.madimiOne(
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),

          /*
          --------------------------------------------------
          CONTENT
          --------------------------------------------------
          */

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),

                child: IntrinsicHeight(
                  child: Column(
                    children: [

                      const Spacer(),

                      /*
                      ---------------------------
                      TITLE
                      ---------------------------
                      */

                      Text(
                        "Kode Perangkat Anda",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.madimiOne(
                          fontSize: 22,
                          color: AppColors.secondary,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Silakan masukkan kode yang tertera di perangkat Anda",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 40),

                      /*
                      ---------------------------
                      INPUT DEVICE ID
                      ---------------------------
                      */

                      CustomTextField(
                        label: "Nomor Perangkat",
                        hint: "Nomor Perangkat",
                        controller: deviceIdController,
                        focusNode: idFocus,
                        textInputAction: TextInputAction.next,
                        suffixIcon: const Icon(Icons.graphic_eq),
                        onSubmitted: (_) {
                          FocusScope.of(context).requestFocus(nameFocus);
                        },
                      ),

                      const SizedBox(height: 16),

                      /*
                      ---------------------------
                      INPUT NAME
                      ---------------------------
                      */

                      CustomTextField(
                        label: "Nama",
                        hint: "Masukkan Nama Perangkat",
                        controller: deviceNameController,
                        focusNode: nameFocus,
                        textInputAction: TextInputAction.done,
                        suffixIcon: const Icon(Icons.graphic_eq),
                        onSubmitted: (_) {
                          _addDevice();
                        },
                      ),

                      const SizedBox(height: 30),

                      /*
                      ---------------------------
                      BUTTON
                      ---------------------------
                      */

                      CustomButton(
                        text: "Tambah Perangkat",
                        onPressed: () {
                          _addDevice();
                        },
                      ),

                      const Spacer(),

                      /*
                      ---------------------------
                      FOOTER INFO
                      ---------------------------
                      */

                      Text(
                        "Pastikan device dalam kondisi aktif",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*
  --------------------------------------------------
  ACTION TAMBAH DEVICE
  --------------------------------------------------
  */

  void _addDevice() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Device berhasil ditambahkan"),
      ),
    );
  }

  @override
  void dispose() {
    deviceNameController.dispose();
    deviceIdController.dispose();
    nameFocus.dispose();
    idFocus.dispose();
    super.dispose();
  }
}