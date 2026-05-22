import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../services/device_service.dart';

class ManageDeviceScreen extends StatefulWidget {
  const ManageDeviceScreen({super.key});

  @override
  State<ManageDeviceScreen> createState() =>
      _ManageDeviceScreenState();
}

class _ManageDeviceScreenState
    extends State<ManageDeviceScreen> {
  List<dynamic> devices = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDevices();
  }

  /*
  |--------------------------------------------------------------------------
  | LOAD DEVICES
  |--------------------------------------------------------------------------
  */

  Future<void> loadDevices() async {

    try {

      final result =
          await DeviceService.getDevices();

      if (!mounted) return;

      setState(() {

        devices = result;

        isLoading = false;
      });

    } catch (e) {

      print("DEVICE ERROR: $e");

      setState(() {
        isLoading = false;
      });
    }
  }

  /*
  |--------------------------------------------------------------------------
  | DELETE DIALOG
  |--------------------------------------------------------------------------
  */

  void showDeleteDialog(dynamic device) {

    final controller =
        TextEditingController();

    showDialog(
      context: context,
      builder: (_) {

        return AlertDialog(

          title: const Text(
            "Hapus Device",
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                "Masukkan Serial Number (${device['serial_number']}) untuk konfirmasi.",
              ),

              const SizedBox(height: 16),

              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Masukkan Serial Number",
                ),
              ),
            ],
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Batal"),
            ),

              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),

              onPressed: () async {

                final inputId = controller.text.trim();
                final serialNumber = device['serial_number'].toString();
                final deviceId = (device['device_id'] as num).toInt().toString();

                if (inputId == serialNumber) {

                  await DeviceService.deleteDevice(
                    int.parse(deviceId),
                  );

                  setState(() {

                    devices.remove(device);
                  });

                  Navigator.pop(context);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Device berhasil dihapus",
                      ),
                    ),
                  );

                } else {

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "ID tidak cocok",
                      ),
                    ),
                  );
                }
              },

              child: const Text(
                "Hapus",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /*
|--------------------------------------------------------------------------
| EDIT DEVICE
|--------------------------------------------------------------------------
*/

Future<void> showEditDialog(dynamic device) async {

  final nameController = TextEditingController(
    text: device['owner_name'] ?? "",
  );

  final locationController = TextEditingController(
    text: device['location'] ?? "",
  );

  showDialog(

    context: context,

    builder: (_) {

      return AlertDialog(

        title: const Text(
          "Edit Device",
        ),

        content: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            /*
            ------------------------------------------------
            NAMA
            ------------------------------------------------
            */

            TextField(

              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Nama Pemilik",
              ),
            ),

            const SizedBox(height: 16),

            /*
            ------------------------------------------------
            LOCATION
            ------------------------------------------------
            */

            TextField(

              controller: locationController,

              decoration: const InputDecoration(
                labelText: "Lokasi",
              ),
            ),
          ],
        ),

        actions: [

          /*
          ------------------------------------------------
          BATAL
          ------------------------------------------------
          */

          TextButton(

            onPressed: () {

              Navigator.pop(context);
            },

            child: const Text("Batal"),
          ),

          /*
          ------------------------------------------------
          SIMPAN
          ------------------------------------------------
          */

          ElevatedButton(

            onPressed: () async {

              try {

                /*
                ----------------------------------------
                UPDATE KE DATABASE
                ----------------------------------------
                */

                await DeviceService.updateDevice(

                  deviceId: device['device_id'],

                  ownerName:
                      nameController.text,

                  location:
                      locationController.text,
                );

                /*
                ----------------------------------------
                REFRESH DEVICE
                ----------------------------------------
                */

                await loadDevices();

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(

                  const SnackBar(

                    content: Text(
                      "Device berhasil diupdate",
                    ),
                  ),
                );

              } catch (e) {

                ScaffoldMessenger.of(context)
                    .showSnackBar(

                  SnackBar(
                    content: Text(
                      "Error: $e",
                    ),
                  ),
                );
              }
            },

            child: const Text(
              "Simpan",
            ),
          ),
        ],
      );
    },
  );
}

  /*
  |--------------------------------------------------------------------------
  | BUILD
  |--------------------------------------------------------------------------
  */

  @override
  Widget build(BuildContext context) {

    int totalDevice = devices.length;

    int connectedDevice =
        devices.where(
          (e) => e['is_active'] == true,
        ).length;

    return Scaffold(

      backgroundColor:
          const Color(0xFFF7F7F7),

      body: Column(
        children: [

          /*
          --------------------------------------------------
          HEADER
          --------------------------------------------------
          */

          Container(
            width: double.infinity,

            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              16,
            ),

            decoration: BoxDecoration(
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.05),

                  blurRadius: 8,

                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: SafeArea(
              bottom: false,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Kelola Perangkat",

                    style:
                        GoogleFonts.madimiOne(
                      fontSize: 18,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [

                      Expanded(
                        child: _buildInfoCard(
                          title:
                              "Jumlah Perangkat",

                          value:
                              totalDevice.toString(),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _buildInfoCard(
                          title: "Terhubung",

                          value: connectedDevice
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /*
          --------------------------------------------------
          DEVICE LIST
          --------------------------------------------------
          */

          Expanded(

            child: isLoading

                ? const Center(
                    child:
                        CircularProgressIndicator(),
                  )

                : devices.isEmpty

                    ? const Center(
                        child: Text(
                          "Belum ada perangkat",
                        ),
                      )

                    : ListView.builder(

                        padding:
                            const EdgeInsets.all(20),

                        itemCount: devices.length,

                        itemBuilder:
                            (context, index) {

                          final device =
                              devices[index];

                          return DeviceCard(

                            name:
                                device['owner_name']
                                    ?? "-",

                            code:
                                device['serial_number']
                                    ?? "-",

                            battery:
                                device['battery']
                                    ?.toString() ?? "0%",

                            location:
                                device['location']
                                    ?? "-",

                            isActive:
                                device['is_active']
                                    ?? false,

                            onDelete: () {
                              showDeleteDialog(device);
                            },

                           onEdit: () async {

                              await showEditDialog(device);

                              loadDevices();
                            },
                            
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  /*
  |--------------------------------------------------------------------------
  | INFO CARD
  |--------------------------------------------------------------------------
  */

  Widget _buildInfoCard({
    required String title,
    required String value,
  }) {

    return Container(

      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(14),
      ),

      child: Column(
        children: [

          Text(
            value,

            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,

            style: GoogleFonts.inter(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/*
|--------------------------------------------------------------------------
| DEVICE CARD
|--------------------------------------------------------------------------
*/

class DeviceCard extends StatelessWidget {

  final String name;
  final String code;
  final String battery;
  final String location;
  final bool isActive;

  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const DeviceCard({
    super.key,
    required this.name,
    required this.code,
    required this.battery,
    required this.location,
    required this.isActive,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin:
          const EdgeInsets.only(bottom: 16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [

          /*
          --------------------------------------------------
          STRIP
          --------------------------------------------------
          */

          Container(
            width: 6,
            height: 95,

            decoration: BoxDecoration(

              color: isActive
                  ? AppColors.primary
                  : const Color(0xFFF093DA),

              borderRadius:
                  const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.all(14),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  /*
                  --------------------------------------------------
                  HEADER
                  --------------------------------------------------
                  */

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Expanded(
                        child: Row(
                          children: [

                            const Icon(
                              Icons.devices,
                              size: 18,
                            ),

                            const SizedBox(width: 6),

                            Flexible(
                              child: Text(
                                name,

                                overflow:
                                    TextOverflow
                                        .ellipsis,

                                style:
                                    GoogleFonts.inter(
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ),

                            const SizedBox(width: 6),

                            Text(
                              code,

                              style:
                                  GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /*
                      ------------------------
                      POPUP MENU
                      ------------------------
                      */

                      PopupMenuButton(

                        itemBuilder: (context) => [

                          const PopupMenuItem(
                            value: 'edit',
                            child: Text("Edit"),
                          ),

                          const PopupMenuItem(
                            value: 'delete',
                            child: Text("Hapus"),
                          ),
                        ],

                        onSelected: (value) {

                          if (value == 'edit') {

                            onEdit();

                          } else if (value == 'delete') {

                            onDelete();
                          }
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /*
                  --------------------------------------------------
                  STATUS
                  --------------------------------------------------
                  */

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
                        fontSize: 11,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /*
                  --------------------------------------------------
                  BATTERY
                  --------------------------------------------------
                  */

                  Row(
                    children: [

                      const Icon(
                        Icons.battery_full,
                        size: 16,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        battery,

                        style:
                            GoogleFonts.inter(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /*
                  --------------------------------------------------
                  LOCATION
                  --------------------------------------------------
                  */

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
          ),
        ],
      ),
    );
  }
}