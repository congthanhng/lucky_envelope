import 'package:bloc/bloc.dart';
import 'package:lucky_envolope/app/models/setting_data.dart';
import 'package:lucky_envolope/app/repositories/setting_repository.dart';
import 'package:meta/meta.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingFetched>(_onFetched);
  }

  final SettingRepository _repository = SettingRepositoryImpl();

  _onFetched(SettingFetched event, Emitter<SettingState> emit) async {
    await _repository.getSettingData().then(
      (value) {
        emit(SettingFetchedSuccess(data: value));
      },
    );
  }
}
