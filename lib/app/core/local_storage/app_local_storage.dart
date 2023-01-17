
abstract class LocalStorage{
  Future<void> init({String? storageName});

  Future<bool> writeData({required String keyName, required Object values});

  Future<T>? readData<T>({required String keyName});

  Future<bool> deleteData({required String keyName});

  Future<bool> hasKey({required String keyName});

  Future<bool> deleteBox();
}
