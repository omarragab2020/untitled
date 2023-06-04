import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/app/modules/home/controllers/home_controller.dart';
import 'package:untitled/app/modules/home/controllers/main_controller.dart';
import 'package:untitled/app/modules/home/controllers/product_controller.dart';
import 'package:untitled/app/modules/home/views/screens/product_screen/category_products_screen.dart';
import 'package:untitled/app/modules/home/views/screens/product_screen/favorites_screen.dart';
import 'package:untitled/app/modules/home/views/widgets/products/product_types_view.dart';
import 'package:untitled/app/modules/home/views/widgets/home/search_text_form.dart';
import 'package:untitled/app/services/firebase_handler.dart';
import 'package:untitled/utils/helpers.dart';

import '../../../../../data/models/category_model.dart';
import '../../../../../data/models/shop_model.dart';
import '../../../../../services/category_services.dart';
import '../../../controllers/card_controller.dart';
import '../../widgets/text_utils.dart';
import '../cart_item_screen.dart';
import 'package:badges/badges.dart' as badges;

class CategoryScreen extends GetView<MainController> {
  CategoryScreen({super.key, required this.shop});

  ShopModel shop;
  final cartController = Get.find<CartController>();
  final productController = Get.find<ProductController>();

  final _searchController = TextEditingController().obs;

  TextEditingController get searchController => _searchController.value;

  set searchController(TextEditingController val) =>
      _searchController.value = val;

  @override
  Widget build(BuildContext context) {
    return controller.loading
        ? const Center(
            child: CircularProgressIndicator(
            color: mainColor,
          ))
        : Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title: TextUtils(text: (shop.name ?? 'Shop').tr, fontSize: 22),
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         Get.to(() => FavoritesScreen());
              //       },
              //       icon: const Icon(
              //         Icons.favorite,
              //         size: 30,
              //       ))
              // ],
              elevation: 0,
              centerTitle: true,
              backgroundColor: mainColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  MyTextField(
                    searchController,
                    onChanged: (s) {
                      controller.addSearchToList(s);
                    },
                  ),
                  const SizedBox(height: 10),
                  ProductTypesView(
                    onTap: (index) {
                      print('index = $index');
                      controller.currentTypeSelected = index;
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FutureBuilder<QuerySnapshot>(
                          // inside the <> you enter the type of your stream
                          future: FirebaseHandler.getShopCategories(shop.id!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                List<CategoryModel> list =
                                    CategoryModel.fromMapList(snapshot
                                        .data!.docs
                                        .map((e) => e.data())
                                        .toList());

                                List<CategoryModel> displayList = [...list];

                                return Obx(() {
                                  mPrint('Refreshing...');
                                  if (searchController.text.isNotEmpty) {
                                    mPrint('searchController');
                                    displayList = list
                                        .where((element) =>
                                            element.name
                                                ?.toLowerCase()
                                                .contains(searchController.text
                                                    .toLowerCase()
                                                    .trim()) ==
                                            true)
                                        .toList();
                                  } else if (controller.currentTypeSelected ==
                                      0) {
                                    displayList = [...list];
                                  } else if (controller.currentTypeSelected ==
                                      1) {
                                    displayList = [
                                      ...list
                                          .where((element) =>
                                              element.type
                                                  ?.contains('fruits') ==
                                              true)
                                          .toList()
                                    ];
                                  } else if (controller.currentTypeSelected ==
                                      2) {
                                    displayList = [
                                      ...list
                                          .where((element) =>
                                              element.type
                                                  ?.contains('vegetable') ==
                                              true)
                                          .toList()
                                    ];
                                  }
                                  return GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 150,
                                              childAspectRatio: .7,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount: displayList.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return Container(
                                          child: buildCategoriesWidget(
                                              displayList[index], shop),
                                        );
                                      });
                                });
                              }
                              return const Text("No data");
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

Widget buildCategoriesWidget(CategoryModel categoryModel, ShopModel ShopModel) {
  // String name = "";

  return GestureDetector(
    onTap: () {
      Get.to(() => CategoryProductsScreen(
            category: categoryModel,
            shop: ShopModel,
          ));
    },
    child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('category').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Waiting'));
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                        fit: BoxFit.cover, '${categoryModel.image}'),
                  ),
                  Center(
                      child: Text(
                    categoryModel.name!.tr,
                    // categoryModel.name![name],
                    style: const TextStyle(fontSize: 16),
                  )),
                ],
              ),
            ),
          );
        }
        //   child: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(12),
        //     color: Colors.white,
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Expanded(
        //           child: Image.network(fit: BoxFit.cover, '${categoryModel.image}'),
        //         ),
        //         Center(
        //             child: Text(
        //           categoryModel.name!,
        //           // categoryModel.name![name],
        //           style: TextStyle(fontSize: 16),
        //         )),
        //       ],
        //     ),
        //   ),
        // ),
        ),
  );
}
