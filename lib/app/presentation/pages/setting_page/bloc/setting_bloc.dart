import 'package:bloc/bloc.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/domain/usecases/setting_usecase.dart';
import 'package:lucky_envolope/app/presentation/resources/values/constants.dart';
import 'package:meta/meta.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingEnvelopeQuantityChanged>(_envelopeQuantityChanged);
    on<SettingSaved>(_onSaved);
    on<SettingFetched>(_onFetched);
    on<SettingReset>(_onReset);
    on<SettingQuantityIncreased>(_onQuantityIncreased);
  }

  final SettingUseCase _useCase = SettingUseCase();

  _envelopeQuantityChanged(
      SettingEnvelopeQuantityChanged event, Emitter<SettingState> emit) {
    state.envelopesData[event.envelopeName] = state
            .envelopesData[event.envelopeName]
            ?.copyWith(quantity: event.quantity) ??
        EnvelopeModel(quantity: 0, denominations: 0, name: '');
    emit(SettingEnvelopeQuantityChangedSuccess(
        envelopesData: state.envelopesData));
  }

  _onSaved(SettingSaved event, Emitter<SettingState> emit) async {
    await _useCase.saveSettingDenominations(state.envelopesData);
  }

  _onFetched(SettingFetched event, Emitter<SettingState> emit) async {
    await _useCase.getSettingDenominations().then(
      (value) {
        emit(SettingEnvelopeQuantityChangedSuccess(envelopesData: value ?? {}));
      },
    );
  }

  _onReset(SettingReset event, Emitter<SettingState> emit) async {
    emit(SettingInitial());
  }

  _onQuantityIncreased(
      SettingQuantityIncreased event, Emitter<SettingState> emit) async {
    state.envelopesData[event.envelopeName] =
        state.envelopesData[event.envelopeName]?.copyWith(
                quantity:
                    (state.envelopesData[event.envelopeName]?.quantity ?? 0) +
                        1) ??
            EnvelopeModel(quantity: 0, denominations: 0, name: '');
    add(SettingSaved());
  }
}
