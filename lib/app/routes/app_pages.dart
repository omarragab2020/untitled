import 'package:get/get.dart';
import 'package:untitled/app/modules/home/views/screens/home_screen/contact_screen.dart';
import 'package:untitled/app/modules/home/views/screens/home_screen/souq.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/screens/home_screen/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HomeView;

  static final routes = [
    GetPage(
      name: _Paths.HomeView,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.CONTACT,
    //   page: () => const ContactScreen(),
    // ),
  ];
}
