import 'package:lucky_envolope/app/domain/models/history/history_model.dart';

abstract class HistoryRepository{
  Future<List<HistoryModel>?> getHistoryData();

  Future<bool> saveHistoryData(List<HistoryModel> data);
}