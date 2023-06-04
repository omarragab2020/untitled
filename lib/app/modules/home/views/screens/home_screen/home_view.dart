import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:untitled/app/modules/home/views/screens/product_screen/category_screen.dart';
import 'package:untitled/app/routes/app_pages.dart';

import '../../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentScreen.value,
          children: controller.tabs.value,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentScreen.value,
          selectedItemColor: Colors.redAccent,
          onTap: (index) {
            controller.currentScreen.value = index;
          },
          items: [
            BottomNavigationBarItem(
              label: 'Souq'.tr,
              icon: Icon(Icons.shopping_cart_checkout),
            ),
            BottomNavigationBarItem(
              label: 'Favourites'.tr,
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'My account'.tr,
              icon: Icon(Icons.person),
            ),
          ],
        ),
      );
    });
  }
}
