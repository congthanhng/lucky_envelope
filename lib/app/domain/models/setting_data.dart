import 'package:json_annotation/json_annotation.dart';
import 'package:lucky_envolope/app/domain/models/denomination/denomination_vn.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';

part 'setting_data.g.dart';

@JsonSerializable()
class SettingData {
  final List<EnvelopeModel> envelopes;
  final bool isKeepingAfterWithdrawal;

  SettingData(
      {required this.envelopes, required this.isKeepingAfterWithdrawal});

  factory SettingData.fromJson(Map<String, dynamic> json) => SettingData(
        envelopes: [
          ...(json['envelopes'] as List<dynamic>)
              .map((e) => EnvelopeModel.fromJson(e))
              .toList()
        ],
        isKeepingAfterWithdrawal: json['isKeepingAfterWithdrawal'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'envelopes': [...envelopes.map((e) => e.toJson())],
        'isKeepingAfterWithdrawal': isKeepingAfterWithdrawal,
      };

  int get totalEnvelope => envelopes.length;

  SettingData copyWith(
          {List<EnvelopeModel>? envelopes, bool? isKeepingAfterWithdrawal}) =>
      SettingData(
          envelopes: envelopes ?? this.envelopes,
          isKeepingAfterWithdrawal:
              isKeepingAfterWithdrawal ?? this.isKeepingAfterWithdrawal);

  List<EnvelopeModel> get notOpenedEnvelopes => envelopes
      .where(
        (element) => element.isWithdraw == false,
      )
      .toList();

  Map<String, EnvelopeModel> get notOpenedDenomination {
    var result = <String, EnvelopeModel>{};
    var notOpenedList = notOpenedEnvelopes;
    for (var element in DenominationVN.getDefault.values) {
      var quantity = 0;
      for (var e in notOpenedList) {
        if (e.name == element.name) {
          quantity++;
        }
      }
      if (quantity > 0) {
        result[element.name] = EnvelopeModel(
            denominations: element.value,
            quantity: quantity,
            name: element.name);
      }
    }
    return result;
  }

  List<EnvelopeModel> get openedEnvelopes => envelopes
      .where(
        (element) => element.isWithdraw == true,
  )
      .toList();

  Map<String, EnvelopeModel> get openedDenomination {
    var result = <String, EnvelopeModel>{};
    var openedList = openedEnvelopes;
    for (var element in DenominationVN.getDefault.values) {
      var quantity = 0;
      for (var e in openedList) {
        if (e.name == element.name) {
          quantity++;
        }
      }
      if (quantity > 0) {
        result[element.name] = EnvelopeModel(
            denominations: element.value,
            quantity: quantity,
            name: element.name);
      }
    }
    return result;
  }
}
