import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/data/models/shop_model.dart';
import 'package:untitled/app/modules/home/controllers/main_controller.dart';

import '../../../../../data/models/category_model.dart';
import '../../../../../data/models/product_model.dart';
import '../../../controllers/card_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../widgets/cart/cart_total.dart';
import '../../widgets/products/add_cart.dart';
import '../../widgets/text_utils.dart';
import 'package:badges/badges.dart' as badges;

import '../cart_item_screen.dart';
import '../check_out_screen.dart';

class SingleProduct extends StatelessWidget {
  late ProductModel model;
  late ShopModel shopModel;

  SingleProduct({
    super.key,
    required this.model,
  });

  final controller = Get.put(HomeController());
  final cartController = Get.find<CartController>();
  final mainController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            TextUtils(text: (model.descriptionEn ?? 'Shop').tr, fontSize: 22),
        actions: [
          Obx(() {
            return badges.Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              badgeAnimation: const badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 6),
              ),
              badgeStyle: const BadgeStyle(
                badgeColor: Colors.green,
              ),
              badgeContent: Text(
                cartController.quantity().toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  onPressed: () {
                    Get.to(CartItemScreen(
                      shopModel: shopModel,
                    ));
                  },
                  icon: Image.asset('assets/images/shop.png')),
            );
          }),
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        mainController.manageFavorites(model);
                        mainController.isFavorites(model.id!)
                            ? Get.snackbar(
                                "Successfully !",
                                "The product has been added successfully",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              )
                            : Get.snackbar(
                                "Successfully !",
                                "The product has been removed successfully",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                      },
                      icon: mainController.isFavorites(model.id!)
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_outline,
                              color: Colors.black)),
                  IconButton(
                      onPressed: () {
                        cartController.addProductToCart(model);
                        Get.snackbar(
                          "Successfully !",
                          "The product has been removed successfully",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                          colorText: Colors.white,
                        );
                      },
                      icon:
                          const Icon(Icons.shopping_cart, color: Colors.black)),
                ],
              );
            }),
            if (model.image != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Image.network(
                  model.image!,
                  height: Get.height * .3,
                  width: Get.width,
                ),
              ),
            if (model.descriptionEn != null)
              Text(
                model.descriptionEn!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price : \$${model.price!}',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(width: 15),
                // Text(
                //   'Discount : ' ?? ''.tr,
                //   style: const TextStyle(fontSize: 18, color: Colors.grey),
                // ),
                Text(
                  (model.discount ?? 0).toString(),
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                        primary: mainColor,
                      ),
                      onPressed: () {
                        cartController.addProductToCart(model);
                        Get.snackbar(
                          "Successfully !",
                          "The product has been removed successfully",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                          colorText: Colors.white,
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add to cart",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.shopping_cart),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
