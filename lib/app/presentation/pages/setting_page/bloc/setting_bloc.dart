import 'package:bloc/bloc.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/presentation/resources/values/constants.dart';
import 'package:meta/meta.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingEnvelopeQuantityChanged>(_envelopeQuantityChanged);
  }

  _envelopeQuantityChanged(
      SettingEnvelopeQuantityChanged event, Emitter<SettingState> emit) {
    state.envelopesData[event.envelopeName] = state
            .envelopesData[event.envelopeName]
            ?.copyWith(quantity: event.quantity) ??
        EnvelopeModel(quantity: 0, denominations: 0, name: '');
    emit(SettingEnvelopeQuantityChangedSuccess(
        envelopesData: state.envelopesData));
  }
}
