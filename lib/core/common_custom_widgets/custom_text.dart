import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String? text;
  final Color color;
  final Alignment? alignment;
  final double height;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? width;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;

  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.alignment,
    this.height = 1,
    this.overflow,
    required this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.width,
    this.maxLines,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      child: Text(
        text!,
        style: Theme.of(context).textTheme.headline5?.copyWith(
          color: color,
          fontSize: fontSize,
          height: height,
          fontFamily: "Cairo",
          fontWeight: fontWeight,
          decoration: textDecoration,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
