import 'package:hive/hive.dart';
import 'package:lucky_envolope/app/core/local_storage/app_local_storage.dart';

class HiveStorage implements LocalStorage{

  Box? _box;

  Future<void> ensureBoxInitialized() async {
    if (_box.runtimeType == Null || _box == null || !(_box?.isOpen ?? false)) {
      await init();
    }
  }

  @override
  Future<void> init({String? storageName}) async {
    await Hive.openBox(storageName??'testBox');
  }

  @override
  Future<bool> deleteBox() {
    // TODO: implement deleteBox
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteData({required String keyName}) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<bool> hasKey({required String keyName}) async {
    // TODO: implement hasKey
    throw UnimplementedError();
  }

  @override
  Future<T>? readData<T>({required String keyName}) async {
    await ensureBoxInitialized();
    var data = await _box?.get(keyName);
    return data;
  }

  @override
  Future<bool> writeData({required String keyName, required Object values}) async {
    await ensureBoxInitialized();
    if (_box?.isOpen == false) {
      return Future.value(false);
    }
    return await _box?.put(keyName, values).then((_) => Future.value(true),
        onError: (e) => Future.value(false)) ??
        false;
  }

}