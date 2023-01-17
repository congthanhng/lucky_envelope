part of 'envelope_set_bloc.dart';

@immutable
abstract class EnvelopeSetState {
  final SettingData? data;
  const EnvelopeSetState({this.data});
}

class EnvelopeSetInitial extends EnvelopeSetState {}

class EnvelopeSetFetchedSuccess extends EnvelopeSetState{
  const EnvelopeSetFetchedSuccess({super.data});
}
