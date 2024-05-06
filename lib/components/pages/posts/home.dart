import 'package:flutter/material.dart';
import 'package:ondulis_app/components/organisms/header/custom_appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ホーム',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Center(
        child: Text('ログインしました'),
      ),
    );
  }
}