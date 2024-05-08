import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/atoms/button/open_url_button.dart';
import 'package:ondulis_app/components/atoms/imagePicker/custom_image_picker.dart';
import 'package:ondulis_app/components/molecules/textform/customTextFormField.dart';
import 'package:ondulis_app/repository/user_service.dart';
import 'package:ondulis_app/repository/user_provider.dart';


final _auth = FirebaseAuth.instance;

class ProfileChangePage extends ConsumerWidget{

    const ProfileChangePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // final displayNameController = TextEditingController();
    final profileImagePath = ref.watch(profileImagePathProvider);

    final dataService = ref.read(userServiceProvider.notifier).state;
    final displayNameController = TextEditingController(text: ref.watch(userProvider).value?.displayName ?? '');

    return Scaffold(
      appBar: AppBar(
      title: const Text('プロフィール変更'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomImagePicker(),
            const Gap(20),
            CustomTextFormField(
              controller: displayNameController,
              labelText: 'アカウント名',
            ),
            const Gap(20),
            ElevatedButton(
              onPressed: () async {
                final userId = _auth.currentUser?.uid;
                if (userId != null) {
                  final email = _auth.currentUser?.email ?? '';
                  final displayNameText = displayNameController.text;
                  final photoUrl = profileImagePath;

                  if (displayNameText.isNotEmpty && photoUrl.isNotEmpty) {
                    try {
                      await dataService.addUser(email, displayNameText, photoUrl);
                        Navigator.pop(context);
                    } catch (e) {
                      debugPrint('Error adding user: $e');
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('入力エラー'),
                        content: const Text('アカウント名と写真は必須です'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: const Text('変更する'),
            ),
            const Gap(20),
            const OpenUrlButton(
              urlString: 'https://forms.gle/gfNEdPDNGL6fFYpL6',
              text: Text('要望はこちらへ')
            ),
          ]
        )
      ),
    );
  }
}