import 'package:flutter/material.dart';

class PlanetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const PlanetButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 550,
      left: 30,
      right: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
