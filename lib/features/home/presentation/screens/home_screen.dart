import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/images.dart';
import 'package:cars_auction_app/features/home/presentation/components/custom_ads_banner.dart';
import 'package:flutter/material.dart';

import '../components/custom_sliver_app_bar.dart';
import '../components/custom_sliver_listi_tems.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: kWhite,
      body: CustomScrollView(
        slivers: [
          HomeCustomAppBar(),
          CustomAdsBanner(image: imCar1),
          CustomSliverListItems(),
          CustomAdsBanner(image: imCar1),
        ],
      ),
    );
  }
}
