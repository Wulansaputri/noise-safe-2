import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DeviceStatusCard extends StatelessWidget {
  final bool isActive;
  final String ownerName;
  final String serialNumber;

  const DeviceStatusCard({
    super.key,
    required this.ownerName,
    required this.serialNumber,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

          // 🔵 STRIP WARNA KIRI
          Container(
            width: 6,
            height: 100,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.primary
                  : AppColors.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),

          // 📄 CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // 🔹 NAMA + STATUS
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [

                      // 👤 INFO DEVICE
                      Expanded(
                        child: Row(
                          children: [

                            const Icon(
                              Icons.person,
                              size: 20,
                            ),

                            const SizedBox(width: 6),

                            Expanded(
                              child: Text(
                                ownerName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(width: 6),

                            Text(
                              serialNumber,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      // 🟢 STATUS
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? Colors.green
                              : Colors.red,
                          borderRadius:
                              BorderRadius.circular(8),
                        ),
                        child: Text(
                          isActive
                              ? "Aktif"
                              : "Tidak aktif",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // 🔋 BATTERY
                  const Row(
                    children: [
                      Icon(Icons.battery_full, size: 18),
                      SizedBox(width: 5),
                      Text("89%"),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // 📍 LOKASI
                  const Text(
                    "Gedung Sate, Bandung",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}