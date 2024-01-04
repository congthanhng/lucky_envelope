import 'package:lucky_envolope/app/domain/models/envelope/envelope_model.dart';

class HistoryModel {
  final EnvelopeModel envelope;
  final String peopleName;
  final String dateTime;

  HistoryModel(
      {required this.envelope,
      this.peopleName = 'Ẩn danh',
      required this.dateTime});

  HistoryModel copyWith(
          {EnvelopeModel? envelope, String? peopleName, String? dateTime}) =>
      HistoryModel(
          dateTime: dateTime ?? this.dateTime,
          envelope: envelope ?? this.envelope,
          peopleName: peopleName ?? this.peopleName);

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
      envelope: EnvelopeModel.fromJson(json['envelope']),
      peopleName: json['peopleName'] as String,
      dateTime: json['dateTime'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'envelope': envelope.toJson(),
        'peopleName': peopleName,
        'dateTime': dateTime,
      };
}
