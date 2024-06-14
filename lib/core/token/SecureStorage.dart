// ignore_for_file: file_names, avoid_print

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String> readSecureData(String key) async {
    String value = await _storage.read(key: key) ?? 'No data found!';
    print('Data read from secure storage: $value');
    return value;
  }

  deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  Future<bool> isLogin() async {
    String token = await readSecureData('token');
    return token != 'No data found!';
  }
}
