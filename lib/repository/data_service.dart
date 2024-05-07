import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ondulis_app/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dataServiceProvider = StateProvider<DataService>((ref) => DataService());
// データベースへの書き込みを行うクラス
class DataService {
  // データベースの参照を取得
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  // データベースにデータを追加
  Future<void> addUser(String email, String displayName, String photoURL) async {

    final authId = auth.currentUser!.uid;

    final newUser = UserModel(
      email: email,
      authId: authId.toString(),
      displayName: displayName,
      profileImageURL: photoURL,
      createdAt: DateTime.now(),
    );

    await db.collection('users').doc(authId).set(newUser.toJson());
  }
}