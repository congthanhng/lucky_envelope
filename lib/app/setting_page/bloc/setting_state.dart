part of 'setting_bloc.dart';

@immutable
abstract class SettingState {
  final SettingData? data;
  const SettingState({this.data});
}

class SettingInitial extends SettingState {}

class SettingFetchedSuccess extends SettingState{
  const SettingFetchedSuccess({super.data});
}
