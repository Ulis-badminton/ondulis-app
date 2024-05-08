import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood.freezed.dart'; // 先頭の文字をファイル名と同じ名前にする
part 'mood.g.dart'; // 先頭の文字をファイル名と同じ名前にする

@freezed
class Mood with _$Mood {
  const factory Mood({
    required String auth_id,
    required int mood, // 0: bad, 1: normal, 2: good
    String? comment,
    required int date, // 投稿日の年月日をYYYYMMDDの形式で格納
  }) = _Mood;

  factory Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);
}