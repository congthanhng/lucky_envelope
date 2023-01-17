part of 'setting_bloc.dart';

@immutable
abstract class SettingEvent {}

class SettingEnvelopeQuantityChanged extends SettingEvent {
  final String envelopeName;
  final int quantity;

  SettingEnvelopeQuantityChanged(
      {required this.envelopeName, required this.quantity});
}
