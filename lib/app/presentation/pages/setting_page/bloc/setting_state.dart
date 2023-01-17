part of 'setting_bloc.dart';

@immutable
abstract class SettingState {
  final Map<String, EnvelopeModel> envelopesData;

  const SettingState({required this.envelopesData});
}

  class SettingInitial extends SettingState {
  SettingInitial()
      : super(envelopesData: {
          Constants.vnd_500: EnvelopeModel(
              denominations: 500, quantity: 0, name: Constants.vnd_500),
          Constants.vnd_1k: EnvelopeModel(
              denominations: 1000, quantity: 0, name: Constants.vnd_1k),
          Constants.vnd_2k: EnvelopeModel(
              denominations: 2000, quantity: 0, name: Constants.vnd_2k),
          Constants.vnd_5k: EnvelopeModel(
              denominations: 5000, quantity: 0, name: Constants.vnd_5k),
          Constants.vnd_10k: EnvelopeModel(
              denominations: 10000, quantity: 0, name: Constants.vnd_10k),
          Constants.vnd_20k: EnvelopeModel(
              denominations: 20000, quantity: 0, name: Constants.vnd_20k),
          Constants.vnd_50k: EnvelopeModel(
              denominations: 50000, quantity: 0, name: Constants.vnd_50k),
          Constants.vnd_100k: EnvelopeModel(
              denominations: 100000, quantity: 0, name: Constants.vnd_100k),
          Constants.vnd_200k: EnvelopeModel(
              denominations: 200000, quantity: 0, name: Constants.vnd_200k),
          Constants.vnd_500k: EnvelopeModel(
              denominations: 500000, quantity: 0, name: Constants.vnd_500k),
        });
}

class SettingEnvelopeQuantityChangedSuccess extends SettingState {
  const SettingEnvelopeQuantityChangedSuccess({required super.envelopesData});
}
