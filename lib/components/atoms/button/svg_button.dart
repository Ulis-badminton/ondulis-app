import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String svgAssetPath;
  final VoidCallback onPressed;
  final double size;

  const SvgButton({
    Key? key,
    required this.svgAssetPath,
    required this.onPressed,
    this.size = 48.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: SvgPicture.asset(
          svgAssetPath,
          width: size * 0.6,
          height: size * 0.6,
        ),
      ),
    );
  }
}