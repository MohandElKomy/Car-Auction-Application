import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors.dart';
import '../../../../core/common_custom_widgets/custom_button.dart';
import '../../../../core/common_custom_widgets/custom_text.dart';

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 200.w, vertical: 100.h),
      child: CustomButton(
        color: kBlue,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.camera_alt,
              size: 30.sp,
              color: kWhite,
            ),
            CustomText(
              text: 'Add Photo',
              fontSize: 18.sp,
              color: kWhite,
            ),
          ],
        ),
      ),
    );
  }
}
