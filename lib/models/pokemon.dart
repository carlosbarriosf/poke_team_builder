import 'package:hive/hive.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 0)
class Pokemon extends HiveObject {
  @HiveField(0)
  String pokemonName;

  @HiveField(1)
  String sprite;

  @HiveField(2)
  List<dynamic> types;

  @HiveField(3)
  List<dynamic> ability;

  @HiveField(4)
  int height;

  @HiveField(5)
  int weight;

  @HiveField(6)
  List<dynamic> baseStat;

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
