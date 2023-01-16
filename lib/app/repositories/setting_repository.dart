import 'package:lucky_envolope/app/core/local_storage/app_local_storage.dart';
import 'package:lucky_envolope/app/models/setting_data.dart';

abstract class SettingRepository{
  Future<SettingData?> getSettingData();

  Future<bool> setSettingData(SettingData data);
}

class SettingRepositoryImpl implements SettingRepository{
  final LocalStorage _localStorage = HiveStorage();
  @override
  Future<SettingData?> getSettingData() async {
    return _localStorage.readData<SettingData?>(keyName: 'LuckyEnvelope');
  }

  @override
  Future<bool> setSettingData(SettingData data) {
    return _localStorage.writeData(keyName: 'LuckyEnvelope', values: data);
  }

}