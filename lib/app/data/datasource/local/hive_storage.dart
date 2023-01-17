// import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lucky_envolope/app/core/local_storage/app_local_storage.dart';

class HiveStorage implements LocalStorage {
  Box? _box;

  Future<void> ensureBoxInitialized() async {
    if (_box.runtimeType == Null || _box == null || !(_box?.isOpen ?? false)) {
      await init();
    }
  }

  @override
  Future<void> init({String? storageName}) async {
    WidgetsFlutterBinding.ensureInitialized();
    _box = await Hive.openBox(storageName ?? 'testBox');
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
    print('getKeyname: $keyName');
    var data = await _box?.get(keyName);
    print('getKeyname data: $data');

    return data;
  }

  @override
  Future<bool> writeData(
      {required String keyName, required Object values}) async {
    print('writeData: $keyName');

    await ensureBoxInitialized();
    if (_box?.isOpen == false) {
      return Future.value(false);
    }
    try {
      await _box?.put(keyName, values);
      var data = await _box?.get(keyName);
      print('Dataaaaa: $data -- $values');
      return Future.value(true);
    } catch (e) {
      print('FAILED: $e');
      return Future.value(false);
    }
  }
}
