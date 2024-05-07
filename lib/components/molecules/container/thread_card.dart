import 'package:flutter/material.dart';

class ThreadCard extends StatelessWidget {
  final String title;
  final String profileImagePath;
  final VoidCallback onPress;
  final Color iconColor;
  final Color borderColor;

  const ThreadCard({super.key, 
    required this.title,
    required this.profileImagePath,
    required this.onPress,
    this.iconColor = Colors.black,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconColor,
              child: Image.network(profileImagePath)
              ),
            const SizedBox(width: 16.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}