///  double get rating => rate / rateNum;

import 'dart:convert';
import 'super_date_converters.dart';

///****************************************
///region Model ProductModelFields
class ProductModelFields {
  static const String id = 'id';
  static const String image = 'image';
  static const String nameAr = 'nameAr';
  static const String nameEn = 'nameEn';
  static const String descriptionAr = 'descriptionAr';
  static const String descriptionEn = 'descriptionEn';
  static const String typeEn = 'typeEn';
  static const String typeAr = 'typeAr';
  static const String categoryID = 'categoryID';
  static const String shopID = 'shopID';
  static const String price = 'price';
  static const String discount = 'discount';
  static const String rateNum = 'rateNum';
  static const String rate = 'rate';

  static const List<String> list = [
    id,
    image,
    nameAr,
    nameEn,
    descriptionAr,
    descriptionEn,
    typeEn,
    typeAr,
    categoryID,
    shopID,
    price,
    discount,
    rateNum,
    rate
  ];
}

///endregion Model ProductModelFields

///****************************************
///region Model ProductModel
class ProductModel {
  ///region Fields
  String? id;
  String? image;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  String? typeEn;
  String? typeAr;
  String? categoryID;
  String? shopID;
  double? price;
  double? discount;
  int rateNum = 1;
  double rate = 5;

  ///endregion Fields
  double get rating => rate / rateNum;

  ///region FieldsList
  List<String> fieldsList = ProductModelFields.list;
  List<dynamic> get toArgs => [
        id,
        image,
        nameAr,
        nameEn,
        descriptionAr,
        descriptionEn,
        typeEn,
        typeAr,
        categoryID,
        shopID,
        price,
        discount,
        rateNum,
        rate
      ];

  ///endregion FieldsList

  ///region newInstance
  ProductModel get newInstance => ProductModel();

  ///endregion newInstance

  ///region default constructor
  ProductModel(
      {this.id,
      this.image,
      this.nameAr,
      this.nameEn,
      this.descriptionAr,
      this.descriptionEn,
      this.typeEn,
      this.typeAr,
      this.categoryID,
      this.shopID,
      this.price,
      this.discount,
      this.rateNum = 1,
      this.rate = 5});

  ///endregion default constructor

  ///region withFields constructor
  ProductModel.withFields(
      this.id,
      this.image,
      this.nameAr,
      this.nameEn,
      this.descriptionAr,
      this.descriptionEn,
      this.typeEn,
      this.typeAr,
      this.categoryID,
      this.shopID,
      this.price,
      this.discount,
      this.rateNum,
      this.rate);

  ///endregion withFields constructor

  ///region fromMap
  ProductModel.fromMap(Map<String, dynamic> map) {
    updateFromMap(map);
  }

  ///endregion fromMap

