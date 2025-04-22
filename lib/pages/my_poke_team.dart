import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poke_team_builder/components/drawer.dart';
import 'package:poke_team_builder/models/pokemon.dart';
import 'package:poke_team_builder/pages/poke_detail.dart';
import 'package:poke_team_builder/utils/string_capitalize.dart';

class MyPokeTeam extends StatefulWidget {
  const MyPokeTeam({super.key});

  @override
  State<MyPokeTeam> createState() => _MyPokeTeamState();
}

class _MyPokeTeamState extends State<MyPokeTeam> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Pokemon>('myTeam');
    final team = box.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'My team',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue[700],
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.menu, color: Colors.white),
                ),
          ),
        ],
      ),
      endDrawer: MyDrawer(),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    'My current team',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                team.isEmpty
                    ? Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'The team is currently empty',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                    : Column(
                      children: [
                        ...team.asMap().entries.map((entry) {
                          final index = entry.key;
                          final pokemon = entry.value;

                          return Dismissible(
                            key: Key(pokemon.pokemonName),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                //Remove from Hive
                                box.deleteAt(index);
                                team.removeAt(index);
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      '${capitalize(pokemon.pokemonName)} is no longer in the Team.',
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
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[700],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            pokemon.sprite,
                                            scale: 2,
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            capitalize(pokemon.pokemonName),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => PokemonDetail(
                                                    pokemon: pokemon,
                                                  ),
                                            ),
                                          );
                                        },
                                        minWidth: 0,
                                        padding: EdgeInsets.zero,
                                        child: Icon(
                                          Icons.info,
                                          color: Colors.grey[400],
                                          size: 32,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
