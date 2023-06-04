import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/modules/home/controllers/card_controller.dart';
import 'package:untitled/app/modules/home/views/screens/cart_item_screen.dart';

import '../../../../../data/models/shop_model.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/main_controller.dart';
import '../../widgets/home/delivery.dart';
import '../../widgets/home/home_list.dart';
import '../../widgets/home/shops_list_view.dart';
import '../../widgets/home/search_text_form.dart';
import '../../widgets/my_account/text_feild.dart';
import '../../widgets/text_utils.dart';
import 'package:badges/badges.dart' as badges;

import '../product_screen/category_screen.dart';

class SouqScreen extends StatelessWidget {
  SouqScreen({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextUtils(text: 'Shop'.tr, fontSize: 22),
          // actions: [
          //   Obx(() {
          //     return badges.Badge(
          //       position: BadgePosition.topEnd(top: 0, end: 3),
          //       badgeStyle: BadgeStyle(
          //         badgeColor: Colors.green,
          //       ),
          //       badgeAnimation: const badges.BadgeAnimation.rotation(
          //         animationDuration: Duration(milliseconds: 300),
          //       ),
          //       badgeContent: Text(
          //         cartController.quantity().toString(),
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       child: IconButton(
          //           onPressed: () {
          //             Get.to(CartItemScreen());
          //           },
          //           icon: Image.asset('assets/images/shop.png')),
          //     );
          //   }),
          // ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      text: "Find Your NEEDS",
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(height: 20),
                    // SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // const DeliveryWidget(),
            HomeListFilter(),
            const SizedBox(height: 10),

            const Expanded(child: ShopsListView()),
          ],
        ),
      ),
    );
  }
}
