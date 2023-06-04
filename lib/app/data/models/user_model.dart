import 'dart:convert';

///****************************************
///region Model UserModelFields
class UserModelFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String balance = 'balance';

  static const List<String> list = [id, name, email, password];
}

///endregion Model UserModelFields

///****************************************
///region Model UserModel
class UserModel {
  ///region Fields
  String? id;
  String? name;
  String? email;
  String? password;
  double balance = 0;

  ///endregion Fields

  ///region FieldsList
  List<String> fieldsList = UserModelFields.list;
  List<dynamic> get toArgs => [id, name, email, password];

  ///endregion FieldsList

  ///region newInstance
  UserModel get newInstance => UserModel();

  ///endregion newInstance

  ///region default constructor
  UserModel({this.id, this.name, this.email, this.password});

  ///endregion default constructor

  ///region withFields constructor
  UserModel.withFields(this.id, this.name, this.email, this.password);

  ///endregion withFields constructor

  ///region fromMap
  UserModel.fromMap(Map<String, dynamic> map) {
    updateFromMap(map);
  }

  ///endregion fromMap

  ///region fromMapList
  static List<UserModel> fromMapList(List<Map<String, dynamic>> list) {
    return list.map((e) => UserModel.fromMap(e)).toList();
  }

  ///endregion fromMapList

  ///region fromJson
  UserModel.fromJson(String jsonInput) : this.fromMap(json.decode(jsonInput));

  ///endregion fromJson

  ///region toMap
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) {
      map[UserModelFields.id] = id;
    }
    if (name != null) {
      map[UserModelFields.name] = name;
    }
    if (email != null) {
      map[UserModelFields.email] = email;
    }
    if (password != null) {
      map[UserModelFields.password] = password;
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
  UserModel copyWith(
      {String? id, String? name, String? email, String? password}) {
    return UserModel()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..email = email ?? this.email
      ..password = password ?? this.password;
  }

  ///endregion copyWith

  ///region updateWith
  void updateWith({String? id, String? name, String? email, String? password}) {
    if (id != null) {
      this.id = id;
    }
    if (name != null) {
      this.name = name;
    }
    if (email != null) {
      this.email = email;
    }
    if (password != null) {
      this.password = password;
    }
  }

  ///endregion updateWith

  ///region updateFrom
  void updateFrom({required UserModel another}) {
    if (another.id != null) {
      id = another.id;
    }
    if (another.name != null) {
      name = another.name;
    }
    if (another.email != null) {
      email = another.email;
    }
    if (another.password != null) {
      password = another.password;
    }
  }

  ///endregion updateFrom

  ///region updateFromMap
  void updateFromMap(Map<String, dynamic> map) {
    if (map[UserModelFields.id] != null) {
      id = map[UserModelFields.id].toString();
    }
    if (map[UserModelFields.name] != null) {
      name = map[UserModelFields.name].toString();
    }
    if (map[UserModelFields.email] != null) {
      email = map[UserModelFields.email].toString();
    }
    if (map[UserModelFields.password] != null) {
      password = map[UserModelFields.password].toString();
    }
  }

  ///endregion updateFromMap

  ///region Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        password == other.password;
  }

  bool isTheSameObjectID(UserModel other) =>
      id != null && other.id != null && id == other.id;
  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;

  ///endregion Equality
}

///endregion Model UserModel
