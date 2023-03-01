import 'package:cars_auction_app/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_custom_widgets/custom_text.dart';

class CarDescription extends StatelessWidget {
  const CarDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomText(
      text: tCarDesc,
      fontSize: 24.sp,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      height: 1.4,
    );
  }
}
