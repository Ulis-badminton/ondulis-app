import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String svgAssetPath;
  final VoidCallback onPressed;
  final double size;
  final bool isSelected;
  final Color? color;

  const SvgButton({
    Key? key,
    required this.svgAssetPath,
    required this.onPressed,
    this.size = 48.0,
    this.isSelected = false,
    this.color,
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
          side: isSelected
              ? BorderSide(
                  color: color ?? Colors.blue,
                  width: 2.0,
                )
              : null,
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