import 'package:bloc/bloc.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/domain/models/setting_data.dart';
import 'package:lucky_envolope/app/domain/usecases/setting_usecase.dart';
import 'package:meta/meta.dart';

part 'envelope_set_event.dart';

part 'envelope_set_state.dart';

class EnvelopeSetBloc extends Bloc<EnvelopeSetEvent, EnvelopeSetState> {
  EnvelopeSetBloc() : super(EnvelopeSetInitial()) {
    on<EnvelopeSetFetched>(_onFetched);
    on<EnvelopeSetGenerated>(_onGenerated);
  }

  final SettingUseCase _useCase = SettingUseCase();

  _onFetched(EnvelopeSetFetched event, Emitter<EnvelopeSetState> emit) async {
    await _useCase.getSettingData().then(
      (value) {
        emit(EnvelopeSetFetchedSuccess(data: value ?? state.data));
      },
    );
  }

  _onGenerated(
      EnvelopeSetGenerated event, Emitter<EnvelopeSetState> emit) async {
    List<EnvelopeModel> result = [];
    event.dataInput.forEach(
      (key, value) {
        for (var i = 0; i < value.quantity; i++) {
          result.add(EnvelopeModel(
              denominations: value.denominations,
              quantity: 1,
              name: value.name));
        }
      },
    );
    result.shuffle();
    var revers = result.reversed.toList();
    revers.shuffle();
    emit(EnvelopeSetGeneratedSuccess(
        data: state.data.copyWith(envelopes: revers)));
  }
}
