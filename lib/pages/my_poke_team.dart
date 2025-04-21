import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poke_team_builder/models/pokemon.dart';

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
      appBar: AppBar(title: Text('My team')),
      body: Column(
        children: [
          Center(child: Text('My Pokémon Team')),
          ElevatedButton(
            onPressed: () async {
              final box = Hive.box<Pokemon>('myTeam');
              await box.clear();
              // setState(() {}); // Refresh UI if necessary
            },
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }
}
