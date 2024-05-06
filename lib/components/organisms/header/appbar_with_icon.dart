import 'package:flutter/material.dart';

class AppBarWithIcon extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String imagePath;
  final VoidCallback onIconPressed;
  final VoidCallback? onBackPressed; // バックボタンのコールバック

  const AppBarWithIcon({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onIconPressed,
    this.onBackPressed, // バックボタンのコールバックを受け取るように変更
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: onBackPressed != null // バックボタンのコールバックが設定されている場合のみ表示
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed,
            )
          : null, // コールバックが設定されていない場合は何も表示しない
      actions: [
        GestureDetector(
          onTap: onIconPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Image.asset(imagePath),
              onPressed: () {}, // この部分は無視される
            ),
          ),
        ),
      ],
    );
  }
}