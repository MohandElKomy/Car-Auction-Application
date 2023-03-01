import 'package:cars_auction_app/constants/texts.dart';
import 'package:cars_auction_app/core/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import 'car_details_icon.dart';
import 'car_details_item.dart';

class CarDetailsCustomAppBar extends StatelessWidget {
  const CarDetailsCustomAppBar({
    Key? key,
    required this.image,
    required this.year,
    required this.kms,
  }) : super(key: key);

  final String image;
  final String year;
  final String kms;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      centerTitle: false,
      stretch: true,
      expandedHeight: 350.h,
      backgroundColor: kWhite,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarDetailsIcon(
            icon: Icons.arrow_back_outlined,
            size: 25.w,
            onTap: (){Get.back();},
          ),

              CarDetailsIcon(
                size: 30.w,
                icon: Icons.share,
                onTap: (){},
              ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: Stack(
          children: [
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: -1,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 80.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     CarDetailsItem(
                      icon: icoHomeAd4,
                      label: tInsurance,
                      num: '6',
                    ),
                    SizedBox(width: 30.w,),
                    CarDetailsItem(
                      icon: icoHomeAd2,
                      label: tModel,
                      num: year,
                    ),
                    SizedBox(width: 30.w,),
                    CarDetailsItem(
                      icon: icoHomeAd3,
                      label: tKms,
                      num: kms,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
