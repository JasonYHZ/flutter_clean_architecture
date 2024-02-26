// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityDtoImpl _$$ActivityDtoImplFromJson(Map<String, dynamic> json) =>
    _$ActivityDtoImpl(
      key: json['key'] as String,
      activity: json['activity'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ActivityDtoImplToJson(_$ActivityDtoImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'activity': instance.activity,
      'type': instance.type,
      'participants': instance.participants,
      'price': instance.price,
    };
