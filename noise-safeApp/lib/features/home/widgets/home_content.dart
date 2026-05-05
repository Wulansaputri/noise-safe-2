import 'package:flutter/material.dart';
import 'device_status_card.dart';
import 'package:noise_safe_1/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../alert/notification_screen.dart';


class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

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

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hai!",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        "Michalle",
                        style: TextStyle(
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
           children: const [
              DeviceStatusCard(isActive: true),
              DeviceStatusCard(isActive: true),
              DeviceStatusCard(isActive: false), 
            ],
          ),
        )
      ],
    ); 
  }
}