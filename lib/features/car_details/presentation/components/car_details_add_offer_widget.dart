import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_button.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_tex_form_field.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_text.dart';
import 'package:cars_auction_app/core/local_storage/local_storage_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/texts.dart';
import '../../../home/data/model/cars_response_mode.dart';

class CarDetailsAddOfferWidget extends StatelessWidget {
  CarDetailsAddOfferWidget({
    Key? key,
    required this.sortedPrice,
    required this.auctions,
    required this.date,
  }) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final int sortedPrice;
  final String date;
  final List<AuctionModel> auctions;
  List jsonList = [];
  @override
  Widget build(BuildContext context) {
    for (var i in auctions) {
      jsonList.add({'price': i.price, 'phoneNum': i.phoneNumber});
    }
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              text: tAddOffer,
              validate: (value) {
                if (value == '') {
                  return 'Please enter a number';
                }
                final val = int.parse(value!);
                if (sortedPrice >= val) {
                  return '$tGreaterValue $sortedPrice';
                }
                return null;
              },
              controller: textController,
            ),
            SizedBox(height: 30.h),
            CustomButton(
              color: kBlue,
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final json = {
                    'price': textController.text,
                    'phoneNum': phoneNum,
                  };
                  jsonList.add(json);
                  await FirebaseFirestore.instance
                      .collection('cars')
                      .doc('id-$date')
                      .update({
                    'arrayName': FieldValue.arrayUnion([json])
                  });
                }
              },
              child: CustomText(
                text: tConfirm,
                fontSize: 20.sp,
                color: kWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
