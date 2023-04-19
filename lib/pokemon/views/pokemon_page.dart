import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(pokemon.pictureUrl),
          Text(pokemon.name),
        ],
      ),
    );
  }
}
