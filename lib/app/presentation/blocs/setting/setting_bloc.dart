import 'package:bloc/bloc.dart';
import 'package:lucky_envolope/app/domain/models/setting_data.dart';
import 'package:lucky_envolope/app/domain/usecases/setting_usecase.dart';
import 'package:meta/meta.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingFetched>(_onFetched);
  }

  final SettingUseCase _useCase = SettingUseCase();

  _onFetched(SettingFetched event, Emitter<SettingState> emit) async {
    await _useCase.getSettingData().then(
      (value) {
        emit(SettingFetchedSuccess(data: value));
      },
    );
  }
}
