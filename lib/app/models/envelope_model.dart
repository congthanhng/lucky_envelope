import 'package:json_annotation/json_annotation.dart';
part 'envelope_model.g.dart';

@JsonSerializable()
class EnvelopeModel {
  final int denominations;
  final int quantity;

  EnvelopeModel({required this.denominations, required this.quantity});

  factory EnvelopeModel.fromJson(Map<String, dynamic> json) => _$EnvelopeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnvelopeModelToJson(this);
}
