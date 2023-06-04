import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryServices {
  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection('category');

  final CollectionReference _productCollectionReference =
      FirebaseFirestore.instance.collection('product');

  final CollectionReference _itemCollectionReference = FirebaseFirestore
      .instance
      .collection('product')
      .doc('V4Uck84hyEZJqj9zDyMn')
      .collection('items');

  static CollectionReference getCategoriesRef() =>
      FirebaseFirestore.instance.collection('category');

  static Query<Map<String, dynamic>> getCategoriesQueryRef([String? s]) =>
      FirebaseFirestore.instance
          .collection('category')
          .where('field', isEqualTo: s);

  static DocumentReference getCategoryRef(String categID) =>
      FirebaseFirestore.instance.collection('category').doc(categID);

  static CollectionReference getCategoryProductsRef(String categID) =>
      getCategoryRef(categID).collection('products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionReference.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productCollectionReference.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getItem() async {
    var value = await _itemCollectionReference.get();

    return value.docs;
  }
}
