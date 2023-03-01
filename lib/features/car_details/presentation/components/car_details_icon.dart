import 'package:cars_auction_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class CarDetailsIcon extends StatelessWidget {
  const CarDetailsIcon({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.size,
  }) : super(key: key);
  final IconData icon;
  final double size;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: kTextColor,
        radius: 25.r,
        child: Icon(icon,size: size,color: kBlack,),
      ),
    );
  }
}
