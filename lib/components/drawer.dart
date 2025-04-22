import 'package:flutter/material.dart';
import 'package:poke_team_builder/pages/home.dart';
import 'package:poke_team_builder/pages/my_poke_team.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[800],
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(24),
            child: Image.asset('assets/pokelogo.png'),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Team Builder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPokeTeam()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.catching_pokemon, color: Colors.white),
              title: Text(
                'My team',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
