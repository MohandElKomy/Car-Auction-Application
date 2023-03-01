import '../../../../constants/texts.dart';
import '../../../../core/icons.dart';

class CarDetailsList {
  const CarDetailsList(
      {
        required this.icon,
        required this.desc,
        required this.title,
      });
  final String title;
  final String icon;
  final String desc;
}

List<CarDetailsList> carDetailsList = <CarDetailsList>[
   CarDetailsList(title: tColor, icon: icoEngine,desc: tBlue),
   CarDetailsList(title: tColor, icon: icoEngine,desc: tBlue),
   CarDetailsList(title: tColor, icon: icoEngine,desc: tBlue),
   CarDetailsList(title: tColor, icon: icoEngine,desc: tBlue),
   CarDetailsList(title: tColor, icon: icoEngine,desc: tBlue),
   CarDetailsList(title: tColor, icon: icoEngine,desc: tBlue),
   CarDetailsList(title: tColor, icon: icoEngine,desc: tBlue),
   CarDetailsList(title: tColor, icon: icoEngine,desc: tBlue),
];