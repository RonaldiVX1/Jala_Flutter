import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronaldi_jala_test/app/app_binding.dart';
import 'app/route/app_route.dart';
import 'app/route/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Entrance Test",
      initialRoute: RouteName.dashboard,
      getPages: AppRoute.pages,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
