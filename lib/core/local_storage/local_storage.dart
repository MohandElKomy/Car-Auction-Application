import 'package:get_storage/get_storage.dart';

class LocalStorageManger {
  static void saveUserPhone(String phoneNum) async {
    await GetStorage().write('PhoneNum', phoneNum);
  }

  static Future<String?> get getUserPhone async {
    return GetStorage().read('PhoneNum');
  }

  static Future removeUserPhone() async {
    await GetStorage().remove('PhoneNum');
  }

  static void saveUserName(String name) async {
    await GetStorage().write('name', name);
  }

  static Future<String?> get getUserName async {
    return GetStorage().read('name');
  }

  static Future removeUserName() async {
    await GetStorage().remove('name');
  }

  static void saveAppState(String state) async {
    await GetStorage().write('state', state);
  }

  static Future<String?> get getAppState async {
    return GetStorage().read('state');
  }

  static Future removeAppState() async {
    await GetStorage().remove('state');
  }
}
