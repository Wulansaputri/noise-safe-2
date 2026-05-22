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

  @override
  Widget build(BuildContext context) {

    /*
    ------------------------------------------------
    PAGES
    ------------------------------------------------
    */

    final List<Widget> pages = [

      /*
      HOME
      */

      const HomeContent(
        key: ValueKey("home"),
      ),

      /*
      ADD DEVICE
      */

      const AddDeviceScreen(),

      /*
      MANAGE DEVICE
      */

      const ManageDeviceScreen(
        key: ValueKey("manage"),
      ),

      /*
      PROFILE
      */

      const ProfileScreen(),
    ];

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavbar(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {

            /*
            REBUILD PAGE
            */

            currentIndex = index;
          });
        },
      ),
    );
  }
}