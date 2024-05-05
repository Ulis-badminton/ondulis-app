import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPress;
  final double iconSize;

  const IconButton({
    super.key,
    required this.imagePath,
    required this.onPress,
    this.iconSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: iconSize / 2,
        child: ClipOval(
          child: Image.asset(
            imagePath,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}