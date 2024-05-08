import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/models/user_model.dart';
import 'package:ondulis_app/repository/user_service.dart';

class ThreadCard extends StatelessWidget {
  final String authId;
  final String? comment;
  final int mood;
  final Color iconColor;
  final Color borderColor;

  const ThreadCard({
    super.key,
    required this.authId,
    this.comment,
    required this.mood,
    this.iconColor = Colors.black,
    this.borderColor = Colors.grey,
  });

  String get svgPath {
    switch (mood) {
      case 0:
        return 'assets/images/bad_mood.svg';
      case 1:
        return 'assets/images/normal_mood.svg';
      case 2:
        return 'assets/images/good_mood.svg';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: UserService().getUser(authId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final user = snapshot.data!;
          final accountName = user.displayName;
          final profileImagePath = user.profileImageURL;

          return Container(
            width: MediaQuery.of(context).size.width,
            height: 80.0,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: iconColor,
                  backgroundImage: NetworkImage(profileImagePath),
                ),
                const Gap(16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        accountName,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        comment ?? '',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  svgPath,
                  width: 24.0,
                  height: 24.0,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}