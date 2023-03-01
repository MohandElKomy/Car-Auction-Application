import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/local_storage/local_storage_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

import 'package:intl/intl.dart';

class AddNewCarController extends GetxController {
  RxBool isLoading = false.obs;
  XFile? photo;
  RxString link = ''.obs;
  final carName = TextEditingController();
  final carModelYear = TextEditingController();
  final carPrice = TextEditingController();
  final carkms = TextEditingController();
  final carInsurance = TextEditingController();
  RxString date = DateTime.now().toString().obs;
  @override
  void onInit() {
    photo = null;
    super.onInit();
  }

  @override
  void dispose() {
    photo = null;
    carModelYear.dispose();
    carPrice.dispose();
    carName.dispose();
    carkms.dispose();
    carInsurance.dispose();
    super.dispose();
  }

  Future pickIMage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      photo = image;
      update();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed: $e');
      }
    }
  }

  Future<UploadTask?> uploadFile(XFile? file) async {
    if (file == null) {
      Get.snackbar(
        '',
        'No file was selected',
        backgroundColor: kPrimary,
      );
      return null;
    }
    isLoading.value = true;
    UploadTask uploadTask;
    Reference ref = FirebaseStorage.instance.ref().child(file.name);
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'gs://car-auction-ece98.appspot.com': file.path},
    );
    uploadTask = ref.putFile(io.File(file.path), metadata);
    link.value = await ref.getDownloadURL();
    print('link:::::::::: ${link.value}');
    update();
    return Future.value(uploadTask);
  }

  Future<bool> addCar({
    required String image,
    required String title,
    required String price,
    required String year,
    required String insurance,
    required String kms,
  }) async {
    final document =
        FirebaseFirestore.instance.collection('cars').doc('id-${date.value}');
    final json = {
      'image': image,
      'title': title,
      'price': price,
      'insurance': insurance,
      'kms': kms,
      'year': year,
      'id': phoneNum,
      'createdAt': date.value,
      'deal': false,
      'auction': [],
      'traderPhoneNum': '',
    };
    await document.set(json);
    isLoading.value = false;
    return true;
  }
}
