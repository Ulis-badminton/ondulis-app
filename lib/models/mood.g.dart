// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoodImpl _$$MoodImplFromJson(Map<String, dynamic> json) => _$MoodImpl(
      auth_id: json['auth_id'] as String,
      mood: (json['mood'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$MoodImplToJson(_$MoodImpl instance) =>
    <String, dynamic>{
      'auth_id': instance.auth_id,
      'mood': instance.mood,
      'date': instance.date.toIso8601String(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
