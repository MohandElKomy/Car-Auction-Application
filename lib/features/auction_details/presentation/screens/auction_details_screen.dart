import 'dart:collection';

import 'package:cars_auction_app/constants/texts.dart';
import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_text.dart';
import 'package:cars_auction_app/features/owner/presentation/screens/owner_bottom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/local_storage/local_storage_variables.dart';
import '../../../home/data/model/cars_response_mode.dart';

class AuctionDetailsScreen extends StatelessWidget {
  AuctionDetailsScreen({
    Key? key,
    required this.allAuctions,
    required this.createdAt,
    required this.id,
  }) : super(key: key);
  final List allAuctions;
  final String createdAt;
  final String id;
  List<AuctionModel> auctions = [];
  @override
  Widget build(BuildContext context) {
    for (var i in allAuctions) {
      auctions.add(AuctionModel.fromJson(i));
    }

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: CustomText(
          text: tAuc,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: allAuctions.isEmpty
            ? Center(
                child: CustomText(
                  text: tNoOffers,
                  fontSize: 25.sp,
                  color: kBlue,
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 30.h),
                itemBuilder: (BuildContext context, int index) {
                  auctions.sort((a, b) {
                    return -(a.price!).compareTo(b.price!);
                  });
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Card(
                      color: kGreen,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: tFrom,
                                      fontSize: 18.sp,
                                      color: kBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: auctions[index].phoneNumber,
                                      fontSize: 18.sp,
                                      color: kBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: tOffer,
                                      fontSize: 18.sp,
                                      color: kBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: auctions[index].price,
                                      fontSize: 18.sp,
                                      color: kBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: kBlue,
                              maxRadius: 30.r,
                              child: Center(
                                child: IconButton(
                                  onPressed: () async {
                                    final document = FirebaseFirestore.instance
                                        .collection('cars')
                                        .doc('id-$createdAt');
                                    await document.update({
                                      'deal': true,
                                      'traderPhoneNum': phoneNum,
                                    });
                                    Get.offAll(() => OwnerBottomNavBar());
                                  },
                                  icon: const Icon(
                                    Icons.check,
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: auctions.length,
              ),
      ),
    );
  }
}
