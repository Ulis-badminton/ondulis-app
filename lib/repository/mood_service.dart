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
  // データベースにデータを追加
  Future<void> addMood(int mood) async {

    final authId = auth.currentUser!.uid;

    final newMood = Mood(
      auth_id: authId,
      mood: mood,
      date: DateTime.now(),
    );

    await db.collection('mood').doc(authId).set(newMood.toJson());
  }
}