  ///region fromMapList
  static List<ProductModel> fromMapList(List<dynamic> list) {
    return list
        .map((e) => ProductModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  ///endregion fromMapList

  ///region fromJson
  ProductModel.fromJson(String jsonInput)
      : this.fromMap(json.decode(jsonInput));

  ///endregion fromJson

  ///region toMap
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) {
      map[ProductModelFields.id] = id;
    }
    if (image != null) {
      map[ProductModelFields.image] = image;
    }
    if (nameAr != null) {
      map[ProductModelFields.nameAr] = nameAr;
    }
    if (nameEn != null) {
      map[ProductModelFields.nameEn] = nameEn;
    }
    if (descriptionAr != null) {
      map[ProductModelFields.descriptionAr] = descriptionAr;
    }
    if (descriptionEn != null) {
      map[ProductModelFields.descriptionEn] = descriptionEn;
    }
    if (typeEn != null) {
      map[ProductModelFields.typeEn] = typeEn;
    }
    if (typeAr != null) {
      map[ProductModelFields.typeAr] = typeAr;
    }
    if (categoryID != null) {
      map[ProductModelFields.categoryID] = categoryID;
    }
    if (shopID != null) {
      map[ProductModelFields.shopID] = shopID;
    }
    if (price != null) {
      map[ProductModelFields.price] = price;
    }
    if (discount != null) {
      map[ProductModelFields.discount] = discount;
    }
    map[ProductModelFields.rateNum] = rateNum;
    map[ProductModelFields.rate] = rate;
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
  ProductModel copyWith(
      {String? id,
      String? image,
      String? nameAr,
      String? nameEn,
      String? descriptionAr,
      String? descriptionEn,
      String? typeEn,
      String? typeAr,
      String? categoryID,
      String? shopID,
      double? price,
      double? discount,
      int? rateNum,
      double? rate}) {
    return ProductModel()
      ..id = id ?? this.id
      ..image = image ?? this.image
      ..nameAr = nameAr ?? this.nameAr
      ..nameEn = nameEn ?? this.nameEn
      ..descriptionAr = descriptionAr ?? this.descriptionAr
      ..descriptionEn = descriptionEn ?? this.descriptionEn
      ..typeEn = typeEn ?? this.typeEn
      ..typeAr = typeAr ?? this.typeAr
      ..categoryID = categoryID ?? this.categoryID
      ..shopID = shopID ?? this.shopID
      ..price = price ?? this.price
      ..discount = discount ?? this.discount
      ..rateNum = rateNum ?? this.rateNum
      ..rate = rate ?? this.rate;
  }

  ///endregion copyWith

  ///region updateWith
  void updateWith(
      {String? id,
      String? image,
      String? nameAr,
      String? nameEn,
      String? descriptionAr,
      String? descriptionEn,
      String? typeEn,
      String? typeAr,
      String? categoryID,
      String? shopID,
      double? price,
      double? discount,
      int? rateNum,
      double? rate}) {
    if (id != null) {
      this.id = id;
    }
    if (image != null) {
      this.image = image;
    }
    if (nameAr != null) {
      this.nameAr = nameAr;
    }
    if (nameEn != null) {
      this.nameEn = nameEn;
    }
    if (descriptionAr != null) {
      this.descriptionAr = descriptionAr;
    }
    if (descriptionEn != null) {
      this.descriptionEn = descriptionEn;
    }
    if (typeEn != null) {
      this.typeEn = typeEn;
    }
    if (typeAr != null) {
      this.typeAr = typeAr;
    }
    if (categoryID != null) {
      this.categoryID = categoryID;
    }
    if (shopID != null) {
      this.shopID = shopID;
    }
    if (price != null) {
      this.price = price;
    }
    if (discount != null) {
      this.discount = discount;
    }
    if (rateNum != null) {
      this.rateNum = rateNum;
    }
    if (rate != null) {
      this.rate = rate;
    }
  }

  ///endregion updateWith

  ///region updateFrom
  void updateFrom({required ProductModel another}) {
    if (another.id != null) {
      id = another.id;
    }
    if (another.image != null) {
      image = another.image;
    }
    if (another.nameAr != null) {
      nameAr = another.nameAr;
    }
    if (another.nameEn != null) {
      nameEn = another.nameEn;
    }
    if (another.descriptionAr != null) {
      descriptionAr = another.descriptionAr;
    }
    if (another.descriptionEn != null) {
      descriptionEn = another.descriptionEn;
    }
    if (another.typeEn != null) {
      typeEn = another.typeEn;
    }
    if (another.typeAr != null) {
      typeAr = another.typeAr;
    }
    if (another.categoryID != null) {
      categoryID = another.categoryID;
    }
    if (another.shopID != null) {
      shopID = another.shopID;
    }
    if (another.price != null) {
      price = another.price;
    }
    if (another.discount != null) {
      discount = another.discount;
    }
    rateNum = another.rateNum;
    rate = another.rate;
  }

  ///endregion updateFrom

  ///region updateFromMap
  void updateFromMap(Map<String, dynamic> map) {
    if (map[ProductModelFields.id] != null) {
      id = map[ProductModelFields.id].toString();
    }
    if (map[ProductModelFields.image] != null) {
      image = map[ProductModelFields.image].toString();
    }
    if (map[ProductModelFields.nameAr] != null) {
      nameAr = map[ProductModelFields.nameAr].toString();
    }
    if (map[ProductModelFields.nameEn] != null) {
      nameEn = map[ProductModelFields.nameEn].toString();
    }
    if (map[ProductModelFields.descriptionAr] != null) {
      descriptionAr = map[ProductModelFields.descriptionAr].toString();
    }
    if (map[ProductModelFields.descriptionEn] != null) {
      descriptionEn = map[ProductModelFields.descriptionEn].toString();
    }
    if (map[ProductModelFields.typeEn] != null) {
      typeEn = map[ProductModelFields.typeEn].toString();
    }
    if (map[ProductModelFields.typeAr] != null) {
      typeAr = map[ProductModelFields.typeAr].toString();
    }
    if (map[ProductModelFields.categoryID] != null) {
      categoryID = map[ProductModelFields.categoryID].toString();
    }
    if (map[ProductModelFields.shopID] != null) {
      shopID = map[ProductModelFields.shopID].toString();
    }
    if (map[ProductModelFields.price] != null) {
      price = double.tryParse(map[ProductModelFields.price].toString());
    }
    if (map[ProductModelFields.discount] != null) {
      discount = double.tryParse(map[ProductModelFields.discount].toString());
    }
    rateNum = int.tryParse(map[ProductModelFields.rateNum].toString()) ?? 1;
    rate = double.tryParse(map[ProductModelFields.rate].toString()) ?? 5;
  }

  ///endregion updateFromMap

  ///region Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel &&
        id == other.id &&
        image == other.image &&
        nameAr == other.nameAr &&
        nameEn == other.nameEn &&
        descriptionAr == other.descriptionAr &&
        descriptionEn == other.descriptionEn &&
        typeEn == other.typeEn &&
        typeAr == other.typeAr &&
        categoryID == other.categoryID &&
        shopID == other.shopID &&
        price == other.price &&
        discount == other.discount &&
        rateNum == other.rateNum &&
        rate == other.rate;
  }

  bool isTheSameObjectID(ProductModel other) =>
      id != null && other.id != null && id == other.id;
  @override
  int get hashCode =>
      id.hashCode ^
      image.hashCode ^
      nameAr.hashCode ^
      nameEn.hashCode ^
      descriptionAr.hashCode ^
      descriptionEn.hashCode ^
      typeEn.hashCode ^
      typeAr.hashCode ^
      categoryID.hashCode ^
      shopID.hashCode ^
      price.hashCode ^
      discount.hashCode ^
      rateNum.hashCode ^
      rate.hashCode;

  ///endregion Equality
}

///endregion Model ProductModel
