import 'dart:convert';
import 'super_date_converters.dart';

///****************************************
///region Model ShopModelFields
class ShopModelFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String address = 'address';
  static const String image = 'image';
  static const String rateNum = 'rateNum';
  static const String rate = 'rate';

  static const List<String> list = [
    id,
    name,
    phone,
    address,
    image,
    rateNum,
    rate
  ];
}

///endregion Model ShopModelFields

///****************************************
///region Model ShopModel
class ShopModel {
  ///region Fields
  String? id;
  String? name;
  String? phone;
  String? address;
  String? image;
  int rateNum = 1;
  double rate = 5;

  ///endregion Fields

  double get rating => rate / rateNum;

  ///region FieldsList
  List<String> fieldsList = ShopModelFields.list;
  List<dynamic> get toArgs => [id, name, phone, address, image, rateNum, rate];

  ///endregion FieldsList

  ///region newInstance
  ShopModel get newInstance => ShopModel();

  ///endregion newInstance

  ///region default constructor
  ShopModel(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.image,
      this.rateNum = 1,
      this.rate = 5});

  ///endregion default constructor

  ///region withFields constructor
  ShopModel.withFields(this.id, this.name, this.phone, this.address, this.image,
      this.rateNum, this.rate);

  ///endregion withFields constructor

  ///region fromMap
  ShopModel.fromMap(Map<String, dynamic> map) {
    updateFromMap(map);
  }

  ///endregion fromMap

  ///region fromMapList
  static List<ShopModel> fromMapList(List<dynamic> list) {
    return list
        .map((e) => ShopModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  ///endregion fromMapList

  ///region fromJson
  ShopModel.fromJson(String jsonInput) : this.fromMap(json.decode(jsonInput));

  ///endregion fromJson

  ///region toMap
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) {
      map[ShopModelFields.id] = id;
    }
    if (name != null) {
      map[ShopModelFields.name] = name;
    }
    if (phone != null) {
      map[ShopModelFields.phone] = phone;
    }
    if (address != null) {
      map[ShopModelFields.address] = address;
    }
    if (image != null) {
      map[ShopModelFields.image] = image;
    }
    map[ShopModelFields.rateNum] = rateNum;
    map[ShopModelFields.rate] = rate;
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
  ShopModel copyWith(
      {String? id,
      String? name,
      String? phone,
      String? address,
      String? image,
      int? rateNum,
      double? rate}) {
    return ShopModel()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..phone = phone ?? this.phone
      ..address = address ?? this.address
      ..image = image ?? this.image
      ..rateNum = rateNum ?? this.rateNum
      ..rate = rate ?? this.rate;
  }

  ///endregion copyWith

  ///region updateWith
  void updateWith(
      {String? id,
      String? name,
      String? phone,
      String? address,
      String? image,
      int? rateNum,
      double? rate}) {
    if (id != null) {
      this.id = id;
    }
    if (name != null) {
      this.name = name;
    }
    if (phone != null) {
      this.phone = phone;
    }
    if (address != null) {
      this.address = address;
    }
    if (image != null) {
      this.image = image;
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
  void updateFrom({required ShopModel another}) {
    if (another.id != null) {
      id = another.id;
    }
    if (another.name != null) {
      name = another.name;
    }
    if (another.phone != null) {
      phone = another.phone;
    }
    if (another.address != null) {
      address = another.address;
    }
    if (another.image != null) {
      image = another.image;
    }
    rateNum = another.rateNum;
    rate = another.rate;
  }

  ///endregion updateFrom

  ///region updateFromMap
  void updateFromMap(Map<String, dynamic> map) {
    if (map[ShopModelFields.id] != null) {
      id = map[ShopModelFields.id].toString();
    }
    if (map[ShopModelFields.name] != null) {
      name = map[ShopModelFields.name].toString();
    }
    if (map[ShopModelFields.phone] != null) {
      phone = map[ShopModelFields.phone].toString();
    }
    if (map[ShopModelFields.address] != null) {
      address = map[ShopModelFields.address].toString();
    }
    if (map[ShopModelFields.image] != null) {
      image = map[ShopModelFields.image].toString();
    }
    rateNum = int.tryParse(map[ShopModelFields.rateNum].toString()) ?? 1;
    rate = double.tryParse(map[ShopModelFields.rate].toString()) ?? 5;
  }

  ///endregion updateFromMap

  ///region Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShopModel &&
        id == other.id &&
        name == other.name &&
        phone == other.phone &&
        address == other.address &&
        image == other.image &&
        rateNum == other.rateNum &&
        rate == other.rate;
  }

  bool isTheSameObjectID(ShopModel other) =>
      id != null && other.id != null && id == other.id;
  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      address.hashCode ^
      image.hashCode ^
      rateNum.hashCode ^
      rate.hashCode;

  ///endregion Equality
}

///endregion Model ShopModel
