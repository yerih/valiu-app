






import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  final String imagePath;
  final double blurSigma;
  final Widget child;

  const BlurredBackground({
    super.key,
    required this.imagePath,
    this.blurSigma = 1.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        // Blur Effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurSigma,
              sigmaY: blurSigma,
            ),
            child: Container(
              color: Colors.black.withAlpha(10), // Optional tint
            ),
          ),
        ),
        // Your Content (passed as child)
        child,
      ],
    );
  }
}



