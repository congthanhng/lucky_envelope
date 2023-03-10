import 'package:json_annotation/json_annotation.dart';

part 'envelope_model.g.dart';

@JsonSerializable()
class EnvelopeModel {
  final int denominations;
  final int quantity;
  final String name;
  bool isWithdraw;

  EnvelopeModel(
      {required this.denominations,
      required this.quantity,
      required this.name,
      this.isWithdraw = false});

  factory EnvelopeModel.fromJson(Map<String, dynamic> json) =>
      _$EnvelopeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnvelopeModelToJson(this);

  int get total => denominations * quantity;

  EnvelopeModel copyWith(
          {int? denominations,
          int? quantity,
          String? name,
          bool? isWithdraw}) =>
      EnvelopeModel(
          quantity: quantity ?? this.quantity,
          denominations: denominations ?? this.denominations,
          name: name ?? this.name,
          isWithdraw: isWithdraw ?? this.isWithdraw);

}
