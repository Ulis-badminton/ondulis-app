import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ondulis_app/repository/user_provider.dart';
import 'package:image_picker_web/image_picker_web.dart';

// profileImagePathProviderの初期値はcurrentUserのphotoURL
final profileImagePathProvider = StateProvider<String>((ref) => '');

class CustomImagePicker extends ConsumerWidget {
  const CustomImagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(profileImagePathProvider);
    final user = ref.watch(userProvider).value;

  if (user != null && imagePath.isEmpty) {
      Future(() {
        ref.read(profileImagePathProvider.notifier).state = user.profileImageURL;
      });
    }

    void uploadProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final reference = FirebaseStorage.instance.ref().child('profileImages/$fileName');
      await reference.putFile(File(pickedFile.path));
      final imageUrl = await reference.getDownloadURL();
      Future(() => ref.read(profileImagePathProvider.notifier).state = imageUrl);
    }
  }

  void uploadProfileImageOnWeb() async {
      Uint8List? uint8list = await ImagePickerWeb.getImageAsBytes();
      if (uint8list != null) {
        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        final reference = FirebaseStorage.instance.ref().child('profileImages/$fileName');
        await reference.putData(uint8list);
        final imageUrl = await reference.getDownloadURL();
        Future(() => ref.read(profileImagePathProvider.notifier).state = imageUrl);
    }
  }


    return InkWell(
      onTap: () async {
        if (kIsWeb) {
          uploadProfileImageOnWeb();
        } else {
          uploadProfileImage();
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