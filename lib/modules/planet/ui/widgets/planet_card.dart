import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PlanetCard extends StatelessWidget {
  final String planetName;
  final String description;
  final String assetImage;
  final VoidCallback? onTap;

  const PlanetCard({
    super.key,
    required this.planetName,
    required this.description,
    required this.assetImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              assetImage,
              height: 150,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                text: TextSpan(
                  text: planetName,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  children: [
                    TextSpan(
                      text: '\n$description',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ).animate().then(delay: 1.seconds).shimmer(duration: 1.seconds, curve: Curves.easeInOut),
    );
  }
}
