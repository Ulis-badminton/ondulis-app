import 'package:flutter/material.dart';

class ThreadCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color iconColor;
  final Color borderColor;

  ThreadCard({
    required this.title,
    required this.icon,
    required this.onPress,
    this.iconColor = Colors.black,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconColor,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 16.0),
            Text(
              title,
              style: TextStyle(
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