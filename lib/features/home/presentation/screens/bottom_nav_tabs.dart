import 'package:cars_auction_app/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/texts.dart';
import '../../../../core/colors.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import 'home_screen.dart';

class BottomNavTabsScreen extends StatelessWidget {
  BottomNavTabsScreen({Key? key}) : super(key: key);
  final HomeController homeController =
      Get.put<HomeController>(HomeController());
  final screens = [
    const HomeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: kWhite,
        body: IndexedStack(
          index: homeController.currentIndex.value,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeController.currentIndex.value,
          onTap: (index) {
            homeController.currentIndex.value = index;
          },
          iconSize: 30,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: tHome,
              backgroundColor: kPrimary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle_outlined),
              label: tProfile,
              backgroundColor: kPrimary,
            )
          ],
        ),
      ),
    );
  }
}
