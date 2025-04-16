import 'package:flutter/material.dart';
import 'package:poke_team_builder/models/pokemon.dart';
import 'package:poke_team_builder/pages/poke_detail.dart';
import 'package:poke_team_builder/utils/string_capitalize.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // String capitalize(String s) {
    //   return s[0].toUpperCase() + s.substring(1);
    // }

    return Card(
      color: Colors.amber[400],
      child: Stack(
        children: [
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
              width: 28,
              height: 28,
              child: IconButton(
                onPressed: () {}, // todo => implement function to add to Team
                icon: Icon(Icons.add, size: 20, color: Colors.white),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(pokemon.sprite, height: 100, width: 100),
                ),
                SizedBox(height: 6),
                Text(
                  capitalize(pokemon.pokemonName),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetail(pokemon: pokemon),
                      ),
                    );
                  }, //push to pokemon detail page
                  minWidth: 0,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  color: Colors.blue,
                  child: Text(
                    'View more..',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
