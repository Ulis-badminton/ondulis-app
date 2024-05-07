import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/models/user_model.dart';

final userProvider = StreamProvider<UserModel?>((ref) {
  final auth = FirebaseAuth.instance;
  final collection = FirebaseFirestore.instance.collection('users');
  
  final stream = collection.doc(auth.currentUser?.uid).snapshots().map(
    (snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        return data != null ? UserModel.fromJson(data) : null;
      } else {
        return null;
      }
    },
  );
  return stream;
});
