// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      email: json['email'] as String,
      authId: json['authId'] as String,
      displayName: json['displayName'] as String,
      profileImageURL: json['profileImageURL'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'authId': instance.authId,
      'displayName': instance.displayName,
      'profileImageURL': instance.profileImageURL,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
