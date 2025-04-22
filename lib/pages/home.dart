import 'package:flutter/material.dart';
import 'package:poke_team_builder/components/drawer.dart';
import 'package:poke_team_builder/components/pokemon_card.dart';
import 'package:poke_team_builder/models/pokemon.dart';
import 'package:poke_team_builder/utils/fetch_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Pokemon? pokemon;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              'Pokémon Team Builder',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
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
        backgroundColor: Colors.blue[700],
      ),
      endDrawer: MyDrawer(),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 48),
          Center(child: Image.asset('assets/pokelogo.png')),
          SizedBox(height: 24),
          Text(
            "Create your own Pokémon team!",
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 24),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[700],
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Search for a Pokémon",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    try {
                      final data = await fetchData(
                        "https://pokeapi.co/api/v2/pokemon/${_controller.text}",
                      );
                      final newPokemon = Pokemon(
                        pokemonName: data['name'],
                        sprite: data['sprites']['front_default'],
                        types: data['types'],
                        ability: data['abilities'],
                        height: data['height'],
                        weight: data['weight'],
                        baseStat: data['stats'],
                      );
                      setState(() {
                        pokemon = newPokemon;
                      });
                    } catch (e) {
                      print('Error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(
                            child: Text(
                              'Pokemon not found',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          backgroundColor: Colors.blue[700],
                        ),
                      );
                    }
                  },
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          if (pokemon != null) PokemonCard(pokemon: pokemon!),
        ],
      ),
    );
  }
}
