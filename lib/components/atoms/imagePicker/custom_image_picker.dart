import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class CustomImagePicker extends StatelessWidget {
  final File? profileImage;
  final ValueChanged<File> onImageSelected;

  const CustomImagePicker({
    Key? key,
    required this.profileImage,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picker = ImagePicker();
        final pickedImage = await picker.pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          onImageSelected(File(pickedImage.path));
        }
      },
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: profileImage != null ? FileImage(profileImage!) : null,
        child: profileImage == null ? const Icon(Icons.camera_alt, size: 50.0) : null,
      ),
    );
  }
}
