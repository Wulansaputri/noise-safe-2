import 'package:flutter/material.dart';
import 'device_status_card.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
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

        SizedBox(
        height: 280,
        width: double.infinity,

        child: FlutterMap(

          options: const MapOptions(

            initialCenter: LatLng(
              -6.9175,
              107.6191,
            ),

            initialZoom: 13,
          ),

          children: [

            TileLayer(

              urlTemplate:
                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

              userAgentPackageName:
                  'com.example.noise_safe_1',
            ),

            MarkerLayer(

              markers: [

                Marker(

                  point: const LatLng(
                    -6.9175,
                    107.6191,
                  ),

                  width: 80,
                  height: 80,

                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

        const SizedBox(height: 10),

        // 📱 LIST DEVICE
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: devices.map((device) {
              return DeviceStatusCard(
                isActive:
                    device['status'] == 'active',

                ownerName:
                    device['owner_name'] ?? '-',

                serialNumber:
                    device['serial_number'] ?? '-',
              );
            }).toList(),
          ),
        )
      ],
    );
  }
      void loadDevices() async {

  try {

    final data =
        await DeviceService.getDevices();

    print("HOME DEVICES: $data");

    if (!mounted) return;

    setState(() {

      devices = data;
    });

  } catch (e) {

    print("DEVICE ERROR: $e");
  }
}}