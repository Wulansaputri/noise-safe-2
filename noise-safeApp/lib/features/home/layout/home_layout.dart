import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/home_content.dart';
import '../../device/add_device_screen.dart';
import '../../device/manage_device_screen.dart';
import '../../profile/profile_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeContent(),
    const AddDeviceScreen(),
    const ManageDeviceScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}