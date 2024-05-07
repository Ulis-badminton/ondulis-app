import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ondulis_app/repository/user_provider.dart';

// profileImagePathProviderの初期値はcurrentUserのphotoURL
final profileImagePathProvider = StateProvider<String>((ref) => '');

class CustomImagePicker extends ConsumerWidget {
  const CustomImagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(profileImagePathProvider);

    final user = ref.watch(userProvider).value;

    if (user != null && imagePath.isEmpty) {
      ref.read(profileImagePathProvider.notifier).state = user.profileImageURL;
    }

    return InkWell(
      onTap: () async {
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          final fileName = DateTime.now().millisecondsSinceEpoch.toString();
          final reference = FirebaseStorage.instance.ref().child('profileImages/$fileName');
          await reference.putFile(File(pickedFile.path));
          final imageUrl = await reference.getDownloadURL();
          ref.read(profileImagePathProvider.notifier).state = imageUrl;
        }
      },
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: imagePath.isNotEmpty
            ? NetworkImage(imagePath)
            : const AssetImage('assets/images/shuttle.png') as ImageProvider,
      ),
    );
  }
}