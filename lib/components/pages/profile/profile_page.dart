import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/molecules/textform/customTextFormField.dart';
import 'package:ondulis_app/components/pages/posts/home.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({super.key, required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _displayNameController = TextEditingController();

  Future<void> _saveProfile() async {
    final displayName = _displayNameController.text.trim();
    if (displayName.isNotEmpty) {
      final userRef = FirebaseFirestore.instance.collection('users').doc(widget.user.uid);
      final now = DateTime.now();
      await userRef.set({
        'email': widget.user.email,
        'displayName': displayName,
        'auth_id' : widget.user.uid,
        'created_at': now,
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール設定'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('メールアドレス: ${widget.user.email}'),
            const Gap(16.0),
            CustomTextFormField(
              labelText: 'ユーザー名',
              controller: _displayNameController, 
            ),
            const Gap(16.0),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('プロフィールを保存'),
            ),
          ],
        ),
      ),
    );
  }
}