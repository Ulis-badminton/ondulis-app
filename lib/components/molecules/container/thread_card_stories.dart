import 'package:flutter/material.dart';
import 'package:ondulis_app/models/user_model.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ondulis_app/components/molecules/container/thread_card.dart';


final mockUser = const UserModel(
  email: 'example.com',
  authId: 'abc',
  displayName: '名前',
  profileImageURL: 'https://blogger.googleusercontent.com/img/a/AVvXsEjyeJgJIrzCF5Ck3iDJAS25qLd7P02PixI-UWNgtSyq5YHPa9v5ngQgeJIjoRypNDVpQrAyKh3I4EZnFXMAgQIrsDfF5dCTNY_VPrOmkNWO18doT6xehVo70halIYqycSTnfxjffLXgcrGmRu-F4KweGragY9pRkKtvB40s7FrvuI4sUD0XRRkqh0pltw=s805'
);

@widgetbook.UseCase(
  name: 'ThreadCard',
  type: ThreadCard,
)
ThreadCard threadCard(BuildContext context) {
  return const ThreadCard(
    authId: 'abc',
    comment: '今日はいい気分です',
    mood: 1,
  );
}
