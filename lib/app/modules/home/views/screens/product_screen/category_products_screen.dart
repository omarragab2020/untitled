import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/data/models/product_model.dart';
import 'package:untitled/app/modules/home/views/widgets/cart/cardItem_builder.dart';
import 'package:untitled/app/modules/home/views/widgets/products/product_types_view.dart';
import 'package:untitled/app/modules/home/views/widgets/text_utils.dart';
import 'package:untitled/app/services/firebase_handler.dart';

import '../../../../../data/models/category_model.dart';
import '../../../../../data/models/shop_model.dart';
import '../../../../../services/category_services.dart';
import '../../../controllers/card_controller.dart';
import '../../../controllers/main_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../widgets/home/search_text_form.dart';
import '../cart_item_screen.dart';
import 'favorites_screen.dart';
import 'single_product.dart';
import 'package:badges/badges.dart' as badges;

class CategoryProductsScreen extends GetView<MainController> {
  CategoryProductsScreen(
      {super.key, required this.category, required this.shop});

  final CategoryModel category;
  final cartController = Get.find<CartController>();
  final _searchController = TextEditingController().obs;
  ShopModel shop;

  TextEditingController get searchController => _searchController.value;

  set searchController(TextEditingController val) =>
      _searchController.value = val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            children: [
              TextUtils(text: category.name!.tr, fontSize: 22),
              TextUtils(text: (shop.name ?? 'Shop').tr, fontSize: 22),
            ],
          ),
          actions: [
            Obx(() {
              return badges.Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                badgeAnimation: const badges.BadgeAnimation.rotation(
                  animationDuration: Duration(seconds: 6),
                ),
                badgeStyle: BadgeStyle(
                  badgeColor: Colors.green,
                ),
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    onPressed: () {
                      Get.to(CartItemScreen(
                        shopModel: shop,
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
          padding: const EdgeInsets.all(12.0),
          child: category.id == null
              ? const Text("ID error")
              : Column(
                  children: [
                    Expanded(
                      child: FutureBuilder<QuerySnapshot>(
                          // inside the <> you enter the type of your stream
                          future: FirebaseHandler.getCategoryProducts(category),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                List<ProductModel> list =
                                    ProductModel.fromMapList(snapshot.data!.docs
                                        .map((e) => e.data())
                                        .toList());

                                List<ProductModel> displayList = [...list];

                                return AnimationLimiter(
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              childAspectRatio: .8,
                                              maxCrossAxisExtent: 200,
                                              crossAxisSpacing: 6,
                                              mainAxisSpacing: 9),
                                      itemCount: list.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 375),
                                          child: SlideAnimation(
                                            delay: const Duration(
                                                milliseconds: 100),
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                                child: CardItemBuilder(
                                              productModel: displayList[index],
                                              shopModel: shop,
                                            )),
                                          ),
                                        );
                                      }),
                                );
                              }
                              return const Text("No data");
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                  ],
                ),
        ));
  }
}
