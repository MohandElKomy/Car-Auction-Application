import 'package:cars_auction_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common_custom_widgets/custom_text.dart';
import '../../domain/entities/car_details_list.dart';

class AllCarDetailsListItems extends StatelessWidget {
  const AllCarDetailsListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index){
        return Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: kGreen,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  carDetailsList[index].icon,
                  width: 40.w,
                  color: kBlack,
                ),
                SizedBox(
                  width: 15.w,
                ),
                CustomText(
                  text: carDetailsList[index].title,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 160.w,
                ),
                CustomText(
                  text: carDetailsList[index].desc,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index){
        return SizedBox(height: 5.h);
      },
      itemCount: carDetailsList.length,
    );
  }
}
