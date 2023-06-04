import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/app/data/models/shop_model.dart';
import 'package:untitled/app/modules/home/views/widgets/cart/empty_cart.dart';
import 'package:untitled/app/modules/home/views/widgets/text_utils.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/models/product_model.dart';
import '../../../../services/firebase_handler.dart';
import '../../controllers/card_controller.dart';
import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';

class CartItemScreen extends StatelessWidget {
  CartItemScreen({
    Key? key,
    required shopModel,
  }) : super(key: key);

  final controller = Get.find<CartController>();
  ShopModel? shopModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return const EmptyCart();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Suggested products',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseHandler.getCategoryProducts(CategoryModel(
                          id: controller.productsMap.values.first.productModel
                              ?.categoryID,
                          shopID: controller
                              .productsMap.values.first.productModel?.shopID)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            List<ProductModel> list = ProductModel.fromMapList(
                                snapshot.data!.docs
                                    .map((e) => e.data())
                                    .toList());

                            List<ProductModel> displayList = [...list];
                            return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(width: 5);
                                },
                                itemCount: displayList.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller
                                          .addProductToCart(displayList[index]);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.network(
                                            displayList[index].image!,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Container(
                                          width: 70,
                                          color: mainColor,
                                          child: Center(
                                              child: Text(
                                            controller.isProductAdded(
                                                    displayList[index])
                                                ? '${controller.getCartProduct(displayList[index]).count}'
                                                : 'ADD',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          }
                          return const Text("No data");
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                Expanded(
                  flex: 4,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CartProductCard(
                        cartProductModel:
                            controller.productsMap.values.toList()[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: controller.productsMap.length,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12, right: 12, left: 12),
                  child: CartTotal(),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
