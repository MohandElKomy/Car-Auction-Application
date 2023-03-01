import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  RxString phoneNum = ''.obs;
  RxString userName = ''.obs;
  RxBool isLoading = false.obs;

  @override
  dispose() {
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<bool> login() async {
    isLoading.value = true;
    final document =
        FirebaseFirestore.instance.collection('users').doc(phoneNum.value);
    final json = {
      'phone': phoneNum.value,
      'name': userName.value,
    };
    await document.set(json);
    isLoading.value = false;
    return true;
  }
}
