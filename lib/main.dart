import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:open_api_generator_flutter/routes/router.dart';

import 'bindings/main_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'appTitle'.tr,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: DeliveryRoutes.petList,
      getPages: DeliveryPages.pages,
      initialBinding: MainBinding(),
      builder: EasyLoading.init(),
    );
  }

  void initEasyLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 100.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.transparent
      ..boxShadow = <BoxShadow>[]
      ..indicatorColor = const Color(0xFF002C43)
      ..textColor = Colors.black
      ..maskColor = const Color(0x33000000)
      ..maskType = EasyLoadingMaskType.custom
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
