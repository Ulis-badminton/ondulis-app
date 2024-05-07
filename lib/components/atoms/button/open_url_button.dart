import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUrlButton extends StatelessWidget {
  final String urlString;
  final Text text;

  const OpenUrlButton({super.key, 
    required this.urlString,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(urlString);
    return ElevatedButton(
      onPressed: () => _launchURL(url),
      child: text,
    );
  }

  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}