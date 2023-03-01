import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_cars_list.dart';

class CustomSliverListItems extends StatelessWidget {
  const CustomSliverListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: carDetailsWidgets[index],
          );
        },
        childCount: carDetailsWidgets.length,
      ),
    );
  }
}
List<Widget> carDetailsWidgets = [
   CustomCarsList(),
];
