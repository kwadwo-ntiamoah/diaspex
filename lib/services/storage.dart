import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageKeys {
  StorageKeys._();

  static const token = "token";
  static const user = "user";
}

abstract class IStorage {
  Future setToken(String token);
  Future<String?> getToken();

  Future setUserDetails(String details);
  Future<String?> getUserDetails();
}

class Storage implements IStorage {
  final FlutterSecureStorage secureStorage;

  Storage({ required this.secureStorage });

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: StorageKeys.token);
  }

  @override
  Future setToken(String token) async {
    await secureStorage.write(key: StorageKeys.token, value: token);
  }

  @override
  Future<String?> getUserDetails() async {
    return await secureStorage.read(key: StorageKeys.user);
  }

  @override
  Future setUserDetails(String details) async {
    await secureStorage.write(key: StorageKeys.user, value: details);
  }

}