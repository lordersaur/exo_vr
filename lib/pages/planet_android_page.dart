import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class PlanetAndroidPage extends StatefulWidget {
  const PlanetAndroidPage({ super.key });

  @override
  State<PlanetAndroidPage> createState() => _PlanetAndroidPageState();
}

class _PlanetAndroidPageState extends State<PlanetAndroidPage> {
  late ArCoreController controller;

  Future<void> _render (ArCoreController controller) async {
    this.controller = controller;

    final ByteData planetTextureBytes = await rootBundle.load("assets/images/earth_map.jpg");
    final materials = ArCoreMaterial(
      color: Colors.blue,
      textureBytes: planetTextureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [materials],
      radius: 0.4
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector64.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _render
      ),
    );
  }

   @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}