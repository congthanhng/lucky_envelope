part of 'setting_bloc.dart';

@immutable
abstract class SettingEvent {}

class SettingEnvelopeQuantityChanged extends SettingEvent {
  final String envelopeName;
  final int quantity;

  SettingEnvelopeQuantityChanged(
      {required this.envelopeName, required this.quantity});
}

class SettingSaved extends SettingEvent{}
class SettingFetched extends SettingEvent{}

class SettingReset extends SettingEvent{}
