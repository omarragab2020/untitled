import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/app/data/models/cart_product_model.dart';
import 'package:untitled/app/data/models/product_model.dart';

import '../../../routes/app_pages.dart';
import '../views/widgets/text_utils.dart';

class CartController extends GetxService {
  final _productsMap = <String, CartProductModel>{}.obs;
  Map<String, CartProductModel> get productsMap => _productsMap;
  set productsMap(Map<String, CartProductModel> val) =>
      _productsMap.value = val;

  bool isProductIDAdded(String id) => productsMap.containsKey(id);
  bool isProductAdded(ProductModel productModel) =>
      isProductIDAdded(productModel.id!);

  CartProductModel getCartProductByID(String id) => productsMap.values
      .toList()
      .singleWhere((element) => element.productModel?.id == id);
  CartProductModel getCartProduct(ProductModel productModel) =>
      getCartProductByID(productModel.id!);

  void addProductToCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel.id)) {
      productsMap[productModel.id!]!.count++;
    } else {
      productsMap[productModel.id!] =
          CartProductModel(productModel: productModel);
    }
    _productsMap.refresh();
  }

  void addCartProductToCart(CartProductModel cartProductModel) {
    if (cartProductModel.productModel != null) {
      addProductToCart(cartProductModel.productModel!);
    }
  }

  void removeProductsFromCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel.id) &&
        productsMap[productModel.id]!.count == 1) {
      productsMap.remove(productModel.id);
    } else {
      productsMap[productModel.id!]!.count--;
    }
    _productsMap.refresh();
  }

  void removeCartProductFromCart(CartProductModel cartProductModel) {
    if (cartProductModel.productModel != null) {
      removeProductsFromCart(cartProductModel.productModel!);
    }
  }

  void removeOneProduct(ProductModel productModel) {
    productsMap.remove(productModel.id);
  }

  void removeOneCartProduct(CartProductModel cartProductModel) {
    if (cartProductModel.productModel?.id != null) {
      productsMap.remove(cartProductModel.productModel!.id);
    }
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        // Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: mainColor,
    );
  }

  get productSubTotal => productsMap.entries.map((e) => e.value.cost).toList();

  get total => productsMap.entries
      .map((e) => e.value.costDiscount)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  get productSubTotalDis =>
      productsMap.entries.map((e) => e.value.costDiscount).toList();

  get totalDis => productsMap.entries
      .map((e) => e.value.costDiscount)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() => productsMap.length;
}
