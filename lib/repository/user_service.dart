import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ondulis_app/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userServiceProvider = StateProvider<UserService>((ref) => UserService());
// データベースへの書き込みを行うクラス
class UserService {
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

  // データベースからUserのデータを削除
  Future<void> deleteUser() async {
    final authId = auth.currentUser!.uid;
    await db.collection('users').doc(authId).delete();
  }

  // データベースのUserのデータを更新
  Future<void> updateUser(String displayName, String photoURL) async {
    final authId = auth.currentUser!.uid;
    final user = await db.collection('users').doc(authId).get();
    final data = user.data()!;

    final updatedUser = UserModel(
      email: data['email'],
      authId: data['authId'],
      displayName: displayName,
      profileImageURL: photoURL,
      createdAt: data['createdAt'].toDate(),
    );

    await db.collection('users').doc(authId).set(updatedUser.toJson());
  }

  // 指定したauthIDのユーザー情報を取得
  Future<UserModel> getUser(String authId) async {
    final user = await db.collection('users').doc(authId).get();
    final data = user.data()!;

    return UserModel(
      email: data['email'],
      authId: data['authId'],
      displayName: data['displayName'],
      profileImageURL: data['profileImageURL'],
      createdAt: data['createdAt'].toDate(),
    );
  }
}