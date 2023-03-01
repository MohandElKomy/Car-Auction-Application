import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../home/data/model/cars_response_mode.dart';
import '../components/car_details_custom_app_bar.dart';
import '../components/custom_car_details_bar.dart';
import '../components/custom_car_details_sliver_list.dart';

class CarDetailsScreen extends StatelessWidget {
  CarDetailsScreen(
      {Key? key,
      required this.image,
      required this.price,
      required this.year,
      required this.insurance,
      required this.name,
      required this.kms,
      required this.auction,
      required this.deal,
      required this.date})
      : super(key: key);
  final String image;
  final String price;
  final String year;
  final String insurance;
  final String name;
  final String kms;
  final String date;
  final bool deal;
  final List auction;
  List<AuctionModel> sort = [];
  @override
  Widget build(BuildContext context) {
    for (var i in auction) {
      sort.add(AuctionModel.fromJson(i));
    }
    sort.sort((a, b) {
      return -(a.price!).compareTo(b.price!);
    });
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: kWhite,
        body: CustomScrollView(
          slivers: [
            CarDetailsCustomAppBar(image: image, year: year, kms: kms),
            CustomCarDetailsBar(
              price: price,
              kms: kms,
              deal: deal,
              name: name,
              sortedPrice: sort[0].price!,
              auctions: sort,
              date: date,
            ),
            const CustomCarDetailsSliverList(),
          ],
        ),
      ),
    );
  }
}
