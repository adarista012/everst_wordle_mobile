import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle_mobile/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wordle Mobile',
      initialRoute: '/',
      getPages: routes,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
    );
  }
}
