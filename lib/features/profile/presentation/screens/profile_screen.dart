import 'package:cars_auction_app/constants/texts.dart';
import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/local_storage/local_storage.dart';
import 'package:cars_auction_app/core/local_storage/local_storage_variables.dart';
import 'package:cars_auction_app/features/authentication/login/presentation/screens/login_screen.dart';
import 'package:cars_auction_app/features/home/presentation/controller/home_controller.dart';
import 'package:cars_auction_app/features/owner/presentation/controller/owner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common_custom_widgets/custom_button.dart';
import '../../../../core/common_custom_widgets/custom_text.dart';
import '../../../../core/images.dart';
import '../../../home/presentation/screens/bottom_nav_tabs.dart';
import '../../../owner/presentation/screens/owner_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final HomeController homeController =
      Get.put<HomeController>(HomeController());
  final OwnerController ownerController =
      Get.put<OwnerController>(OwnerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimary,
        title: CustomText(
          text: tProfile,
          fontSize: 26.sp,
          color: kBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsetsDirectional.only(
            start: 25.w,
            end: 25.w,
            top: 180.h,
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(iProfile),
                      maxRadius: 50.r,
                    ),
                    SizedBox(width: 20.w),
                    CustomText(
                      text: userName ?? '',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: kBlack,
                      width: 130.w,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                CustomButton(
                  color: kPrimary,
                  onTap: () async {
                    if (appState == 'user') {
                      ownerController.currentIndex.value = 0;
                      homeController.currentIndex.value = 0;
                      LocalStorageManger.saveAppState('trader');
                      appState = await LocalStorageManger.getAppState;
                      Get.offAll(() => OwnerBottomNavBar());
                    } else if (appState == 'trader') {
                      ownerController.currentIndex.value = 0;
                      homeController.currentIndex.value = 0;
                      LocalStorageManger.saveAppState('user');
                      appState = await LocalStorageManger.getAppState;
                      Get.offAll(() => BottomNavTabsScreen());
                    }
                  },
                  child: CustomText(
                    text: appState == 'user' ? tOwner : tTrader,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 280.h),
              child: CustomButton(
                onTap: () async {
                  await LocalStorageManger.removeUserPhone();
                  phoneNum = '';
                  Get.offAll(() => LoginScreen());
                },
                color: kPrimary,
                child: CustomText(
                  text: 'Logout',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
