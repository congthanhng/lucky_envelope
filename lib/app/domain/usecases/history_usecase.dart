import 'package:lucky_envolope/app/data/repositories/history_repository_impl.dart';
import 'package:lucky_envolope/app/domain/models/history/history_model.dart';
import 'package:lucky_envolope/app/domain/repositories/history_repository.dart';

class HistoryUseCase{
  final HistoryRepository _repository = HistoryRepositoryImpl();

  Future<List<HistoryModel>?> getHistoryData(){
    return _repository.getHistoryData();
  }

  Future<bool> saveHistoryData(List<HistoryModel> data){
    return _repository.saveHistoryData(data);
  }
}