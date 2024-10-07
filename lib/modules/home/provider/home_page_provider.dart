import 'package:exo_vr/modules/planets/models/planet.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = AsyncNotifierProvider<HomeController, List<Planet>>(HomeController.new);

class HomeController extends AsyncNotifier<List<Planet>> {
  @override
  Future<List<Planet>> build() async {
    if (state.value != null) {
      return state.value!;
    }

    List<Planet> planets = [
      Planet(
        name: "CoRoT-7 b",
        assetPath: 'assets/images/Corot-7b.png',
        modelPath: 'assets/models/corot_7b_fiery.glb',
        rade: 1.681,
        masse: 4.07661,
        timeOrbitStar: 0.85359163,
        temperature: 1756,
        starTemperature: 5275,
        description:
            "CoRoT-7 b is a rocky and extremely hot exoplanet that orbits very close to its star, completing an orbit in less than a day. Its extremely high temperature suggests its surface may be molten.",
      ),
      Planet(
        name: "Kepler-10 b",
        rade: 1.47,
        masse: 3.26,
        modelPath: 'assets/models/kepler_10_b_lite.glb',
        assetPath: 'assets/images/Kepler-10b.png',
        timeOrbitStar: 0.83749070,
        temperature: 2188,
        starTemperature: 5708,
        description:
            "Kepler-10 b is another rocky exoplanet very close to its star. Its high temperature makes it a scorching planet, suggesting it may have a surface similar to a volcanic desert.",
      ),
      Planet(
        name: "Kepler-186 f",
        rade: 1.17,
        masse: 1.71,
        modelPath: 'assets/models/kepler-186f.glb',
        assetPath: 'assets/images/Kepler186f.png',
        timeOrbitStar: 129.9441,
        temperature: 177,
        starTemperature: 3755,
        description:
            "Kepler-186 f is a planet similar in size to Earth, orbiting in the habitable zone of its star, which means it could have liquid water on its surface. Although its star's temperature is lower than the Sun's, its position in the habitable zone makes it an interesting candidate for the search for life.",
      ),
      Planet(
        name: "Kepler-22 b",
        rade: 2.1,
        masse: 9.1,
        timeOrbitStar: 289.863876,
        modelPath: 'assets/models/kepler_22_b.glb',
        assetPath: 'assets/images/Kepler22b.png',
        temperature: 279,
        starTemperature: 5596,
        description:
            "Kepler-22 b is a larger planet than Earth, also located in its star's habitable zone. Although it's slightly warmer than Earth, its size and location make it an intriguing object of study in the search for habitable exoplanets.",
      ),
      Planet(
        name: "Kepler-452 b",
        rade: 1.63,
        masse: 3.29,
        timeOrbitStar: 384.843,
        temperature: 265,
        starTemperature: 5757,
        modelPath: 'assets/models/kepler-452b.glb',
        assetPath: 'assets/images/Kepler-452b.png',
        description:
            "Kepler-452 b is a rocky exoplanet with a size and characteristics similar to Earth. Its orbit around a Sun-like star, along with its location in the habitable zone, makes it one of the best candidates in the search for Earth-like conditions.",
      ),
    ];

    return planets;
  }
}
