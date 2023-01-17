// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingData _$SettingDataFromJson(Map<String, dynamic> json) => SettingData(
      envelopes: (json['envelopes'] as List<dynamic>)
          .map((e) => EnvelopeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isKeepingAfterWithdrawal: json['isKeepingAfterWithdrawal'] as bool,
    );

Map<String, dynamic> _$SettingDataToJson(SettingData instance) =>
    <String, dynamic>{
      'envelopes': instance.envelopes,
      'isKeepingAfterWithdrawal': instance.isKeepingAfterWithdrawal,
    };
