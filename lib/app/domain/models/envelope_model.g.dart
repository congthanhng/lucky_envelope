// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'envelope_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvelopeModel _$EnvelopeModelFromJson(Map<String, dynamic> json) =>
    EnvelopeModel(
      denominations: json['denominations'] as int,
      quantity: json['quantity'] as int,
      name: json['name'] as String,
      isWithdraw: json['isWithdraw'] as bool? ?? false,
    );

Map<String, dynamic> _$EnvelopeModelToJson(EnvelopeModel instance) =>
    <String, dynamic>{
      'denominations': instance.denominations,
      'quantity': instance.quantity,
      'name': instance.name,
      'isWithdraw': instance.isWithdraw,
    };
