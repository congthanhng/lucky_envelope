import 'package:lucky_envolope/app/domain/models/setting_data.dart';

abstract class SettingRepository{
  Future<SettingData?> getSettingData();

  Future<bool> setSettingData(SettingData data);
}