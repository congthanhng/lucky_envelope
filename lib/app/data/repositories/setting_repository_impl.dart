import 'dart:convert';

import 'package:lucky_envolope/app/core/local_storage/app_local_storage.dart';
import 'package:lucky_envolope/app/data/datasource/local/hive_storage.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/domain/models/setting_data.dart';
import 'package:lucky_envolope/app/domain/repositories/setting_repository.dart';

class SettingRepositoryImpl implements SettingRepository {
  final LocalStorage _localStorage = HiveStorage();

  @override
  Future<SettingData?> getSettingData() async {
    var data = await _localStorage.readData(keyName: 'LuckyEnvelope');
    var models = jsonDecode(data) as Map<String, dynamic>;
    var results = SettingData.fromJson(models);

    return Future.value(results);
  }

  @override
  Future<bool> setSettingData(SettingData data) async {
    return _localStorage.writeData(
        keyName: 'LuckyEnvelope', values: jsonEncode(data.toJson()));
  }

  @override
  Future<bool> saveSettingDenominations(Map<String, EnvelopeModel> data) {
    var jsonData = data.map((key, value) {
      return MapEntry(key, value.toJson());
    },);
    return _localStorage.writeData(
        keyName: 'SettingDenominations', values: jsonEncode(jsonData));
  }

  @override
  Future<Map<String, EnvelopeModel>> getSettingDenominations() async {
    var data = await _localStorage.readData(keyName: 'SettingDenominations');
    var models = jsonDecode(data) as Map<String, dynamic>;
    var result = models.map((key, value) {
      return MapEntry(key, EnvelopeModel.fromJson(value));
    },);
    return Future.value(result);
  }
}
