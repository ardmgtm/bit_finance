// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as int? ?? 0,
      type: json['type'] as int,
      nominal: (json['nominal'] as num).toDouble(),
      dateTime: DateTime.parse(json['datetime'] as String),
      category: json['category'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'nominal': instance.nominal,
      'datetime': instance.dateTime.toIso8601String(),
      'category': instance.category,
      'description': instance.description,
    };
