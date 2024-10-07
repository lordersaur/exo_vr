import 'package:exo_vr/modules/planets/models/planet.dart';
import 'package:exo_vr/service/dio_service.dart';
import 'package:exo_vr/util/log.dart';

class PlanetService {
  final String _urlBase = "https://exoplanetarchive.ipac.caltech.edu/TAP/sync";

  Future<List<Planet>> find() async {
    List<String> names = [
      "Kepler-22 b",
      "Kepler-452 b",
      "Kepler-186 f",
      "Kepler-10 b",
      "CoRoT-7 b",
    ];

    // Codificar los nombres correctamente para la consulta SQL
    final encodedNames = names.map((name) => "'${Uri.encodeComponent(name)}'").join(',');

    final queryParam = {
      "query": "SELECT pl_name,pl_rade,pl_bmasse,pl_orbper,pl_eqt,st_teff FROM pscomppars WHERE pl_name IN ($encodedNames)",
      "format": "json",
    };

    // Construir la URL final con parámetros
    final uri = Uri.parse(_urlBase).replace(queryParameters: queryParam);

    try {
      final response = await Http.get(uri.toString());
      return List<Planet>.from(response.map((e) => Planet.fromJson(e)));
    } catch (e) {
      Log.error("Error al obtener los planetas", e);
      return [];
    }
  }

  Future<Planet> findByName(String name) async {
    final queryParam = {
      "query": "SELECT+pl_name,pl_rade,pl_bmasse,pl_orbper,pl_eqt,st_teff+FROM+pscomppars+WHERE+pl_name+IN+${Uri.encodeQueryComponent(name)}",
      "format": "json",
    };
    try {
      final response = await Http.get(_urlBase, queryParam: queryParam);
      return Planet.fromJson(response.first);
    } catch (e) {
      Log.error("Error al obtener el planeta", e);
      return Planet(
        name: name,
        description: '',
        assetPath: '',
        modelPath: '',
        rade: 0,
        masse: 0,
        timeOrbitStar: 0,
        temperature: 0,
        starTemperature: 0,
      );
    }
  }
}
