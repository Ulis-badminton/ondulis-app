import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/models/user_model.dart';

final userProvider = StreamProvider<List<UserModel>>((ref) {
  final collection = FirebaseFirestore.instance.collection('user');
  
  final stream = collection.snapshots().map(
      
        (e) => e.docs.map((e) => UserModel.fromJson(e.data())).toList(),
      );
  return stream;
});
