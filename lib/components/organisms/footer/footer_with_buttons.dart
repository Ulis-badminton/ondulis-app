import 'package:flutter/material.dart';

class FooterWithButtons extends StatelessWidget {
  final Text leftButtonText;
  final VoidCallback leftButtonOnPress;
  final Text rightButtonText;
  final VoidCallback rightButtonOnPress;
  final Color borderColor;

  FooterWithButtons({
    required this.leftButtonText,
    required this.leftButtonOnPress,
    required this.rightButtonText,
    required this.rightButtonOnPress,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: leftButtonOnPress,
              child: leftButtonText,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: ElevatedButton(
              onPressed: rightButtonOnPress,
              child: rightButtonText,
            ),
          ),
        ],
      ),
    );
  }
}