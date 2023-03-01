import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAdsBanner extends StatelessWidget {
  const CustomAdsBanner({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      elevation: 0,
      pinned: false,
      centerTitle: false,
      expandedHeight: 200.h,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            SizedBox(height: 30.h,),
            Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
      ),
          ],
        ),
    ),
    );
  }
}
