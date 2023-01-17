import 'package:lucky_envolope/app/core/local_storage/app_local_storage.dart';
import 'package:lucky_envolope/app/data/datasource/local/hive_storage.dart';
import 'package:lucky_envolope/app/domain/models/setting_data.dart';
import 'package:lucky_envolope/app/domain/repositories/setting_repository.dart';

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