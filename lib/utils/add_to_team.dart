import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poke_team_builder/models/pokemon.dart';
import 'package:poke_team_builder/utils/string_capitalize.dart';

void addPokeToTeam(Pokemon pokemon, context) async {
  final box = Hive.box<Pokemon>('myTeam');
  final alreadyInTeam = box.values.any(
    (storedPokemon) => storedPokemon.pokemonName == pokemon.pokemonName,
  );

  if (alreadyInTeam) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            '${capitalize(pokemon.pokemonName)} is already in the Team',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        backgroundColor: Colors.amber[700],
      ),
    );
  } else if (box.length >= 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'Team members at limit!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        backgroundColor: Colors.red[800],
      ),
    );
  } else {
    await box.add(pokemon);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            '${capitalize(pokemon.pokemonName)} is now on your Team!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}
