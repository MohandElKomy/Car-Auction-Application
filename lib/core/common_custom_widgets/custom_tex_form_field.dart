import 'package:cars_auction_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? Function(String?)? validate;
  final void Function(String?)? onSave;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool autofocus;
  final void Function(String)? onFieldSubmitted;
  final bool enabled;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  const CustomTextFormField({
    Key? key,
    required this.text,
    required this.validate,
    this.onSave,
    this.onChanged,
    this.keyboardType,
    this.obscureText,
    required this.controller,
    this.autofocus = false,
    this.onFieldSubmitted,
    this.enabled = true,
    this.textInputAction,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: text,
              fontSize: 22.sp,
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 56.h,
              child: Wrap(
                children: [
                  Center(
                    child: TextFormField(
                      controller: controller,
                      validator: validate,
                      autofocus: autofocus,
                      textInputAction: textInputAction,
                      keyboardType: keyboardType,
                      obscureText: obscureText ?? false,
                      onSaved: onSave,
                      onTap: () {
                        controller!.selection = TextSelection.fromPosition(
                            TextPosition(offset: controller!.text.length));
                      },
                      onChanged: onChanged,
                      onFieldSubmitted: onFieldSubmitted,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: kTextColor,
                                fontSize: 20.sp,
                              ),
                      cursorHeight: 30.h,
                      cursorColor: kPrimary,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        errorStyle: TextStyle(fontSize: 12.sp, height: .8),
                        fillColor: kTextColor.withOpacity(0.1),
                        filled: true,
                        enabled: enabled,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: kHomeFilterColor.withOpacity(0.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: kHomeFilterColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      focusNode: focusNode,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
