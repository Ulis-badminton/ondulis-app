import 'package:flutter/material.dart';
import 'package:ondulis_app/components/molecules/thread_card.dart';

class ThreadList extends StatelessWidget {
  final List<ThreadCard> threads;

  ThreadList({required this.threads});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: threads.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: threads[index],
        );
      },
    );
  }
}