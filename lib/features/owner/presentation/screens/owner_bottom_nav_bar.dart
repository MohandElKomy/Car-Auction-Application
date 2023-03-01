import 'package:cars_auction_app/features/owner/presentation/controller/owner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/texts.dart';
import '../../../../core/colors.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import 'owner_home_screen.dart';

class OwnerBottomNavBar extends StatelessWidget {
  OwnerBottomNavBar({Key? key}) : super(key: key);
  final OwnerController ownerController =
      Get.put<OwnerController>(OwnerController());
  final screens = [
    OwnerHomeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: kWhite,
        body: IndexedStack(
          index: ownerController.currentIndex.value,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: ownerController.currentIndex.value,
          onTap: (index) {
            ownerController.currentIndex.value = index;
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
