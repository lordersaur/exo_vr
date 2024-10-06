import 'package:exo_vr/modules/planets/ui/widgets/planet_background.dart';
import 'package:exo_vr/modules/planets/ui/widgets/planet_button.dart';
import 'package:exo_vr/modules/planets/ui/widgets/planet_description.dart';
import 'package:exo_vr/modules/planets/ui/widgets/planet_image.dart';
import 'package:flutter/material.dart';
import 'package:exo_vr/modules/space_camera/planet_android_page.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PlanetBackground(),
          const PlanetImage(
            imagePath: 'assets/images/mars.png',
            imageHeight: 250,
          ),
          const PlanetDescription(
            title: 'MARS',
            description: 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System.',
          ),
          PlanetButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlanetAndroidPage()),
              );
            },
            buttonText: 'View in VR',
          ),
        ],
      ),
    );
  }
}
