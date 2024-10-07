import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PlanetCard extends StatelessWidget {
  final Color color;
  final String planetName;
  final String description;
  final String assetImage;
  final VoidCallback? onTap;

  const PlanetCard({
    super.key,
    required this.color,
    required this.planetName,
    required this.description,
    required this.assetImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              assetImage,
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              planetName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ).animate().fadeIn(duration: 0.5.seconds).scale(duration: 1.seconds),
    );
  }
}
