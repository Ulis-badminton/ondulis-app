// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoodImpl _$$MoodImplFromJson(Map<String, dynamic> json) => _$MoodImpl(
      auth_id: json['auth_id'] as String,
      mood: (json['mood'] as num).toInt(),
      comment: json['comment'] as String?,
      date: (json['date'] as num).toInt(),
    );

Map<String, dynamic> _$$MoodImplToJson(_$MoodImpl instance) =>
    <String, dynamic>{
      'auth_id': instance.auth_id,
      'mood': instance.mood,
      'comment': instance.comment,
      'date': instance.date,
    };
