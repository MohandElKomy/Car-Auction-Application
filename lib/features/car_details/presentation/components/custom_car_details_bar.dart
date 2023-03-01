import 'package:cars_auction_app/constants/texts.dart';
import 'package:cars_auction_app/core/icons.dart';
import 'package:cars_auction_app/features/home/data/model/cars_response_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/colors.dart';
import '../../../../core/common_custom_widgets/custom_text.dart';
import 'car_details_add_offer_widget.dart';

class CustomCarDetailsBar extends StatelessWidget {
  const CustomCarDetailsBar({
    Key? key,
    required this.price,
    required this.kms,
    required this.deal,
    required this.name,
    required this.sortedPrice,
    required this.auctions,
    required this.date,
  }) : super(key: key);

  final String price;
  final String date;
  final String kms;
  final String name;
  final bool deal;
  final String sortedPrice;
  final List<AuctionModel> auctions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      centerTitle: false,
      expandedHeight: deal == false ? 265.h : 150.h,
      backgroundColor: kWhite,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 20.w,
            end: 20.w,
            top: 20.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 70.w,
                    ),
                    child: CustomText(
                      text: name,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 10.w),
                    child: Row(
                      children: [
                        CustomText(
                          text: price,
                          fontSize: 34.sp,
                          fontWeight: FontWeight.bold,
                          color: kBlack,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 10.h,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: kPrimary,
                  ),
                  alignment: Alignment.center,
                  height: 40.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          icoHomeAd4,
                          width: 28.w,
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        CustomText(
                          text: tInsurance,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                          color: kBlack,
                        ),
                        CustomText(
                          text: kms,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                          color: kBlack,
                        ),
                        CustomText(
                          text: tKms,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                          color: kBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              deal == false
                  ? CarDetailsAddOfferWidget(
                      sortedPrice: int.parse(sortedPrice),
                      auctions: auctions,
                      date: date,
                    )
                  : Padding(
                      padding: EdgeInsetsDirectional.only(top: 40.h),
                      child: Container(
                        width: 600.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: CustomText(
                          text: tNotAvailable,
                          fontSize: 24.sp,
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          alignment: Alignment.center,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
