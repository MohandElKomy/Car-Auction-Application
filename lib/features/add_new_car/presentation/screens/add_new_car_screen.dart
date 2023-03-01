import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_button.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_tex_form_field.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_text.dart';
import 'package:cars_auction_app/features/add_new_car/presentation/controller/add_new_car_controller.dart';
import 'package:cars_auction_app/features/owner/presentation/screens/owner_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../../constants/texts.dart';
import '../components/add_photo_widget.dart';

class AddNewCarScreen extends StatelessWidget {
  AddNewCarScreen({Key? key}) : super(key: key);
  final AddNewCarController carController =
      Get.put<AddNewCarController>(AddNewCarController());
  static final GlobalKey<FormState> _addCarFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
          child: Form(
            key: _addCarFormKey,
            child: ListView(
              padding: EdgeInsetsDirectional.only(
                top: 40.h,
                start: 10.w,
                end: 10.w,
              ),
              shrinkWrap: true,
              children: [
                GetBuilder<AddNewCarController>(builder: (controller) {
                  return Container(
                    height: 250.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: kGreen,
                    ),
                    child: carController.photo != null
                        ? Image.file(
                            File(carController.photo!.path),
                            fit: BoxFit.fill,
                          )
                        : AddPhotoWidget(
                            onTap: carController.pickIMage,
                          ),
                  );
                }),
                SizedBox(height: 30.h),
                CustomTextFormField(
                  text: tCarName,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return tCarNameError;
                    }
                    return null;
                  },
                  controller: carController.carName,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  text: tCarYear,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return tCarModelError;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: carController.carModelYear,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  text: tPrice,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return tCarPriceError;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: carController.carPrice,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  text: tKms,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return tCarKmsError;
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  controller: carController.carkms,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  text: tCarInsurance,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return tCarInsuranceError;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: carController.carInsurance,
                ),
                SizedBox(height: 60.h),
                GetBuilder<AddNewCarController>(builder: (controller) {
                  return CustomButton(
                    color: !controller.isLoading.value
                        ? kPrimary
                        : kPrimary.withOpacity(0.4),
                    onTap: !controller.isLoading.value
                        ? () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (_addCarFormKey.currentState!.validate()) {
                              _addCarFormKey.currentState!.save();
                              await carController
                                  .uploadFile(carController.photo)
                                  .whenComplete(() async {
                                if (await carController.addCar(
                                  image: carController.link.value,
                                  title: carController.carName.text,
                                  price: carController.carPrice.text,
                                  year: carController.carModelYear.text,
                                  insurance: carController.carInsurance.text,
                                  kms: carController.carkms.text,
                                )) {
                                  Get.snackbar('', 'Car is added');
                                  Get.offAll(() => OwnerBottomNavBar());
                                }
                              });
                            }
                          }
                        : () {},
                    child: !controller.isLoading.value
                        ? CustomText(
                            text: tAddCar,
                            fontSize: 22.sp,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  color: kBlue,
                                ),
                              ),
                              CustomText(
                                text: tAddCar,
                                fontSize: 22.sp,
                                color: kWhite,
                              ),
                              SizedBox(width: 50.w),
                            ],
                          ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
