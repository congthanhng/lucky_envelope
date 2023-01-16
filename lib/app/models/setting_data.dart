import 'package:lucky_envolope/app/models/envelope_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'setting_data.g.dart';

@JsonSerializable()
class SettingData {
  final List<EnvelopeModel> envelopes;
  final bool isKeepingAfterWithdrawal;

  SettingData(
      {required this.envelopes, required this.isKeepingAfterWithdrawal});

  factory SettingData.fromJson(Map<String, dynamic> json) => _$SettingDataFromJson(json);

  Map<String, dynamic> toJson() => _$SettingDataToJson(this);

  int get totalEnvelope => envelopes.length;
}
