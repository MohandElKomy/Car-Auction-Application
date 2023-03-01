import 'package:cars_auction_app/constants/texts.dart';
import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_button.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_text.dart';
import 'package:cars_auction_app/core/images.dart';
import 'package:cars_auction_app/core/local_storage/local_storage_variables.dart';
import 'package:cars_auction_app/features/auction_details/presentation/screens/auction_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../add_new_car/presentation/screens/add_new_car_screen.dart';
import '../../../home/data/model/cars_response_mode.dart';
import '../components/car_card_widget.dart';
import '../controller/owner_controller.dart';

class OwnerHomeScreen extends StatelessWidget {
  OwnerHomeScreen({Key? key}) : super(key: key);
  final OwnerController ownerController =
      Get.put<OwnerController>(OwnerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 65.w,
        ),
        child: CustomButton(
          color: kBlue,
          onTap: () {
            Get.to(() => AddNewCarScreen());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: kWhite,
                size: 40.sp,
              ),
              CustomText(
                text: tAdd,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: kWhite,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot<CarsModel>>(
            stream: ownerController.fetchCars.snapshots(),
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
              ownerController.cars.value = [];
              for (var i in cars.docs) {
                if (i.data().id == phoneNum) {
                  if (i.data().deal == false) {
                    if (DateTime.now()
                            .difference(DateTime.parse(i.data().createdAt!))
                            .inDays <=
                        2) {
                      ownerController.cars.add(i);
                    }
                  }
                }
              }
              return ownerController.cars.isEmpty
                  ? SafeArea(
                      child: Center(
                        child: CustomText(
                          text: tNoCar,
                          fontSize: 30.sp,
                        ),
                      ),
                    )
                  : SafeArea(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => AuctionDetailsScreen(
                                    allAuctions: ownerController.cars[index]
                                        .data()
                                        .auctions!,
                                    createdAt: ownerController.cars[index]
                                        .data()
                                        .createdAt!,
                                    id: ownerController.cars[index].data().id!,
                                  ));
                            },
                            child: CustomCarCardWidget(
                              name: ownerController.cars[index].data().title!,
                              image: ownerController.cars[index].data().image!,
                              price: ownerController.cars[index].data().price!,
                              year: ownerController.cars[index].data().year!,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 20.h);
                        },
                        itemCount: ownerController.cars.length,
                      ),
                    );
            }),
      ),
    );
  }
}
