import 'package:exo_vr/pages/exo_viewer.dart';
import 'package:exo_vr/pages/planet_android_page.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart' show ArCoreController;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ArCoreController.checkArCoreAvailability().then((value) => print(value.toString()));
  await ArCoreController.checkIsArCoreInstalled().then((value) => print(value.toString()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terere Lab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExoViewer(),
    );
  }
}
