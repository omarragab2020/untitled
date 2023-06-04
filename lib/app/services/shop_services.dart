import 'package:cloud_firestore/cloud_firestore.dart';

class ShopServices {
  final CollectionReference _shopCollectionReference =
      FirebaseFirestore.instance.collection('shop');

  static CollectionReference getShopRef() =>
      FirebaseFirestore.instance.collection('shop');

  Future<List<QueryDocumentSnapshot>> getShop() async {
    var value = await _shopCollectionReference.get();

    return value.docs;
  }
}
