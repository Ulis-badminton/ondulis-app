import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/models/post.dart';

final blogStreamProvider = StreamProvider<List<Post>>((ref) {
  final collection = FirebaseFirestore.instance.collection('post');
  
  final stream = collection.snapshots().map(
       
        (e) => e.docs.map((e) =>  Post.fromJson(e.data())).toList(),
      );
  return stream;
});