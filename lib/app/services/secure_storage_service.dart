import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class SecureStorageService {
  void storeItem({required String key, required String value});

  Future<String?> getItem(String key);

  void removeItem(String key);

  void clear();
}

@Singleton(as: SecureStorageService)
class SecureStorageServiceImpl extends SecureStorageService {
  SecureStorageServiceImpl({required this.storage});

  final FlutterSecureStorage storage;

  @FactoryMethod(preResolve: true)
  static Future<SecureStorageServiceImpl> create() async {
    const storage = FlutterSecureStorage();
    return SecureStorageServiceImpl(storage: storage);
  }

  @override
  Future<String?> getItem(String key) async {
    return storage.read(key: key);
  }

  @override
  void storeItem({required String key, required String value}) {
    storage.write(key: key, value: value);
  }

  @override
  void removeItem(String key) {
    storage.delete(key: key);
  }

  @override
  void clear() {
    storage.deleteAll();
  }
}
