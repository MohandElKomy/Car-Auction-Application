import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_text.dart';
import 'package:cars_auction_app/features/home/data/model/cars_response_mode.dart';
import 'package:cars_auction_app/features/home/presentation/controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/texts.dart';
import '../../../car_details/presentation/screens/car_details_screen.dart';
import 'custom_cars_list_item.dart';

class CustomCarsList extends StatelessWidget {
  CustomCarsList({Key? key}) : super(key: key);
  final HomeController homeController =
      Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: tAllCars,
          fontSize: 24.sp,
          color: kBlack,
        ),
        StreamBuilder<QuerySnapshot<CarsModel>>(
            stream: homeController.fetchCars.snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasError) {
                return Center(
                  child: CustomText(
                    text: snapshots.error.toString(),
                    fontSize: 25.sp,
                  ),
                );
              }

              if (!snapshots.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: kPrimary,
                ));
              }
              final cars = snapshots.requireData;
              final allCars = [];
              for (var i in cars.docs) {
                final days = DateTime.now()
                    .difference(DateTime.parse(i.data().createdAt!));
                if (days.inDays <= 2) {
                  allCars.add(i);
                }
              }
              return GridView.builder(
                  itemCount: allCars.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 40.h,
                    mainAxisExtent: 270.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return allCars.isEmpty
                        ? Center(
                            child: CustomText(
                              text: 'No data found!!!',
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: kBlack,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Get.to(() => CarDetailsScreen(
                                    name: allCars[index].data().title!,
                                    image: allCars[index].data().image!,
                                    price: allCars[index].data().price!,
                                    insurance: allCars[index].data().insurance!,
                                    kms: allCars[index].data().kms!,
                                    year: allCars[index].data().year!,
                                    deal: allCars[index].data().deal!,
                                    auction: allCars[index].data().auctions!,
                                    date: allCars[index].data().createdAt!,
                                  ));
                            },
                            child: CustomCarsListItem(
                              title: allCars[index].data().title!,
                              image: allCars[index].data().image!,
                              price: allCars[index].data().price!,
                              insurance: allCars[index].data().insurance!,
                              kms: allCars[index].data().kms!,
                              year: allCars[index].data().year!,
                            ),
                          );
                  });
            }),
      ],
    );
  }
}
