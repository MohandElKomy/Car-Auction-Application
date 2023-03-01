import 'package:cars_auction_app/features/home/data/model/cars_response_mode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  @override
  void onInit() {
    currentIndex.value = 0;
    super.onInit();
  }

  @override
  void dispose() {
    currentIndex.value = 0;
    super.dispose();
  }

  final fetchCars = FirebaseFirestore.instance
      .collection('cars')
      .withConverter<CarsModel>(
        fromFirestore: (snapshots, _) => CarsModel.fromJson(snapshots.data()!),
        toFirestore: (car, _) => car.toJson(),
      );
}
