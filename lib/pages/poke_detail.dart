import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poke_team_builder/components/drawer.dart';
import 'package:poke_team_builder/models/pokemon.dart';
import 'package:poke_team_builder/utils/add_to_team.dart';
import 'package:poke_team_builder/utils/string_capitalize.dart';

class PokemonDetail extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDetail({super.key, required this.pokemon});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Pokemon>('myTeam');
    bool alreadyInTeam = box.values.any(
      (storedPokemon) =>
          storedPokemon.pokemonName == widget.pokemon.pokemonName,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          capitalize(widget.pokemon.pokemonName),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[700],
      ),
      endDrawer: MyDrawer(),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          //Card Widget
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 8),
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blue[700],
                    width: 400,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      capitalize(widget.pokemon.pokemonName),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //Image and types container
                  Container(
                    color: Colors.grey[300],
                    width: 400,
                    height: 250,
                    child: Stack(
                      children: [
                        Image.network(
                          widget.pokemon.sprite,
                          scale: 0.5,
                          width: 400,
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Types:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  ...widget.pokemon.types.map((type) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text(
                                        '[${capitalize(type['type']['name'])}]',
                                        style: TextStyle(
                                          color: Colors.blue[700],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Weight and Height
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2, top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Weight: ${widget.pokemon.weight.toString()}',
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Height: ${widget.pokemon.height.toString()}',
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  //Abilities container
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 4,
                      right: 4,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[700],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Abilities',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                ...widget.pokemon.ability.map((ability) {
                                  return Text(
                                    capitalize(ability['ability']['name']),
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.w400,
                                    ),
                                  );
                                }),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[700],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Stats',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                ...widget.pokemon.baseStat.map((stat) {
                                  return Text(
                                    '${capitalize(stat['stat']['name'])}: ${stat['base_stat']}',
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.w400,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Add to team button
          Container(
            decoration: BoxDecoration(
              color: alreadyInTeam ? Colors.red[900] : Colors.blue[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: MaterialButton(
              onPressed: () {
                if (alreadyInTeam) {
                  final keyToDelete = box.keys.firstWhere(
                    (key) =>
                        box.get(key)?.pokemonName == widget.pokemon.pokemonName,
                    orElse: () => null,
                  );
                  if (keyToDelete != null) {
                    setState(() {
                      box.delete(keyToDelete);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                          child: Text(
                            '${capitalize(widget.pokemon.pokemonName)} is no longer in the Team.',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        backgroundColor: Colors.blue[700],
                      ),
                    );
                  }
                } else {
                  setState(() {
                    addPokeToTeam(widget.pokemon, context);
                  });
                }
              },
              child: Text(
                alreadyInTeam ? 'Remove from Team' : 'Add to my Team',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
