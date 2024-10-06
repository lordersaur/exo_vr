import 'package:flutter/material.dart';

class PlanetImage extends StatelessWidget {
  final String imagePath;
  final double imageHeight;

  const PlanetImage({
    super.key,
    required this.imagePath,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 30,
      right: 30,
      child: Image.asset(
        imagePath,
        height: imageHeight,
        fit: BoxFit.contain,
      ),
    );
  }
}
