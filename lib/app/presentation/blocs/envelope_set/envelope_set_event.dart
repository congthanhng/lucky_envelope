part of 'envelope_set_bloc.dart';

@immutable
abstract class EnvelopeSetEvent {}

class EnvelopeSetFetched extends EnvelopeSetEvent {}

class EnvelopeSetGenerated extends EnvelopeSetEvent {
  final Map<String, EnvelopeModel> dataInput;

  EnvelopeSetGenerated(this.dataInput);
}
