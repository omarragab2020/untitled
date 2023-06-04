import 'package:get/get.dart';
import 'package:untitled/app/data/models/product_model.dart';
import 'package:untitled/app/data/models/shop_model.dart';
import 'package:untitled/app/modules/home/views/screens/home_screen/souq.dart';
import 'package:untitled/app/modules/home/views/screens/my_order/fawry_screen.dart';

import '../views/screens/account_scceen/account_screen.dart';
import '../views/screens/my_order/talabat.dart';
import '../views/screens/product_screen/favorites_screen.dart';

class HomeController extends GetxController {
  RxInt currentScreen = 0.obs;
  RxInt currentCount = 0.obs;

  final tabs = [
    SouqScreen(),
    FavoritesScreen(),
    MyAccountScreen(),
    // const FawryScreen(),
  ].obs;

  void addProduct() {
    currentCount++;
    update();
  }

  void removeProduct() {
    if (currentCount >= 1) {
      currentCount--;
    }
    update();
  }
}
