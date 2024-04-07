import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  void storeItem({required String key, required String value});

  String? getItem(String key);

  void removeItem(String key);

  void clear();
}

@Singleton(as: LocalStorageService)
class SharedPreferenceStorage extends LocalStorageService {
  SharedPreferenceStorage({required this.prefs});
  final SharedPreferences prefs;

  @FactoryMethod(preResolve: true)
  static Future<SharedPreferenceStorage> create() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPreferenceStorage(prefs: prefs);
  }

  @override
  String? getItem(String key) {
    return prefs.getString(key);
  }

  @override
  void storeItem({required String key, required String value}) {
    prefs.setString(key, value);
  }

  @override
  void removeItem(String key) {
    prefs.remove(key);
  }

  @override
  void clear() {
    prefs.clear();
  }
}
