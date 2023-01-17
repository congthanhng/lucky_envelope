import 'package:json_annotation/json_annotation.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';

part 'setting_data.g.dart';

@JsonSerializable()
class SettingData {
  final List<EnvelopeModel> envelopes;
  final bool isKeepingAfterWithdrawal;

  SettingData(
      {required this.envelopes, required this.isKeepingAfterWithdrawal});

  factory SettingData.fromJson(Map<String, dynamic> json) =>
      SettingData(
        envelopes: [...(json['envelopes'] as List<dynamic>)
            .map((e) => EnvelopeModel.fromJson(e))
            .toList()],
        isKeepingAfterWithdrawal: json['isKeepingAfterWithdrawal'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'envelopes': [...envelopes.map((e) => e.toJson())],
    'isKeepingAfterWithdrawal': isKeepingAfterWithdrawal,
  };

  int get totalEnvelope => envelopes.length;

  SettingData copyWith(
      {List<EnvelopeModel>? envelopes, bool? isKeepingAfterWithdrawal}) =>
      SettingData(envelopes: envelopes ?? this.envelopes,
          isKeepingAfterWithdrawal: isKeepingAfterWithdrawal ??
              this.isKeepingAfterWithdrawal);
}
