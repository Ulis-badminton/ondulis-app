import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ondulis_app/models/timestamp.dart';

part 'mood.freezed.dart'; // 先頭の文字をファイル名と同じ名前にする
part 'mood.g.dart'; // 先頭の文字をファイル名と同じ名前にする

@freezed
class Mood with _$Mood {
  const factory Mood({
    required String auth_id,
    required int mood,
    required DateTime date,
    @TimestampConverter() DateTime? createdAt,
  }) = _Mood;

  factory Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);
}