import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/models/shop_model.dart';
import 'package:untitled/app/modules/home/views/screens/product_screen/single_product.dart';
import '../../../../../data/models/product_model.dart';
import '../../../controllers/card_controller.dart';
import '../../../controllers/main_controller.dart';
import '../text_utils.dart';

class CardItemBuilder extends StatelessWidget {
  CardItemBuilder(
      {required this.productModel, Key? key, required this.shopModel})
      : super(key: key);
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  final ProductModel productModel;
  final ShopModel shopModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SingleProduct(
              model: productModel,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    spreadRadius: 3,
                    blurRadius: 5),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.manageFavorites(productModel);
                          controller.isFavorites(productModel.id!)
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
                        icon: controller.isFavorites(productModel.id!)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_outline,
                                color: Colors.black)),
                    IconButton(
                        onPressed: () {
                          cartController.addProductToCart(productModel);
                          Get.snackbar(
                            "Successfully !",
                            "The product has been removed successfully",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 1),
                            colorText: Colors.white,
                          );
                        },
                        icon: const Icon(Icons.shopping_cart,
                            color: Colors.black)),
                  ],
                );
              }),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  productModel.descriptionEn!.tr,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: Get.width,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  productModel.image!,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    // right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price : ${productModel.price!}'.tr,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ((productModel.discount ?? 0).toString()),
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough),
                      ),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextUtils(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                text: productModel.rating.toStringAsFixed(2),
                                color: Colors.white,
                              ),
                              const Icon(Icons.star,
                                  size: 13, color: Colors.white)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
