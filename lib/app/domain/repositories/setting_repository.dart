import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/domain/models/setting_data.dart';

abstract class SettingRepository{
  Future<SettingData?> getSettingData();

  Future<bool> setSettingData(SettingData data);

  Future<bool> saveSettingDenominations(Map<String, EnvelopeModel> data);

  Future<Map<String, EnvelopeModel>?> getSettingDenominations();
}