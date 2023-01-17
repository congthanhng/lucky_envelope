import 'package:bloc/bloc.dart';
import 'package:lucky_envolope/app/domain/models/setting_data.dart';
import 'package:lucky_envolope/app/domain/usecases/setting_usecase.dart';
import 'package:meta/meta.dart';

part 'envelope_set_event.dart';

part 'envelope_set_state.dart';

class EnvelopeSetBloc extends Bloc<EnvelopeSetEvent, EnvelopeSetState> {
  EnvelopeSetBloc() : super(EnvelopeSetInitial()) {
    on<EnvelopeSetFetched>(_onFetched);
  }

  final SettingUseCase _useCase = SettingUseCase();

  _onFetched(EnvelopeSetFetched event, Emitter<EnvelopeSetState> emit) async {
    await _useCase.getSettingData().then(
      (value) {
        emit(EnvelopeSetFetchedSuccess(data: value));
      },
    );
  }
}
