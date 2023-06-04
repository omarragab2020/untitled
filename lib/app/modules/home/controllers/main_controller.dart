import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/app/data/models/product_model.dart';
import 'package:untitled/app/data/models/shop_model.dart';
import 'package:untitled/app/services/firebase_handler.dart';

import '../../../data/models/category_model.dart';
import '../../../services/firebase_db.dart';

class MainController extends GetxService {
  static MainController get to => Get.find();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool val) => _loading.value = val;

  final _currentSelectedProductType = 0.obs;
  int get currentSelectedProductType => _currentSelectedProductType.value;
  set currentSelectedProductType(int val) =>
      _currentSelectedProductType.value = val;

  final _currentTypeSelected = 0.obs;
  int get currentTypeSelected => _currentTypeSelected.value;
  set currentTypeSelected(int val) => _currentTypeSelected.value = val;

  final _currentOrderStateSelected = 0.obs;
  int get currentOrderStateSelected => _currentOrderStateSelected.value;
  set currentOrderStateSelected(int val) =>
      _currentOrderStateSelected.value = val;
  RxInt currentPoint = 0.obs;

  initAll() async {
    await FirebaseDB.initDB();
    await FirebaseDB.initDB2();
    await FirebaseDB.initDB3();
  }

  @override
  void onInit() {
    super.onInit();
    // initAll();
    List? storedShoppings = storage.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favoritesList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
  }

  var productList = <ProductModel>[].obs;
  var favoritesList = <ProductModel>[].obs;
  var lastProductList = <ProductModel>[].obs;
  var storage = GetStorage();

  void manageFavorites(ProductModel product) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == product.id);

    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await storage.remove('isFavoritesList');
    } else {
      favoritesList.add(product);

      await storage.write('isFavoritesList', favoritesList);
    }
  }

  void manageLastOrder(ProductModel product) async {
    var existingIndex =
        lastProductList.indexWhere((element) => element.id == product.id);

    if (existingIndex >= 0) {
      lastProductList.removeAt(existingIndex);
      await storage.remove('isFavoritesList');
    } else {
      lastProductList.add(product);

      await storage.write('isFavoritesList', lastProductList);
    }
  }

  void manageFavorites2(String productId) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await storage.remove('isFavoritesList');
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));

      await storage.write('isFavoritesList', favoritesList);
    }
  }

  bool isFavorites(String productId) {
    return favoritesList.any((element) => element.id == productId);
  }
//Search Bar Logic

  void addSearchToList(String searchName) {
    _currentTypeSelected.refresh();
  }

  void clearSearch() {
    addSearchToList("");
  }
}
