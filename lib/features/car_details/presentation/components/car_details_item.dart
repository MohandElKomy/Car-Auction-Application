import 'package:cars_auction_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common_custom_widgets/custom_text.dart';

class CarDetailsItem extends StatelessWidget {
  const CarDetailsItem({Key? key, required this.icon, required this.num, required this.label}) : super(key: key);
  final String icon;
  final String num;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 130.w,
      decoration: BoxDecoration(
        color: kGreen,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 10.w,end: 10.w,),
            child: SvgPicture.asset(icon,width: 40.w,),
          ),
          CustomText(
            text: label,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: num,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
