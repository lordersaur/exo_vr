import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ExoViewer extends StatefulWidget {
  const ExoViewer({super.key});

  @override
  State<ExoViewer> createState() => _ExoViewerState();
}

class _ExoViewerState extends State<ExoViewer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ModelViewer(
        src: 'assets/models/kepler_22_b.glb',
        alt: 'A 3D model of an Exoplanet',
        arScale: ArScale.auto,
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
