class Planet {
  String name;
  String description;
  String assetPath;
  String modelPath;
  double rade; // Radio del exoplaneta (en radios terrestres).
  double masse; // Masa del exoplaneta (en masas terrestres).
  double timeOrbitStar; // Tiempo que tarda en orbitar su estrella (en dias).
  int temperature; // Temperatura de equilibrio del exoplaneta. (Kelvin)
  int starTemperature; // Temperatura de la estrella. (Kelvin)

  Planet({
    required this.name,
    required this.description,
    required this.assetPath,
    required this.modelPath,
    required this.rade,
    required this.masse,
    required this.timeOrbitStar,
    required this.temperature,
    required this.starTemperature,
  });

  factory Planet.fromJson(Map<String, dynamic> json) => Planet(
        name: json["pl_name"],
        description: json["pl_description"],
        modelPath: json["modePath"],
        assetPath: json["assetPath"],
        rade: json["pl_rade"]?.toDouble(),
        masse: json["pl_bmasse"]?.toDouble(),
        timeOrbitStar: json["pl_orbper"]?.toDouble(),
        temperature: json["pl_eqt"],
        starTemperature: json["st_teff"],
      );

  Map<String, dynamic> toJson() => {
        "pl_name": name,
        "pl_description": description,
        "modelPath": modelPath,
        "assetPath": assetPath,
        "pl_rade": rade,
        "pl_bmasse": masse,
        "pl_orbper": timeOrbitStar,
        "pl_eqt": temperature,
        "st_teff": starTemperature,
      };
}
