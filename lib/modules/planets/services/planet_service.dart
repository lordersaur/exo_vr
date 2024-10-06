import 'package:exo_vr/modules/planets/models/planet.dart';
import 'package:exo_vr/service/dio_service.dart';

class PlanetService {
  final String _urlBase = "https://exoplanetarchive.ipac.caltech.edu/TAP/sync";

  Future<List<Planet>> find() async {
    List<String> names = [
      "Kepler-22 b",
      "Kepler-452 b",
      "Kepler-186 f",
      "Kepler-10 b",
      "CoRoT-17 b",
    ];
    final queryParam = {
      "query": "SELECT+pl_name,pl_rade,pl_bmasse,pl_orbper,pl_eqt,st_teff+FROM+pscomppars+WHERE+pl_name+IN+${Uri.encodeQueryComponent(names.join(","))}",
      "format": "json",
    };
    final response = await Http.get(_urlBase, queryParam: queryParam);

    return List<Planet>.from(response.map((e) => Planet.fromJson(e)));
  }

  Future<Planet> findByName(String name) async {
    final queryParam = {
      "query": "SELECT+pl_name,pl_rade,pl_bmasse,pl_orbper,pl_eqt,st_teff+FROM+pscomppars+WHERE+pl_name+IN+${Uri.encodeQueryComponent(name)}",
      "format": "json",
    };
    final response = await Http.get(_urlBase, queryParam: queryParam);
    return Planet.fromJson(response);
  }
}