import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/models/mood.dart';
import 'package:ondulis_app/repository/mood_service.dart';

final moodProvider = StreamProvider<Mood?>((ref) {
  final auth = FirebaseAuth.instance;
  final collection = FirebaseFirestore.instance.collection('mood');
  
  final stream = collection.doc(auth.currentUser?.uid).snapshots().map(
    (snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        return data != null ? Mood.fromJson(data) : null;
      } else {
        return null;
      }
    },
  );
  return stream;

});

final todayMoodsProvider = StreamProvider<List<Mood>?>((ref) {
  final collection = FirebaseFirestore.instance.collection('mood');
  final todayDate = MoodService().convertDateTimeToInt(DateTime.now());

  final stream = collection
      .where('date', isEqualTo: todayDate)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) => Mood.fromJson(doc.data())).toList();
  });

  return stream;
});
