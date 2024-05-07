import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ondulis_app/models/timestamp.dart';

part 'user_model.freezed.dart'; // 先頭の文字をファイル名と同じ名前にする
part 'user_model.g.dart'; // 先頭の文字をファイル名と同じ名前にする

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String email,
    required String authId,
    required String displayName,
    required String profileImageURL,
    @TimestampConverter() DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}