import 'package:flutter/material.dart';
import 'device_status_card.dart';
import 'package:noise_safe_1/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../alert/notification_screen.dart';
import '../../../services/user_service.dart';
import '../../../services/device_service.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String name = "";
  bool isLoading = true;

  List devices = [];

  @override
  void initState() {
    super.initState();
    loadUser();
    loadDevices();
  }

  void loadUser() async {
    try {
      final data = await UserService.getProfile();

      if (!mounted) return;

      setState(() {
        name = data['user']['name'];
        isLoading = false;
      });
      
    } catch (e) {
      print("ERROR: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // 🔷 HEADER
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // 🔹 LOGO + TEXT
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/logo2.svg',
                    height: 35,
                  ),
                  const SizedBox(width: 8),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hai!",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),

                      isLoading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  )
                ],
              ),

              /// 🔔 NOTIFICATION ICON
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),

        // 🗺️ MAP
        Container(
          height: 280,
          width: double.infinity,
          color: AppColors.textSecondary,
          child: const Center(child: Text("Google Map Here")),
        ),

        const SizedBox(height: 10),

        // 📱 LIST DEVICE
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: devices.map((device) {
              return DeviceStatusCard(
                isActive: true,
                ownerName: device['owner_name'] ?? '-',
                serialNumber: device['serial_number'] ?? '-',
              );
            }).toList(),
          ),
        )
      ],
    );
  }
      void loadDevices() async {
      try {
        final data = await DeviceService.getDevices();

        if (!mounted) return;

        setState(() {
          devices = data;
        });

      } catch (e) {
        print("DEVICE ERROR: $e");
      }
    }
}