import 'package:get/get.dart';
import 'package:untitled/app/modules/home/controllers/product_controller.dart';
import 'package:untitled/app/modules/home/controllers/setting_controller.dart';

import '../controllers/card_controller.dart';
import '../controllers/main_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(ProductController());
  }
}
