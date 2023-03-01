import 'package:cars_auction_app/core/colors.dart';
import 'package:cars_auction_app/core/local_storage/local_storage_variables.dart';
import 'package:cars_auction_app/features/authentication/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

import 'core/local_storage/local_storage.dart';
import 'features/home/presentation/screens/bottom_nav_tabs.dart';
import 'features/owner/presentation/screens/owner_bottom_nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  await GetStorage.init();
  await getData();
  runApp(const MyApp());
}

Future<void> getData() async {
  if (await LocalStorageManger.getUserPhone != null) {
    phoneNum = await LocalStorageManger.getUserPhone;
  } else {
    GetStorage().write('PhoneNum', '');
    phoneNum = await LocalStorageManger.getUserPhone;
  }
  if (await LocalStorageManger.getUserName != null) {
    userName = await LocalStorageManger.getUserName;
  } else {
    GetStorage().write('name', '');
    userName = await LocalStorageManger.getUserName;
  }
  if (await LocalStorageManger.getAppState != null) {
    appState = await LocalStorageManger.getAppState;
  } else {
    GetStorage().write('state', 'user');
    appState = await LocalStorageManger.getAppState;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(600, 1000),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        rebuildFactor: (old, data) {
          return data.devicePixelRatio != old.devicePixelRatio;
        },
        builder: ((context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: kPrimSwatch,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: kPrimSwatch,
                backgroundColor: kGreen,
              ),
            ),
            home: phoneNum == ''
                ? LoginScreen()
                : (appState == 'user')
                    ? BottomNavTabsScreen()
                    : OwnerBottomNavBar(),
          );
        }));
  }
}
