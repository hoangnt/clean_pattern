import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureStorageUtil {
  static LocalSecureStorageUtil instance = LocalSecureStorageUtil._();
  LocalSecureStorageUtil._();

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  final String _email = "email";
  final String _password = "password";
  final String _accessToken = "accessToken";
  final String _refreshToken = "refreshToken";

  Future<void> saveEmail(String email) async =>
      await _storage.write(key: _email, value: email);
  Future<String?> getEmail() async => await _storage.read(key: _email);

  Future<void> savePassword(String password) async =>
      await _storage.write(key: _password, value: password);
  Future<String?> getPassword() async => await _storage.read(key: _password);

  Future<void> saveAccessToken(String token) async =>
      await _storage.write(key: _accessToken, value: token);
  Future<String?> getAccessToken() async =>
      await _storage.read(key: _accessToken);

  Future<void> saveRefreshToken(String token) async =>
      await _storage.write(key: _refreshToken, value: token);
  Future<String?> getRefreshToken() async =>
      await _storage.read(key: _refreshToken);
}
