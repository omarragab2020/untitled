import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:untitled/app/modules/home/controllers/auth_controller.dart';
import 'package:untitled/app/modules/home/controllers/main_controller.dart';
import 'package:untitled/app/modules/home/controllers/payment_controller.dart';
import 'package:untitled/app/modules/home/controllers/product_controller.dart';
import 'package:untitled/utils/my_string.dart';

import 'app/modules/home/controllers/card_controller.dart';
import 'app/modules/home/controllers/setting_controller.dart';
import 'app/routes/app_pages.dart';
import 'language/localiztion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(SettingController());
  Get.put(MainController());
  Get.put(ProductController());
  Get.put(CartController());
  Get.put(ProductController());
  Get.put(AuthController());
  Get.put(PayMentController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: Locale(ene),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
    ),
  );
}
