import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String auth_id;
  final DateTime create_at;
  final String displayName;
  final String email;

  UserModel({
    required this.auth_id,
    required this.create_at,
    required this.displayName,
    required this.email,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      auth_id: data['auth_id'] ?? '',
      create_at: data['created_at'].toDate(),
      displayName: data['displayName'] ?? '',
      email: data['email'] ?? '',
    );
  }
}