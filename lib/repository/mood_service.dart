import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ondulis_app/models/mood.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final moodServiceProvider = StateProvider<MoodService>((ref) => MoodService());
// データベースへの書き込みを行うクラス
class MoodService {
  // データベースの参照を取得
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  // 現在のユーザーが今日moodを登録しているかどうかを確認
  Future<bool> isMoodRegisteredToday() async {
    final authId = auth.currentUser!.uid;
    final mood = await db.collection('mood')
    .where('auth_id', isEqualTo: authId)
    .where('date', isEqualTo: convertDateTimeToInt(DateTime.now()))
    .get();

    return mood.docs.isNotEmpty;
  }

  // データベースにデータを追加
  Future<void> addMood(int mood, int date) async {

    final authId = auth.currentUser!.uid;

    final newMood = Mood(
      auth_id: authId,
      mood: mood,
      date: date,
    );

    await db.collection('mood').doc(authId).set(newMood.toJson());
  }

  // Moodのデータを更新
  Future<void> updateMood(int mood) async {
    final authId = auth.currentUser!.uid;
    final user = await db.collection('mood').doc(authId).get();
    final data = user.data()!;

    final updatedMood = Mood(
      auth_id: data['auth_id'],
      mood: mood,
      date: data['date'],
    );

    await db.collection('mood').doc(authId).set(updatedMood.toJson());
  }

  Future<void> addMoodComment(String comment) async {
    final authId = auth.currentUser!.uid;
    final user = await db.collection('mood').doc(authId).get();
    final data = user.data()!;

    final updatedMood = Mood(
      auth_id: data['auth_id'],
      mood: data['mood'],
      date: data['date'],
      comment: comment,
    );

    await db.collection('mood').doc(authId).set(updatedMood.toJson());
  }

  // Moodのコメントを更新
  Future<void> updateMoodComment(String comment) async {
    final authId = auth.currentUser!.uid;
    final user = await db.collection('mood').doc(authId).get();
    final data = user.data()!;

    final updatedMood = Mood(
      auth_id: data['auth_id'],
      mood: data['mood'],
      date: data['date'],
      comment: comment,
    );

    await db.collection('mood').doc(authId).set(updatedMood.toJson());
  }

  // Moodのコメントを取得
  Future<String> getMoodComment() async {
    final authId = auth.currentUser!.uid;
    final user = await db.collection('mood').doc(authId).get();
    if (user.data() == null) {
      return '';
    }
    final data = user.data()!;
    return data['comment'];
  }

  int convertDateTimeToInt(DateTime dateTime) {
    final year = dateTime.year;
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');

    final dateTimeString = '$year$month$day';
    return int.parse(dateTimeString);
  }
}
