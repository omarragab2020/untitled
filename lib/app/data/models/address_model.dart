import 'dart:convert';
import 'super_date_converters.dart';

///****************************************
///region Model AddressModelFields
class AddressModelFields {
  static const String id = 'id';
  static const String type = 'type';
  static const String streetName = 'streetName';
  static const String blockNum = 'blockNum';
  static const String floorNum = 'floorNum';
  static const String apartmentNum = 'apartmentNum';

  static const List<String> list = [
    id,
    type,
    streetName,
    blockNum,
    floorNum,
    apartmentNum
  ];
}

///endregion Model AddressModelFields

///****************************************
///region Model AddressModel
class AddressModel {
  ///region Fields
  String? id;
  String? type;
  String? streetName;
  String? blockNum;
  String? floorNum;
  String? apartmentNum;

  ///endregion Fields

  ///region FieldsList
  List<String> fieldsList = AddressModelFields.list;
  List<dynamic> get toArgs =>
      [id, type, streetName, blockNum, floorNum, apartmentNum];

  ///endregion FieldsList

  ///region newInstance
  AddressModel get newInstance => AddressModel();

  ///endregion newInstance

  ///region default constructor
  AddressModel(
      {this.id,
      this.type,
      this.streetName,
      this.blockNum,
      this.floorNum,
      this.apartmentNum});

  ///endregion default constructor

  ///region withFields constructor
  AddressModel.withFields(this.id, this.type, this.streetName, this.blockNum,
      this.floorNum, this.apartmentNum);

  ///endregion withFields constructor

  ///region fromMap
  AddressModel.fromMap(Map<String, dynamic> map) {
    updateFromMap(map);
  }

  ///endregion fromMap

  ///region fromMapList
  static List<AddressModel> fromMapList(List<Map<String, dynamic>> list) {
    return list.map((e) => AddressModel.fromMap(e)).toList();
  }

  ///endregion fromMapList

  ///region fromJson
  AddressModel.fromJson(String jsonInput)
      : this.fromMap(json.decode(jsonInput));

  ///endregion fromJson

  ///region toMap
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) {
      map[AddressModelFields.id] = id;
    }
    if (type != null) {
      map[AddressModelFields.type] = type;
    }
    if (streetName != null) {
      map[AddressModelFields.streetName] = streetName;
    }
    if (blockNum != null) {
      map[AddressModelFields.blockNum] = blockNum;
    }
    if (floorNum != null) {
      map[AddressModelFields.floorNum] = floorNum;
    }
    if (apartmentNum != null) {
      map[AddressModelFields.apartmentNum] = apartmentNum;
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
  AddressModel copyWith(
      {String? id,
      String? type,
      String? streetName,
      String? blockNum,
      String? floorNum,
      String? apartmentNum}) {
    return AddressModel()
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..streetName = streetName ?? this.streetName
      ..blockNum = blockNum ?? this.blockNum
      ..floorNum = floorNum ?? this.floorNum
      ..apartmentNum = apartmentNum ?? this.apartmentNum;
  }

  ///endregion copyWith

  ///region updateWith
  void updateWith(
      {String? id,
      String? type,
      String? streetName,
      String? blockNum,
      String? floorNum,
      String? apartmentNum}) {
    if (id != null) {
      this.id = id;
    }
    if (type != null) {
      this.type = type;
    }
    if (streetName != null) {
      this.streetName = streetName;
    }
    if (blockNum != null) {
      this.blockNum = blockNum;
    }
    if (floorNum != null) {
      this.floorNum = floorNum;
    }
    if (apartmentNum != null) {
      this.apartmentNum = apartmentNum;
    }
  }

  ///endregion updateWith

  ///region updateFrom
  void updateFrom({required AddressModel another}) {
    if (another.id != null) {
      id = another.id;
    }
    if (another.type != null) {
      type = another.type;
    }
    if (another.streetName != null) {
      streetName = another.streetName;
    }
    if (another.blockNum != null) {
      blockNum = another.blockNum;
    }
    if (another.floorNum != null) {
      floorNum = another.floorNum;
    }
    if (another.apartmentNum != null) {
      apartmentNum = another.apartmentNum;
    }
  }

  ///endregion updateFrom

  ///region updateFromMap
  void updateFromMap(Map<String, dynamic> map) {
    if (map[AddressModelFields.id] != null) {
      id = map[AddressModelFields.id].toString();
    }
    if (map[AddressModelFields.type] != null) {
      type = map[AddressModelFields.type].toString();
    }
    if (map[AddressModelFields.streetName] != null) {
      streetName = map[AddressModelFields.streetName].toString();
    }
    if (map[AddressModelFields.blockNum] != null) {
      blockNum = map[AddressModelFields.blockNum].toString();
    }
    if (map[AddressModelFields.floorNum] != null) {
      floorNum = map[AddressModelFields.floorNum].toString();
    }
    if (map[AddressModelFields.apartmentNum] != null) {
      apartmentNum = map[AddressModelFields.apartmentNum].toString();
    }
  }

  ///endregion updateFromMap

  ///region Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddressModel &&
        id == other.id &&
        type == other.type &&
        streetName == other.streetName &&
        blockNum == other.blockNum &&
        floorNum == other.floorNum &&
        apartmentNum == other.apartmentNum;
  }

  bool isTheSameObjectID(AddressModel other) =>
      id != null && other.id != null && id == other.id;
  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      streetName.hashCode ^
      blockNum.hashCode ^
      floorNum.hashCode ^
      apartmentNum.hashCode;

  ///endregion Equality
}

///endregion Model AddressModel
