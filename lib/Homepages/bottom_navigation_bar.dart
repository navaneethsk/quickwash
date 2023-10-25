import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:quickwash/Homepages/booking_page.dart';
import 'package:quickwash/Homepages/home_page.dart';
import 'package:quickwash/Homepages/profile_page.dart';
import 'package:quickwash/themes.dart';

import '../images.dart';
import '../main.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  List pages = [
    homePage(),
    bookingPage(),
    profilePage()
  ];
  int selectIndex=0;
  void onTapped(int index){
    setState(() {
      selectIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: ConvexAppBar(
          items:const [
            TabItem(icon: Icons.home_outlined,activeIcon: Icons.home_filled,title: "Home"),
            TabItem(icon: Icons.check_circle_outline,activeIcon: Icons.check_circle,title: "Booked"),
            TabItem(icon: Icons.person_2_outlined,activeIcon: Icons.person,title: "Profile"),
          ],
        height: w*0.15,
        color: Themes.grey3,
        backgroundColor: Themes.secondaryColor,
        activeColor: Themes.primaryColor,
        onTap: onTapped,
        initialActiveIndex: selectIndex,
      )

    );

  }
}
