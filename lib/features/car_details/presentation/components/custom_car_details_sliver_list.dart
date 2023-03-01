import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'car_details_list_widget.dart';

class CustomCarDetailsSliverList extends StatelessWidget {
  const CustomCarDetailsSliverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
              bottom: 20.h,
              end: 10.w,
            ),
            child: carDetailsWidgetsList[index],
          );
        },
        childCount: carDetailsWidgetsList.length,
      ),
    );
  }
}
