part of 'envelope_set_bloc.dart';

@immutable
abstract class EnvelopeSetEvent {}

class EnvelopeSetFetched extends EnvelopeSetEvent {}

class EnvelopeSetGenerated extends EnvelopeSetEvent {
  final Map<String, EnvelopeModel> dataInput;

  EnvelopeSetGenerated(this.dataInput);
}

class EnvelopeSetSaved extends EnvelopeSetEvent {
  final SettingData data;

  EnvelopeSetSaved(this.data);
}

class EnvelopeSetWithdrawed extends EnvelopeSetEvent {
  final int index;

  EnvelopeSetWithdrawed(this.index);
}

class EnvelopeSetReset extends EnvelopeSetEvent {}

class EnvelopeSetItemAdded extends EnvelopeSetEvent {
  final EnvelopeModel item;

  EnvelopeSetItemAdded(this.item);
}
