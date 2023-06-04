import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/models/product_model.dart';
import 'package:untitled/app/data/models/user_model.dart';
import 'package:untitled/app/modules/home/controllers/auth_controller.dart';
import 'package:uuid/uuid.dart';

import '../../utils/helpers.dart';
import '../data/models/address_model.dart';
import '../data/models/category_model.dart';
import '../data/models/shop_model.dart';
import '../data/models/super_date_converters.dart';
import 'encryption_service.dart';

class FirebaseHandler {
  // static AuthService authService = AuthService.to;

  ///************************************************************************************************
  static const String refUserDoc = 'users';
  static const String refShopsDoc = 'shops';
  static const String refCategoryDoc = 'categories';
  static const String refProductDoc = 'products';
  static const String refAddressesDoc = 'addresses';

  ///************************************************************************************************
  static FirebaseFirestore storeInstance = FirebaseFirestore.instance;
  static CollectionReference<Map<String, dynamic>> usersCollection =
      storeInstance.collection(refUserDoc);
  static CollectionReference<Map<String, dynamic>> shopsCollection =
      storeInstance.collection(refShopsDoc);

  ///region Users
  ///************************************************************************************************
  static Future<QuerySnapshot<Map<String, dynamic>>> getUsers() =>
      usersCollection.get();
  static DocumentReference<Map<String, dynamic>> getUserRef(String id) =>
      usersCollection.doc(id);

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id) =>
      getUserRef(id).get();

  static Query<Map<String, dynamic>> searchUsers(ShopModel tripModel) {
    Query<Map<String, dynamic>> query = shopsCollection;
    query = query.where(ShopModelFields.name, isEqualTo: 1);

    return query;
  }

  static Future<bool> saveUser(UserModel user) async {
    try {
      if (user.id == null) {
        user.id = getNextID();
        await usersCollection.doc(user.id).set(user.toMap());
      } else {
        await usersCollection.doc(user.id).update(user.toMap());
      }
      return true;
    } on Exception catch (e) {
      mPrintError('Exception $e');
      return false;
    }
  }

  ///endregion Shops
  ///region Addresses
  ///************************************************************************************************
  static CollectionReference<Map<String, dynamic>> getAddressesRef(
          String userID) =>
      getUserRef(userID).collection(refAddressesDoc);

  static Future<QuerySnapshot<Map<String, dynamic>>> getAddresses(
          String userID) =>
      getAddressesRef(userID).get();

  static DocumentReference<Map<String, dynamic>> getAddressRef(
          String userID, String addressID) =>
      getAddressesRef(userID).doc(addressID);

  static Future<DocumentSnapshot<Map<String, dynamic>>> getAddress(
          String userID, String addressID) =>
      getAddressRef(userID, addressID).get();

  static Query<Map<String, dynamic>> searchGetAddresses(ShopModel tripModel) {
    Query<Map<String, dynamic>> query = shopsCollection;
    query = query.where(ShopModelFields.name, isEqualTo: 1);

    return query;
  }

  static Future<bool> saveAddress(AddressModel address) async {
    try {
      if (AuthController.to.isSignedIn) {
        if (address.id == null) {
          address.id = getNextID();
          await getAddressesRef(AuthController.to.user!.id!)
              .doc(address.id)
              .set(address.toMap());
        } else {
          await getAddressesRef(AuthController.to.user!.id!)
              .doc(address.id)
              .update(address.toMap());
        }
        return true;
      } else {
        mPrintError('Not logged in');
        return false;
      }
    } on Exception catch (e) {
      mPrintError('Exception $e');
      return false;
    }
  }

  ///endregion Shops
  ///region Shops
  ///************************************************************************************************
  static Future<QuerySnapshot<Map<String, dynamic>>> getShops() =>
      shopsCollection.get();
  static Future<DocumentSnapshot<Map<String, dynamic>>> getShop(String id) =>
      shopsCollection.doc(id).get();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getShopsSnapshots() =>
      shopsCollection.snapshots();

  static Query<Map<String, dynamic>> searchShops(ShopModel tripModel) {
    Query<Map<String, dynamic>> query = shopsCollection;
    query = query.where(ShopModelFields.name, isEqualTo: 1);

    return query;
  }

  static Future<bool> saveShop(ShopModel shop) async {
    try {
      if (shop.id == null) {
        shop.id = getNextID();
        await shopsCollection.doc(shop.id).set(shop.toMap());
      } else {
        await shopsCollection.doc(shop.id).update(shop.toMap());
      }
      return true;
    } on Exception catch (e) {
      mPrintError('Exception $e');
      return false;
    }
  }

  ///endregion Shops
  ///region Category
  ///************************************************************************************************
  static Future<QuerySnapshot<Map<String, dynamic>>> getShopCategories(
          String shopID) =>
      shopsCollection.doc(shopID).collection(refCategoryDoc).get();

  static Future<DocumentSnapshot<Map<String, dynamic>>> getCategory(
          String shopID, String categoryID) =>
      shopsCollection
          .doc(shopID)
          .collection(refCategoryDoc)
          .doc(categoryID)
          .get();

  static Future<bool> saveCategory(CategoryModel category) async {
    try {
      if (category.id == null) {
        category.id = getNextID();
        await shopsCollection
            .doc(category.shopID)
            .collection(refCategoryDoc)
            .doc(category.id)
            .set(category.toMap());
      } else {
        await shopsCollection
            .doc(category.shopID)
            .collection(refCategoryDoc)
            .doc(category.id)
            .update(category.toMap());
      }
      return true;
    } on Exception catch (e) {
      mPrintError('Exception $e');
      return false;
    }
  }

  ///endregion Category
  ///region Products
  ///************************************************************************************************
  static Future<QuerySnapshot<Map<String, dynamic>>> getCategoryProducts(
          CategoryModel categoryModel) =>
      shopsCollection
          .doc(categoryModel.shopID)
          .collection(refCategoryDoc)
          .doc(categoryModel.id)
          .collection(refProductDoc)
          .get();

  static Future<bool> saveProduct(
      String shopID, ProductModel productModel) async {
    try {
      if (productModel.id == null) {
        productModel.id = getNextID();
        await shopsCollection
            .doc(shopID)
            .collection(refCategoryDoc)
            .doc(productModel.categoryID)
            .collection(refProductDoc)
            .doc(productModel.id)
            .set(productModel.toMap());
      } else {
        await shopsCollection
            .doc(shopID)
            .collection(refCategoryDoc)
            .doc(productModel.categoryID)
            .collection(refProductDoc)
            .doc(productModel.id)
            .update(productModel.toMap());
      }
      return true;
    } on Exception catch (e) {
      mPrintError('Exception $e');
      return false;
    }
  }

  ///endregion Products

  static String getNextID([String prefix = '']) {
    if (prefix.isNotEmpty) prefix += "_";
    return '$prefix${DateTime.now().millisecondsSinceEpoch}_${(const Uuid()).v1().replaceAll('-', '')}';
  }

  static void updateMyUser(Map<String, dynamic> map) {
    if (AuthController.to.isSignedIn) {
      FirebaseHandler.updateUser(AuthController.to.user!.id!, map);
    }
  }

  static void updateUser(String userID, Map<String, dynamic> map) {
    FirebaseHandler.getUserRef(userID).update(map);
  }

  static bool withdrawCard(QueryDocumentSnapshot<Map<String, dynamic>> card) {
    if (AuthController.to.isSignedIn) {
      var cardMap = card.data();
      card.reference.update({
        'available': '0',
        'withdraw_by_id': AuthController.to.user!.id!,
        'withdraw_by_name': AuthController.to.user!.name!,
        'balance_before': AuthController.to.user!.balance,
        'balance_after':
            AuthController.to.user!.balance + double.parse(cardMap['value'])
      });
      FirebaseHandler.updateMyUser({
        UserModelFields.balance:
            FieldValue.increment(double.parse(cardMap['value']))
      });

      // loggedInUser!.balance += double.parse(cardMap['value']);
      // mShowToast('${'Congratulations, You have got '.tr}${cardMap['title']}', displayTime: 4.seconds);
      return true;
    } else {
      // mShowToast('Error, How do you reached here!');
      mPrintError('Error, How do you reached here!');
      return false;
    }
  }

  ///region Cards
  // static Query<Map<String, dynamic>> getCardBySerialRef(String serial) =>
  //     scratchCardsCollection.where('serial', isEqualTo: serial.trim());
  //
  // static Future<QuerySnapshot<Map<String, dynamic>>> getCardBySerial(
  //         String serial) =>
  //     getCardBySerialRef(serial).get();
  //
  // static Future<QuerySnapshot<Map<String, dynamic>>> getCardBySerialAndTime(
  //         String serial) =>
  //     scratchCardsCollection
  //         .where('serial', isEqualTo: serial.trim())
  //         .where('available', isEqualTo: '1')
  //         // .where('expire_date', isLessThanOrEqualTo: Timestamp.now())
  //         .where('expire_date',
  //             isGreaterThanOrEqualTo: DateTime.now().toDateStr())
  //         .get();
  //
  // static Future<QuerySnapshot<Map<String, dynamic>>> getCards() =>
  //     scratchCardsCollection.get();
  //
  // static Stream<QuerySnapshot<Map<String, dynamic>>> getCardsSnapshots() =>
  //     scratchCardsCollection.snapshots();

  ///endregion Cards
}
