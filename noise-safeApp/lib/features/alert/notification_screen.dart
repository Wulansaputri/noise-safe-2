import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import 'package:noise_safe_1/shared_widgets/custom_header.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: CustomHeader(title: "Tentang Aplikasi"),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          NotificationCard(
            name: "Angeli",
            device: "NB200-1",
            battery: "89%",
            location: "Gedung Sate, Bandung",
            isActive: true,
            color: Colors.blue,
          ),
          NotificationCard(
            name: "Angeli",
            device: "NB200-1",
            battery: "89%",
            location: "Gedung Sate, Bandung",
            isActive: false,
            color: Colors.pink,
          ),
          NotificationCard(
            name: "Angeli",
            device: "NB200-1",
            battery: "89%",
            location: "Gedung Sate, Bandung",
            isActive: false,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String name;
  final String device;
  final String battery;
  final String location;
  final bool isActive;
  final Color color;

  const NotificationCard({
    super.key,
    required this.name,
    required this.device,
    required this.battery,
    required this.location,
    required this.isActive,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [

          /// LEFT COLOR BAR
          Container(
            width: 6,
            height: 90,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(14),
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME + STATUS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person_outline, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            name,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            device,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isActive ? "Aktif" : "Tidak aktif",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// BATTERY
                  Row(
                    children: [
                      const Icon(Icons.battery_full, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        battery,
                        style: GoogleFonts.inter(fontSize: 12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  /// LOCATION
                  Text(
                    location,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}