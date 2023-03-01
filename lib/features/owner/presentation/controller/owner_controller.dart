import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../home/data/model/cars_response_mode.dart';

class OwnerController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList cars = [].obs;
  List<AuctionModel> list = [];
  @override
  void onInit() {
    cars.value = [];
    super.onInit();
  }

  @override
  void dispose() {
    currentIndex.value = 0;
    cars.value = [];
    super.dispose();
  }

  final fetchCars = FirebaseFirestore.instance
      .collection('cars')
      .withConverter<CarsModel>(
        fromFirestore: (snapshots, _) => CarsModel.fromJson(snapshots.data()!),
        toFirestore: (car, _) => car.toJson(),
      );
}
