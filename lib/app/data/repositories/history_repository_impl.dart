import 'dart:convert';

import 'package:lucky_envolope/app/core/local_storage/app_local_storage.dart';
import 'package:lucky_envolope/app/data/datasource/local/hive_storage.dart';
import 'package:lucky_envolope/app/domain/models/history/history_model.dart';
import 'package:lucky_envolope/app/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository{
  final LocalStorage _localStorage = HiveStorage();

  @override
  Future<List<HistoryModel>?> getHistoryData() async {
    var data = await _localStorage.readData(keyName: 'History');
    if(data == null) return Future.value();
    var models = jsonDecode(data) as List<dynamic>;
    var results = models.map((e) => HistoryModel.fromJson(e),).toList();
    return Future.value(results);
  }

  @override
  Future<bool> saveHistoryData(List<HistoryModel> data) {
    return _localStorage.writeData(
        keyName: 'History', values: jsonEncode([...data.map((e) => e.toJson())]));
  }

}