import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors.dart';
import '../../../../core/common_custom_widgets/custom_text.dart';

class CustomCarCardWidget extends StatelessWidget {
  const CustomCarCardWidget({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.year,
  });
  final String name;
  final String year;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBlue,
      shadowColor: kBlue,
      child: Column(
        children: [
          Container(
            height: 150.h,
            width: 600.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListTile(
              title: CustomText(
                text: name,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: kWhite,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                width: 200.w,
              ),
              trailing: SizedBox(
                width: 140.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: year,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: kWhite,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        text: price,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: kWhite,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
