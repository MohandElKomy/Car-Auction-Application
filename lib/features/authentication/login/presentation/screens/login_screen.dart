import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_button.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_tex_form_field.dart';
import 'package:cars_auction_app/core/common_custom_widgets/custom_text.dart';
import 'package:cars_auction_app/features/authentication/login/presentation/controller/login_controller.dart';
import 'package:cars_auction_app/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../constants/texts.dart';
import '../../../../../core/local_storage/local_storage.dart';
import '../../../../../core/local_storage/local_storage_variables.dart';
import '../../../../home/presentation/screens/bottom_nav_tabs.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final LoginController loginController =
      Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: kPrimary,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: CustomText(
            text: tWelcome,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
          child: Form(
            key: LoginScreen._loginFormKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              shrinkWrap: true,
              children: [
                SizedBox(height: 100.h),
                CustomText(
                  text: tWelcomeToApp,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 150.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomText(
                    text: tLogin,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50.h),
                CustomTextFormField(
                  text: tPhoneNum,
                  validate: (value) {
                    return Validations.validatePhoneNumber(value);
                  },
                  onChanged: (value) {
                    loginController.phoneNum.value = value;
                  },
                  keyboardType: TextInputType.number,
                  controller: loginController.phoneController,
                ),
                SizedBox(height: 50.h),
                CustomTextFormField(
                  text: tName,
                  validate: (value) {
                    if (value == '') {
                      return tUserNameError;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    loginController.userName.value = value;
                  },
                  keyboardType: TextInputType.number,
                  controller: loginController.nameController,
                ),
                SizedBox(height: 100.h),
                GetBuilder<LoginController>(builder: (controller) {
                  return CustomButton(
                    color: !controller.isLoading.value
                        ? kBlue
                        : kBlue.withOpacity(0.4),
                    onTap: !controller.isLoading.value
                        ? () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (LoginScreen._loginFormKey.currentState!
                                .validate()) {
                              LoginScreen._loginFormKey.currentState!.save();
                              if (await controller.login()) {
                                LocalStorageManger.saveUserPhone(
                                    controller.phoneNum.value);
                                LocalStorageManger.saveUserName(
                                    controller.userName.value);
                                phoneNum = controller.phoneNum.value;
                                userName = controller.userName.value;
                                Get.offAll(() => BottomNavTabsScreen());
                              }
                            }
                          }
                        : () {},
                    child: !controller.isLoading.value
                        ? CustomText(
                            text: tLog,
                            fontSize: 22.sp,
                            color: kWhite,
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
                                text: tLog,
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
