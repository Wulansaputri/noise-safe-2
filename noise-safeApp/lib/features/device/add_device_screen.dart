import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_widgets/custom_button.dart';
import '../../shared_widgets/custom_textfield.dart';
import 'package:noise_safe_1/core/theme/app_colors.dart';
import '../../services/device_service.dart';

/*
|--------------------------------------------------------------------------
| ADD DEVICE SCREEN - NOISE SAFE
|--------------------------------------------------------------------------
| Halaman untuk menambahkan device baru
|
| Fitur:
| - Input nama device
| - Input ID device
| - Tombol tambah device
|--------------------------------------------------------------------------
*/

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {

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

  /*
  --------------------------------------------------
  BUILD UI
  --------------------------------------------------
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [

      /*
      --------------------------------------------------
      CONTENT
      --------------------------------------------------
      */

      Expanded(
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
                    TOP SPACING (BIAR TURUN HALUS)
                    --------------------------------------------------
                    */

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),

                    /*
                    --------------------------------------------------
                    HEADER (CENTER PERFECT)
                    --------------------------------------------------
                    */

                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Kode Perangkat Anda",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.madimiOne(
                              fontSize: 30,
                              color: AppColors.secondary,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Silakan masukkan kode yang tertera di perangkat Anda",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    /*
                    --------------------------------------------------
                    FORM SECTION (LEBIH RAPAT & KONSISTEN)
                    --------------------------------------------------
                    */

                    CustomTextField(
                      label: "Nama Device",
                      hint: "Contoh: Headset Anak",
                      controller: deviceNameController,
                      focusNode: nameFocus,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(idFocus);
                      },
                    ),

                    const SizedBox(height: 16),

                    CustomTextField(
                      label: "ID Device",
                      hint: "Masukkan kode device",
                      controller: deviceIdController,
                      focusNode: idFocus,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) {
                        _addDevice();
                      },
                    ),

                    const SizedBox(height: 32),

                    /*
                    --------------------------------------------------
                    BUTTON (FULL WIDTH)
                    --------------------------------------------------
                    */

                    CustomButton(
                      text: "Tambah Device",
                      onPressed: () {
                          _addDevice();
                        }
                    ),

                    const SizedBox(height: 20),

                    /*
                    --------------------------------------------------
                    FOOTER INFO
                    --------------------------------------------------
                    */

                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Pastikan device dalam kondisi aktif",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 30),
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

    void _addDevice() async {
      try {
        final response = await DeviceService.connectDevice(
          serialNumber: deviceIdController.text,
          ownerName: deviceNameController.text,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response["message"])),
        );

        Navigator.pushReplacementNamed(context, "/home");

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }

  /*
  --------------------------------------------------
  DISPOSE
  --------------------------------------------------
  */

  @override
  void dispose() {
    deviceNameController.dispose();
    deviceIdController.dispose();
    nameFocus.dispose();
    idFocus.dispose();
    super.dispose();
  }
}