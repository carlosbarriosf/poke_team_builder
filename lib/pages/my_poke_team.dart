import 'package:flutter/material.dart';

class MyPokeTeam extends StatefulWidget {
  const MyPokeTeam({super.key});

  @override
  State<MyPokeTeam> createState() => _MyPokeTeamState();
}

class _MyPokeTeamState extends State<MyPokeTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My team')),
      body: Center(child: Text('My team')),
    );
  }
}
