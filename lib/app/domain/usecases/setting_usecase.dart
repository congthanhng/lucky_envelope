import 'package:lucky_envolope/app/data/repositories/setting_repository_impl.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/domain/models/setting_data.dart';
import 'package:lucky_envolope/app/domain/repositories/setting_repository.dart';

class SettingUseCase {
  final SettingRepository _repository = SettingRepositoryImpl();

  Future<SettingData?> getSettingData() {
    return _repository.getSettingData();
  }

  Future<void> saveSettingData(SettingData data) {
    return _repository.setSettingData(data);
  }

  Future<bool> saveSettingDenominations(Map<String, EnvelopeModel> data){
    return _repository.saveSettingDenominations(data);
  }

  Future<Map<String, EnvelopeModel>?> getSettingDenominations(){
    return _repository.getSettingDenominations();
  }
}
