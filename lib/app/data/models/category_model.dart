import 'dart:convert';
import 'super_date_converters.dart';

///****************************************
///region Model CategoryModelFields
class CategoryModelFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String image = 'image';
  static const String type = 'type';
  static const String shopID = 'shopID';

  static const List<String> list = [id, name, image, type, shopID];
}

///endregion Model CategoryModelFields

///****************************************
///region Model CategoryModel
class CategoryModel {
  ///region Fields
  String? id;
  String? name;
  String? image;
  String? type;
  String? shopID;

  ///endregion Fields

  ///region FieldsList
  List<String> fieldsList = CategoryModelFields.list;
  List<dynamic> get toArgs => [id, name, image, type, shopID];

  ///endregion FieldsList

  ///region newInstance
  CategoryModel get newInstance => CategoryModel();

  ///endregion newInstance

  ///region default constructor
  CategoryModel({this.id, this.name, this.image, this.type, this.shopID});

  ///endregion default constructor

  ///region withFields constructor
  CategoryModel.withFields(
      this.id, this.name, this.image, this.type, this.shopID);

  ///endregion withFields constructor

  ///region fromMap
  CategoryModel.fromMap(Map<String, dynamic> map) {
    updateFromMap(map);
  }

  ///endregion fromMap

  ///region fromMapList
  static List<CategoryModel> fromMapList(List<dynamic> list) {
    return list
        .map((e) => CategoryModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  ///endregion fromMapList

  ///region fromJson
  CategoryModel.fromJson(String jsonInput)
      : this.fromMap(json.decode(jsonInput));

  ///endregion fromJson

  ///region toMap
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) {
      map[CategoryModelFields.id] = id;
    }
    if (name != null) {
      map[CategoryModelFields.name] = name;
    }
    if (image != null) {
      map[CategoryModelFields.image] = image;
    }
    if (type != null) {
      map[CategoryModelFields.type] = type;
    }
    if (shopID != null) {
      map[CategoryModelFields.shopID] = shopID;
    }
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
  CategoryModel copyWith(
      {String? id, String? name, String? image, String? type, String? shopID}) {
    return CategoryModel()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..image = image ?? this.image
      ..type = type ?? this.type
      ..shopID = shopID ?? this.shopID;
  }

  ///endregion copyWith

  ///region updateWith
  void updateWith(
      {String? id, String? name, String? image, String? type, String? shopID}) {
    if (id != null) {
      this.id = id;
    }
    if (name != null) {
      this.name = name;
    }
    if (image != null) {
      this.image = image;
    }
    if (type != null) {
      this.type = type;
    }
    if (shopID != null) {
      this.shopID = shopID;
    }
  }

  ///endregion updateWith

  ///region updateFrom
  void updateFrom({required CategoryModel another}) {
    if (another.id != null) {
      id = another.id;
    }
    if (another.name != null) {
      name = another.name;
    }
    if (another.image != null) {
      image = another.image;
    }
    if (another.type != null) {
      type = another.type;
    }
    if (another.shopID != null) {
      shopID = another.shopID;
    }
  }

  ///endregion updateFrom

  ///region updateFromMap
  void updateFromMap(Map<String, dynamic> map) {
    if (map[CategoryModelFields.id] != null) {
      id = map[CategoryModelFields.id].toString();
    }
    if (map[CategoryModelFields.name] != null) {
      name = map[CategoryModelFields.name].toString();
    }
    if (map[CategoryModelFields.image] != null) {
      image = map[CategoryModelFields.image].toString();
    }
    if (map[CategoryModelFields.type] != null) {
      type = map[CategoryModelFields.type].toString();
    }
    if (map[CategoryModelFields.shopID] != null) {
      shopID = map[CategoryModelFields.shopID].toString();
    }
  }

  ///endregion updateFromMap

  ///region Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryModel &&
        id == other.id &&
        name == other.name &&
        image == other.image &&
        type == other.type &&
        shopID == other.shopID;
  }

  bool isTheSameObjectID(CategoryModel other) =>
      id != null && other.id != null && id == other.id;
  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      type.hashCode ^
      shopID.hashCode;

  ///endregion Equality
}

///endregion Model CategoryModel
