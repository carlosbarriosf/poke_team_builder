class Pokemon {
  String pokemonName;
  String sprite;
  List types;
  List ability;
  int height;
  int weight;
  List baseStat;

  Pokemon({
    required this.pokemonName,
    required this.sprite,
    required this.types,
    required this.ability,
    required this.height,
    required this.weight,
    required this.baseStat,
  });
}

// class Types {
//   final List<Map<dynamic, dynamic>> types;

//   Types({required this.types});
// }

// class Abilities {
//   final List<Map<dynamic, dynamic>> abilities;

//   Abilities({required this.abilities});
// }
