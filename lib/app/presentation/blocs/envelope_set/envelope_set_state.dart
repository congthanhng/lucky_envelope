part of 'envelope_set_bloc.dart';

@immutable
abstract class EnvelopeSetState {
  final SettingData data;

  const EnvelopeSetState({required this.data});
}

class EnvelopeSetInitial extends EnvelopeSetState {
  EnvelopeSetInitial()
      : super(data: SettingData(envelopes: [], isKeepingAfterWithdrawal: true));
}

class EnvelopeSetFetchedSuccess extends EnvelopeSetState {
  const EnvelopeSetFetchedSuccess({required super.data});
}

class EnvelopeSetGeneratedSuccess extends EnvelopeSetState {
  const EnvelopeSetGeneratedSuccess({required super.data});
}

class EnvelopeSetWithdrawSuccess extends EnvelopeSetState {
  const EnvelopeSetWithdrawSuccess({required super.data});
}
