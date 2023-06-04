import 'package:get_storage/get_storage.dart';

import '../../utils/helpers.dart';
import '../data/models/user_model.dart';

class OfflineStorage {
  static final GetStorage _storage = GetStorage();

  static const String _userKey = "USER_KEY";

  static void saveUser(UserModel userModel) =>
      {mPrint('Storing user'), _storage.write(_userKey, userModel.toMap())};
  static void eraseUser() =>
      {mPrint('Erasing user'), _storage.remove(_userKey)};
  static UserModel? getUser() {
    mPrint('Reading user');
    if (_storage.hasData(_userKey)) {
      return UserModel.fromMap(_storage.read(_userKey));
    }
    return null;
  }
}
