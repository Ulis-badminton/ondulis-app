import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/models/user_model.dart';

final userProvider = StreamProvider<UserModel?>((ref) async*{
  final authStream = FirebaseAuth.instance.authStateChanges();
  await for (final user in authStream) {
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        yield UserModel.fromFirestore(doc);
      } else {
        yield null;
      }
    } else {
      yield null;
    }
  }
});