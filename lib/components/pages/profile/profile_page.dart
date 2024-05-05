// profile_setup_page.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ondulis_app/components/molecules/textform/customTextFormField.dart';
import 'package:ondulis_app/components/organisms/header/custom_appbar.dart';

final profileImageProvider = StateProvider<XFile?>((_) => null);
final nicknameProvider = StateProvider<String>((_) => '');

class ProfileSetupPage extends ConsumerWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImage = ref.watch(profileImageProvider);
    final nickname = ref.watch(nicknameProvider);
    final _auth = FirebaseAuth.instance;
    final _firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'プロフィール設定',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  ref.read(profileImageProvider.notifier).state = pickedImage;
                }
              },
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: profileImage != null
                    ? FileImage(File(profileImage.path))
                    : null,
                child: profileImage == null
                    ? const Icon(Icons.camera_alt, size: 50.0)
                    : null,
              ),
            ),
            const Gap(16.0),
            CustomTextFormField(
              labelText: 'ニックネーム',
              onChanged: (value) {
                ref.read(nicknameProvider.notifier).state = value;
              },
            ),
            const Gap(16.0),
            ElevatedButton(
              onPressed: () async {
                final user = _auth.currentUser;
                if (user != null) {
                  await _firestore.collection('users').doc(user.uid).set({
                    'nickname': nickname,
                    'profileImageUrl': profileImage?.path,
                  }
                  );
                  // プロフィール設定後の処理
                }
                debugPrint('プロフィールを登録しました');
                debugPrint('ニックネーム: $nickname');
                debugPrint('プロフィール画像: ${profileImage?.path}');
              },
              child: const Text('登録'),
            ),
          ],
        ),
      ),
    );
  }
}