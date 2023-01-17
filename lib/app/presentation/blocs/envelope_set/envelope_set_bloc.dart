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
    on<EnvelopeSetSaved>(_onSaved);
    on<EnvelopeSetWithdrawed>(_onWithdrawed);
    on<EnvelopeSetReset>(_onReset);
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
    var newData = state.data.copyWith(envelopes: revers);
    add(EnvelopeSetSaved(newData));
    emit(EnvelopeSetGeneratedSuccess(data: newData));
  }

  _onSaved(EnvelopeSetSaved event, Emitter<EnvelopeSetState> emit) async {
    await _useCase.saveSettingData(event.data);
  }

  _onWithdrawed(
      EnvelopeSetWithdrawed event, Emitter<EnvelopeSetState> emit) async {
    state.data.envelopes[event.index].isWithdraw = true;
    add(EnvelopeSetSaved(state.data));
    emit(EnvelopeSetWithdrawSuccess(data: state.data));
  }

  _onReset(EnvelopeSetReset event, Emitter<EnvelopeSetState> emit) async {
    var newEnvelopes =
        state.data.envelopes.map((e) => e.copyWith(isWithdraw: false)).toList();
    var newResult = state.data.copyWith(envelopes: newEnvelopes);
    add(EnvelopeSetSaved(newResult));
    emit(EnvelopeSetFetchedSuccess(data: newResult));
  }
}
