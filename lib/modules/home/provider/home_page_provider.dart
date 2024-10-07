import 'package:exo_vr/modules/planets/models/planet.dart';
import 'package:exo_vr/modules/planets/services/planet_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = AsyncNotifierProvider<HomeController, List<Planet>>(HomeController.new);

class HomeController extends AsyncNotifier<List<Planet>> {
  @override
  Future<List<Planet>> build() async {
    if (state.value != null) {
      return state.value!;
    }

    final List<Planet> planets = await PlanetService().find();

    return planets;
  }
}
