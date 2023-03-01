import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/texts.dart';
import '../../../../core/colors.dart';
import '../../../../core/common_custom_widgets/custom_text.dart';
import '../../../../core/icons.dart';


class ContactDetailsBar extends StatelessWidget {
  const ContactDetailsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(bottom: 30.h,start: 10.w,end: 10.w,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){},
            child: CircleAvatar(
              backgroundColor: kGreen,
              radius: 25.r,
              child: SvgPicture.asset(
                icoCall,
                width: 30.w,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: CircleAvatar(
              backgroundColor: kPurple,
              radius: 25.r,
              child: SvgPicture.asset(
                icoChat,
                width: 30.w,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 40.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: kHomeFilterColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.location_pin,color: kWhite,size: 30.sp),
                  CustomText(
                    text: tLocation,
                    fontSize: 15.sp,
                    color: kWhite,
                    textAlign: TextAlign.center,
                    alignment: Alignment.center,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),GestureDetector(
            onTap: (){},
            child: Container(
              height: 40.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: kHomeFilterColor,
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    icoBook,
                    width: 25.w,
                  ),
                  CustomText(
                    text: tSave,
                    fontSize: 15.sp,
                    color: kHomeFilterColor,
                    textAlign: TextAlign.center,
                    alignment: Alignment.center,
                    fontWeight: FontWeight.bold,
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
