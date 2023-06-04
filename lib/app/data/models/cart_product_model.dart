import 'dart:convert';
import 'product_model.dart';
import 'super_date_converters.dart';

///****************************************
///region Model CartProductModelFields
class CartProductModelFields {
  static const String productModel = 'productModel';
  static const String count = 'count';

  static const List<String> list = [productModel, count];
}

///endregion Model CartProductModelFields

///****************************************
///region Model CartProductModel
class CartProductModel {
  ///region Fields
  ProductModel? productModel;
  int count = 1;

  ///endregion Fields

  double get cost =>
      productModel == null ? 0 : count * (productModel!.price ?? 0);

  double get costDiscount => productModel?.discount == null
      ? cost
      : count * (productModel!.discount ?? 0);

  ///region FieldsList
  List<String> fieldsList = CartProductModelFields.list;
  List<dynamic> get toArgs => [productModel, count];

  ///endregion FieldsList

  ///region newInstance
  CartProductModel get newInstance => CartProductModel();

  ///endregion newInstance

  ///region default constructor
  CartProductModel({this.productModel, this.count = 1});

  ///endregion default constructor

  ///region withFields constructor
  CartProductModel.withFields(this.productModel, this.count);

  ///endregion withFields constructor

  ///region fromMap
  CartProductModel.fromMap(Map<String, dynamic> map) {
    updateFromMap(map);
  }

  ///endregion fromMap

  ///region fromMapList
  static List<CartProductModel> fromMapList(List<Map<String, dynamic>> list) {
    return list.map((e) => CartProductModel.fromMap(e)).toList();
  }

  ///endregion fromMapList

  ///region fromJson
  CartProductModel.fromJson(String jsonInput)
      : this.fromMap(json.decode(jsonInput));

  ///endregion fromJson

  ///region toMap
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (productModel != null) {
      map[CartProductModelFields.productModel] = productModel!.toMap();
    }
    map[CartProductModelFields.count] = count;
    return map;
  }

  ///endregion toMap

  ///region toJson
  String toJson() => json.encode(toMap());

  ///endregion toJson

  ///region toString
  @override
  String toString() => toMap().toString();

  ///endregion toString

  ///region copyWith
  CartProductModel copyWith({ProductModel? productModel, int? count}) {
    return CartProductModel()
      ..productModel = productModel ?? this.productModel
      ..count = count ?? this.count;
  }

  ///endregion copyWith

  ///region updateWith
  void updateWith({ProductModel? productModel, int? count}) {
    if (productModel != null) {
      this.productModel = productModel;
    }
    if (count != null) {
      this.count = count;
    }
  }

  ///endregion updateWith

  ///region updateFrom
  void updateFrom({required CartProductModel another}) {
    if (another.productModel != null) {
      productModel = another.productModel;
    }
    count = another.count;
  }

  ///endregion updateFrom

  ///region updateFromMap
  void updateFromMap(Map<String, dynamic> map) {
    if (map[CartProductModelFields.productModel] != null) {
      productModel = ProductModel.fromMap(
          map[CartProductModelFields.productModel] as Map<String, dynamic>);
    }
    count = int.tryParse(map[CartProductModelFields.count].toString()) ?? 1;
  }

  ///endregion updateFromMap

  ///region Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartProductModel &&
        productModel == other.productModel &&
        count == other.count;
  }

  @override
  int get hashCode => productModel.hashCode ^ count.hashCode;

  ///endregion Equality
}

///endregion Model CartProductModel
