import 'package:flutter/material.dart';
import 'package:poke_team_builder/models/pokemon.dart';
import 'package:poke_team_builder/utils/string_capitalize.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          capitalize(pokemon.pokemonName),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
      ),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 100,
              color: Colors.white,
              child: Image.network(pokemon.sprite, width: 200),
            ),
          ),
        ],
      ),
    );
  }
}
